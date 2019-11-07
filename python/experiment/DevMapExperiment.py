import argparse
import json
import os
import numpy as np
import pandas as pd
import pickle
import sys
from collections import Counter, defaultdict
from pandas.io.json import json_normalize
import time
from typing import List

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

import utils
import applications.clang_code.codegraph_models as clang_codegraph_models
import applications.clang_code.preprocess as clang_preprocess
import applications.code.codegraph_models as llvm_codegraph_models
import applications.code.preprocess as llvm_preprocess
from model.PredictionModel import PredictionModel, PredictionModelState


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
    # transfer = df[["transfer"]].values
    # min_max_scaler = preprocessing.MinMaxScaler()
    # transfer_scaled = np.squeeze(min_max_scaler.fit_transform(transfer))
    #
    # wgsize = df[["wgsize"]].values
    # min_max_scaler = preprocessing.MinMaxScaler()
    # wgsize_scaled = np.squeeze(min_max_scaler.fit_transform(wgsize))
    #
    # return np.array([
    #     transfer_scaled,
    #     wgsize_scaled,
    # ]).T

    return np.array([
        df['transfer'].values,
        df['wgsize'].values,
    ]).T

def get_clang_graphs(df: pd.DataFrame) -> np.array:
    graphs = np.array(
        df["clang_graph"].values,
    ).T

    return np.array([json.loads(g, object_hook=utils.json_keys_to_int) for g in graphs])

def get_llvm_graphs(df: pd.DataFrame) -> np.array:
    graphs = np.array(
        df["llvm_graph"].values,
    ).T

    return np.array([json.loads(g, object_hook=utils.json_keys_to_int) for g in graphs])

def encode_1hot(y: np.array) -> np.array:
    """ 1-hot encode labels """
    labels = np.vstack([np.expand_dims(x, axis=0) for x in y])
    l2 = [x[0] for x in labels]
    l1 = [not x for x in l2]
    return np.array(list(zip(l1, l2)), dtype=np.int32)


def encode_srcs(atomizer, srcs: List[str]) -> np.array:
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

    def __init__(self) -> None:
        pass

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

    def get_num_trainable_parameters(self):
        raise NotImplementedError

    def construct(self):
        pass


def predict(**data):
    idx = data['idx']

    # Predict on valid set
    inference_time_start = time.time()
    p = data['model'].predict(
        features=data['features'][idx],
        aux_in_test=data['aux_in'][idx],
        clang_graphs_test=data['clang_graphs'][idx],
        llvm_graphs_test=data['llvm_graphs'][idx],
        sequences=data['sequences'][idx] if data['sequences'] is not None else None,
        y_test=data['y'][idx],
        verbose=False)
    inference_time_end = time.time()
    inference_time = inference_time_end - inference_time_start

    # benchmarks
    benchmarks = data['df']['benchmark'].values[idx]
    # oracle device mappings
    o = data['y'][idx]
    # whether predictions were correct or not
    correct = p == o
    # runtimes of baseline mapping (CPU on AMD, GPU on NVIDIA)
    zero_r_dev = "runtime_cpu" if data['platform'] == "amd" else "runtime_gpu"
    zer_r_runtimes = data['df'][zero_r_dev][idx]
    # speedups of predictions
    runtimes = data['df'][['runtime_cpu', 'runtime_gpu']].values[idx]
    p_runtimes = [r[p_] for p_, r in zip(p, runtimes)]
    p_speedup = zer_r_runtimes / p_runtimes

    # sanity check
    assert (len(benchmarks) == len(o) == len(correct) == len(p) == len(p_speedup))

    # record results
    results = []
    for benchmark_, o_, p_, correct_, p_speedup_ in zip(benchmarks, o, p, correct, p_speedup):
        results.append({
            "Model": data['model'].__name__,
            "Platform": platform2str(data['platform']),
            'Benchmark': escape_benchmark_name(benchmark_),
            'Benchmark Suite': escape_suite_name(benchmark_),
            "Oracle Mapping": o_,
            "Predicted Mapping": p_,
            "Correct?": correct_,
            "Speedup": p_speedup_,
            "Fold": data['fold_idx'],
            "num_trainable_parameters": data['model'].get_num_trainable_parameters(),
            "train_time": data['train_time'],
            "inference_time": inference_time
        })

    return results


