import numpy as np
import tensorflow as tf

import utils
from model.layer.PropagationModelLayer import PropagationModelLayer


class GCNModelLayerState(object):
    """
    Holds the state / weights of a CGN Layer.
    """
    def __init__(self, config):
        self.config = config

        h_dim = self.config['gnn_h_size']
        num_edge_types = self.config['num_edge_types']

        self.weights = {}

        self.weights['edge_type_to_message_transformation_layers'] = []
        for edge_type_idx in range(0, self.config['num_edge_types']):
            self.weights['edge_type_to_message_transformation_layers'].append(
                utils.MLP(h_dim,
                          h_dim,
                          [],
                          'linear',
                          'edge_type_to_message_transformation_layer_%d' % edge_type_idx,
                          False))


class GCNModelLayer(PropagationModelLayer):

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
        h_dim = self.config['gnn_h_size']

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
        h_dim = self.config['gnn_h_size']

        # Get all edge targets (aggregate of typed edges)
        edge_type_to_message_targets = []                                           # List of tensors of message targets

        for edge_type_idx, adjacency_list_for_edge_type in enumerate(self.placeholders['adjacency_lists']):
            edge_type_to_message_targets.append(adjacency_list_for_edge_type[:, 1])

        # Let M be the number of messages (sum of all E):
        message_targets = tf.concat(edge_type_to_message_targets, axis=0)           # [M]

        # Propagate
        for _ in range(self.config['num_timesteps']):
            messages_per_type = []                                                  # list of tensors of messages of shape [e, h]
            # Collect incoming messages per edge type
            for edge_type_idx, adjacency_list_for_edge_type in enumerate(self.placeholders['adjacency_lists']):
                edge_sources = adjacency_list_for_edge_type[:, 0]
                edge_targets = adjacency_list_for_edge_type[:, 1]
                edge_source_states = tf.nn.embedding_lookup(params=embeddings,
                                                            ids=edge_sources)       # [e, h]

                messages = self.state.weights['edge_type_to_message_transformation_layers'][edge_type_idx](
                    edge_source_states)                                             # [e, h]

                messages_per_type.append(messages)

            cur_messages = tf.concat(messages_per_type, axis=0)                     # [m, h]
            aggregated_messages = \
                tf.unsorted_segment_sum(data=cur_messages,
                                       segment_ids=message_targets,
                                       num_segments=num_nodes)                      # [v, h]

            new_node_states = tf.nn.relu(aggregated_messages)                       # [v, h]
            embeddings = new_node_states

        return embeddings