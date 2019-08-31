import argparse
import json
import numpy as np
import os
import pandas as pd
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

import utils
import applications.clang_code.codegraph_models as clang_codegraph_models
import applications.clang_code.preprocess as clang_preprocess
from model.PredictionModel import PredictionModel, PredictionModelState


def prepare_preprocessing_artifact_dir(base_dir):
    utils.delete_and_create_folder(base_dir)
    utils.delete_and_create_folder(os.path.join(base_dir, 'out'))
    utils.delete_and_create_folder(os.path.join(base_dir, 'bad_code'))
    utils.delete_and_create_folder(os.path.join(base_dir, 'good_code'))
    utils.delete_and_create_folder(os.path.join(base_dir, 'error_logs'))


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

    def __init__(self, dataset) -> None:
        self.dataset = dataset

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


# Experiment: DeepGNN
class DeepGNN(HeterogemeousMappingModel):
    __name__ = "DeepGNN"
    __basename__ = "deepgnn"

    def __init__(self, config, dataset):
        self.config = config
        self.dataset = dataset

    def init(self, seed):
        self.state = PredictionModelState(self.config)
        self.model = PredictionModel(self.config, self.state)

        print('Number of trainable parameters:', self.state.count_number_trainable_params())

        return self

    def save(self, outpath):
        raise Exception()

    def restore(self, inpath):
        raise Exception()

    def train(self, **train):
        graphs_train = []
        for graph, y in zip(train["clang_graphs_train"], train["y_train"]):
            graph[utils.L.LABEL_0] = y
            graphs_train.append(graph)

        graphs_valid = []
        for graph, y in zip(train["clang_graphs_valid"], train["y_valid"]):
            graph[utils.L.LABEL_0] = y
            graphs_valid.append(graph)

        graphs_test = []
        for graph, y in zip(train["clang_graphs_test"], train["y_test"]):
            graph[utils.L.LABEL_0] = y
            graphs_test.append(graph)

        self.model.train(graphs_train, graphs_valid=graphs_valid, graphs_test=graphs_test)

    def predict(self, **test):
        graphs_test = []
        for graph, y in zip(test["clang_graphs_test"], test["y_test"]):
            graph[utils.L.LABEL_0] = y
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

    def __init__(self, config, dataset):
        DeepGNN.__init__(self, config, dataset)

def evaluate(model: HeterogemeousMappingModel) -> pd.DataFrame:
    df = model.dataset

    df_train = df[df['inst2vec_class'] == 'ir_train']
    clang_graphs_train = np.array(
        df_train["clang_graph"].values,
    ).T
    y_train = np.array(df_train['class_id'])

    df_test = df[df['inst2vec_class'] == 'ir_test']
    clang_graphs_test = np.array(
        df_test["clang_graph"].values,
    ).T
    y_test = np.array(df_test['class_id'])

    df_valid = df[df['inst2vec_class'] == 'ir_val']
    clang_graphs_valid = np.array(
        df_valid["clang_graph"].values,
    ).T
    y_valid = np.array(df_valid['class_id'])

    # train model
    model.init(seed=0)
    model.train(clang_graphs_train=[json.loads(g, object_hook=utils.json_keys_to_int) for g in clang_graphs_train],
                y_train=y_train,
                clang_graphs_test=[json.loads(g, object_hook=utils.json_keys_to_int) for g in clang_graphs_test],
                y_test=y_test,
                clang_graphs_valid=[json.loads(g, object_hook=utils.json_keys_to_int) for g in clang_graphs_valid],
                y_valid=y_valid)

    prediction_indices = model.predict(clang_graphs_test=[json.loads(g, object_hook=utils.json_keys_to_int) for g in clang_graphs_test],
                                       y_test=y_test)

    accuracy = np.sum(prediction_indices == y_test) / len(prediction_indices)
    print(accuracy)

    return accuracy


