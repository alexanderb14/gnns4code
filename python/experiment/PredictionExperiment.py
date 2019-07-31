import numpy as np
import pandas as pd
import pickle
import json
import os
import sys
from labm8 import fs
from typing import List
from sklearn.model_selection import StratifiedKFold
from sklearn import preprocessing
from progressbar import ProgressBar
import numpy as np
import string
from collections import Counter

from keras.layers import Input, Embedding, LSTM, Dense
from keras.layers.merge import Concatenate
from keras.layers.normalization import BatchNormalization
from keras.models import Model

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

from model.PredictionModel import PredictionModelTrainer, PredictionModelState, PredictionModelPredictor
import utils

seed = 204


#########################################################
class CLgenError(Exception):
  """Top level error. Never directly thrown."""
  pass

class CLgenObject(object):
    """
    Base object for CLgen classes.
    """
    pass

# Taken from the C99 spec, OpenCL spec 1.2, and bag-of-words analysis of
# GitHub corpus:
OPENCL_ATOMS = set([
    '  ',
    '__assert',
    '__attribute',
    '__builtin_astype',
    '__clc_fabs',
    '__clc_fma',
    '__constant',
    '__global',
    '__inline',
    '__kernel',
    '__local',
    '__private',
    '__read_only',
    '__read_write',
    '__write_only',
    '*/',
    '/*',
    '//',
    'abs',
    'alignas',
    'alignof',
    'atomic_add',
    'auto',
    'barrier',
    'bool',
    'break',
    'case',
    'char',
    'clamp',
    'complex',
    'const',
    'constant',
    'continue',
    'default',
    'define',
    'defined',
    'do',
    'double',
    'elif',
    'else',
    'endif',
    'enum',
    'error',
    'event_t',
    'extern',
    'fabs',
    'false',
    'float',
    'for',
    'get_global_id',
    'get_global_size',
    'get_local_id',
    'get_local_size',
    'get_num_groups',
    'global',
    'goto',
    'half',
    'if',
    'ifdef',
    'ifndef',
    'image1d_array_t',
    'image1d_buffer_t',
    'image1d_t',
    'image2d_array_t',
    'image2d_t',
    'image3d_t',
    'imaginary',
    'include',
    'inline',
    'int',
    'into',
    'kernel',
    'line',
    'local',
    'long',
    'noreturn',
    'pragma',
    'private',
    'quad',
    'read_only',
    'read_write',
    'register',
    'restrict',
    'return',
    'sampler_t',
    'short',
    'shuffle',
    'signed',
    'size_t',
    'sizeof',
    'sqrt',
    'static',
    'struct',
    'switch',
    'true',
    'typedef',
    'u32',
    'uchar',
    'uint',
    'ulong',
    'undef',
    'union',
    'unsigned',
    'void',
    'volatile',
    'while',
    'wide',
    'write_only',
])


class VocabError(CLgenError):
    """A character sequence is not in the atomizer's vocab"""
    pass


class Atomizer(CLgenObject):
    """
    Atomizer.
    """
    def __init__(self, vocab: dict):
        """
        Arguments:
            vocab (dict): A dictionary of string -> integer mappings to use for
                atomizing text from atoms into indices.
        """
        assert(isinstance(vocab, dict))
        self.vocab = vocab
        self._vocab_update()

    @property
    def atoms(self):
        return list(sorted(self.vocab.keys()))

    @property
    def indices(self):
        return list(sorted(self.vocab.values()))

    def _vocab_update(self):
        """ call this when vocab is modified """
        self.vocab_size = len(self.vocab)
        self.decoder = dict((val, key) for key, val in self.vocab.items())

    def atomize(self, text: str) -> np.array:
        """
        Atomize a text into an array of vocabulary indices.
        Arguments:
            text (str): Input text.
        Returns:
            np.array: Indices into vocabulary for all atoms in text.
        """
        raise NotImplementedError("abstract class")

    def tokenize(self, text: str) -> list:
        """
        Atomize a text into an array of atomsself.
        Arguments:
            text (str): Input text.
        Returns:
            list of str: Atom strings.
        """
        indices = self.atomize(text)
        return list(map(lambda x: self.decoder[x], indices))

    def deatomize(self, encoded: np.array) -> str:
        """
        Translate atomized code back into a string.
        Arguments:
            encoded (np.array): Encoded vocabulary indices.
        Returns:
            str: Decoded text.
        """
        try:
            return ''.join(list(map(lambda x: self.decoder[x], encoded)))
        except KeyError:
            raise VocabError

    @staticmethod
    def from_text(text: str):
        """
        Instantiate and specialize an atomizer from a corpus text.
        Arguments:
            text (str): Text corpus
        Returns:
            Atomizer: Specialized atomizer.
        """
        raise NotImplementedError("abstract class")


