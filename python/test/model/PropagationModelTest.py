import numpy as np
import tensorflow as tf

import test.test_utils as test_utils
from model.layer.GGNNModelLayer import GGNNModelLayer, GGNNModelLayerState


# Static data
CONFIG = {
    'num_timesteps': 4,
    'graph_rnn_cell': 'GRU',  # GRU, CudnnCompatibleGRUCell, or RNN
    'gnn_h_size': 4,

    'num_edge_types': 2,

    'use_edge_bias': 0,
}


# Tests
def test_ggnn_propagation_model_1_layer():
    # Get data
    test_data = test_utils.get_test_data(CONFIG, 1)

    # Create layer
    state = GGNNModelLayerState(CONFIG)
    ggnn_layer = GGNNModelLayer(CONFIG, state)

    # Process embeddings
    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')
    embeddings_out = ggnn_layer.compute_embeddings(embeddings_in)

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [embeddings_out]
        feed_dict = {ggnn_layer.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     ggnn_layer.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     embeddings_in: test_data['node_features']}

        result = session.run(fetch_list, feed_dict=feed_dict)
        print(result)

        # Check if shape is [v_dim, h_dim]
        assert result[0].shape[0] == test_data['v_dim']
        assert result[0].shape[1] == test_data['h_dim']


def test_ggnn_propagation_model_1_layer_sparse():
    # Get data
    test_data = test_utils.get_test_data(CONFIG, 1)

    # Create layer
    state = GGNNModelLayerState(CONFIG)
    ggnn_layer = GGNNModelLayer(CONFIG, state)

    # Process embeddings
    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')
    embeddings_out = ggnn_layer.compute_embeddings(embeddings_in)

    print(test_data['adjacency_lists'])
    test_data['adjacency_lists'] = {0: [[0, 1]], 1: [[0, 1]]}
    print(test_data['adjacency_lists'])

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [embeddings_out]
        feed_dict = {ggnn_layer.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     ggnn_layer.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     embeddings_in: test_data['node_features']}

        result = session.run(fetch_list, feed_dict=feed_dict)

        print(result)

def test_ggnn_propagation_model_2_layer():
    # Get data
    test_data = test_utils.get_test_data(CONFIG, 1)

    # Create layers
    state1 = GGNNModelLayerState(CONFIG)
    ggnn_layer1 = GGNNModelLayer(CONFIG, state1)
    state2 = GGNNModelLayerState(CONFIG)
    ggnn_layer2 = GGNNModelLayer(CONFIG, state2)

    # Process embeddings
    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')
    embeddings_out = ggnn_layer1.compute_embeddings(embeddings_in)
    embeddings_out = ggnn_layer2.compute_embeddings(embeddings_out)

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [embeddings_out]
        feed_dict = {ggnn_layer1.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     ggnn_layer1.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     ggnn_layer2.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     ggnn_layer2.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     embeddings_in: test_data['node_features']}

        result = session.run(fetch_list, feed_dict=feed_dict)
        print(result)
        # Check if shape is [v_dim, h_dim]
        assert result[0].shape[0] == test_data['v_dim']
        assert result[0].shape[1] == test_data['h_dim']
