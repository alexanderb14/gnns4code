import tensorflow as tf

class PropagationModelLayer(object):
    def __init__(self):
        # # Load data
        # self.max_num_vertices = 0
        # self.num_edge_types = 1
        # self.annotation_size = 0
        #
        # # Build the actual model
        # config = tf.ConfigProto()
        # config.gpu_options.allow_growth = True
        #self.graph = tf.Graph()
        #with self.graph.as_default():

        self.placeholders = {}

        #     self.weights = {}
        #     self.ops = {}

    def compute_embeddings(self, embeddings: tf.Tensor) -> tf.Tensor:
        """
        Uses the model layer to process embeddings to new embeddings. All embeddings are in one dimension.
        Propagation is made in one pass with many disconnected graphs.

        :param embeddings: Tensor of shape [V, D]
        :return: Tensor of shape [V, D]
        """
        raise NotImplementedError