class CharacterAtomizer(Atomizer):
    """
    An atomizer for character-level syntactic modelling.
    """
    def __init__(self, *args, **kwargs):
        super(CharacterAtomizer, self).__init__(*args, **kwargs)

    def atomize(self, text: str) -> np.array:
        try:
            return np.array(list(map(lambda x: self.vocab[x], text)))
        except KeyError:
            raise VocabError

    def __repr__(self):
        return "CharacterAtomizer[{n} chars]".format(n=self.vocab_size)

    @staticmethod
    def from_text(text: str) -> Atomizer:
        counter = Counter(text)
        count_pairs = sorted(counter.items(), key=lambda x: -x[1])
        atoms, _ = zip(*count_pairs)
        vocab = dict(zip(atoms, range(len(atoms))))
        return CharacterAtomizer(vocab)


class GreedyAtomizer(Atomizer):
    """
    Greedy encoding for multi-characten modelling.
    """
    def __init__(self, *args, **kwargs):
        self.determine_chars = kwargs.pop("determine_chars", False)
        super(GreedyAtomizer, self).__init__(*args, **kwargs)

        multichars = set(k for k in self.atoms if len(k) > 1)
        first_chars = set(a[0] for a in multichars)
        self.lookup = dict((c, [a for a in multichars if a[0] == c])
                           for c in first_chars)

    def atomize(self, text: str) -> np.array:
        def _add_to_vocab(token: str):
            if self.determine_chars and token not in self.vocab:
                maxind = max(self.vocab.values())
                self.vocab[token] = maxind + 1

            return self.vocab[token]

        indices = []
        i = 0
        j = 2
        try:
            while i < len(text):
                if self.lookup.get(text[i]):
                    if j <= len(text) and any(x.startswith(text[i:j])
                                              for x in self.lookup[text[i]]):
                        j += 1
                    else:
                        while j > i + 1:
                            if any(x == text[i:j]
                                   for x in self.lookup[text[i]]):
                                indices.append(self.vocab[text[i:j]])
                                i = j
                                j = j + 2
                                break
                            else:
                                j -= 1
                        else:
                            indices.append(_add_to_vocab(text[i]))
                            i = i + 1
                            j = j + 2
                else:
                    indices.append(_add_to_vocab(text[i]))
                    i = i + 1
                    j = j + 2
        except KeyError:
            raise VocabError

        if self.determine_chars:
            self._vocab_update()

        return np.array(indices)

    def __repr__(self):
        return "GreedyAtomizer[{n} tokens]".format(n=self.vocab_size)

    @staticmethod
    def from_text(text: str) -> Atomizer:
        opencl_vocab = dict(zip(OPENCL_ATOMS, range(len(OPENCL_ATOMS))))
        c = GreedyAtomizer(opencl_vocab, determine_chars=True)

        tokens = sorted(list(set(c.tokenize(text))))
        vocab = dict(zip(tokens, range(len(tokens))))
        return GreedyAtomizer(vocab)


#########################################################
def platform2str(platform: str) -> str:
    """ get full platform name """
    if platform == "amd":
        return "AMD Tahiti 7970"
    elif platform == "nvidia":
        return "NVIDIA GTX 970"
    else:
        raise LookupException


def escape_suite_name(g: str) -> str:
    """ format benchmark suite name for display """
    c = g.split('-')
    if c[0] == "amd" or c[0] == "nvidia":
        return c[0].upper() + " SDK"
    if c[0] == "npb" or c[0] == "shoc":
        return c[0].upper()
    elif c[0] == "parboil" or c[0] == "polybench" or c[0] == "rodinia":
        return c[0].capitalize()
    else:
        raise LookupError


