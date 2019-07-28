import numpy as np
import tensorflow as tf

import test.test_utils as test_utils
import utils as utils
from model.cell.DeepGMGCell import DeepGMGCell, DeepGMGCellState
from model.layer.GGNNModelLayer import GGNNModelLayer, GGNNModelLayerState


# Static data
CONFIG = {
    'num_timesteps': 4,
    'graph_rnn_cell': 'GRU',  # GRU, CudnnCompatibleGRUCell, or RNN
    'hidden_size': 4,

    'deepgmg_mlp_size': 2,
    'num_node_types': 2,
    'num_edge_types': 2,

    'use_edge_bias': 0,
    "use_edge_msg_avg_aggregation": 0,

    'actions': [
        {
            'name': 'init_node',
            'type': 'init_node',
            'input_dimension': 1,
            'loss_scaling_factor': 1
        },
        {
            'name': 'add_node',
            'type': 'add_node',
            'input_dimension': 'num_node_types',
            'loss_scaling_factor': 1,
        },
        {
            'name': 'add_edge',
            'type': 'add_edge',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'add_edge_to',
            'type': 'add_edge_to',
            'input_dimension': 'num_edge_types',
            'loss_scaling_factor': 1
        }
    ]
}


# Helper functions
def setup_deepgmg_cell_prediction_and_fetch_op(action_ids: list, op_to_fetch: str, num_graphs: int):
    # Get data
    test_data = test_utils.get_test_data(CONFIG, num_graphs)

    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')

    # Create state
    ggnn_layer_state = GGNNModelLayerState(CONFIG)
    deepgmg_cell_state = DeepGMGCellState(CONFIG)

    # Create layer and propagate
    ggnn_layer = GGNNModelLayer(CONFIG, ggnn_layer_state)
    embeddings = ggnn_layer.compute_embeddings(embeddings_in)

    # Create cell and predict
    deepgmg_cell = DeepGMGCell(CONFIG, False, deepgmg_cell_state)
    deepgmg_cell.compute_predictions(embeddings)

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [deepgmg_cell.ops[op_to_fetch]]
        feed_dict = {ggnn_layer.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     ggnn_layer.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     embeddings_in: test_data['node_features'],
                     deepgmg_cell.placeholders['actions']: np.array(action_ids),
                     deepgmg_cell.placeholders['embeddings_to_graph_mappings']: test_data['embeddings_to_graph_mappings'],
                     deepgmg_cell.placeholders['embeddings_to_graph_mappings_existent']: test_data['embeddings_to_graph_mappings'],
                     deepgmg_cell.placeholders['embeddings_last_added_node_idxs']: test_data['embeddings_last_added_node_idxs'],
                     deepgmg_cell.placeholders['embeddings_last_added_node_idxs_with_minus_ones']: test_data['embeddings_last_added_node_idxs'],
                     deepgmg_cell.placeholders['last_added_node_types']: test_data['last_added_node_types']}

        result = session.run(fetch_list, feed_dict=feed_dict)
        print(result)

        return result


def setup_deepgmg_cell_training_and_fetch_op(action_ids: list, ops_to_fetch: list, num_graphs: int):
    # Get data
    test_data = test_utils.get_test_data(CONFIG, num_graphs)

    embeddings_in = tf.placeholder(tf.float32, [None, test_data['h_dim']], name='embeddings_in')

    # Create state
    ggnn_layer_state = GGNNModelLayerState(CONFIG)
    deepgmg_cell_state = DeepGMGCellState(CONFIG)

    # Create layer and propagate
    ggnn_layer = GGNNModelLayer(CONFIG, ggnn_layer_state)
    embeddings = ggnn_layer.compute_embeddings(embeddings_in)

    # Create cell and predict
    deepgmg_cell = DeepGMGCell(CONFIG, True, deepgmg_cell_state)
    deepgmg_cell.compute_predictions(embeddings)

    with tf.Session() as session:
        session.run(tf.global_variables_initializer())

        fetch_list = [deepgmg_cell.ops[op_to_fetch] for op_to_fetch in ops_to_fetch]
        feed_dict = {ggnn_layer.placeholders['adjacency_lists'][0]: test_data['adjacency_lists'][0],
                     ggnn_layer.placeholders['adjacency_lists'][1]: test_data['adjacency_lists'][1],
                     embeddings_in: test_data['node_features'],
                     deepgmg_cell.placeholders['actions']: np.array(action_ids),
                     deepgmg_cell.placeholders['embeddings_to_graph_mappings']: test_data['embeddings_to_graph_mappings'],
                     deepgmg_cell.placeholders['embeddings_to_graph_mappings_existent']: test_data['embeddings_to_graph_mappings'],
                     deepgmg_cell.placeholders['embeddings_last_added_node_idxs']: test_data['embeddings_last_added_node_idxs'],
                     deepgmg_cell.placeholders['embeddings_last_added_node_idxs_with_minus_ones']: test_data['embeddings_last_added_node_idxs'],
                     deepgmg_cell.placeholders['last_added_node_types']: test_data['last_added_node_types'],
                     deepgmg_cell.placeholders['a1_labels']: test_data['a1_labels'],
                     deepgmg_cell.placeholders['a2_labels']: test_data['a2_labels'],
                     deepgmg_cell.placeholders['a3_labels']: test_data['a3_labels']}

        result = session.run(fetch_list, feed_dict=feed_dict)
        print(result)

        return result
    

