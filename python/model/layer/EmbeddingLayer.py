import tensorflow as tf

from model.layer.PropagationModelLayer import PropagationModelLayer
import utils


class EmbeddingLayerState(object):
    """
    Holds the state / weights of a Embedding Layer.
    """
    def __init__(self, config):
        self.config = config

        hidden_size_orig = self.config['hidden_size_orig']
        h_size = self.config['gnn_h_size']
        num_edge_types = self.config['num_edge_types']

        self.weights = {}

        self.weights['mapping'] = utils.MLP(hidden_size_orig, h_size, self.config['embedding_layer']['mapping_dims'], 'relu', 'mapping')


class EmbeddingLayer(PropagationModelLayer):
    """
    Implementation of the Embedding Layer.
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

    def compute_embeddings(self, embeddings: tf.Tensor) -> tf.Tensor:
        """
        Uses the model layer to process embeddings to new embeddings. All embeddings are in one dimension.
        Propagation is made in one pass with many disconnected graphs.

        :param embeddings: Tensor of shape [v, h]
        :return: Tensor of shape [v, h]
        """

        embeddings_new = self.state.weights['mapping'](embeddings)                    # [v, h]

        return embeddings_new