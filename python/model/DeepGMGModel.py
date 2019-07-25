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
from model.cell.DeepGMGCell import DeepGMGCell, DeepGMGCellState
from model.layer.GGNNModelLayer import GGNNModelLayer, GGNNModelLayerState


def apply_action_to_graph(graph:dict, action:dict) -> None:
    if action[utils.AE.ACTION] == utils.A.ADD_NODE:
        node_type = action[utils.L.LABEL_0]
        if node_type == 0:
            return

        graph[utils.T.NODES].append(node_type)

    elif action[utils.AE.ACTION] == utils.A.ADD_EDGE_TO:
        graph[utils.T.EDGES].append([ \
                action[utils.AE.LAST_ADDED_NODE_ID], \
                action[utils.L.LABEL_1], \
                action[utils.L.LABEL_0] \
        ])


class DeepGMGState(object):
    """
    State of the DeepGMG model.
    """
    def __init__(self, config):
        self.graph = tf.Graph()

        tf_config = tf.ConfigProto()
        tf_config.gpu_options.allow_growth = True
        self.sess = tf.Session(graph=self.graph, config=tf_config)

        self.best_epoch_weights = None

        with self.graph.as_default():
            self.ggnn_layer_state = GGNNModelLayerState(config)
            self.deepgmg_cell_state = DeepGMGCellState(config)

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


