import tensorflow as tf

from model.layer.PropagationModelLayer import PropagationModelLayer
from utils import glorot_init


class GGNNModelLayerState(object):
    """
    Holds the state / weights of a GGNN Layer.
    """
    def __init__(self, config):
        self.config = config

        h_dim = self.config['hidden_size']
        num_edge_types = self.config['num_edge_types']

        self.weights = {}

        edge_weights = tf.Variable(glorot_init([num_edge_types * h_dim, h_dim]),
                                                   name='edge_weights')
        self.weights['edge_weights'] = tf.reshape(edge_weights, [num_edge_types, h_dim, h_dim])

        cell_type = self.config['graph_rnn_cell'].lower()
        activation_fun = tf.nn.tanh
        if cell_type == 'gru':
            # cell = tf.nn.rnn_cell.GRUCell(h_dim, activation=activation_fun,
            #                               kernel_initializer=tf.glorot_uniform_initializer,
            #                               bias_initializer=tf.glorot_uniform_initializer)
            cell = tf.nn.rnn_cell.GRUCell(h_dim, activation=activation_fun)
        elif cell_type == 'cudnncompatiblegrucell':
            import tensorflow.contrib.cudnn_rnn as cudnn_rnn
            cell = cudnn_rnn.CudnnCompatibleGRUCell(h_dim)
        elif cell_type == 'rnn':
            cell = tf.nn.rnn_cell.BasicRNNCell(h_dim, activation=activation_fun)
        else:
            raise Exception("Unknown RNN cell type '%s'." % cell_type)
        self.weights['rnn_cells'] = cell

class GGNNModelLayer(PropagationModelLayer):
    """
    Implementation of the model described in
    Li, Yujia, et al. "Gated graph sequence neural networks." arXiv preprint arXiv:1511.05493 (2015).
    """
    # Used shape abbreviations:
    #   v ~ number of nodes
    #   h ~ state dimension
    #   e ~ number of edges of current type
    #   M ~ number of messages (sum of all e)
    def __init__(self, config, state):
        super().__init__()

        self.config = config
        self.state = state

        num_edge_types = self.config['num_edge_types']

        # Placeholders
        h_dim = self.config['hidden_size']
        self.placeholders['adjacency_lists'] = [tf.placeholder(tf.int32, [None, 2], name='adjacency_e%s' % e)
                                                for e in range(num_edge_types)]

    def compute_embeddings(self, embeddings: tf.Tensor) -> tf.Tensor:
        """
        Uses the model layer to process embeddings to new embeddings. All embeddings are in one dimension.
        Propagation is made in one pass with many disconnected graphs.

        :param embeddings: Tensor of shape [v, h]
        :return: Tensor of shape [v, h]
        """
        num_nodes = tf.shape(embeddings, out_type=tf.int32)[0]

        # Get all edge targets (aggregate of typed edges)
        edge_targets = []                                                           # list of tensors of message targets of shape [e]
        for edge_type_idx, adjacency_list_for_edge_type in enumerate(self.placeholders['adjacency_lists']):
            edge_targets_for_one_type = adjacency_list_for_edge_type[:, 1]
            edge_targets.append(edge_targets_for_one_type)
        edge_targets = tf.concat(edge_targets, axis=0)                              # [M]

        # Propagate
        for step in range(self.config['num_timesteps']):
            messages = []                                                           # list of tensors of messages of shape [e, h]
            message_source_states = []                                              # list of tensors of edge source states of shape [e, h]

            # Collect incoming messages per edge type
            for edge_type_idx, adjacency_list_for_edge_type in enumerate(self.placeholders['adjacency_lists']):
                edge_sources = adjacency_list_for_edge_type[:, 0]
                edge_source_states = tf.nn.embedding_lookup(params=embeddings,
                                                            ids=edge_sources)       # [e, h]
                all_messages_for_edge_type = tf.matmul(edge_source_states,
                                                       self.state.weights['edge_weights'][edge_type_idx])  # Shape [e, h]
                messages.append(all_messages_for_edge_type)
                message_source_states.append(edge_source_states)

            messages = tf.concat(messages, axis=0)                                  # [M, h]

            messages = tf.unsorted_segment_sum(data=messages,
                                               segment_ids=edge_targets,
                                               num_segments=num_nodes)              # [v, h]

            # pass updated vertex features into RNN cell
            embeddings = self.state.weights['rnn_cells'](messages, embeddings)[1]     # [v, h]

        return embeddings