def escape_benchmark_name(g: str) -> str:
    """escape benchmark name for display"""
    c = g.split('-')
    return escape_suite_name(c[0]).split()[0] + "." + c[-2]


def grewe_features(df: pd.DataFrame) -> np.array:
    """ extract Grewe et al. feature vector from runtime data """
    return np.array([
        (df["transfer"].values / (df["comp"].values + df["mem"].values)),  # F1
        (df["coalesced"].values / df["mem"].values),  # F2
        ((df["localmem"].values / df["mem"].values) * df["wgsize"].values),  # F3
        (df["comp"].values / df["mem"].values),  # F4
    ]).T


def auxiliary_inputs(df: pd.DataFrame) -> np.array:
    """ get dsize and wgsize auxiliary inputs """
    transfer = df[["transfer"]].values
    min_max_scaler = preprocessing.MinMaxScaler()
    transfer_scaled = np.squeeze(min_max_scaler.fit_transform(transfer))

    wgsize = df[["wgsize"]].values
    min_max_scaler = preprocessing.MinMaxScaler()
    wgsize_scaled = np.squeeze(min_max_scaler.fit_transform(wgsize))

    return np.array([
        transfer_scaled,
        wgsize_scaled,
    ]).T


def get_clang_graphs(df: pd.DataFrame) -> np.array:
    return np.array(
        df["clang_graph"].values,
    ).T

def encode_1hot(y: np.array) -> np.array:
    """ 1-hot encode labels """
    labels = np.vstack([np.expand_dims(x, axis=0) for x in y])
    l2 = [x[0] for x in labels]
    l1 = [not x for x in l2]
    return np.array(list(zip(l1, l2)), dtype=np.int32)


def encode_srcs(srcs: List[str]) -> np.array:
    """ encode and pad source code for learning """
    from keras.preprocessing.sequence import pad_sequences

    seqs = [atomizer.atomize(src) for src in srcs]
    pad_val = atomizer.vocab_size
    encoded = np.array(pad_sequences(seqs, maxlen=1024, value=pad_val))
    return np.vstack([np.expand_dims(x, axis=0) for x in encoded])


class HeterogemeousMappingModel(object):
    """
    A model for predicting OpenCL heterogeneous device mappings.

    Attributes
    ----------
    __name__ : str
        Model name
    __basename__ : str
        Shortened name, used for files
    """
    __name__ = None
    __basename__ = None

    def init(self, seed: int) -> None:
        """
        Initialize the model.

        Do whatever is required to setup a new heterogeneous model here.
        This method is called prior to training and predicting.
        This method may be omitted if no initial setup is required.

        Parameters
        ----------
        seed : int
            The seed value used to reproducible results. May be 'None',
            indicating that no seed is to be used.
        """
        pass

    def save(self, outpath: str) -> None:
        """
        Save model state.

        This must capture all of the relevant state of the model. It is up
        to implementing classes to determine how best to save the model.

        Parameters
        ----------
        outpath : str
            The path to save the model state to.
        """
        raise NotImplementedError

    def restore(self, inpath: str) -> None:
        """
        Load a trained model from file.

        This is called in place of init() if a saved model file exists. It
        must restore all of the required model state.

        Parameters
        ----------
        inpath : str
            The path to load the model from. This is the same path as
            was passed to save() to create the file.
        """
        raise NotImplementedError

    def train(self, df: pd.DataFrame, features: np.array, sequences: np.array,
              y: np.array, y_1hot: np.array, verbose: bool = False) -> None:
        """
        Train a model.

        Parameters
        ----------
        df : pd.DataFrame
            The platform dataframe.

        features : np.array
            An array of feature vectors of shape (n,4).

        sequences : np.array
            An array of encoded source code sequences of shape (n,seq_length).

        y : np.array
            An array of optimal device mappings of shape (n,1).

        y_1hot : np.array
            An array of optimal device mappings of shape (n,2), in 1-hot encoding.

        verbose: bool, optional
            Whether to print verbose status messages during training.
        """
        raise NotImplementedError

    def predict(self, features: np.array, sequences: np.array, y: np.array,
                y_1hot: np.array, verbose: bool = False) -> np.array:
        """
        Make predictions for programs.

        Parameters
        ----------
        features : np.array
            An array of feature vectors of shape (n,4).

        sequences : np.array
            An array of encoded source code sequences of shape (n,seq_length).

        y : np.array
            An array of optimal device mappings of shape (n,1).

        y_1hot : np.array
            An array of optimal device mappings of shape (n,2), in 1-hot encoding.

        verbose: bool, optional
            Whether to print verbose status messages.

        Returns
        -------
        np.array
            Predicted 'y' values (optimal device mappings) with shape (n,1).
        """
        raise NotImplementedError


