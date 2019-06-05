import json
import os
import shutil
import time

import numpy as np
import tensorflow as tf

import utils
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

        with self.graph.as_default():
            self.ggnn_layer_state = GGNNModelLayerState(config)
            self.deepgmg_cell_state = DeepGMGCellState(config)


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

                num_nodes_current = action[utils.AE.LAST_ADDED_NODE_ID]
                if num_nodes_current == 0:
                    num_nodes_current = 1

                if cell_idx not in batch_data_by_cell:
                    batch_data_by_cell[cell_idx] = {
                        # Graph model
                        'adjacency_lists': [[] for _ in range(self.config['num_edge_types'])],
                        'embeddings_to_graph_mappings': [],
                        'embeddings_to_graph_mappings_existent': [],

                        # Generative model
                        'actions': [],
                        'last_added_node_idxs': [],
                        'last_added_node_types': []
                    }

                    for action_idx in range(0, len(self.config['actions'])):
                        batch_data_by_cell[cell_idx]['a%i_labels' % action_idx] = []

                batch_data = batch_data_by_cell[cell_idx]

                # Generative model
                if utils.AE.ACTION in action:
                    batch_data['actions'].append(action[utils.AE.ACTION] - utils.ACTION_OFFSET)
                else:
                    batch_data['actions'].append(-1)

                if utils.AE.LAST_ADDED_NODE_ID in action:
                    batch_data['last_added_node_idxs'].append(sum(graph_sizes[0:graph_idx]) + num_nodes_current)
                else:
                    batch_data['last_added_node_idxs'].append(0)

                if utils.AE.LAST_ADDED_NODE_TYPE in action:
                    batch_data['last_added_node_types'].append(action[utils.AE.LAST_ADDED_NODE_TYPE])
                else:
                    batch_data['last_added_node_types'].append(0)

                # Labels
                for action_idx, action_meta in enumerate(self.config['actions']):
                    # Build action label index. See the enum.
                    label_name = 'a%i_labels' % action_idx

                    if action_meta['type'] == 'add_edge_to':
                        mat = np.zeros((num_nodes, num_edge_types))

                        if utils.L.LABEL_0 in action and utils.L.LABEL_1 in action:
                            node = action[utils.L.LABEL_0]
                            edge_type = action[utils.L.LABEL_1]
                            mat[node][edge_type] = 1

                        batch_data[label_name].append(mat)

                    else:
                        if utils.L.LABEL_0 in action:
                            batch_data[label_name].append(action[utils.L.LABEL_0])
                        else:
                            batch_data[label_name].append(0)

                # Graph model
                adj_lists = action[utils.AE.ADJ_LIST]
                for idx, adj_list in adj_lists.items():
                    batch_data['adjacency_lists'][idx].append(adj_list)

                graph_mappings_all = np.full(num_nodes, graph_idx)
                batch_data['embeddings_to_graph_mappings'].append(graph_mappings_all)

                graph_mappings = np.full(num_nodes_current, graph_idx)
                filler = np.full(num_nodes - num_nodes_current, -1)
                batch_data['embeddings_to_graph_mappings_existent'].append(np.concatenate((graph_mappings, filler)))

        #
        feed_dict = {}
        for cell_idx, cell_data in batch_data_by_cell.items():
            # Graph model
            for idx, adj_list in enumerate(self.ggnn_layers[cell_idx].placeholders['adjacency_lists']):
                feed_dict[adj_list] = np.array(cell_data['adjacency_lists'][idx])
                if len(feed_dict[adj_list]) == 0:
                    feed_dict[adj_list] = np.zeros((0, 2), dtype=np.int32)
                else:
                    feed_dict[adj_list] = feed_dict[adj_list][0]

            # Generative model
            feed_dict[self.cells[cell_idx].placeholders['actions']] = cell_data['actions']
            feed_dict[self.cells[cell_idx].placeholders['embeddings_last_added_node_idxs']] \
                = cell_data['last_added_node_idxs']
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
        # Add sampled node to graph
        apply_action_to_graph(self.current_graph, {
            utils.AE.ACTION:      utils.A.ADD_NODE,
            utils.L.LABEL_0:      add_node
        })

    def __add_edge_to_graph(self, node, edge_type):
        # Add sampled edge to graph
        apply_action_to_graph(self.current_graph, {
            utils.AE.ACTION:                  utils.A.ADD_EDGE_TO,
            utils.AE.LAST_ADDED_NODE_ID:      self.last_added_node_id,
            utils.L.LABEL_0:                  node,
            utils.L.LABEL_1:                  edge_type
        })

    def __do_init_node_action(self):
        # Prepare
        action = {
            utils.AE.ACTION:                    utils.A.INIT_NODE,
            utils.AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            utils.AE.ADJ_LIST:                  utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES])[0]
        }
        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings']]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]

        # Print
        utils.action_pretty_print(action)

    def __sample_add_node_action(self):
        # Prepare
        action = {
            utils.AE.ACTION:                    utils.A.ADD_NODE,
            utils.AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            utils.AE.ADJ_LIST:                  utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES])[0]
        }
        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops['f_add_node']]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_addnode = result[1][0]

        # Sample if to add node
        p_addnode_norm = p_addnode / (np.sum(p_addnode) + utils.SMALL_NUMBER)   # Normalize to sum up to 1
        node_type = np.random.multinomial(1, p_addnode_norm)                    # Sample categorial
        node_type = np.argmax(node_type)                                        # One hot -> integer

        # Print
        action[utils.L.LABEL_0] = node_type
        action[utils.AE.PROBABILITY] = p_addnode_norm[node_type]
        utils.action_pretty_print(action)

        return node_type, p_addnode_norm

    def __sample_add_edge_action(self):
        # Prepare
        action = {
            utils.AE.ACTION:                    utils.A.ADD_EDGE,
            utils.AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            utils.AE.ADJ_LIST:                  utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES])[0]
        }
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
        utils.action_pretty_print(action)

        return add_edge, p_addedge

    def __sample_add_edge_to_action(self):
        # Prepare
        action = {
            utils.AE.ACTION:                    utils.A.ADD_EDGE_TO,
            utils.AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            utils.AE.ADJ_LIST:                  utils.graph_to_adjacency_lists(self.current_graph[utils.T.EDGES])[0]
        }
        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops['f_add_edge_to']]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_nodes = result[1]

        # Sample where to add edge to
        p_nodes_limited = p_nodes[0:len(self.current_graph[utils.T.NODES]) - 1] # Limit choice of sampling
        p_nodes_limited = np.reshape(p_nodes_limited, (-1))
        p_nodes_limited = p_nodes_limited / (np.sum(p_nodes_limited) + utils.SMALL_NUMBER)  # Normalize to sum up to 1
        p_nodes_limited_reshaped = np.reshape(p_nodes_limited, (-1, self.config['num_edge_types']))

        v_t = np.random.multinomial(1, p_nodes_limited)                         # Sample categorial
        v_t = np.reshape(v_t, (-1, self.config['num_edge_types']))

        node = np.sum(np.argmax(v_t, axis = 0))                                 # One-hot 2D np-array
        edge_type = np.sum(np.argmax(v_t, axis = 1))                            # -> Positions for col, row

        # Print
        action[utils.L.LABEL_0] = node
        action[utils.L.LABEL_1] = edge_type
        action[utils.AE.PROBABILITY] = p_nodes_limited_reshaped[node][edge_type]
        utils.action_pretty_print(action)

        return node, edge_type, p_nodes_limited_reshaped[node][edge_type]

    def generate(self):
        is_first_node = True
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
        is_first_node = True
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

            current_function.apply_action({
                utils.AE.ACTION: utils.A.ADD_NODE,
                utils.L.LABEL_0: node_type
            }, node_types)

            self.__do_init_node_action()

            # Sample add edge
            add_edge, p_addedge = self.__sample_add_edge_action()
            while add_edge == 1:
                # Sample add edge to
                node, edge_type, p_nodes = self.__sample_add_edge_to_action()
                self.__add_edge_to_graph(node, edge_type)

                current_function.apply_action({
                    utils.AE.ACTION: utils.A.ADD_EDGE_TO,
                    utils.L.LABEL_0: node,
                    utils.L.LABEL_1: edge_type,
                }, node_types)

                # Sample add edge
                add_edge, p_addedge = self.__sample_add_edge_action()

            # Sample add node
            node_type, p_addnode = self.__sample_add_node_action()
            if node_type == 0:
                break

        return current_code_graph

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
            out_dir = self.config['out_dir'] + '/_out/'
        else:
            out_dir = SCRIPT_DIR + '/..' + '/_out/'

        if not os.path.exists(out_dir):
            os.makedirs(out_dir)

        if 'run_id' in self.config:
            self.run_id = self.config['run_id']
        else:
            self.run_id = '_'.join([time.strftime('%Y-%m-%d-%H-%M-%S'), str(os.getpid())])

        out_dir += str(len(next(os.walk(out_dir))[1])) + '_' + self.run_id
        if os.path.exists(out_dir):
            shutil.rmtree(out_dir)

        self.model_save_dir = out_dir + '/model'
        os.makedirs(self.model_save_dir, exist_ok=True)

        self.tensorboard_dir = out_dir + '/tensorboard'
        os.makedirs(self.tensorboard_dir, exist_ok=True)

        with open(out_dir + '/config.json', 'w') as fp:
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
        for cell in self.cells:
            losses.append(cell.ops['loss'])

        self.ops['losses'] = losses

        self.ops['loss_unrolled'] = tf.reduce_sum(losses, axis=0)

    def __make_train_step(self) -> None:
        """
        Create tf train step
        """
        trainable_vars = self.state.sess.graph.get_collection(tf.GraphKeys.TRAINABLE_VARIABLES)

        optimizer = tf.train.AdamOptimizer(self.config['learning_rate'])
        grads_and_vars = optimizer.compute_gradients(self.ops['loss_unrolled'], var_list=trainable_vars)

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

    def train(self, actions_by_graphs, graph_sizes) -> None:
        # Build feed dict
        # 1. Graph info
        feed_dict = self._graphs_to_batch_feed_dict(actions_by_graphs, graph_sizes,
                                                    self.config['num_training_unroll'])

        # 2. Initial node embeddings
        num_nodes_all_graphs = sum(graph_sizes)
        feed_dict[self.placeholders['embeddings_in']] = np.ones((num_nodes_all_graphs, self.config['hidden_size']))

        iteration = 0
        while True:
            # Run and fetch
            fetch_list = [self.ops['loss_unrolled'], self.ops['losses'], self.ops['train_step']]
            if self.with_gradient_monitoring:
                fetch_list.extend([self.ops['gradients'], self.ops['clipped_gradients']])

            result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

            summary = tf.Summary()
            summary.value.add(tag='loss', simple_value=result[0])
            self.train_writer.add_summary(summary, iteration)

            if self.with_gradient_monitoring:
                (gradients, clipped_gradients) = (result[3], result[4])

                self.train_writer.add_summary(gradients, iteration)
                self.train_writer.add_summary(clipped_gradients, iteration)

            print(iteration, result)
            iteration += 1

            if iteration >= self.config['num_epochs']:
                break
