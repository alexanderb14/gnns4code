import argparse
import json
import os
import pickle
import random
import shutil
import sys
import time

import numpy as np
import tensorflow as tf

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

import utils
import applications.utils as app_utils
import applications.clang_code.codegraph_models as clang_codegraph_models
from model.cell.PredictionCell import PredictionCell, PredictionCellState
from model.layer.EmbeddingLayer import EmbeddingLayer, EmbeddingLayerState
from model.layer.GGNNModelLayer import GGNNModelLayer, GGNNModelLayerState


class PredictionModelState(object):
    """
    State of the Prediction model.
    """
    def __init__(self, config):
        self.graph = tf.Graph()

        tf_config = tf.ConfigProto()
        tf_config.gpu_options.allow_growth = True
        self.sess = tf.Session(graph=self.graph, config=tf_config)

        self.best_epoch_weights = None

        with self.graph.as_default():
            self.embedding_layer_state = EmbeddingLayerState(config)
            self.ggnn_layer_state = GGNNModelLayerState(config)
            self.prediction_cell_state = PredictionCellState(config)


class PredictionModel(object):
    """
    Base class of the Trainer and Predictor.
    """
    def __init__(self, config, state):
        self.config = config
        self.state = state

        self.ggnn_layers = []
        self.cells = []

        with self.state.graph.as_default():
            self.ops = {}
            self.placeholders = {}

    def _initialize_model(self) -> None:
        """
        Init tf model
        """
        init_op = tf.group(tf.global_variables_initializer(),
                           tf.local_variables_initializer())
        self.state.sess.run(init_op)

    def _graphs_to_batch_feed_dict(self, graphs: list, graph_sizes: list, len_unroll=1) -> dict:
        num_edge_types = self.config['num_edge_types']

        batch_data = {
            # Graph model
            'adjacency_lists': [[] for _ in range(self.config['num_edge_types'])],
            'embeddings_to_graph_mappings': [],
            'aux_in': [],
            'labels': [],
            'embeddings_in': []
        }

        for graph_idx, graph in enumerate(graphs):
            num_nodes = graph_sizes[graph_idx]

            if self.config['use_edge_bias'] == 1:
                batch_data['num_incoming_edges_dicts_per_type'] = []

            # Aux in
            if utils.I.AUX_IN_0 in graph:
                batch_data['aux_in'].append(graph[utils.I.AUX_IN_0])

            # Labels
            if utils.L.LABEL_0 in graph:
                batch_data['labels'].append(graph[utils.L.LABEL_0])

            # Graph model: Adj list
            adj_lists = graph[utils.AE.ADJ_LIST]
            for idx, adj_list in adj_lists.items():
                batch_data['adjacency_lists'][idx].append(adj_list)

            if self.config['use_edge_bias'] == 1:
                # Graph model: Incoming edge numbers
                num_incoming_edges_dicts_per_type = action[utils.AE.NUMS_INCOMING_EDGES_BY_TYPE] if action else utils.graph_to_adjacency_lists([], self.config['tie_fwd_bkwd'])[0]
                num_incoming_edges_per_type = np.zeros((num_nodes, num_edge_types))
                for (e_type, num_incoming_edges_per_type_dict) in num_incoming_edges_dicts_per_type.items():
                    for (node_id, edge_count) in num_incoming_edges_per_type_dict.items():
                        num_incoming_edges_per_type[node_id, e_type] = edge_count
                batch_data['num_incoming_edges_dicts_per_type'].append(num_incoming_edges_per_type)

            graph_mappings_all = np.full(num_nodes, graph_idx)
            batch_data['embeddings_to_graph_mappings'].append(graph_mappings_all)

            nodes_one_hot = utils.get_one_hot(np.array(graph[utils.T.NODES]), self.config['hidden_size_orig'])
            batch_data['embeddings_in'].append(nodes_one_hot.astype(float))

        # Build feed dict
        feed_dict = {}

        # Graph model: Adj list
        for idx, adj_list in enumerate(self.ggnn_layers[0].placeholders['adjacency_lists']):
            feed_dict[adj_list] = np.array(batch_data['adjacency_lists'][idx])
            if len(feed_dict[adj_list]) == 0:
                feed_dict[adj_list] = np.zeros((0, 2), dtype=np.int32)
            else:
                feed_dict[adj_list] = feed_dict[adj_list][0]

        if self.config['use_edge_bias'] == 1:
            # Graph model: Incoming edge numbers
            feed_dict[self.ggnn_layers[0].placeholders['num_incoming_edges_per_type']] \
                = np.concatenate(batch_data['num_incoming_edges_dicts_per_type'], axis=0)

        # Aux in
        feed_dict[self.cells[0].placeholders['aux_in']] = batch_data['aux_in']

        # Labels
        feed_dict[self.cells[0].placeholders['labels']] = batch_data['labels']
        feed_dict[self.cells[0].placeholders['embeddings_to_graph_mappings']] \
            = np.concatenate(batch_data['embeddings_to_graph_mappings'], axis=0)

        # Embeddings
        feed_dict[self.placeholders['embeddings_in']] = np.concatenate(batch_data['embeddings_in'], axis=0)

        return feed_dict

    def _make_model(self) -> None:
        """
        Create tf model
        """
        self.placeholders['embeddings_in'] = tf.placeholder(tf.float32, [None, self.config['hidden_size_orig']], name='embeddings_in')

        # Create model: Unroll network and wire embeddings
        embeddings_reduced = self.placeholders['embeddings_in']

        # Create embedding layer
        embedding_layer = EmbeddingLayer(self.config, self.state.embedding_layer_state)
        embeddings = embedding_layer.compute_embeddings(embeddings_reduced)

        # Create propagation layer
        ggnn_layer = GGNNModelLayer(self.config, self.state.ggnn_layer_state)
        embeddings = ggnn_layer.compute_embeddings(embeddings)

        # Create prediction cell
        prediction_cell = PredictionCell(self.config, True, self.state.prediction_cell_state)
        prediction_cell.initial_embeddings = embeddings_reduced
        prediction_cell.compute_predictions(embeddings)

        self.ggnn_layers.append(ggnn_layer)
        self.cells.append(prediction_cell)

        # Accumulate losses
        losses = []

        for cell in self.cells:
            losses.append(cell.ops['loss'])

        self.ops['losses'] = losses
        self.ops['loss'] = tf.reduce_sum(losses)