def evaluate(model: HeterogemeousMappingModel) -> pd.DataFrame:
    """
    Evaluate a model.

    Performs 10-fold cross-validation of the model's effectiveness at predicting
    OpenCL device mappings. Results are cached.

    Parameters
    ----------
    model : HeterogeneousMappingModel
        The predictive model to evaluate.

    Returns
    -------
    pd.Dataframe
        Evaluation results.
    """
    from sklearn.model_selection import StratifiedKFold
    from progressbar import ProgressBar

    progressbar = [0, ProgressBar(max_value=10)]

    data = []
    for i, platform in enumerate(["nvidia"]):
        platform_name = platform2str(platform)

        # load runtime data
        df = pd.read_csv("/devel/tmp/gnns4code/out.csv")

        sequences = None  # defer sequence encoding until needed (it's expensive)

        # values used for training & predictions
        features = grewe_features(df)
        aux_in = auxiliary_inputs(df)
        clang_graphs = get_clang_graphs(df)

        # optimal mappings
        y = np.array([1 if x == "GPU" else 0 for x in df["oracle"].values])
        y_1hot = encode_1hot(y)

        # 10-fold cross-validation
        kf = StratifiedKFold(n_splits=10, shuffle=True, random_state=seed)
        for j, (train_index, test_index) in enumerate(kf.split(features, y)):
            model_path = f"data/case-study-a/models/{model.__basename__}-{platform}-{j}.model"
            predictions_path = f"data/case-study-a/predictions/{model.__basename__}-{platform}-{j}.result"

            # if sequences is None:  # encode source codes if needed
            #     sequences = encode_srcs(df["src"].values)

            # train and cache a model
            model.init(seed=seed)
            model.train(df=df,
                        features=features[train_index],
                        aux_in=aux_in[train_index],
                        clang_graphs=[json.loads(g, object_hook=utils.json_keys_to_int) for g in clang_graphs[train_index]],
#                        sequences=sequences[train_index],
                        y=y[train_index],
                        y_1hot=y_1hot[train_index],
                        verbose=False)

            # test model
            p = model.predict(
                features=features[test_index],
                aux_in=aux_in[test_index],
                clang_graphs=[json.loads(g, object_hook=utils.json_keys_to_int) for g in clang_graphs[test_index]],
                # sequences=sequences[test_index],
                y=y[test_index],
                y_1hot=y_1hot[test_index],
                verbose=False)

            # benchmarks
            benchmarks = df['benchmark'].values[test_index]
            # oracle device mappings
            o = y[test_index]
            # whether predictions were correct or not
            correct = p == o
            # runtimes of baseline mapping (CPU on AMD, GPU on NVIDIA)
            zero_r_dev = "runtime_cpu" if platform == "amd" else "runtime_gpu"
            zer_r_runtimes = df[zero_r_dev][test_index]
            # speedups of predictions
            runtimes = df[['runtime_cpu', 'runtime_gpu']].values[test_index]
            p_runtimes = [r[p_] for p_, r in zip(p, runtimes)]
            p_speedup = zer_r_runtimes / p_runtimes

            # sanity check
            assert (len(benchmarks) == len(o) == len(correct) == len(p) == len(p_speedup))

            # record results
            for benchmark_, o_, p_, correct_, p_speedup_ in zip(benchmarks, o, p, correct, p_speedup):
                data.append({
                    "Model": model.__name__,
                    "Platform": platform_name,
                    'Benchmark': escape_benchmark_name(benchmark_),
                    'Benchmark Suite': escape_suite_name(benchmark_),
                    "Oracle Mapping": o_,
                    "Predicted Mapping": p_,
                    "Correct?": correct_,
                    "Speedup": p_speedup_,
                })

            # update progress bar
            progressbar[0] += 1
            progressbar[1].update(progressbar[0])

    return pd.DataFrame(
        data, index=range(1, len(data) + 1), columns=[
            "Model",
            "Platform",
            "Benchmark",
            "Benchmark Suite",
            "Oracle Mapping",
            "Predicted Mapping",
            "Correct?",
            "Speedup"
        ])