def print_and_save_report(args, config, model, accuracy):
    report_json = {
        'accuracy': accuracy,
        'config': config
    }

    # Write to files
    num_files = int(len(
        [f for f in os.listdir(args.report_write_dir) if os.path.isfile(os.path.join(args.report_write_dir, f))]))

    # Summary as JSON
    filename = model.__basename__ + '_' + str(num_files) + '.json'
    with open(os.path.join(args.report_write_dir, filename), 'w') as f:
        f.write(json.dumps(report_json))


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
        parser_prep.add_argument("--inst2vec_dataset_dir", type=str)
        parser_prep.add_argument("--dataset_csv_out", type=str)

        args = parser_prep.parse_args(sys.argv[2:])

        preprocessing_artifact_dir_clang = os.path.join(args.preprocessing_artifact_dir, 'clang')
        preprocessing_artifact_dir_llvm = os.path.join(args.preprocessing_artifact_dir, 'llvm')
        # prepare_preprocessing_artifact_dir(preprocessing_artifact_dir_clang)
        # prepare_preprocessing_artifact_dir(preprocessing_artifact_dir_llvm)
        #
        # classes = [f for f in os.listdir(args.code_dir)]
        # for class_name in classes:
        #     class_code_dir = os.path.join(args.code_dir, class_name)
        #     files = utils.get_files_by_extension(class_code_dir, '.cpp')
        #     print(class_code_dir)
        #
        #     clang_preprocess.process_sources(files, preprocessing_artifact_dir_clang, args.code_dir,
        #                                      is_opencl_source=False)



        df = pd.DataFrame(columns=['clang_graph', 'program_ids', 'class_id', 'inst2vec_class'])

        # Pass 1: Parsing, Transforming
        graphs_dir = os.path.join(preprocessing_artifact_dir_clang, 'out')
        class_names = [f for f in os.listdir(graphs_dir)]

        num_nodes = []
        graphs_transformed = []

        for i, class_name in enumerate(class_names):
            utils.printProgressBar(i, len(class_names), prefix='Parsing, Transforming:', suffix='Complete', length=50)

            file_names = [f for f in os.listdir(os.path.join(graphs_dir, class_name))]
            for file_name in file_names:
                # Parse from file to object
                file_name_absl = os.path.join(graphs_dir, class_name, file_name)
                with open(file_name_absl) as f:
                    jRoot = json.load(f)
                graphs = clang_codegraph_models.codegraphs_create_from_miner_output(jRoot)

                # Transform
                graphs_new = []
                for graph in graphs:
                    graph = clang_codegraph_models.transform_graph(graph)
                    graphs_new.append(graph)
                graphs_transformed.append({
                    'graph': graphs_new,
                    'class_id': int(class_name),
                    'program_id': file_name.split('.')[0]})

                # Stats: Number of nodes
                stats_vstr = clang_codegraph_models.StatisticsVisitor()
                for graph in graphs_new:
                    graph.accept(stats_vstr)
                    num_nodes.append(stats_vstr.num_nodes)

        print('num_nodes_max:', np.max(num_nodes))
        print('num_nodes_mean:', np.mean(num_nodes))
        print('num_graphs:', len(graphs_transformed))

        # Pass 2: Assign node ids
        nic_vstr = clang_codegraph_models.NodeTypeIdCreateVisitor(with_functionnames=False, with_callnames=False)
        for i, graph_data in enumerate(graphs_transformed):
            utils.printProgressBar(i, len(graphs_transformed), prefix='Assign node ids:', suffix='Complete', length=50)

            for graph in graph_data['graph']:
                graph.accept(nic_vstr)
        node_types = nic_vstr.node_type_ids_by_statements
        print(utils.pretty_print_dict(node_types))
        print('num_node_types:', len(node_types))

        # Pass 3: CodeGraph -> graph
        for i, graph_data in enumerate(graphs_transformed):
            if i % 100 == 0:
                utils.printProgressBar(i, len(graphs_transformed), prefix='CodeGraph -> graph:', suffix='Complete', length=50)

            nodes_all = []
            node_values_all = []
            edges_all = []

            for graph in graph_data['graph']:
                # Extract node infos
                ni_vstr = clang_codegraph_models.NodeInfoExtractionVisitor()
                graph.accept(ni_vstr)
                nodes = ni_vstr.node_types()
                node_values = ni_vstr.node_values()

                # Extract edges
                ee_vstr = clang_codegraph_models.EdgeExtractionVisitor(edge_types={'AST': 0, 'LIVE': 1})
                graph.accept(ee_vstr)
                edges = ee_vstr.edges

                # Shift edges to correct nodes
                edges_corrected = []
                for edge in edges:
                    edges_corrected.append((edge[0] + len(nodes_all), edge[1], edge[2] + len(nodes_all)))

                nodes_all += nodes
                node_values_all += node_values
                edges_all += edges

            graph_export = {
                utils.T.NODES: nodes_all,
                utils.T.NODE_VALUES: node_values_all,
                utils.T.EDGES: edges_all
            }

            # Append to df
            df = df.append({
                'clang_graph': json.dumps(graph_export),
                'class_id': graph_data['class_id'],
                'program_id': graph_data['program_id']}, ignore_index=True)

        # Save df
        df.to_csv(args.dataset_csv_out, index=False)

        # Enrich with information of inst2vec evaluation
        df = pd.read_csv(args.dataset_csv_out)
        for set_name in ['ir_test', 'ir_val', 'ir_train']:
            print('Proccessing %s' % set_name)
            utils.print_dash()

            class_names = [f for f in os.listdir(os.path.join(args.inst2vec_dataset_dir, set_name))]
            for class_name in class_names:
                file_names = [f for f in os.listdir(os.path.join(args.inst2vec_dataset_dir, set_name, class_name))]
                prefixes = []
                for file_name in file_names:
                    prefixes.append(file_name.split('.')[0])
                program_ids = list(set(prefixes))

                for program_id in program_ids:
                    if not program_id.isdigit():
                        continue

                    match = (df['class_id'] == int(class_name)) & (df['program_id'] == int(program_id))
                    if len(df[match]) != 1:
                        print(' Missing sample: class_id: %d, program_id %d' % (int(class_name), int(program_id)))
                        continue

                    df.loc[match, 'inst2vec_class'] = set_name

        # Save df
        df.to_csv(args.dataset_csv_out, index=False)

    # Experiment command
    if command_arg.command == 'experiment':
        # Parse args
        parser_exp = subparsers.add_parser('train')

        parser_exp.add_argument('--dataset')
        parser_exp.add_argument('--report_write_dir')

        args = parser_exp.parse_args(sys.argv[2:])

        #
        dataset = pd.read_csv(args.dataset)

        config = {
            "graph_rnn_cell": "GRU",

            "num_timesteps": 4,
            "hidden_size_orig": 92,
            "hidden_size": 8,
            "deepgmg_mlp_size": 2,

            "num_edge_types": 2,

            "prediction_cell": {
                "mlp_f_m_dims": [],
                "mlp_g_m_dims": [],
                "mlp_reduce_after_aux_in_dims": [105],
                "output_dim": 105,
            },

            "embedding_layer": {
                "mapping_dims": []
            },

            "learning_rate": 0.005,
            "clamp_gradient_norm": 1.0,

            "batch_size": 64,
            "num_epochs": 2500,
            "out_dir": "/tmp",

            "tie_fwd_bkwd": 0,
            "use_edge_bias": 0,
            "use_edge_msg_avg_aggregation": 0,

            "use_node_values": 0,

            "save_best_model_interval": 1,

            "with_aux_in": 0
        }

        print("Evaluating GNNClang ...", file=sys.stderr)
        model = DeepGNNAST(config, dataset)
        accuracy = evaluate(model)

        print_and_save_report(args, config, model, accuracy)


if __name__ == '__main__':
    main()
