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

    def __get_weights(self):
        """
        Get model weights
        """
        weights = {}
        for variable in self.sess.graph.get_collection(tf.GraphKeys.GLOBAL_VARIABLES):
            weights[variable.name] = self.sess.run(variable)

        return weights

    def __set_weights(self, weights):
        """
        Set model weights
        """
        variables_to_initialize = []
        with tf.name_scope("restore"):
            restore_ops = []
            used_vars = set()
            for variable in self.sess.graph.get_collection(tf.GraphKeys.GLOBAL_VARIABLES):
                used_vars.add(variable.name)
                if variable.name in weights:
                    restore_ops.append(variable.assign(weights[variable.name]))
                else:
                    print('Freshly initializing %s since no saved value was found.' % variable.name)
                    variables_to_initialize.append(variable)
            for var_name in weights:
                if var_name not in used_vars:
                    print('Saved weights for %s not used by model.' % var_name)
            self.sess.run(restore_ops)

    def backup_best_weights(self):
        """
        Backup current state of the model
        """
        print('Backuping up best weights...')
        self.best_epoch_weights = self.__get_weights()

    def restore_best_weights(self):
        """
        Restore best state of the model
        """
        if self.best_epoch_weights:
            print('Restoring best weights...')
            self.__set_weights(self.best_epoch_weights)

    def save_weights_to_disk(self, path):
        """
        Save model weights to given file
        """
        data = self.__get_weights()

        with open(path, 'wb') as out_file:
            pickle.dump(data, out_file, pickle.HIGHEST_PROTOCOL)

    def restore_weights_from_disk(self, path):
        """
        Save model weights to given file
        """
        print("Restoring weights from file %s." % path)
        with open(path, 'rb') as in_file:
            data = pickle.load(in_file)

        self.__set_weights(data)

    def count_number_trainable_params(self):
        """
        Counts the number of trainable variables.
        Taken from https://stackoverflow.com/questions/38160940/how-to-count-total-number-of-trainable-parameters-in-a-tensorflow-model
        """
        tot_nb_params = 0
        for trainable_variable in self.sess.graph.get_collection(tf.GraphKeys.TRAINABLE_VARIABLES):
            shape = trainable_variable.get_shape()  # e.g [D,F] or [W,H,C]
            current_nb_params = self.get_nb_params_shape(shape)
            tot_nb_params = tot_nb_params + current_nb_params
        return tot_nb_params

    def get_nb_params_shape(self, shape):
        """
        Computes the total number of params for a given shap.
        Works for any number of shapes etc [D,F] or [W,H,C] computes D*F and W*H*C.
        Taken from https://stackoverflow.com/questions/38160940/how-to-count-total-number-of-trainable-parameters-in-a-tensorflow-model
        """
        nb_params = 1
        for dim in shape:
            nb_params = nb_params * int(dim)
        return nb_params


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

        self.with_gradient_monitoring = True if 'gradient_monitoring' in self.config and self.config['gradient_monitoring'] == 1 else False

        self.with_aux_in = True if 'with_aux_in' in self.config and self.config['with_aux_in'] == 1 else False

        # Create and initialize model
        with self.state.graph.as_default():
            self._make_model(True)
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

    def _initialize_model(self) -> None:
        """
        Init tf model
        """
        init_op = tf.group(tf.global_variables_initializer(),
                           tf.local_variables_initializer())
        self.state.sess.run(init_op)

    def _graphs_to_batch_feed_dict(self, graphs: list, graph_sizes: list, is_training: bool) -> dict:
        num_edge_types = self.config['num_edge_types']

        batch_data = {
            # Graph model
            'adjacency_lists': [[] for _ in range(self.config['num_edge_types'])],
            'embeddings_to_graph_mappings': [],
            'labels': [],
            'embeddings_in': [],
            'node_values': [],
        }

        if self.with_aux_in:
            batch_data['aux_in'] = []

        for graph_idx, graph in enumerate(graphs):
            num_nodes = graph_sizes[graph_idx]

            if self.config['use_edge_bias'] == 1:
                batch_data['num_incoming_edges_dicts_per_type'] = []

            # Aux in
            if self.with_aux_in:
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

            node_types = utils.get_one_hot(np.array(graph[utils.T.NODES]),
                                           self.config['hidden_size_orig']).astype(float)
            batch_data['embeddings_in'].append(node_types)

            if self.config['use_node_values'] == 1:
                node_values = np.array(graph[utils.T.NODE_VALUES]).astype(float).reshape(-1, 1)
                node_values = node_values / 2147483647

                batch_data['node_values'].append(node_values)

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

        # Is training
        feed_dict[self.cells[0].placeholders['is_training']] = is_training

        # Aux in
        if self.with_aux_in:
            feed_dict[self.cells[0].placeholders['aux_in']] = batch_data['aux_in']

        # Labels
        if 'labels' in self.cells[0].placeholders:
            feed_dict[self.cells[0].placeholders['labels']] = utils.get_one_hot(np.array(batch_data['labels']), self.config['prediction_cell']['output_dim'])

        # Embeddings
        feed_dict[self.placeholders['embeddings_in']] = np.concatenate(batch_data['embeddings_in'], axis=0)
        feed_dict[self.cells[0].placeholders['embeddings_to_graph_mappings']] \
            = np.concatenate(batch_data['embeddings_to_graph_mappings'], axis=0)

        # Node values
        if self.config['use_node_values'] == 1:
            feed_dict[self.placeholders['node_values']] = np.concatenate(batch_data['node_values'], axis=0)

        return feed_dict

    def _make_model(self, enable_training) -> None:
        """
        Create tf model
        """
        self.placeholders['embeddings_in'] = tf.placeholder(tf.float32, [None, self.config['hidden_size_orig']], name='embeddings_in')
        if self.config['use_node_values'] == 1:
            self.placeholders['node_values'] = tf.placeholder(tf.float32, [None, 1], name='node_values')
            node_values = self.placeholders['node_values']

        # Create model: Unroll network and wire embeddings
        embeddings_reduced = self.placeholders['embeddings_in']

        # Create embedding layer
        embedding_layer = EmbeddingLayer(self.config, self.state.embedding_layer_state)
        embeddings = embedding_layer.compute_embeddings(embeddings_reduced)

        # Create propagation layer
        ggnn_layer = GGNNModelLayer(self.config, self.state.ggnn_layer_state)
        embeddings = ggnn_layer.compute_embeddings(embeddings)

        if self.config['use_node_values'] == 1:
            embeddings = tf.concat([embeddings, node_values], axis=1)

        # Create prediction cell
        prediction_cell = PredictionCell(self.config, enable_training, self.state.prediction_cell_state, self.with_aux_in)
        prediction_cell.initial_embeddings = embeddings_reduced
        prediction_cell.compute_predictions(embeddings)

        self.ggnn_layers.append(ggnn_layer)
        self.cells.append(prediction_cell)

        # Accumulate losses
        if enable_training:
            losses = []

            for cell in self.cells:
                losses.append(cell.ops['loss'])

            self.ops['losses'] = losses
            self.ops['loss'] = tf.reduce_sum(losses)

    def _make_train_step(self) -> None:
        """
        Create tf train step
        """
        update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS)
        with tf.control_dependencies(update_ops):
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

    def train(self, graphs_train, graphs_test=None, graphs_valid=None) -> None:
        """
        Train model with training set in multiple epochs
        """
        # Enrich graphs with adj list
        for graph in graphs_train:
            graph[utils.AE.ADJ_LIST] = utils.graph_to_adjacency_lists(graph[utils.T.EDGES], self.config['tie_fwd_bkwd'] == 1)[0]

        # Extract graph sizes
        graph_sizes = []
        for graph in graphs_train:
            graph_sizes.append(len(graph[utils.T.NODES]))

        best_epoch_metric = sys.maxsize
        best_epoch_count = 0

        if graphs_valid:
            # Extract valid labels
            y_valid = []
            for graph in graphs_valid:
                y_valid.append(graph[utils.L.LABEL_0])
            y_valid = np.array(y_valid)

        if graphs_test:
            # Extract test labels
            y_test = []
            for graph in graphs_test:
                y_test.append(graph[utils.L.LABEL_0])
            y_test = np.array(y_test)

        # Run epochs
        for epoch in range(0, self.config['num_epochs']):
            # Training
            # ############################################
            epoch_start_time = time.time()

            # Partition into batches
            batch_size = self.config['batch_size']

            lst = list(zip(graphs_train, graph_sizes))
            random.shuffle(lst)
            batches = [lst[i * batch_size:(i + 1) * batch_size] for i in
                       range((len(lst) + batch_size - 1) // batch_size)]

            # Run batches
            training_losses = []
            epoch_instances_per_secs = []

            for batch in batches:
                start_time = time.time()
                batch_graphs, batch_graph_sizes = zip(*batch)

                batch_graphs = list(batch_graphs)
                batch_graph_sizes = list(batch_graph_sizes)

                # Build feed dict
                # 1. Graph info
                feed_dict = self._graphs_to_batch_feed_dict(batch_graphs, batch_graph_sizes, True)

                # Run batch
                result = self._run_batch(feed_dict)
                end_time = time.time()

                # Log
                instances_per_sec = len(batch_graphs) / (end_time - start_time)
                epoch_instances_per_secs.append(instances_per_sec)

                training_losses.append(result[0])

            training_loss = np.sum(training_losses)
            epoch_instances_per_sec = np.mean(epoch_instances_per_secs)
            epoch_end_time = time.time()
            epoch_time = epoch_end_time - epoch_start_time

            # Logging
            summary = tf.Summary()
            summary.value.add(tag='train_loss', simple_value=training_loss)

            # Testing
            # ############################################
            if graphs_valid and graphs_test:
                # Make predictions on valid set
                predictions = self.predict(graphs_valid)

                valid_loss = np.sum(predictions - utils.get_one_hot(y_valid, self.config['prediction_cell']['output_dim']))
                valid_accuracy = np.sum(np.argmax(predictions, axis=1) == y_valid) / len(predictions)

                # Make predictions on test set
                predictions = self.predict(graphs_test)

                test_loss = np.sum(predictions - utils.get_one_hot(y_test, self.config['prediction_cell']['output_dim']))
                test_accuracy = np.sum(np.argmax(predictions, axis=1) == y_test) / len(predictions)

                # Logging
                summary.value.add(tag='valid_accuracy', simple_value=valid_accuracy)
                summary.value.add(tag='test_accuracy', simple_value=test_accuracy)
                print('epoch: %i, instances/sec: %.2f, epoch_time: %.2fs, train_loss: %.8f, valid_accuracy: %.4f, test_accuracy: %.4f' % (epoch, epoch_instances_per_sec, epoch_time, training_loss, valid_accuracy, test_accuracy))


                if valid_accuracy < best_epoch_metric:
                    best_epoch_metric = valid_accuracy

                    best_epoch_count += 1
                    if 'save_best_model_interval' in self.config and best_epoch_count >= self.config['save_best_model_interval']:
                        self.state.backup_best_weights()

                        best_epoch_count = 0

            elif graphs_test:
                # Make predictions on test set
                predictions = self.predict(graphs_test)

                test_loss = np.sum(predictions - utils.get_one_hot(y_test, self.config['prediction_cell']['output_dim']))
                test_accuracy = np.sum(np.argmax(predictions, axis=1) == y_test) / len(predictions)

                # Logging
                summary.value.add(tag='test_accuracy', simple_value=test_accuracy)
                summary.value.add(tag='test_loss', simple_value=test_loss)
                print('epoch: %i, instances/sec: %.2f, epoch_time: %.2fs, train_loss: %.8f, test_accuracy: %.4f' % (epoch, epoch_instances_per_sec, epoch_time, training_loss, test_accuracy))

            else:
                # Logging
                print('epoch: %i, instances/sec: %.2f, epoch_time: %.2fs, loss: %.8f' % (epoch, epoch_instances_per_sec, epoch_time, training_loss))

                if training_loss < best_epoch_metric:
                    best_epoch_metric = training_loss

                    best_epoch_count += 1
                    if 'save_best_model_interval' in self.config and best_epoch_count >= self.config['save_best_model_interval']:
                        self.state.backup_best_weights()

                        best_epoch_count = 0

            # Logging
            self.train_writer.add_summary(summary, epoch)

        self.state.restore_best_weights()

    def predict(self, graphs):
        # Enrich graphs with adj list
        for graph in graphs:
            graph[utils.AE.ADJ_LIST] = utils.graph_to_adjacency_lists(graph[utils.T.EDGES], self.config['tie_fwd_bkwd'] == 1)[0]

        # Extract graph sizes
        graph_sizes = []
        for graph in graphs:
            graph_sizes.append(len(graph[utils.T.NODES]))

        # Graph info
        feed_dict = self._graphs_to_batch_feed_dict(graphs, graph_sizes, False)

        # Run
        fetch_list = [self.cells[0].ops['output']]
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        return result[0]


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