# srcs = '\n'.join(pd.read_csv("data/case-study-a/cgo17-nvidia.csv")['src'].values)
# atomizer = GreedyAtomizer.from_text(srcs)


# # Experiment: Static mapping
# class StaticMapping(HeterogemeousMappingModel):
#     __name__ = "Static mapping"
#     __basename__ = "static"
#
#     def init(self, seed: int):
#         return self
#
#     def save(self, outpath):
#         with open(outpath, "wb") as outfile:
#             pickle.dump(self.model, outfile)
#
#     def restore(self, inpath):
#         with open(inpath, "rb") as infile:
#             self.model = pickle.load(infile)
#
#     def train(self, df=None, **train):
#         from collections import Counter
#
#         pd.set_option('display.max_rows', 5)
#         pd.set_option('display.max_columns', None)
#         print(df)
#
#         # select the Zero-R device: the most frequently optimal device
#         zero_r_device = Counter(df['oracle']).most_common(1)[0][0]
#         self.model = 1 if zero_r_device == "GPU" else 0
#
#     def predict(self, **test):
#         if self.model:
#             return np.ones(len(test["y"])).astype(np.int32)
#         else:
#             return np.zeros(len(test["y"])).astype(dtype=np.int32)
#
# print("Evaluating static mapping ...", file=sys.stderr)
# baseline = evaluate(StaticMapping())
# result = baseline.groupby(['Platform', 'Benchmark Suite'])['Platform', 'Correct?', 'Speedup'].mean()
# print(result)


# # Experiment: Grewe et al
# class Grewe(HeterogemeousMappingModel):
#     __name__ = "Grewe et al."
#     __basename__ = "grewe"
#
#     def init(self, seed: int):
#         from sklearn.tree import DecisionTreeClassifier
#
#         self.model = DecisionTreeClassifier(
#             random_state=seed, splitter="best",
#             criterion="entropy", max_depth=5,
#             min_samples_leaf=5)
#         return self
#
#     def save(self, outpath):
#         with open(outpath, "wb") as outfile:
#             pickle.dump(self.model, outfile)
#
#     def restore(self, inpath):
#         with open(inpath, "rb") as infile:
#             self.model = pickle.load(infile)
#
#     def train(self, **train):
#         self.model.fit(train["features"], train["y"])
#
#     def predict(self, **test):
#         return self.model.predict(test["features"])
#
# print("Evaluating Grewe et al. ...", file=sys.stderr)
# grewe = evaluate(Grewe())
# result = grewe.groupby(['Platform', 'Benchmark Suite'])['Platform', 'Correct?', 'Speedup'].mean()
# print(result)