class PredictionModelPredictor(PredictionModel):
    """
    Implementation of the prediction process.
    """
    def __init__(self, config: dict, state: PredictionModelState):
        super().__init__(config, state)

        # Create model
        with self.state.graph.as_default():
            self._make_model()

    def predict(self, graphs):
        # Enrich graphs with adj list
        for graph in graphs:
            graph[utils.AE.ADJ_LIST] = utils.graph_to_adjacency_lists(graph[utils.T.EDGES], self.config['tie_fwd_bkwd'] == 1)[0]

        # Extract graph sizes
        graph_sizes = []
        for graph in graphs:
            graph_sizes.append(len(graph[utils.T.NODES]))

        # Graph info
        feed_dict = self._graphs_to_batch_feed_dict(graphs, graph_sizes)

        # Run
        fetch_list = [self.ops['loss'], self.cells[0].ops['output']]
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        return result[1]

class PredictionModelTrainer(PredictionModel):
    """
    Implementation of the training process.
    """
    def __init__(self, config: dict, state: PredictionModelState):
        super().__init__(config, state)

        self.with_gradient_monitoring = True if 'gradient_monitoring' in self.config and self.config['gradient_monitoring'] == 1 else False

        # Create and initialize model
        with self.state.graph.as_default():
            self._make_model()
            self._make_train_step()
            self._initialize_model()

        # Configure directories and save model configuration
        SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
        if 'out_dir' in self.config:
            self.out_dir = self.config['out_dir'] + '/_out/'
        else:
            self.out_dir = SCRIPT_DIR + '/..' + '/_out/'

        if not os.path.exists(self.out_dir):
            os.makedirs(self.out_dir)

        if 'run_id' in self.config:
            self.run_id = self.config['run_id'] + '_'.join([time.strftime('%Y-%m-%d-%H-%M-%S'), str(os.getpid())])
        else:
            self.run_id = '_'.join([time.strftime('%Y-%m-%d-%H-%M-%S'), str(os.getpid())])

        self.out_dir += str(len(next(os.walk(self.out_dir))[1])) + '_' + self.run_id
        if os.path.exists(self.out_dir):
            shutil.rmtree(self.out_dir)

        model_path = self.out_dir + '/model'
        os.makedirs(model_path, exist_ok=True)
        self.model_file = os.path.join(model_path, 'model.pickle')

        self.tensorboard_dir = self.out_dir + '/tensorboard'
        os.makedirs(self.tensorboard_dir, exist_ok=True)

        with open(self.out_dir + '/config.json', 'w') as fp:
            json.dump(self.config, fp)

        # Configure TensorBoard
        self.train_writer = tf.summary.FileWriter(os.path.join(self.tensorboard_dir, 'train'), graph=self.state.graph)

    def _make_train_step(self) -> None:
        """
        Create tf train step
        """
        trainable_vars = self.state.sess.graph.get_collection(tf.GraphKeys.TRAINABLE_VARIABLES)

        optimizer = tf.train.AdamOptimizer(self.config['learning_rate'])
        grads_and_vars = optimizer.compute_gradients(self.ops['loss'], var_list=trainable_vars)

        # Clipping
        clipped_grads = []
        for grad, var in grads_and_vars:
            if grad is not None:
                clipped_grads.append((tf.clip_by_norm(grad, self.config['clamp_gradient_norm']), var))
            else:
                clipped_grads.append((grad, var))

        # Monitoring
        if self.with_gradient_monitoring:
            self.ops['gradients'] = tf.summary.merge([tf.summary.histogram("%s-grad" % g[1].name, g[0]) for g in grads_and_vars])
            self.ops['clipped_gradients'] = tf.summary.merge([tf.summary.histogram("%s-clipped-grad" % g[1].name, g[0]) for g in clipped_grads])

        # Apply
        self.ops['train_step'] = optimizer.apply_gradients(clipped_grads)

        # Initialize newly-introduced variables:
        self.state.sess.run(tf.local_variables_initializer())

    def _run_batch(self, feed_dict):
        """
        Train model with one batch and retrieve result
        """
        fetch_list = [self.ops['loss'], self.ops['train_step']]
        if self.with_gradient_monitoring:
            offset = len(fetch_list)
            fetch_list.extend([self.ops['gradients'], self.ops['clipped_gradients']])

        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        return result

    def train(self, graphs) -> None:
        """
        Train model with training set in multiple epochs
        """
        # Enrich graphs with adj list
        for graph in graphs:
            graph[utils.AE.ADJ_LIST] = utils.graph_to_adjacency_lists(graph[utils.T.EDGES], self.config['tie_fwd_bkwd'] == 1)[0]

        # Extract graph sizes
        graph_sizes = []
        for graph in graphs:
            graph_sizes.append(len(graph[utils.T.NODES]))

        best_epoch_loss = sys.maxsize
        best_epoch_count = 0

        for epoch in range(0, self.config['num_epochs']):
            epoch_start_time = time.time()

            # Partition into batches
            batch_size = self.config['batch_size']

            lst = list(zip(graphs, graph_sizes))
            random.shuffle(lst)
            batches = [lst[i * batch_size:(i + 1) * batch_size] for i in
                       range((len(lst) + batch_size - 1) // batch_size)]

            # Run batches
            epoch_losses = []
            epoch_instances_per_secs = []

            for batch in batches:
                start_time = time.time()
                batch_graphs, batch_graph_sizes = zip(*batch)

                batch_graphs = list(batch_graphs)
                batch_graph_sizes = list(batch_graph_sizes)

                # Build feed dict
                # 1. Graph info
                feed_dict = self._graphs_to_batch_feed_dict(batch_graphs, batch_graph_sizes)

                # Run batch
                result = self._run_batch(feed_dict)
                end_time = time.time()

                # Log
                instances_per_sec = len(batch_graphs) / (end_time - start_time)
                epoch_instances_per_secs.append(instances_per_sec)

                epoch_losses.append(result[0])

            epoch_loss = np.sum(epoch_losses)
            if epoch_loss < best_epoch_loss:
                best_epoch_loss = epoch_loss

                best_epoch_count += 1
                # if 'save_best_model_interval' in self.config and best_epoch_count >= self.config['save_best_model_interval']:
                #     self.state.backup_best_weights()
                #
                #     best_epoch_count = 0

            epoch_instances_per_sec = np.mean(epoch_instances_per_secs)

            epoch_end_time = time.time()
            epoch_time = epoch_end_time - epoch_start_time

            print('epoch: %i, instances/sec: %.2f, epoch_time: %.2fs loss: %.8f' % (epoch, epoch_instances_per_sec, epoch_time, epoch_loss))

            # Logging
            summary = tf.Summary()
            summary.value.add(tag='loss', simple_value=epoch_loss)
            self.train_writer.add_summary(summary, epoch)

        # self.state.restore_best_weights()


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

    # Train command
    if command_arg.command == 'train':
        # Parse args
        parser_train = subparsers.add_parser('train')
        parser_train.add_argument('--config_file')
        parser_train.add_argument('--config_additional_params')
        args = parser_train.parse_args(sys.argv[2:])

        # Build Config
        with open(os.path.join(SCRIPT_DIR, args.config_file)) as f:
            config = json.load(f)
        if args.config_additional_params is not None:
            config.update(json.loads(args.config_additional_params))
        print('Config: %s' % json.dumps(config))

        # Load data
        with open(SCRIPT_DIR + '/' + config['train_file'], 'r') as f:
            data = json.load(f)
            train_data = data['graphs']

            train_data = json.loads(json.dumps(train_data), object_hook=utils.json_keys_to_int)

        # Create objects
        state = PredictionModelState(config)
        trainer = PredictionModelTrainer(config, state)

        # Train
        trainer.train(train_data)

        # Save weights
        state.save_weights_to_disk(trainer.model_file)

    # Generate command
    if command_arg.command == 'generate':
        # Parse args
        parser_generate = subparsers.add_parser('generate')
        parser_generate.add_argument('--artifact_path')
        parser_generate.add_argument('--num_generate')
        parser_generate.add_argument("--create_pngs")
        parser_generate.add_argument('--save_graphs_to_file')
        parser_generate.add_argument('--debug')

        args = parser_generate.parse_args(sys.argv[2:])

        # Restore Config
        with open(os.path.join(args.artifact_path, 'config.json')) as f:
            config = json.load(f)

        # Create objects
        state = DeepGMGState(config)
        generator = DeepGMGGenerator(config, state, args.debug)
        state.restore_weights_from_disk(os.path.join(args.artifact_path, 'model', 'model.pickle'))

        # Generate
        graphs = []
        graphs_valid = []

        for i in range(0, int(args.num_generate)):
            if config['type'] == 'clang':
                # Restore node types
                with open(os.path.join(args.artifact_path, 'node_types.json'), 'r') as f:
                    node_types = json.load(f)

                graph, p_codegraph, p_min = generator.generate_clang(node_types)
                graphs.append(graph)

                # Optional: Write dot graphs
                if args.create_pngs:
                    try:
                        clang_codegraph_models.save_dot_graph(
                            graph, os.path.join(args.create_pngs, 'graph_%i.png' % i), 'png', node_types, True)
                    except RecursionError:
                        pass

                # Optional: Validate
                try:
                    # Generate code
                    cg_vstr = clang_codegraph_models.CodeGenVisitor(500)
                    graph.accept(cg_vstr, clang_codegraph_models.sort_edges_conforming_c_syntax)

                    # Format code
                    code = cg_vstr.get_code_as_str()
                    code_formatted, returncode_format = app_utils.format_c_code(code)

                    _, returncode_compile = app_utils.compile_to_bytecode(code)

                    if returncode_format == 0 and returncode_compile == 0:
                        print('C Code:')
                        print(code_formatted)

                        graph.c_code = code_formatted
                        graphs_valid.append(graph)

                except:
                    pass

                print('p_codegraph: %.4f, p_min: %.4f' % (p_codegraph, p_min))
                print('Number generated: %i, Number valid: %i, Percent valid: %.4f' % (
                    i, len(graphs_valid), len(graphs_valid) / len(graphs)))
                utils.print_dash()

            else:
                graph = generator.generate()

        # Optional: Save generated kernels
        if args.save_graphs_to_file:
            with open(args.save_graphs_to_file, 'wb') as f:
                pickle.dump(graphs, f, pickle.HIGHEST_PROTOCOL)

if __name__ == '__main__':
    main()