class DeepGMGModel(object):
    """
    Base class of the Trainer and Generator.
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

    def _graphs_to_batch_feed_dict(self, actions_by_graphs: list, graph_sizes: list, len_unroll: int) -> dict:
        num_edge_types = self.config['num_edge_types']

        batch_data_by_cell = {}
        for graph_idx, actions in enumerate(actions_by_graphs):
            for cell_idx in range(0, len_unroll):
                if cell_idx in actions:
                    action = actions[cell_idx]
                else:
                    action = None

                num_nodes = graph_sizes[graph_idx]

                num_nodes_current = action[utils.AE.LAST_ADDED_NODE_ID] if action else 0

                if cell_idx not in batch_data_by_cell:
                    batch_data_by_cell[cell_idx] = {
                        # Graph model
                        'adjacency_lists': [[] for _ in range(self.config['num_edge_types'])],
                        'embeddings_to_graph_mappings': [],
                        'embeddings_to_graph_mappings_existent': [],

                        # Generative model
                        'actions': [],
                        'last_added_node_idxs': [],
                        'last_added_node_idxs_with_minus_ones': [],
                        'last_added_node_types': []
                    }

                    if self.config['use_edge_bias'] == 1:
                        batch_data_by_cell[cell_idx]['num_incoming_edges_dicts_per_type'] = []

                    for action_idx in range(0, len(self.config['actions'])):
                        batch_data_by_cell[cell_idx]['a%i_labels' % action_idx] = []

                batch_data = batch_data_by_cell[cell_idx]

                # Generative model
                if action and utils.AE.ACTION in action:
                    batch_data['actions'].append(action[utils.AE.ACTION] - utils.ACTION_OFFSET)
                else:
                    batch_data['actions'].append(-1)

                if action and utils.AE.LAST_ADDED_NODE_ID in action:
                    batch_data['last_added_node_idxs'].append(sum(graph_sizes[0:graph_idx]) + num_nodes_current)
                    batch_data['last_added_node_idxs_with_minus_ones'].append(sum(graph_sizes[0:graph_idx]) + num_nodes_current)
                else:
                    batch_data['last_added_node_idxs'].append(0)
                    batch_data['last_added_node_idxs_with_minus_ones'].append(-1)

                if action and utils.AE.LAST_ADDED_NODE_TYPE in action:
                    batch_data['last_added_node_types'].append(action[utils.AE.LAST_ADDED_NODE_TYPE])
                else:
                    batch_data['last_added_node_types'].append(0)

                # Labels
                for action_idx, action_meta in enumerate(self.config['actions']):
                    # Build action label index. See the enum.
                    label_name = 'a%i_labels' % action_idx

                    if action_meta['type'] == 'add_edge_to':
                        mat = np.zeros((num_nodes, num_edge_types))

                        if action and utils.L.LABEL_0 in action and utils.L.LABEL_1 in action:
                            node = action[utils.L.LABEL_0]
                            edge_type = action[utils.L.LABEL_1]
                            mat[node][edge_type] = 1

                        batch_data[label_name].append(mat)

                    else:
                        if action and utils.L.LABEL_0 in action:
                            batch_data[label_name].append(action[utils.L.LABEL_0])
                        else:
                            batch_data[label_name].append(0)

                # Graph model: Adj list
                adj_lists = action[utils.AE.ADJ_LIST] if action else utils.graph_to_adjacency_lists([], self.config['tie_fwd_bkwd'])[0]
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

                if num_nodes_current == 0:
                   num_nodes_current = 1
                graph_mappings = np.full(num_nodes_current, graph_idx)
                filler = np.full(num_nodes - num_nodes_current, -1)
                batch_data['embeddings_to_graph_mappings_existent'].append(np.concatenate((graph_mappings, filler)))

        #
        feed_dict = {}
        for cell_idx, cell_data in batch_data_by_cell.items():
            # Graph model: Adj list
            for idx, adj_list in enumerate(self.ggnn_layers[cell_idx].placeholders['adjacency_lists']):
                feed_dict[adj_list] = np.array(cell_data['adjacency_lists'][idx])
                if len(feed_dict[adj_list]) == 0:
                    feed_dict[adj_list] = np.zeros((0, 2), dtype=np.int32)
                else:
                    feed_dict[adj_list] = feed_dict[adj_list][0]

            if self.config['use_edge_bias'] == 1:
                # Graph model: Incoming edge numbers
                feed_dict[self.ggnn_layers[cell_idx].placeholders['num_incoming_edges_per_type']] \
                    = np.concatenate(cell_data['num_incoming_edges_dicts_per_type'], axis=0)

            # Generative model
            feed_dict[self.cells[cell_idx].placeholders['actions']] = cell_data['actions']
            feed_dict[self.cells[cell_idx].placeholders['embeddings_last_added_node_idxs']] \
                = cell_data['last_added_node_idxs']
            feed_dict[self.cells[cell_idx].placeholders['embeddings_last_added_node_idxs_with_minus_ones']] \
                = cell_data['last_added_node_idxs_with_minus_ones']
            feed_dict[self.cells[cell_idx].placeholders['last_added_node_types']] \
                = cell_data['last_added_node_types']

            # Labels
            feed_dict[self.cells[cell_idx].placeholders['a1_labels']] = cell_data['a1_labels']
            feed_dict[self.cells[cell_idx].placeholders['a2_labels']] = cell_data['a2_labels']
            feed_dict[self.cells[cell_idx].placeholders['a3_labels']] = np.concatenate(cell_data['a3_labels'], axis=0)

            feed_dict[self.cells[cell_idx].placeholders['embeddings_to_graph_mappings']] \
                = np.concatenate(cell_data['embeddings_to_graph_mappings'], axis=0)
            feed_dict[self.cells[cell_idx].placeholders['embeddings_to_graph_mappings_existent']] \
                = np.concatenate(cell_data['embeddings_to_graph_mappings_existent'], axis=0)

#            print(len(np.concatenate(cell_data['embeddings_to_graph_mappings'], axis=0)))
#            print(np.concatenate(cell_data['embeddings_to_graph_mappings'], axis=0))
        # # Print
        # print('--------------------------------------------')
        # for k, v in batch_data_by_cell[0].items():
        #     print(k, v)

        return feed_dict


class DeepGMGGenerator(DeepGMGModel):
    """
    Implementation of the generation process.
    """
    def __init__(self, config: dict, state: DeepGMGState):
        super().__init__(config, state)

        self.debug = self.config['debug'] == 1

        self.num_nodes_max = config['gen_num_node_max']

        with self.state.graph.as_default():
            self.__make_model()

    def __make_model(self) -> None:
        """
        Create tf model
        """
        self.placeholders['embeddings_in'] = tf.placeholder(tf.float32, [None, self.config['hidden_size']], name='embeddings_in')

        # Create layer and propagate
        ggnn_layer = GGNNModelLayer(self.config, self.state.ggnn_layer_state)
        embeddings = ggnn_layer.compute_embeddings(self.placeholders['embeddings_in'])
        self.ops['peek'] = embeddings

        # Create cell and predict
        deepgmg_cell = DeepGMGCell(self.config, True, self.state.deepgmg_cell_state)
        self.placeholders['embeddings_out'] = deepgmg_cell.compute_predictions(embeddings)

        self.ggnn_layers.append(ggnn_layer)
        self.cells.append(deepgmg_cell)

    def __add_node_to_graph(self, add_node):
        """
        Add sampled node to graph
        """
        apply_action_to_graph(self.current_graph, {
            utils.AE.ACTION:      utils.A.ADD_NODE,
            utils.L.LABEL_0:      add_node
        })

    def __add_edge_to_graph(self, node, edge_type):
        """
        Add sampled edge to graph
        """
        apply_action_to_graph(self.current_graph, {
            utils.AE.ACTION:                  utils.A.ADD_EDGE_TO,
            utils.AE.LAST_ADDED_NODE_ID:      self.last_added_node_id,
            utils.L.LABEL_0:                  node,
            utils.L.LABEL_1:                  edge_type
        })

    def __do_init_node_action(self):
        """
        Apply init node action to current model state
        """
        # Prepare
        action = {
            utils.AE.ACTION:                    utils.A.INIT_NODE,
            utils.AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            utils.AE.ADJ_LIST:                  utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES], self.config['tie_fwd_bkwd'])[0],
            utils.AE.NUMS_INCOMING_EDGES_BY_TYPE:utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES], self.config['tie_fwd_bkwd'])[1]
        }
        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings']]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]

        # Print
        if self.debug:
            utils.action_pretty_print(action)

    def __sample_add_node_action(self):
        """
        Sample add node action from current model state
        """
        # Prepare
        action = {
            utils.AE.ACTION:                    utils.A.ADD_NODE,
            utils.AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            utils.AE.ADJ_LIST:                  utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES], self.config['tie_fwd_bkwd'])[0]
        }
        if self.config['use_edge_bias'] == 1:
            action[utils.AE.NUMS_INCOMING_EDGES_BY_TYPE] \
                = utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES], self.config['tie_fwd_bkwd'])[1]

        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops['f_add_node']]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_addnode = result[1][0]
        p_addnode = p_addnode.astype('float64')

        # Sample if to add node
        p_addnode_norm = p_addnode / np.sum(p_addnode)                          # Normalize to sum up to 1

        node_type = np.random.multinomial(1, p_addnode_norm)                    # Sample categorial
        node_type = np.argmax(node_type)                                        # One hot -> integer

        # Print
        action[utils.L.LABEL_0] = node_type
        action[utils.AE.PROBABILITY] = p_addnode_norm[node_type]
        if self.debug:
            utils.action_pretty_print(action)

        return node_type, p_addnode_norm

    def __sample_add_edge_action(self):
        """
        Sample add edge action from current model state
        """
        # Prepare
        action = {
            utils.AE.ACTION:                    utils.A.ADD_EDGE,
            utils.AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            utils.AE.ADJ_LIST:                  utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES], self.config['tie_fwd_bkwd'])[0]
        }
        if self.config['use_edge_bias'] == 1:
            action[utils.AE.NUMS_INCOMING_EDGES_BY_TYPE] \
                = utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES], self.config['tie_fwd_bkwd'])[1]

        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops['f_add_edge']]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_addedge = result[1][0]

        # Sample if to add edge
        add_edge = np.random.multinomial(1, p_addedge)                          # Sample bernoulli
        add_edge = np.argmax(add_edge)                                          # One hot -> integer

        # Print
        action[utils.L.LABEL_0] = add_edge
        action[utils.AE.PROBABILITY] = p_addedge[add_edge]
        if self.debug:
            utils.action_pretty_print(action)

        return add_edge, p_addedge

    def __sample_add_edge_to_action(self):
        """
        Sample add edge to action from current model state
        """
        # Prepare
        action = {
            utils.AE.ACTION:                    utils.A.ADD_EDGE_TO,
            utils.AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            utils.AE.ADJ_LIST:                  utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES], self.config['tie_fwd_bkwd'])[0]
        }
        if self.config['use_edge_bias'] == 1:
            action[utils.AE.NUMS_INCOMING_EDGES_BY_TYPE] \
                = utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES], self.config['tie_fwd_bkwd'])[1]

        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops['f_add_edge_to']]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_nodes = result[1]
        p_nodes = p_nodes.astype('float64')

        # Sample where to add edge to
        p_nodes_limited = p_nodes[0:len(self.current_graph[utils.T.NODES]) - 1] # Limit choice of sampling
        p_nodes_limited = np.reshape(p_nodes_limited, (-1))
        p_nodes_limited = p_nodes_limited / np.sum(p_nodes_limited)             # Normalize to sum up to 1
        p_nodes_limited_reshaped = np.reshape(p_nodes_limited, (-1, self.config['num_edge_types']))

        v_t = np.random.multinomial(1, p_nodes_limited)                         # Sample categorial
        v_t = np.reshape(v_t, (-1, self.config['num_edge_types']))

        node = np.sum(np.argmax(v_t, axis = 0))                                 # One-hot 2D np-array
        edge_type = np.sum(np.argmax(v_t, axis = 1))                            # -> Positions for col, row

        # Print
        action[utils.L.LABEL_0] = node
        action[utils.L.LABEL_1] = edge_type
        action[utils.AE.PROBABILITY] = p_nodes_limited_reshaped[node][edge_type]
        if self.debug:
            utils.action_pretty_print(action)

        return node, edge_type, p_nodes_limited_reshaped[node][edge_type]

    def generate(self):
        """
        Generate a default graph using the pre-trained model
        """
        is_first_node = True
        if self.debug:
            utils.action_pretty_print_header()

        # Context
        self.current_graph = {utils.T.NODES: [], utils.T.EDGES: []}
        self.last_added_node_id = 0
        self.last_added_node_type = 0
        self.embeddings = np.ones((self.num_nodes_max, self.config['hidden_size']))

        # GO!
        # Sample add node
        node_type, p_addnode = self.__sample_add_node_action()

        while self.last_added_node_id < self.num_nodes_max:
            self.last_added_node_type = node_type
            if is_first_node:
                is_first_node = False
            else:
                self.last_added_node_id += 1
            self.__add_node_to_graph(node_type)

            self.__do_init_node_action()

            # Sample add edge
            add_edge, p_addedge = self.__sample_add_edge_action()
            while add_edge == 1:
                # Sample add edge to
                node, edge_type, p_nodes = self.__sample_add_edge_to_action()
                self.__add_edge_to_graph(node, edge_type)

                # Sample add edge
                add_edge, p_addedge = self.__sample_add_edge_action()

            # Sample add node
            node_type, p_addnode = self.__sample_add_node_action()
            if node_type == 0:
                break

        return self.current_graph

    def generate_clang(self, node_types):
        """
        Generate a clang graph using the pre-trained model
        """
        is_first_node = True
        if self.debug:
            utils.action_pretty_print_header()

        # Application model context
        current_code_graph = clang_codegraph_models.CodeGraph()
        current_function = clang_codegraph_models.Function()
        current_code_graph.functions.append(current_function)

        # ML model context
        self.current_graph = {utils.T.NODES: [], utils.T.EDGES: []}
        self.last_added_node_id = 0
        self.last_added_node_type = 0
        self.embeddings = np.ones((self.num_nodes_max, self.config['hidden_size']))

        p_codegraph = []

        # GO!
        # Sample add node
        node_type, p_addnode = self.__sample_add_node_action()
        p_codegraph.append(p_addnode[node_type])

        while self.last_added_node_id < self.num_nodes_max:
            self.last_added_node_type = node_type
            if is_first_node:
                is_first_node = False
            else:
                self.last_added_node_id += 1
            self.__add_node_to_graph(node_type)

            current_function.apply_action({
                utils.AE.ACTION: utils.A.ADD_NODE,
                utils.L.LABEL_0: node_type,
                utils.AE.PROBABILITY: p_addnode
            }, node_types)

            self.__do_init_node_action()

            # Sample add edge
            add_edge, p_addedge = self.__sample_add_edge_action()
            p_codegraph.append(p_addedge[add_edge])

            while add_edge == 1:
                # Sample add edge to
                node, edge_type, p_nodes = self.__sample_add_edge_to_action()
                p_codegraph.append(p_nodes)

                self.__add_edge_to_graph(node, edge_type)

                current_function.apply_action({
                    utils.AE.ACTION: utils.A.ADD_EDGE_TO,
                    utils.L.LABEL_0: node,
                    utils.L.LABEL_1: edge_type
                }, node_types)

                # Sample add edge
                add_edge, p_addedge = self.__sample_add_edge_action()
                p_codegraph.append(p_addedge[add_edge])

            # Sample add node
            node_type, p_addnode = self.__sample_add_node_action()
            p_codegraph.append(p_addnode[node_type])

            if node_type == 0:
                break

        return current_code_graph, np.sum(p_codegraph) / len(p_codegraph), np.min(p_codegraph)


class DeepGMGTrainer(DeepGMGModel):
    """
    Implementation of the training process.
    """
    def __init__(self, config: dict, state: DeepGMGState):
        super().__init__(config, state)

        self.with_gradient_monitoring = True if 'gradient_monitoring' in self.config and self.config['gradient_monitoring'] == 1 else False

        # Create and initialize model
        with self.state.graph.as_default():
            self.__make_model()
            self.__make_train_step()
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

    def __make_model(self) -> None:
        """
        Create tf model
        """
        self.placeholders['embeddings_in'] = tf.placeholder(tf.float32, [None, self.config['hidden_size']], name='embeddings_in')

        # Create model: Unroll network and wire embeddings
        embeddings = self.placeholders['embeddings_in']
        for i in range(0, self.config['num_training_unroll']):
            # Create layer and propagate
            ggnn_layer = GGNNModelLayer(self.config, self.state.ggnn_layer_state)
            embeddings = ggnn_layer.compute_embeddings(embeddings)

            # Create cell and predict
            deepgmg_cell = DeepGMGCell(self.config, True, self.state.deepgmg_cell_state, i)
            embeddings = deepgmg_cell.compute_predictions(embeddings)

            self.ggnn_layers.append(ggnn_layer)
            self.cells.append(deepgmg_cell)

        # Accumulate losses
        losses = []
        losses_an = []
        losses_ae = []
        losses_nodes = []

        for cell in self.cells:
            losses.append(cell.ops['loss'])

            l = cell.ops['loss_by_actions']
            losses_an.append(l[0])
            losses_ae.append(l[1])
            losses_nodes.append(l[2])

        self.ops['losses'] = losses
        self.ops['loss'] = tf.reduce_sum(losses)
        self.ops['loss_an'] = tf.reduce_sum(losses_an)
        self.ops['loss_ae'] = tf.reduce_sum(losses_ae)
        self.ops['loss_nodes'] = tf.reduce_sum(losses_nodes)

    def __make_train_step(self) -> None:
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

    def __run_batch(self, feed_dict, iteration):
        """
        Train model with one batch and retrieve result
        """
        fetch_list = [self.ops['loss'], self.ops['losses'], self.ops['train_step'],
                      self.ops['loss_an'], self.ops['loss_ae'], self.ops['loss_nodes']]
        if self.with_gradient_monitoring:
            offset = len(fetch_list)
            fetch_list.extend([self.ops['gradients'], self.ops['clipped_gradients']])

        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        return result

    def train(self, train_datas) -> None:
        """
        Train model with training set in multiple epochs
        """
        actions_by_graphs = []

        # Extract actions
        for train_data in train_datas:
            actions = train_data[utils.AE.ACTIONS]
            utils.enrich_action_sequence_with_adj_list_data(actions, self.config['tie_fwd_bkwd'] == 1)
            actions_by_graphs.append(actions)

        # Extract graph sizes
        graph_sizes = []
        for train_data in train_datas:
            actions = train_data[utils.AE.ACTIONS]
            action_last = actions[len(actions) - 1]

            graph_sizes.append(action_last[utils.AE.LAST_ADDED_NODE_ID] + 1)

        best_epoch_loss = sys.maxsize
        best_epoch_count = 0

        for epoch in range(0, self.config['num_epochs']):
            epoch_start_time = time.time()

            # Partition into batches
            batch_size = self.config['batch_size']

            lst = list(zip(actions_by_graphs, graph_sizes))
            random.shuffle(lst)
            batches = [lst[i * batch_size:(i + 1) * batch_size] for i in
                       range((len(lst) + batch_size - 1) // batch_size)]

            # Run batches
            epoch_losses = []
            epoch_instances_per_secs = []

            for batch in batches:
                start_time = time.time()
                batch_actions_by_graphs, batch_graph_sizes = zip(*batch)

                batch_actions_by_graphs = list(batch_actions_by_graphs)
                batch_graph_sizes = list(batch_graph_sizes)

                # Build feed dict
                # 1. Graph info
                feed_dict = self._graphs_to_batch_feed_dict(batch_actions_by_graphs, batch_graph_sizes, self.config['num_training_unroll'])

                # 2. Initial node embeddings
                num_nodes_all_graphs = sum(batch_graph_sizes)
                feed_dict[self.placeholders['embeddings_in']] = np.ones((num_nodes_all_graphs, self.config['hidden_size']))

                # Run batch
                result = self.__run_batch(feed_dict, epoch)
                end_time = time.time()

                # Log
                instances_per_sec = len(actions_by_graphs) / (end_time - start_time)
                epoch_instances_per_secs.append(instances_per_sec)

                epoch_losses.append(result[0])

            epoch_loss = np.mean(epoch_losses)
            if epoch_loss < best_epoch_loss:
                best_epoch_loss = epoch_loss

                best_epoch_count += 1
                if 'save_best_model_interval' in self.config and best_epoch_count > self.config['save_best_model_interval']:
                    self.state.backup_best_weights()

                    best_epoch_count = 0

            epoch_instances_per_sec = np.mean(epoch_instances_per_secs)

            epoch_end_time = time.time()
            epoch_time = epoch_end_time - epoch_start_time

            print('epoch: %i, instances/sec: %.2f, epoch_time: %.2fs loss: %.8f' % (epoch, epoch_instances_per_sec, epoch_time, epoch_loss))

            # Logging
            summary = tf.Summary()
            summary.value.add(tag='loss', simple_value=epoch_loss)
            self.train_writer.add_summary(summary, epoch)

        self.state.restore_best_weights()


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

        utils.get_data_stats(train_data)

        # Create objects
        state = DeepGMGState(config)
        trainer = DeepGMGTrainer(config, state)

        # Save node types
        with open(trainer.out_dir + '/node_types.json', 'w') as f:
            json.dump(data['types'], f)

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