# # Experiment: DeepTune
# class DeepTune(HeterogemeousMappingModel):
#     __name__ = "DeepTune"
#     __basename__ = "deeptune"
#
#     def init(self, seed: int):
#         from keras.layers import Input, Embedding, LSTM, Dense
#         from keras.layers.merge import Concatenate
#         from keras.layers.normalization import BatchNormalization
#         from keras.models import Model
#
#         np.random.seed(seed)
#
#         # Language model. Takes as inputs source code sequences.
#         code_in = Input(shape=(1024,), dtype="int32", name="code_in")
#         x = Embedding(input_dim=atomizer.vocab_size + 1, input_length=1024,
#                       output_dim=64, name="embedding")(code_in)
#         x = LSTM(64, implementation=1, return_sequences=True, name="lstm_1")(x)
#         x = LSTM(64, implementation=1, name="lstm_2")(x)
#         langmodel_out = Dense(2, activation="sigmoid")(x)
#
#         # Auxiliary inputs. wgsize and dsize.
#         auxiliary_inputs = Input(shape=(2,))
#
#         # Heuristic model. Takes as inputs the language model,
#         #   outputs 1-hot encoded device mapping
#         x = Concatenate()([auxiliary_inputs, x])
#         x = BatchNormalization()(x)
#         x = Dense(32, activation="relu")(x)
#         out = Dense(2, activation="sigmoid")(x)
#
#         self.model = Model(inputs=[auxiliary_inputs, code_in], outputs=[out, langmodel_out])
#         self.model.compile(
#             optimizer="adam", metrics=['accuracy'],
#             loss=["categorical_crossentropy", "categorical_crossentropy"],
#             loss_weights=[1., .2])
#
#         return self
#
#     def save(self, outpath):
#         self.model.save(outpath)
#
#     def restore(self, inpath):
#         from keras.models import load_model
#         self.model = load_model(inpath)
#
#     def train(self, **train):
#         self.model.fit([train["aux_in"], train["sequences"]], [train["y_1hot"], train["y_1hot"]],
#                        epochs=50, batch_size=64, verbose=train["verbose"], shuffle=True)
#
#     def predict(self, **test):
#         p = np.array(self.model.predict(
#             [test["aux_in"], test["sequences"]], batch_size=64, verbose=test["verbose"]))
#         indices = [np.argmax(x) for x in p[0]]
#         return indices
#
# deeptune_model = DeepTune()
# deeptune_model.init(seed)
# deeptune_model.model.summary()
#
# print("Evaluating DeepTune ...", file=sys.stderr)
# deeptune = evaluate(deeptune_model)
# result = deeptune.groupby(['Platform', 'Benchmark Suite'])['Platform', 'Correct?', 'Speedup'].mean()
#
# print(result)


# Experiment: Grewe et al
class Grewe(HeterogemeousMappingModel):
    __name__ = "DeepGNN"
    __basename__ = "deepgnn"

    def init(self, seed: int):
        config = {
            "graph_rnn_cell": "GRU",

            "num_timesteps": 4,
            "hidden_size_orig": 400,
            "hidden_size": 16,
            "deepgmg_mlp_size": 2,

            "num_node_types": 174,
            "num_edge_types": 4,

            "learning_rate": 0.0005,
            "clamp_gradient_norm": 1.0,

            "batch_size": 32,
            "num_epochs": 100,
            "out_dir": "/tmp",

            "tie_fwd_bkwd": 0,
            "use_edge_bias": 0,
            "use_edge_msg_avg_aggregation": 0,

            "save_best_model_interval": 1
        }

        state = PredictionModelState(config)
        self.trainer = PredictionModelTrainer(config, state)
        self.predictor = PredictionModelPredictor(config, state)

        return self

    def save(self, outpath):
        raise Exception()

    def restore(self, inpath):
        raise Exception()

    def train(self, **train):
        graphs = []
        for graph, aux_in, y in zip(train["clang_graphs"], train["aux_in"], train["y"]):
            graph[utils.L.LABEL_0] = y
            graph[utils.I.AUX_IN_0] = aux_in

            graphs.append(graph)

        self.trainer.train(graphs)

    def predict(self, **test):
        graphs = []
        for graph, aux_in, y in zip(test["clang_graphs"], test["aux_in"], test["y"]):
            graph[utils.L.LABEL_0] = y
            graph[utils.I.AUX_IN_0] = aux_in

            graphs.append(graph)

        p = self.predictor.predict(graphs)
        p = np.array(p)

        indices = [np.argmax(x) for x in p]
        return indices


print("Evaluating DeepGNN ...", file=sys.stderr)
grewe = evaluate(Grewe())
result = grewe.groupby(['Platform', 'Benchmark Suite'])['Platform', 'Correct?', 'Speedup'].mean()
print(result)