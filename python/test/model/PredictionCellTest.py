import numpy as np
import tensorflow as tf

import test.test_utils as test_utils
from model.cell.PredictionCell import PredictionCell, PredictionCellState
from model.layer.GGNNModelLayer import GGNNModelLayer, GGNNModelLayerState


# Static data
CONFIG = {
    'hidden_size_orig': 4,

    'num_timesteps': 4,
    'gnn_type': 'GCN',
    'gnn_h_size': 4,

    'gnn_m_size': 2,
    'num_node_types': 2,
    'num_edge_types': 2,

    'use_edge_bias': 0,
    "use_edge_msg_avg_aggregation": 0,
}


# Helper functions
def setup_deepgmg_cell_prediction_and_fetch_op(num_graphs: int):
    # Get data
    test_data = test_utils.get_test_data(CONFIG, num_graphs)

    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')

    # Create state
    ggnn_layer_state = GGNNModelLayerState(CONFIG)
    prediction_cell_state = PredictionCellState(CONFIG)

    # Create layer and propagate
    ggnn_layer = GGNNModelLayer(CONFIG, ggnn_layer_state)
    embeddings = ggnn_layer.compute_embeddings(embeddings_in)

    # Create cell and predict
    prediction_cell = PredictionCell(CONFIG, False, prediction_cell_state)
    output = prediction_cell.compute_predictions(embeddings)

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [output]
        feed_dict = {ggnn_layer.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     ggnn_layer.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     prediction_cell.placeholders['initial_embeddings']: test_data['node_features'],
                     embeddings_in: test_data['node_features'],
                     prediction_cell.placeholders['embeddings_to_graph_mappings']: test_data['embeddings_to_graph_mappings']}

        result = session.run(fetch_list, feed_dict=feed_dict)
        print(result)

        return result


def setup_deepgmg_cell_training_and_fetch_op(num_graphs: int):
    # Get data
    test_data = test_utils.get_test_data(CONFIG, num_graphs)

    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')

    # Create state
    ggnn_layer_state = GGNNModelLayerState(CONFIG)
    prediction_cell_state = PredictionCellState(CONFIG)

    # Create layer and propagate
    ggnn_layer = GGNNModelLayer(CONFIG, ggnn_layer_state)
    embeddings = ggnn_layer.compute_embeddings(embeddings_in)

    # Create cell and predict
    prediction_cell = PredictionCell(CONFIG, True, prediction_cell_state)
    output = prediction_cell.compute_predictions(embeddings)

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [prediction_cell.ops['loss']]
        feed_dict = {ggnn_layer.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     ggnn_layer.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     prediction_cell.placeholders['initial_embeddings']: test_data['node_features'],
                     embeddings_in: test_data['node_features'],
                     prediction_cell.placeholders['embeddings_to_graph_mappings']: test_data['embeddings_to_graph_mappings'],
                     prediction_cell.placeholders['labels']: test_data['labels']}

        result = session.run(fetch_list, feed_dict=feed_dict)
        print(result)

        return result


# Prediction Tests
def test_prediction_cell_1_graph():
    result = setup_deepgmg_cell_prediction_and_fetch_op(1)

    assert isinstance(result[0], np.float32)


def test_prediction_cell_2_graphs():
    result = setup_deepgmg_cell_prediction_and_fetch_op(2)

    assert isinstance(result[0], np.ndarray)
    assert result[0].shape[0] == 2


# Training Tests
# 1 Graph
def test_training_cell_1_graph():
    result = setup_deepgmg_cell_training_and_fetch_op(1)


def test_training_cell_2_graphs():
    result = setup_deepgmg_cell_training_and_fetch_op(2)
