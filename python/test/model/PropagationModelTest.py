import numpy as np
import tensorflow as tf

import test.test_utils as test_utils
from model.layer.GGNNModelLayer import GGNNModelLayer, GGNNModelLayerState
from model.layer.GCNModelLayer import GCNModelLayer, GCNModelLayerState


# Static data
CONFIG = {
    'num_timesteps': 4,
    'gnn_h_size': 4,

    'num_edge_types': 2,

    'use_edge_bias': 0,
}


# Helper functions
def run_propagation_1_layer(graph_layer):
    # Get data
    test_data = test_utils.get_test_data(CONFIG, 1)

    # Process embeddings
    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')
    embeddings_out = graph_layer.compute_embeddings(embeddings_in)

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [embeddings_out]
        feed_dict = {graph_layer.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     graph_layer.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     embeddings_in: test_data['node_features']}

        result = session.run(fetch_list, feed_dict=feed_dict)
        print(result)

        # Check if shape is [v_dim, h_dim]
        assert result[0].shape[0] == test_data['v_dim']
        assert result[0].shape[1] == test_data['h_dim']


def run_propagation_model_1_layer_sparse(graph_layer):
    # Get data
    test_data = test_utils.get_test_data(CONFIG, 1)

    # Process embeddings
    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')
    embeddings_out = graph_layer.compute_embeddings(embeddings_in)

    print(test_data['adjacency_lists'])
    test_data['adjacency_lists'] = {0: [[0, 1]], 1: [[0, 1]]}
    print(test_data['adjacency_lists'])

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [embeddings_out]
        feed_dict = {graph_layer.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     graph_layer.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     embeddings_in: test_data['node_features']}

        result = session.run(fetch_list, feed_dict=feed_dict)

        print(result)


def run_propagation_model_2_layer(graph_layer1, graph_layer2):
    # Get data
    test_data = test_utils.get_test_data(CONFIG, 1)

    # Process embeddings
    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')
    embeddings_out = graph_layer1.compute_embeddings(embeddings_in)
    embeddings_out = graph_layer2.compute_embeddings(embeddings_out)

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [embeddings_out]
        feed_dict = {graph_layer1.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     graph_layer1.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     graph_layer2.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     graph_layer2.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     embeddings_in: test_data['node_features']}

        result = session.run(fetch_list, feed_dict=feed_dict)
        print(result)
        # Check if shape is [v_dim, h_dim]
        assert result[0].shape[0] == test_data['v_dim']
        assert result[0].shape[1] == test_data['h_dim']


# GNN Tests
def test_ggnn_propagation_model_1_layer():
    state = GGNNModelLayerState(CONFIG)
    graph_layer = GGNNModelLayer(CONFIG, state)

    run_propagation_1_layer(graph_layer)


def test_ggnn_propagation_model_1_layer_sparse():
    state = GGNNModelLayerState(CONFIG)
    graph_layer = GGNNModelLayer(CONFIG, state)

    run_propagation_model_1_layer_sparse(graph_layer)


def test_ggnn_propagation_model_2_layer():
    state1 = GGNNModelLayerState(CONFIG)
    graph_layer1 = GGNNModelLayer(CONFIG, state1)
    state2 = GGNNModelLayerState(CONFIG)
    graph_layer2 = GGNNModelLayer(CONFIG, state2)

    run_propagation_model_2_layer(graph_layer1, graph_layer2)


# GCN Tests
def test_gcn_propagation_model_1_layer():
    state = GCNModelLayerState(CONFIG)
    graph_layer = GCNModelLayer(CONFIG, state)

    run_propagation_1_layer(graph_layer)


def test_gcn_propagation_model_1_layer_sparse():
    state = GCNModelLayerState(CONFIG)
    graph_layer = GCNModelLayer(CONFIG, state)

    run_propagation_model_1_layer_sparse(graph_layer)


def test_gcn_propagation_model_2_layer():
    state1 = GCNModelLayerState(CONFIG)
    graph_layer1 = GCNModelLayer(CONFIG, state1)
    state2 = GCNModelLayerState(CONFIG)
    graph_layer2 = GCNModelLayer(CONFIG, state2)

    run_propagation_model_2_layer(graph_layer1, graph_layer2)