# Prediction Tests
# 1 Graph
def test_deepgmg_cell_prediction_1_graph_h_g():
    result = setup_deepgmg_cell_prediction_and_fetch_op([1], 'h_G', 1)

    # Check if shape is [1, h_dim * m]. As there's 1 test graph and a h_G embedding
    assert result[0].shape[0] == 1
    assert result[0].shape[1] == CONFIG['hidden_size'] * CONFIG['deepgmg_mlp_size']


def test_deepgmg_cell_prediction_1_graph_h_v():
    result = setup_deepgmg_cell_prediction_and_fetch_op([1], 'h_v', 1)

    # Check if shape is [1, h_dim]. As there's 1 test graph and a node (h_v) embedding
    assert result[0].shape[0] == 1
    assert result[0].shape[1] == CONFIG['hidden_size']


def test_deepgmg_cell_prediction_1_graph_add_node():
    result = setup_deepgmg_cell_prediction_and_fetch_op([1], 'f_add_node', 1)

    # Check if shape is [1, 2]. As there's 1 test graph and a binomial decision
    assert result[0].shape[0] == 1
    assert result[0].shape[1] == 2


def test_deepgmg_cell_prediction_1_graph_add_edge():
    result = setup_deepgmg_cell_prediction_and_fetch_op([2], 'f_add_edge', 1)

    # Check if shape is [1, 2]. As there's 1 test graph and a binomial decision
    assert result[0].shape[0] == 1
    assert result[0].shape[1] == 2


def test_deepgmg_cell_prediction_1_graph_add_edge_to():
    result = setup_deepgmg_cell_prediction_and_fetch_op([3], 'f_add_edge_to', 1)

    # Check if shape is [3, 1]. As there's 1 test graph with 3 nodes and 2 edge types
    assert result[0].shape[0] == 3
    assert result[0].shape[1] == 2


# 2 Graphs
def test_deepgmg_cell_prediction_2_graphs_h_g():
    result = setup_deepgmg_cell_prediction_and_fetch_op([1, 1], 'h_G', 2)

    # Check if shape is [2, h_dim * m]. As there's 2 test graphs and a h_G embedding
    assert result[0].shape[0] == 2
    assert result[0].shape[1] == CONFIG['hidden_size'] * CONFIG['deepgmg_mlp_size']


def test_deepgmg_cell_prediction_2_graphs_h_v():
    result = setup_deepgmg_cell_prediction_and_fetch_op([1, 1], 'h_v', 2)

    # Check if shape is [1, h_dim]. As there's 2 test graphs and a node (h_v) embedding
    assert result[0].shape[0] == 2
    assert result[0].shape[1] == CONFIG['hidden_size']


def test_deepgmg_cell_prediction_2_graphs_add_node():
    result = setup_deepgmg_cell_prediction_and_fetch_op([1, 1], 'f_add_node', 2)

    # Check if shape is [2, 2]. As there's 2 test graphs and a binomial decision
    assert result[0].shape[0] == 2
    assert result[0].shape[1] == 2


def test_deepgmg_cell_prediction_2_graphs_add_edge():
    result = setup_deepgmg_cell_prediction_and_fetch_op([2, 2], 'f_add_edge', 2)

    # Check if shape is [2, 2]. As there's 2 test graphs and a binomial decision
    assert result[0].shape[0] == 2
    assert result[0].shape[1] == 2


def test_deepgmg_cell_prediction_2_graphs_add_edge_to():
    result = setup_deepgmg_cell_prediction_and_fetch_op([3, 3], 'f_add_edge_to', 2)

    # Check if shape is [6, 1]. As there's 2 test graphs with 3 nodes
    assert result[0].shape[0] == 6
    assert result[0].shape[1] == 2


# Training Tests
# 1 Graph
def test_deepgmg_cell_loss_1_graph_add_node():
    result = setup_deepgmg_cell_training_and_fetch_op([1], ['loss_an', 'loss'], 1)

    # Check if action loss of action matches the overall loss
    assert result[0][0] == result[1]


def test_deepgmg_cell_loss_1_graph_init_node():
    result = setup_deepgmg_cell_training_and_fetch_op([0], ['embeddings'], 1)


def test_deepgmg_cell_loss_1_graph_add_edge():
    result = setup_deepgmg_cell_training_and_fetch_op([2], ['loss_ae', 'loss'], 1)

    # Check if action loss of action matches the overall loss
    assert result[0][0] == result[1]


def test_deepgmg_cell_loss_1_graph_add_edge_to():
    result = setup_deepgmg_cell_training_and_fetch_op([3], ['loss_nodes', 'loss'], 1)

    # Check if action loss of action matches the overall loss
    assert result[0][0] == result[1]


# 2 Graphs
def test_deepgmg_cell_loss_2_graphs_add_node():
    result = setup_deepgmg_cell_training_and_fetch_op([1, 1], ['loss_an', 'loss'], 2)

    # Check if action loss of both graphs of action match the overall loss
    assert np.sum(result[0]) == result[1]


def test_deepgmg_cell_loss_2_graph_init_node():
    result = setup_deepgmg_cell_training_and_fetch_op([0, 1], ['embeddings'], 2)


def test_deepgmg_cell_loss_2_graphs_add_edge():
    result = setup_deepgmg_cell_training_and_fetch_op([2, 2], ['loss_ae', 'loss'], 2)

    # Check if action loss of both graphs of action match the overall loss
    assert np.sum(result[0]) == result[1]


def test_deepgmg_cell_loss_2_graphs_add_edge_to():
    result = setup_deepgmg_cell_training_and_fetch_op([3, 3], ['loss_nodes', 'loss'], 2)

    # Check if action loss of both graphs of action match the overall loss
    assert np.sum(result[0]) == result[1]