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
        num_node_types = self.config['num_node_types']

        self.weights = {}

        self.weights['transform'] = utils.MLP(h_size, 1, [], 'relu', 'mlp_regression_transform')
        self.weights['gate'] = utils.MLP(h_size + h_size_orig, 1, [], 'relu', 'mlp_regression_gate')

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

        # Model
        # #########################################
        # Gate outputs
        gate_input = tf.concat([embeddings, self.initial_embeddings], axis=-1)                                       # [b*v, 2h]
        gated_outputs = tf.nn.sigmoid(self.state.weights['gate'](gate_input)) * self.state.weights['transform'](embeddings) # [b*v, 1]

        # Sum up all nodes per graph
        graph_representations = tf.unsorted_segment_sum(data=gated_outputs,
                                                        segment_ids=embeddings_to_graph_mappings,
                                                        num_segments=num_graphs)                                # [b, 1]
        output = tf.squeeze(graph_representations)                                                              # [b]
        output = tf.sigmoid(output)

        # Training
        if self.enable_training:
            # Input
            self.placeholders['labels'] = tf.placeholder(tf.int32, [None], name='labels')
            labels = tf.cast(self.placeholders['labels'], dtype=tf.float32)

            # Loss
            diff_loss = output - labels                                                                         # [b]
            loss = 0.5 * tf.square(diff_loss)                                                                   # [b]

            self.ops['loss'] = loss

        self.ops['peek'] = loss

        return output
