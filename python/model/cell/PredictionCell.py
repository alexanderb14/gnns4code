import tensorflow as tf

import utils


class PredictionCellState(object):
    """
    Holds the state / weights of a Prediction cell.
    """
    def __init__(self, config):
        self.config = config

        h_size = self.config['hidden_size']
        h_size_orig = self.config['hidden_size_orig']
        m_size = self.config['deepgmg_mlp_size']

        self.weights = {}

        self.weights['mlp_f_m'] = utils.MLP(h_size, h_size * m_size, [], 'relu', 'mlp_regression_transform')
        self.weights['mlp_g_m'] = utils.MLP(h_size + h_size_orig, h_size * m_size, [], 'relu', 'mlp_regression_gate')

        self.weights['mlp_reduce'] = utils.MLP(h_size * m_size + 2, 32, [], 'relu', 'mlp_reduce')
        self.weights['mlp_reduce_2'] = utils.MLP(32, 2, [], 'sigmoid', 'mlp_reduce_2')


class PredictionCell(object):
    """
    Implementation of the Prediction cell.
    """
    def __init__(self, config, enable_training, state):
        self.config = config
        self.enable_training = enable_training
        self.state = state

        self.ops = {}
        self.placeholders = {}

    def compute_predictions(self, embeddings: tf.Tensor) -> tf.Tensor:
        """
        Make prediction based on node embeddings.

        :param embeddings: Tensor of shape [b*v, h]
        :return: Predictions
        """
        h_size = self.config['hidden_size']
        m_size = self.config['deepgmg_mlp_size']
        num_node_types = self.config['num_node_types']

        # Placeholders
        # #########################################
        # # Initial embeddings
        # self.placeholders['initial_embeddings'] = tf.placeholder(tf.float32, [None, self.config['hidden_size']], name='initial_embeddings')
        # initial_embeddings = self.placeholders['initial_embeddings']

        # Embeddings to graph mappings
        self.placeholders['embeddings_to_graph_mappings'] \
            = tf.placeholder(tf.int32, [None], name='embeddings_to_graph_mappings')
        embeddings_to_graph_mappings = self.placeholders['embeddings_to_graph_mappings']
        num_graphs = tf.reduce_max(embeddings_to_graph_mappings) + 1                                            # Scalar

        # Input
        self.placeholders['aux_in'] = tf.placeholder(tf.float32, [None, 2], name='aux_in')
        aux_in = tf.cast(self.placeholders['aux_in'], dtype=tf.float32)

        # Model
        # #########################################
        gate_input = tf.concat([embeddings, self.initial_embeddings], axis=-1)                                  # [b*v, 2h + h_init]
        h_v_G = self.state.weights['mlp_f_m'](embeddings)                                                       # [b*v, 2h]
        g_v_G = self.state.weights['mlp_g_m'](gate_input)                                                       # [b*v, 2h]
        g_v_G = tf.nn.sigmoid(g_v_G)                                                                            # [b*v, 2h]

        h_G = h_v_G * g_v_G                                                                                     # [b*v, 2h]

        # Sum up all nodes per graph
        h_G = tf.unsorted_segment_sum(data=h_G,
                                      segment_ids=embeddings_to_graph_mappings,
                                      num_segments=num_graphs)                                                  # [b, 2h]

        h_G_and_aux_in = tf.concat([h_G, aux_in], axis=-1)                                                      # [b, 2h + 2]

#        h_G_and_aux_in = tf.layers.batch_normalization(h_G_and_aux_in, training=self.enable_training)

        h_G_and_aux_in = self.state.weights['mlp_reduce'](h_G_and_aux_in)

        output = self.state.weights['mlp_reduce_2'](h_G_and_aux_in)                                             # [b, 2]

        output = tf.nn.softmax(output)                                                                          # [b, 2]

        # Training
        if self.enable_training:
            # Input
            self.placeholders['labels'] = tf.placeholder(tf.int32, [None, 2], name='labels')
            labels = tf.cast(self.placeholders['labels'], dtype=tf.float32)

            # Loss
            diff_loss = output - labels                                                                         # [b, 2]
            loss = 0.5 * tf.square(diff_loss)                                                                   # [b, 2]

            loss = tf.reduce_sum(loss)                                                                          # [b]

            self.ops['loss'] = loss

        self.ops['output'] = output