def evaluate_3split(model: HeterogemeousMappingModel, fold_mode, datasets, dataset_nvidia, dataset_amd, seed) -> pd.DataFrame:
    """
    Evaluate a model.

    Performs 3-split cross-validation of the model's effectiveness at predicting
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
    from sklearn.model_selection import StratifiedKFold, GroupKFold
    from progressbar import ProgressBar

    if len(datasets) == 0:
        datasets = ["nvidia", "amd"]

    data_valid = []
    data_test = []
    for i, platform in enumerate(datasets):
        progressbar = [0, ProgressBar(max_value=10)]

        platform_name = platform2str(platform)

        # load runtime data
        if platform == "nvidia":
            model.dataset = dataset_nvidia
        elif platform == "amd":
            model.dataset = dataset_amd

        df = model.dataset

        sequences = None  # defer sequence encoding until needed (it's expensive)

        # values used for training & predictions
        features = grewe_features(df)
        aux_in = auxiliary_inputs(df)
        clang_graphs = get_clang_graphs(df)
        llvm_graphs = get_llvm_graphs(df)

        # optimal mappings
        y = np.array([1 if x == "GPU" else 0 for x in df["oracle"].values])
        y_1hot = encode_1hot(y)

        # 5-fold cross-validation
        if fold_mode == 'random':
            kfold_seed = 204
            kf = StratifiedKFold(n_splits=5, shuffle=True, random_state=kfold_seed)
            split = kf.split(features, y)

        for j, (train_index, remaining_index) in enumerate(split):
            # train model
            model.init(seed=seed)

            if model.__class__.__name__ == 'DeepTune' and sequences is None:  # encode source codes if needed
                sequences = encode_srcs(model.atomizer, df["src"].values)

            train_time_start = time.time()
            model.train(df=df,
                        features=features[train_index],
                        aux_in_train=aux_in[train_index],
                        clang_graphs_train=clang_graphs[train_index],
                        llvm_graphs_train=llvm_graphs[train_index],
                        sequences=sequences[train_index] if sequences is not None else None,
                        y_train=y[train_index],
                        y_1hot=y_1hot[train_index],
                        verbose=True)
            train_time_end = time.time()
            train_time = train_time_end - train_time_start

            # validate and test model
            kfold_seed = 204
            kf = StratifiedKFold(n_splits=2, shuffle=True, random_state=kfold_seed)
            remaining_split = kf.split(features[remaining_index], y[remaining_index])

            for j_remaining, (valid_index, test_index) in enumerate(remaining_split):
                # validate
                data_valid += predict(
                    idx=valid_index,
                    model=model,
                    features=features,
                    aux_in=aux_in,
                    platform=platform,
                    clang_graphs=clang_graphs,
                    llvm_graphs=llvm_graphs,
                    sequences=sequences,
                    y=y,
                    df=df,
                    fold_idx=j,
                    train_time=train_time
                )

                # Test
                data_test += predict(
                    idx=test_index,
                    model=model,
                    features=features,
                    aux_in=aux_in,
                    platform=platform,
                    clang_graphs=clang_graphs,
                    llvm_graphs=llvm_graphs,
                    sequences=sequences,
                    y=y,
                    df=df,
                    fold_idx=j,
                    train_time=train_time
                )

    df_valid = pd.DataFrame(
        data_valid, index=range(1, len(data_valid) + 1), columns=[
            "Model",
            "Platform",
            "Benchmark",
            "Benchmark Suite",
            "Oracle Mapping",
            "Predicted Mapping",
            "Correct?",
            "Speedup",
            "Fold",
            "num_trainable_parameters",
            "train_time",
            "inference_time"
        ])
    df_valid['set'] = 'valid'

    df_test = pd.DataFrame(
        data_test, index=range(1, len(data_valid) + 1), columns=[
            "Model",
            "Platform",
            "Benchmark",
            "Benchmark Suite",
            "Oracle Mapping",
            "Predicted Mapping",
            "Correct?",
            "Speedup",
            "Fold",
            "num_trainable_parameters",
            "train_time",
            "inference_time"
        ])
    df_test['set'] = 'test'

    return pd.concat([df_valid, df_test])


def evaluate(model: HeterogemeousMappingModel, fold_mode, datasets, dataset_nvidia, dataset_amd, seed) -> pd.DataFrame:
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
    from sklearn.model_selection import StratifiedKFold, GroupKFold
    from progressbar import ProgressBar

    if len(datasets) == 0:
        datasets = ["nvidia", "amd"]

    data = []
    for i, platform in enumerate(datasets):
        progressbar = [0, ProgressBar(max_value=10)]

        platform_name = platform2str(platform)

        # load runtime data
        if platform == "nvidia":
            model.dataset = dataset_nvidia
        elif platform == "amd":
            model.dataset = dataset_amd

        df = model.dataset

        sequences = None  # defer sequence encoding until needed (it's expensive)

        # values used for training & predictions
        features = grewe_features(df)
        aux_in = auxiliary_inputs(df)
        clang_graphs = get_clang_graphs(df)
        llvm_graphs = get_llvm_graphs(df)

        # optimal mappings
        y = np.array([1 if x == "GPU" else 0 for x in df["oracle"].values])
        y_1hot = encode_1hot(y)

        # 10-fold cross-validation
        if fold_mode == 'random':
            kfold_seed = 204
            kf = StratifiedKFold(n_splits=10, shuffle=True, random_state=kfold_seed)
            split = kf.split(features, y)
        elif fold_mode == 'grouped':
            benchmark_suites = [x.split('-')[0] for x in list(df['benchmark'])]
            num_benchmark_suites = len(set(benchmark_suites))

            temp = defaultdict(lambda: len(temp))
            groups = [temp[x] for x in benchmark_suites]

            kf = GroupKFold(n_splits=num_benchmark_suites)
            split = kf.split(features, y, groups)

        for j, (train_index, test_index) in enumerate(split):
            # train and cache a model
            model.init(seed=seed)

            if model.__class__.__name__ == 'DeepTune' and sequences is None:  # encode source codes if needed
                sequences = encode_srcs(model.atomizer, df["src"].values)

            clang_graphs_train = [json.loads(g, object_hook=utils.json_keys_to_int) for g in clang_graphs[train_index]]
            clang_graphs_test = [json.loads(g, object_hook=utils.json_keys_to_int) for g in clang_graphs[test_index]]
            llvm_graphs_train = [json.loads(g, object_hook=utils.json_keys_to_int) for g in llvm_graphs[train_index]]
            llvm_graphs_test = [json.loads(g, object_hook=utils.json_keys_to_int) for g in llvm_graphs[test_index]]

            train_time_start = time.time()
            model.train(df=df,
                        features=features[train_index],
                        aux_in_train=aux_in[train_index],
                        aux_in_test=aux_in[test_index],
                        clang_graphs_train=clang_graphs_train,
                        clang_graphs_test=clang_graphs_test,
                        llvm_graphs_train=llvm_graphs_train,
                        llvm_graphs_test=llvm_graphs_test,
                        sequences=sequences[train_index] if sequences is not None else None,
                        y_train=y[train_index],
                        y_test=y[test_index],
                        y_1hot=y_1hot[train_index],
                        verbose=True)
            train_time_end = time.time()
            train_time = train_time_end - train_time_start

            # test model
            inference_time_start = time.time()
            p = model.predict(
                features=features[test_index],
                aux_in_test=aux_in[test_index],
                clang_graphs_test=clang_graphs_test,
                llvm_graphs_test=llvm_graphs_test,
                sequences=sequences[test_index] if sequences is not None else None,
                y_test=y[test_index],
                verbose=False)
            inference_time_end = time.time()
            inference_time = inference_time_end - inference_time_start

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
                    "Fold": j,
                    "num_trainable_parameters": model.get_num_trainable_parameters(),
                    "train_time": train_time,
                    "inference_time": inference_time
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
            "Speedup",
            "Fold",
            "num_trainable_parameters",
            "train_time",
            "inference_time"
        ])

# Experiment: Random mapping
class RandomMapping(HeterogemeousMappingModel):
    __name__ = "Random mapping"
    __basename__ = "random"

    def init(self, seed: int):
        return self

    def train(self, df=None, **train):
        pass

    def predict(self, **test):
        return np.random.randint(0, 2, len(test["y_test"]))

    def get_num_trainable_parameters(self):
        return 0

# Experiment: Static mapping
class StaticMapping(HeterogemeousMappingModel):
    __name__ = "Static mapping"
    __basename__ = "static"

    def init(self, seed: int):
        return self

    def save(self, outpath):
        with open(outpath, "wb") as outfile:
            pickle.dump(self.model, outfile)

    def restore(self, inpath):
        with open(inpath, "rb") as infile:
            self.model = pickle.load(infile)

    def train(self, df=None, **train):
        from collections import Counter

        # select the Zero-R device: the most frequently optimal device
        zero_r_device = Counter(df['oracle']).most_common(1)[0][0]
        self.model = 1 if zero_r_device == "GPU" else 0

    def predict(self, **test):
        if self.model:
            return np.ones(len(test["y_test"])).astype(np.int32)
        else:
            return np.zeros(len(test["y_test"])).astype(dtype=np.int32)

    def get_num_trainable_parameters(self):
        return None

# Experiment: Grewe et al
class Grewe(HeterogemeousMappingModel):
    __name__ = "Grewe et al."
    __basename__ = "grewe"

    def init(self, seed: int):
        from sklearn.tree import DecisionTreeClassifier

        self.model = DecisionTreeClassifier(
            random_state=seed, splitter="best",
            criterion="entropy", max_depth=5,
            min_samples_leaf=5)
        return self

    def save(self, outpath):
        with open(outpath, "wb") as outfile:
            pickle.dump(self.model, outfile)

    def restore(self, inpath):
        with open(inpath, "rb") as infile:
            self.model = pickle.load(infile)

    def train(self, **train):
        self.model.fit(train["features"], train["y_train"])

    def predict(self, **test):
        return self.model.predict(test["features"])

    def get_num_trainable_parameters(self):
        return None

# Experiment: DeepTune
class DeepTune(HeterogemeousMappingModel):
    __name__ = "DeepTune"
    __basename__ = "deeptune"

    def __init__(self, config):
        self.config = config

    def init(self, seed: int):
        np.random.seed(seed)

        from keras.layers import Input, Embedding, LSTM, Dense
        from keras.layers.merge import Concatenate
        from keras.layers.normalization import BatchNormalization
        from keras.models import Model
        from keras.regularizers import l2

        # Parse from config
        h_size = self.config['h_size']
        num_extra_lstm_layers = self.config['num_extra_lstm_layers']
        l2_factor = self.config['L2_loss_factor']

        srcs = '\n'.join(self.dataset['src'].values)
        self.atomizer = GreedyAtomizer.from_text(srcs)

        # Language model. Takes as inputs source code sequences.
        # Embedding model
        code_in = Input(shape=(1024,), dtype="int32", name="code_in")
        x = Embedding(input_dim=self.atomizer.vocab_size + 1, input_length=1024,
                      output_dim=h_size, name="embedding",
                      embeddings_regularizer=l2(l2_factor), activity_regularizer=l2(l2_factor))(code_in)
        # Language model
        x = LSTM(h_size, implementation=1, return_sequences=True, name="lstm_1",
                 kernel_regularizer=l2(l2_factor), recurrent_regularizer=l2(l2_factor), bias_regularizer=l2(l2_factor))(x)
        for i in range(0, num_extra_lstm_layers):
            x = LSTM(h_size, implementation=1, name="lstm_%i" % (i + 2),
                     kernel_regularizer=l2(l2_factor), recurrent_regularizer=l2(l2_factor), bias_regularizer=l2(l2_factor))(x)
        langmodel_out = Dense(2, activation="sigmoid",
                              kernel_regularizer=l2(l2_factor), bias_regularizer=l2(l2_factor))(x)

        # Auxiliary inputs. wgsize and dsize.
        auxiliary_inputs = Input(shape=(2,))

        # Heuristic model. Takes as inputs the language model,
        #   outputs 1-hot encoded device mapping
        x = Concatenate()([auxiliary_inputs, x])
        x = BatchNormalization()(x)
        x = Dense(32, activation="relu",
                  kernel_regularizer=l2(l2_factor), bias_regularizer=l2(l2_factor))(x)
        out = Dense(2, activation="sigmoid",
                    kernel_regularizer=l2(l2_factor), bias_regularizer=l2(l2_factor))(x)

        self.model = Model(inputs=[auxiliary_inputs, code_in], outputs=[out, langmodel_out])
        self.model.compile(
            optimizer="adam", metrics=['accuracy'],
            loss=["categorical_crossentropy", "categorical_crossentropy"],
            loss_weights=[1., .2])

        return self

    def save(self, outpath):
        self.model.save(outpath)

    def restore(self, inpath):
        from keras.models import load_model
        self.model = load_model(inpath)

    def train(self, **data):
        self.model.fit([data["aux_in_train"], data["sequences"]], [data["y_1hot"], data["y_1hot"]],
                       epochs=50, batch_size=64, verbose=data["verbose"], shuffle=True)

    def predict(self, **data):
        p = np.array(self.model.predict(
            [data["aux_in_test"], data["sequences"]], batch_size=64, verbose=data["verbose"]))
        indices = [np.argmax(x) for x in p[0]]
        return indices

    def get_num_trainable_parameters(self):
        return self.model.count_params()


# Experiment: DeepGNN
class DeepGNN(HeterogemeousMappingModel):
    __name__ = "DeepGNN"
    __basename__ = "deepgnn"

    def __init__(self, config):
        self.config = config

    def init(self, seed):
        self.state = PredictionModelState(self.config)
        self.model = PredictionModel(self.config, self.state)

        print('Number of trainable parameters:', self.state.count_number_trainable_params())

        return self

    def save(self, outpath):
        raise Exception()

    def restore(self, inpath):
        raise Exception()

    def train(self, **data):
        prefix = 'clang' if self.__basename__ == 'deepgnn-ast' else 'llvm'

        graphs_train = []
        for graph, aux_in, y in zip(data[prefix + "_graphs_train"], data["aux_in_train"], data["y_train"]):
            graph[utils.L.LABEL_0] = y
            graph[utils.I.AUX_IN_0] = aux_in
            graphs_train.append(graph)

        self.model.train(graphs_train)

    def predict(self, **data):
        prefix = 'clang' if self.__basename__ == 'deepgnn-ast' else 'llvm'

        graphs_test = []
        for graph, aux_in, y in zip(data[prefix + "_graphs_test"], data["aux_in_test"], data["y_test"]):
            graph[utils.L.LABEL_0] = y
            graph[utils.I.AUX_IN_0] = aux_in
            graphs_test.append(graph)

        p = self.model.predict(graphs_test)
        p = np.array(p)

        indices = [np.argmax(x) for x in p]

        return indices

    def get_num_trainable_parameters(self):
        return self.state.count_number_trainable_params()


class DeepGNNAST(DeepGNN):
    __name__ = "DeepGNN AST"
    __basename__ = "deepgnn-ast"

    def __init__(self, config):
        DeepGNN.__init__(self, config)


class DeepGNNLLVM(DeepGNN):
    __name__ = "DeepGNN LLVM"
    __basename__ = "deepgnn-llvm"

    def __init__(self, config):
        DeepGNN.__init__(self, config)


def parse_report_to_summary(report: pd.DataFrame):
    report_str = ''

    report_str += 'Grouped by Platform\n'
    report_str += str(report.groupby(['Platform'])['Platform', 'Correct?', 'Speedup'].mean())
    report_str += '\n\n'

    report_str += 'Grouped by Platform and Fold\n'
    report_str += str(report.groupby(['Platform', 'Fold'])['Platform', 'Correct?', 'Speedup'].mean())
    report_str += '\n\n'

    report_str += 'Grouped by Platform and Benchmark Suite\n'
    report_str += str(report.groupby(['Platform', 'Benchmark Suite'])['Platform', 'Correct?', 'Speedup'].mean())
    report_str += '\n\n'

    return report_str


def report_to_json(report: pd.DataFrame):
    result = report.groupby(['Platform'])['Platform', 'Correct?', 'Speedup'].mean()
    accuracy = result.loc['NVIDIA GTX 970', 'Correct?']
    speedup = result.loc['NVIDIA GTX 970', 'Speedup']

    return {'accuracy': round(accuracy, 4),
            'speedup': round(speedup, 4)}


def build_run_id(report_write_dir):
    num_files = int(len(
        [f for f in os.listdir(report_write_dir) if os.path.isfile(os.path.join(report_write_dir, f))]))

    return num_files


def print_and_save_report(report_write_dir, run_id, config, model, report):
    # Print report
    report_summary = parse_report_to_summary(report)
    print(report_summary)

    report_json = report_to_json(report)

    # Write to files
    # Config
    filename = model.__basename__ + '_' + str(run_id) + '_config.txt'
    with open(os.path.join(report_write_dir, filename), 'w') as f:
        f.write(json.dumps(config))

    # Summary
    filename = model.__basename__ + '_' + str(run_id) + '_summary.txt'
    with open(os.path.join(report_write_dir, filename), 'w') as f:
        f.write(report_summary)

    # Summary as JSON
    filename = model.__basename__ + '_' + str(run_id) + '_summary.json'
    with open(os.path.join(report_write_dir, filename), 'w') as f:
        f.write(json.dumps(report_json))

    # Raw
    filename = model.__basename__ + '_' + str(run_id) + '_raw.txt'
    with open(os.path.join(report_write_dir, filename), 'w') as f:
        f.write(report.to_csv())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('command', help='Subcommand to run')
    subparsers = parser.add_subparsers()

    # Parse command
    command_arg = parser.parse_args(sys.argv[1:2])
    if not hasattr(command_arg, 'command'):
        print('Unrecognized command')
        parser.print_help()
        exit(1)

    # Preprocess command
    if command_arg.command == 'preprocess':
        # Parse args
        parser_prep = subparsers.add_parser('preprocess')

        parser_prep.add_argument("--code_dir", type=str,
                                 help="directory of c code files")
        parser_prep.add_argument("--preprocessing_artifact_dir", type=str,
                                 help="out directory containing preprocessing information")
        parser_prep.add_argument('--cgo17_benchmarks_csv', type=str)
        parser_prep.add_argument("--cgo17_benchmarks_csv_out", type=str)

        args = parser_prep.parse_args(sys.argv[2:])

        #
        preprocessing_artifact_dir_clang = os.path.join(args.preprocessing_artifact_dir, 'clang')
        preprocessing_artifact_dir_llvm = os.path.join(args.preprocessing_artifact_dir, 'llvm')
        utils.prepare_preprocessing_artifact_dir(preprocessing_artifact_dir_clang)
        utils.prepare_preprocessing_artifact_dir(preprocessing_artifact_dir_llvm)

        # Find all .cl files and extract code graphs from them
        files = utils.get_files_by_extension(args.code_dir, '.cl')

        clang_preprocess.process_source_directory(files, preprocessing_artifact_dir_clang, args.code_dir)
        llvm_preprocess.process_source_directory(files, preprocessing_artifact_dir_llvm, args.code_dir)

        # Extract oracle from the cgo17 dataframe
        # 
        df_benchmarks = pd.read_csv(args.cgo17_benchmarks_csv)
#        df_benchmarks = df_benchmarks.drop(columns=['src'])
        df_benchmarks = df_benchmarks.drop(columns=['seq'])

        # Clang
        # ############################################
        utils.print_dash()
        print('Preprocessing Clang')
        utils.print_dash()
        out_dir_clang = os.path.join(preprocessing_artifact_dir_clang, 'out')
        filenames_clang = utils.get_files_by_extension(out_dir_clang, '.json')

        preprocessed = []
        num_nodes = []
        for filename in filenames_clang:
            relative_filename = filename.replace(out_dir_clang + '/', '')

            benchmark_suite_name = relative_filename.split('/')[0]
            if benchmark_suite_name == 'parboil-0.2' or benchmark_suite_name == 'rodinia-3.1':
                benchmark_name = relative_filename.split('/')[2].lower()
            elif benchmark_suite_name == 'shoc-1.1.5':
                benchmark_name = relative_filename.split('/')[4].upper()
            elif benchmark_suite_name == 'polybench-gpu-1.0':
                benchmark_name = relative_filename.split('/')[-2].lower()
                if benchmark_name == '2dconv':
                    benchmark_name = '2DConvolution'
                elif benchmark_name == '3dconv':
                    benchmark_name = '3DConvolution'
                elif benchmark_name == 'covar':
                    benchmark_name = 'covariance'
                elif benchmark_name == 'corr':
                    benchmark_name = 'correlation'
                elif benchmark_name == 'gramschm':
                    benchmark_name = 'gramschmidt'
            else:
                benchmark_name = relative_filename.split('/')[-2]

            with open(filename) as f:
                jRoot = json.load(f)
            graphs = clang_codegraph_models.codegraphs_create_from_miner_output(jRoot)
            for graph_idx, graph in enumerate(graphs):
                function_name = graph.functions[0].name

                # Find this kernel in the cgo17 dataframe
                for idx, row in df_benchmarks.iterrows():
                    b = row['benchmark']
                    o = row['oracle']

                    function_name_cgo17 = b.split('-')[-1]
                    benchmark_name_cgo17 = b.split('-')[-2]
                    benchmark_suite_name_cgo17 = b.split('-')[0]

                    if function_name_cgo17 == function_name \
                            and benchmark_name_cgo17.upper() in benchmark_name.upper() \
                            and benchmark_suite_name_cgo17 in benchmark_suite_name:
                        jRoot['functions'][graph_idx][utils.AE.KERNEL_NAME] = b
                        jRoot['functions'][graph_idx][utils.L.LABEL_0] = o

                        # Transform
                        graph = clang_codegraph_models.transform_graph(graph)

                        # Add information to graph
                        graph.name = b
                        graph.oracle = o

                        # Stats: Number of nodes
                        stats_vstr = clang_codegraph_models.StatisticsVisitor()
                        graph.accept(stats_vstr)
                        num_nodes.append(stats_vstr.num_nodes)

                        preprocessed.append(graph)

                        print(benchmark_suite_name, benchmark_name, function_name, o, stats_vstr.num_nodes)

                        break

        print('num_nodes_max:', np.max(num_nodes))
        print('num_nodes_mean:', np.mean(num_nodes))
        print('num_graphs:', len(preprocessed))

        # CodeGraph -> graph
        node_types = clang_codegraph_models.get_node_types(preprocessed, with_functionnames=False, with_callnames=False)
        print('num_node_types:', len(node_types))

        graphs_export = []
        names_export = []

        for graph in preprocessed:
            graph_export = clang_codegraph_models.graph_to_export_format(graph)

            # if graph.oracle == 'CPU':
            #     graph_export[utils.L.LABEL_0] = 0
            # elif graph.oracle == 'GPU':
            #     graph_export[utils.L.LABEL_0] = 1
            # else:
            #     raise Exception()

            graphs_export.append(graph_export)
            names_export.append(graph.name)

        utils.pretty_print_dict(node_types)

        # Write cgo17 benchmarks csv file
        if args.cgo17_benchmarks_csv_out:
            # Find this kernel in the cgo17 dataframe
            for row_idx, row in df_benchmarks.iterrows():
                for name, graph in zip(names_export, graphs_export):
                    if row['benchmark'] == name:
                        df_benchmarks.loc[row_idx, 'clang_graph'] = json.dumps(graph)

            df_benchmarks.to_csv(args.cgo17_benchmarks_csv_out)

        # LLVM
        # ############################################
        utils.print_dash()
        print('Preprocessing LLVM')
        utils.print_dash()
        out_dir_llvm = os.path.join(preprocessing_artifact_dir_llvm, 'out')
        filenames_llvm = utils.get_files_by_extension(out_dir_llvm, '.json')

        preprocessed = []
        num_nodes = []
        for filename in filenames_llvm:
            relative_filename = filename.replace(out_dir_llvm + '/', '')

            benchmark_suite_name = relative_filename.split('/')[0]
            if benchmark_suite_name == 'parboil-0.2' or benchmark_suite_name == 'rodinia-3.1':
                benchmark_name = relative_filename.split('/')[2].lower()
            elif benchmark_suite_name == 'shoc-1.1.5':
                benchmark_name = relative_filename.split('/')[4].upper()
            elif benchmark_suite_name == 'polybench-gpu-1.0':
                benchmark_name = relative_filename.split('/')[-2].lower()
                if benchmark_name == '2dconv':
                    benchmark_name = '2DConvolution'
                elif benchmark_name == '3dconv':
                    benchmark_name = '3DConvolution'
                elif benchmark_name == 'covar':
                    benchmark_name = 'covariance'
                elif benchmark_name == 'corr':
                    benchmark_name = 'correlation'
                elif benchmark_name == 'gramschm':
                    benchmark_name = 'gramschmidt'
            else:
                benchmark_name = relative_filename.split('/')[-2]

            print(filename)
            try:
                with open(filename) as f:
                    jRoot = json.load(f)

                if not jRoot:
                    print('!!! Content of %s was None !!!' % filename)
                    continue
            except:
                print('!!! Content of %s was not JSON parsable !!!' % filename)
                continue

            graphs = llvm_codegraph_models.codegraphs_create_from_miner_output(jRoot)
            for graph_idx, graph in enumerate(graphs):
                function_name = graph.functions[0].name

                # Find this kernel in the cgo17 dataframe
                for idx, row in df_benchmarks.iterrows():
                    b = row['benchmark']
                    o = row['oracle']

                    function_name_cgo17 = b.split('-')[-1]
                    benchmark_name_cgo17 = b.split('-')[-2]
                    benchmark_suite_name_cgo17 = b.split('-')[0]

                    if function_name_cgo17 == function_name \
                            and benchmark_name_cgo17.upper() in benchmark_name.upper() \
                            and benchmark_suite_name_cgo17 in benchmark_suite_name:
                        jRoot['functions'][function_name][utils.AE.KERNEL_NAME] = b
                        jRoot['functions'][function_name][utils.L.LABEL_0] = o

                        # Add information to graph
                        graph.name = b
                        graph.oracle = o

                        # Stats: Number of nodes
                        stats_vstr = llvm_codegraph_models.StatisticsVisitor()
                        graph.visit(stats_vstr)
                        num_nodes.append(stats_vstr.num_nodes)

                        preprocessed.append(graph)

                        print(benchmark_suite_name, benchmark_name, function_name, o, stats_vstr.num_nodes)

                        break
        print('num_nodes_max:', np.max(num_nodes))
        print('num_nodes_mean:', np.mean(num_nodes))
        print('num_graphs:', len(preprocessed))

        # CodeGraph -> graph
        node_types_of_all_graphs = llvm_codegraph_models.get_node_types(preprocessed)
        print('num_node_types:', len(node_types_of_all_graphs))
        utils.pretty_print_dict(node_types_of_all_graphs)

        graphs_export = []
        names_export = []

        for graph in preprocessed:
            graph_export = llvm_codegraph_models.graph_to_export_format(graph, node_types_of_all_graphs)

            graphs_export.append(graph_export)
            names_export.append(graph.name)

        print(names_export)

        # Write cgo17 benchmarks csv file
        if args.cgo17_benchmarks_csv_out:
            # Find this kernel in the cgo17 dataframe
            for row_idx, row in df_benchmarks.iterrows():
                for name, graph in zip(names_export, graphs_export):
                    if row['benchmark'] == name:
                        print(name)
                        df_benchmarks.loc[row_idx, 'llvm_graph'] = json.dumps(graph)

            df_benchmarks.to_csv(args.cgo17_benchmarks_csv_out)


    # Experiment command
    if command_arg.command == 'experiment':
        # Parse args
        parser_exp = subparsers.add_parser('train')

        parser_exp.add_argument('--RandomMapping', action='store_true')
        parser_exp.add_argument('--StaticMapping', action='store_true')
        parser_exp.add_argument('--Grewe', action='store_true')
        parser_exp.add_argument('--DeepTuneLSTM', action='store_true')
        parser_exp.add_argument('--DeepTuneGNNClang', action='store_true')
        parser_exp.add_argument('--DeepTuneGNNClangASTEdges', action='store_true')
        parser_exp.add_argument('--DeepTuneGNNLLVM', action='store_true')
        parser_exp.add_argument('--DeepTuneGNNLLVMCFGEdges', action='store_true')
        parser_exp.add_argument('--DeepTuneGNNLLVMCFGDataflowEdges', action='store_true')
        parser_exp.add_argument('--DeepTuneGNNLLVMCFGDataflowCallEdges', action='store_true')

        parser_exp.add_argument('--dataset_nvidia')
        parser_exp.add_argument('--dataset_amd')

        parser_exp.add_argument('--fold_mode')
        parser_exp.add_argument('--split_mode')
        parser_exp.add_argument('--datasets', '--names-list', nargs='+', default=[])

        parser_exp.add_argument('--seed')
        parser_exp.add_argument('--report_write_dir')
        parser_exp.add_argument('--config')

        args = parser_exp.parse_args(sys.argv[2:])

        # Load datasets
        dataset_nvidia = pd.read_csv(args.dataset_nvidia)
        dataset_amd = pd.read_csv(args.dataset_amd)

        # Build run id
        run_id = str(os.getpid())
        seed = int(args.seed)

        if args.RandomMapping:
            config = json.loads(args.config) if args.config else {
                'fold_mode': args.fold_mode
            }

            model = RandomMapping()

        if args.StaticMapping:
            config = json.loads(args.config) if args.config else {
                'fold_mode': args.fold_mode
            }

            model = StaticMapping()

        if args.Grewe:
            config = json.loads(args.config) if args.config else {
                'fold_mode': args.fold_mode
            }

            model = Grewe()

        if args.DeepTuneLSTM:
            config = json.loads(args.config) if args.config else {
                'fold_mode': args.fold_mode,
                'h_size': 64,
                'num_extra_lstm_layers': 1,
                'L2_loss_factor': 0
            }

            model = DeepTune(config)

        if args.DeepTuneGNNClang or args.DeepTuneGNNClangASTEdges:
            config = json.loads(args.config) if args.config else {
                "run_id": 'deepgnn-ast' + '_' + str(run_id),
                'fold_mode': args.fold_mode,

                "gnn_type": "GGNN",

                "num_timesteps": 4,
                "hidden_size_orig": 92,
                "gnn_h_size": 32,
                "gnn_m_size": 2,

                "num_edge_types": 2,

                "prediction_cell": {
                    "mlp_f_m_dims": [64, 64],
                    "mlp_f_m_activation": "relu",

                    "mlp_g_m_dims": [64, 64],
                    "mlp_g_m_activation": "relu",

                    "mlp_reduce_dims": [64, 64],
                    "mlp_reduce_activation": "relu",
                    "mlp_reduce_out_dim": 32,

                    "mlp_reduce_after_aux_in_1_dims": [32, 32, 32],
                    "mlp_reduce_after_aux_in_1_activation": "relu",
                    "mlp_reduce_after_aux_in_1_out_dim": 32,

                    "mlp_reduce_after_aux_in_2_dims": [],
                    "mlp_reduce_after_aux_in_2_activation": "sigmoid",
                    "mlp_reduce_after_aux_in_2_out_dim": 2,

                    "output_dim": 2,
                },

                "embedding_layer": {
                    "mapping_dims": [128, 128]
                },


                "learning_rate": 0.0005,
                "clamp_gradient_norm": 1.0,
                "L2_loss_factor": 0.1,

                "batch_size": 64,
                "num_epochs": 1500,
                "out_dir": "/tmp",

                "tie_fwd_bkwd": 0,
                "use_edge_bias": 0,
                "use_edge_msg_avg_aggregation": 0,

                "use_node_values": 0,
                "save_best_model_interval": 1,
                "with_aux_in": 1,

                "edge_type_filter": [],

                "seed": seed
            }

            if args.DeepTuneGNNClangASTEdges:
                config['edge_type_filter'] = [0]
                config['num_edge_types'] = 1

            model = DeepGNNAST(config)

        if args.DeepTuneGNNLLVM or args.DeepTuneGNNLLVMCFGEdges or args.DeepTuneGNNLLVMCFGDataflowEdges or args.DeepTuneGNNLLVMCFGDataflowCallEdges:
            config = json.loads(args.config) if args.config else {
                "run_id": 'deepgnn-llvm' + '_' + str(run_id),
                'fold_mode': args.fold_mode,

                "gnn_type": "GGNN",

                "num_timesteps": 4,
                "hidden_size_orig": 140,
                "gnn_h_size": 32,
                "gnn_m_size": 2,

                "num_edge_types": 4,

                "prediction_cell": {
                    "mlp_f_m_dims": [64, 64],
                    "mlp_f_m_activation": "relu",

                    "mlp_g_m_dims": [64, 64],
                    "mlp_g_m_activation": "relu",

                    "mlp_reduce_dims": [64, 64],
                    "mlp_reduce_activation": "relu",
                    "mlp_reduce_out_dim": 32,

                    "mlp_reduce_after_aux_in_1_dims": [64, 32],
                    "mlp_reduce_after_aux_in_1_activation": "relu",
                    "mlp_reduce_after_aux_in_1_out_dim": 32,

                    "mlp_reduce_after_aux_in_2_dims": [],
                    "mlp_reduce_after_aux_in_2_activation": "sigmoid",
                    "mlp_reduce_after_aux_in_2_out_dim": 2,

                    "output_dim": 2,
                },

                "embedding_layer": {
                    "mapping_dims": [128, 128]
                },


                "learning_rate": 0.0005,
                "clamp_gradient_norm": 1.0,
                "L2_loss_factor": 0,

                "batch_size": 64,
                "num_epochs": 1500,
                "out_dir": "/tmp",

                "tie_fwd_bkwd": 0,
                "use_edge_bias": 0,
                "use_edge_msg_avg_aggregation": 0,

                "use_node_values": 0,
                "save_best_model_interval": 1,
                "with_aux_in": 1,

                "edge_type_filter": [],

                "seed": seed
            }

            if args.DeepTuneGNNLLVMCFGEdges:
                config['edge_type_filter'] = [0]
                config['num_edge_types'] = 1

            if args.DeepTuneGNNLLVMCFGDataflowEdges:
                config['edge_type_filter'] = [0, 1]
                config['num_edge_types'] = 2

            if args.DeepTuneGNNLLVMCFGDataflowCallEdges:
                config['edge_type_filter'] = [0, 1, 2]
                config['num_edge_types'] = 3

            model = DeepGNNLLVM(config)

        print("Evaluating %s ..." % model.__name__, file=sys.stderr)

        if args.split_mode == '2':
            evaluate_fn = evaluate
        elif args.split_mode == '3':
            evaluate_fn = evaluate_3split

        report = evaluate_fn(model, config['fold_mode'], args.datasets, dataset_nvidia, dataset_amd, seed)
        print_and_save_report(args.report_write_dir, run_id, config, model, report)

    # Evaluate command
    if command_arg.command == 'evaluate':
        # Parse args
        parser_eval = subparsers.add_parser('evaluate')

        parser_eval.add_argument('--evaluate_report_dir')

        args = parser_eval.parse_args(sys.argv[2:])

        #
        report_files = os.listdir(args.evaluate_report_dir)

        df = pd.DataFrame()
        for report_file in report_files:
            with open(os.path.join(args.evaluate_report_dir, report_file), 'r') as f:
                lines = f.readlines()
                report = json.loads(lines[-2])
                config = lines[-1]

                d = pd.io.json.json_normalize(json.loads(config))
                d['accuracy'] = report['accuracy']
                d['speedup'] = report['speedup']

                df = pd.concat([df, d])

        utils.print_df(df)

        for y in df.columns:
            if df[y].dtype != np.int64 and df[y].dtype != np.float64:
                df[y] = df[y].apply(str)
        config_columns = list(pd.io.json.json_normalize(json.loads(config)).columns)

        print('Mean')
        utils.print_df(df.groupby(config_columns).mean())
        utils.print_dash()

        print('Median')
        utils.print_df(df.groupby(config_columns).median())
        utils.print_dash()

        print('Max')
        utils.print_df(df.groupby(config_columns).max())
        utils.print_dash()


if __name__ == '__main__':
    main()
