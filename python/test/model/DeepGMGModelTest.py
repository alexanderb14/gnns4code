import json
import os
import pytest
import sys

from model.DeepGMGModel import DeepGMGState, DeepGMGGenerator, DeepGMGTrainer
import applications.clang_code.codegraph_models as clang_codegraph_models
import utils

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')

# Static data
CONFIG_DEFAULTGRAPH = {
    'graph_rnn_cell': 'GRU',  # GRU, CudnnCompatibleGRUCell, or RNN

    'num_timesteps': 2,
    'hidden_size': 4,
    'deepgmg_mlp_size': 2,

    'num_node_types': 2,
    'num_edge_types': 2,

    "learning_rate": 0.001,
    'num_training_unroll': 4,
    "clamp_gradient_norm": 1.0,

    "num_epochs": 100,
    "out_dir": '/tmp',

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
def are_graphs_equal(training_graph, generated_graph):
    # Validate nodes
    generated_nodes = generated_graph[utils.T.NODES]

    if generated_nodes != training_graph[utils.T.NODES]:
        return False

    # Validate edges. NOTE: Undirected edges, so allow both directions
    generated_edges = generated_graph[utils.T.EDGES]
    seen_edges = []
    for g_e in generated_edges:
        seen = False
        if (g_e[0], g_e[1], g_e[2]) in training_graph[utils.T.EDGES]:
            seen = True
            seen_edges.append((g_e[0], g_e[1], g_e[2]))
        if (g_e[2], g_e[1], g_e[0]) in training_graph[utils.T.EDGES]:
            seen = True
            seen_edges.append((g_e[2], g_e[1], g_e[0]))

    return set(seen_edges) == set(training_graph[utils.T.EDGES])


def train_generate_and_validate_default_graphs(training_graphs, config, num_graphs_to_gen, num_graphs_to_be_equal):
    utils.actionize_default_graphs(training_graphs, True)

    actions_by_graphs = utils.actionize_default_graphs(training_graphs)
    graph_sizes = [len(graph[utils.T.NODES]) for graph in training_graphs]

    # Train
    state = DeepGMGState(config)
    trainer = DeepGMGTrainer(config, state)
    trainer.train(actions_by_graphs, graph_sizes)

    # Generate and validate
    generator = DeepGMGGenerator(config, state)

    num_graphs_equal = 0
    for _ in range(num_graphs_to_gen):
        try:
            generated_graph = generator.generate()
        except:
            print(sys.exc_info()[0])

        ok = False
        for training_graph in training_graphs:
            if generated_graph and are_graphs_equal(training_graph, generated_graph):
                print('-> TRAIN AND GEN GRAPH EQUAL')
                ok = True
            else:
                print('-> TRAIN AND GEN GRAPH DIFFERENT')

        if ok == True:
            num_graphs_equal += 1

    print(num_graphs_to_gen, num_graphs_equal)
    assert num_graphs_equal > num_graphs_to_be_equal


def train_generate_and_validate_clang_graph(training_graph, config, num_graphs_to_gen, num_graphs_to_be_equal):
    # Transform graph
    clang_codegraph_models.transform_graph(training_graph)

    # Create node type ids
    nic_vstr = clang_codegraph_models.NodeTypeIdCreateVisitor()
    training_graph.accept(nic_vstr)

    # Actionize
    actions = clang_codegraph_models.create_action_sequence(training_graph)
    utils.enrich_action_sequence_with_adj_list_data(actions)
    utils.action_sequence_pretty_print(actions)
    actions_by_graphs = [actions]

    # Get number of nodes
    num_nodes = [clang_codegraph_models.get_num_nodes(training_graph)]

    # Get node types
    node_types = nic_vstr.node_type_ids_by_statements

    # Train
    state = DeepGMGState(config)
    trainer = DeepGMGTrainer(config, state)
    trainer.train(actions_by_graphs, num_nodes)

    # Generate and validate
    generator = DeepGMGGenerator(config, state)

    num_graphs_equal = 0
    for _ in range(num_graphs_to_gen):
        try:
            generated_graph = generator.generate_clang(node_types)
        except:
            print(sys.exc_info()[0])

        try:
            if generated_graph and clang_codegraph_models.are_graphs_equal(training_graph, generated_graph):
                print('-> TRAIN AND GEN GRAPH EQUAL')
                num_graphs_equal += 1
            else:
                print('-> TRAIN AND GEN GRAPH DIFFERENT')

        except:
            print('-> GEN GRAPH DEFECT')
            pass

    print(num_graphs_to_gen, num_graphs_equal)
    assert(num_graphs_equal > num_graphs_to_be_equal)


# Tests
@pytest.mark.acceptance
def test_train_and_gen_one_defaultgraph_small_1():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'hidden_size': 8,

        "learning_rate": 0.001,
        "num_training_unroll": 14,
        "run_id": "one_defaultgraph_small_1",

        "num_node_types": 3,
        "num_edge_types": 5,

        "num_epochs": 2000,
        "gen_num_node_max": 5
    })

    nodes = [1, 2, 1]
    edges = [(2, 1, 1), (2, 0, 0)]
    training_graph = {utils.T.NODES: nodes, utils.T.EDGES: edges}

    train_generate_and_validate_default_graphs([training_graph], config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.acceptance
def test_train_and_gen_one_defaultgraph_small_2():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'hidden_size': 8,

        "learning_rate": 0.001,
        "num_training_unroll": 14,
        "run_id": "one_defaultgraph_small_2",

        "num_node_types": 7,
        "num_edge_types": 5,

        "num_epochs": 500,
        "gen_num_node_max": 5
    })

    nodes = [3, 1, 2]
    edges = [(0, 1, 1), (1, 4, 2)]
    training_graph = {utils.T.NODES: nodes, utils.T.EDGES: edges}

    train_generate_and_validate_default_graphs([training_graph], config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.performance
def test_deepgmg_trainer_and_generator_defaultgraph_medium_1():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'num_timesteps': 2,
        'hidden_size': 16,

        "learning_rate": 0.001,
        "num_training_unroll": 55,
        "run_id": "defaultgraph_medium_1",

        "num_node_types": 7,
        "num_edge_types": 5,

        "num_epochs": 1000,
        "gen_num_node_max": 12
    })

    nodes = [3, 1, 2, 3, 2, 1, 3, 1, 3, 5, 6]
    edges = [(0, 1, 1), (1, 4, 2), (2, 4, 3), (3, 4, 4), \
             (4, 4, 5), (5, 1, 6), (6, 1, 7), (7, 2, 8), \
             (5, 4, 1), (0, 1, 9), (7, 1, 10)]
    training_graph = {utils.T.NODES: nodes, utils.T.EDGES: edges}

    train_generate_and_validate_default_graphs([training_graph], config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.performance
def test_deepgmg_trainer_and_generator_defaultgraph_medium_2():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'num_timesteps': 2,
        'hidden_size': 16,

        "learning_rate": 0.001,
        "num_training_unroll": 55,
        "run_id": "defaultgraph_medium_2",

        "num_node_types": 7,
        "num_edge_types": 5,

        "num_epochs": 1000,
        "gen_num_node_max": 12
    })

    nodes = [3, 1, 2, 3, 2, 1, 3, 1, 3, 5, 6]
    edges = [(0, 1, 1), (1, 4, 2), (2, 2, 3), (3, 4, 4), \
             (4, 4, 5), (5, 1, 6), (6, 1, 7), (7, 2, 8), \
             (5, 4, 1), (0, 1, 9), (7, 1, 10)]
    training_graph = {utils.T.NODES: nodes, utils.T.EDGES: edges}

    train_generate_and_validate_default_graphs([training_graph], config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.performance
def test_deepgmg_trainer_and_generator_defaultgraph_medium_3():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'num_timesteps': 2,
        'hidden_size': 16,

        "learning_rate": 0.001,
        "num_training_unroll": 43,
        "run_id": "defaultgraph_medium_3",

        "num_node_types": 7,
        "num_edge_types": 5,

        "num_epochs": 1000,
        "gen_num_node_max": 12
    })

    nodes = [3, 1, 2, 3, 2, 1, 3, 1, 3]
    edges = [(0, 1, 1), (1, 4, 2), (2, 2, 3), (3, 4, 4), \
             (4, 4, 5), (5, 1, 6), (6, 1, 7), (7, 2, 8)]
    training_graph = {utils.T.NODES: nodes, utils.T.EDGES: edges}

    train_generate_and_validate_default_graphs([training_graph], config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.performance
def test_deepgmg_trainer_and_generator_defaultgraph_medium_4():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'num_timesteps': 2,
        'hidden_size': 8,

        "learning_rate": 0.001,
        "num_training_unroll": 45,
        "run_id": "defaultgraph_medium_4",

        "num_node_types": 4,
        "num_edge_types": 3,

        "num_epochs": 1000,
        "gen_num_node_max": 12
    })

    nodes = [2, 3, 1, 2, 1, 3, 2, 3, 2]
    edges = [(0, 0, 1), (1, 1, 2), (2, 1, 3), (3, 1, 4), \
             (4, 1, 5), (5, 2, 6), (6, 2, 7), (7, 3, 8), \
             (5, 1, 1)]
    training_graph = {utils.T.NODES: nodes, utils.T.EDGES: edges}

    train_generate_and_validate_default_graphs([training_graph], config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.acceptance
def test_train_and_gen_two_defaultgraphs_small():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'hidden_size': 8,

        "learning_rate": 0.001,
        "num_training_unroll": 14,
        "run_id": "two_defaultgraphs_small",

        "num_node_types": 3,
        "num_edge_types": 2,

        "num_epochs": 500,
        "gen_num_node_max": 5
    })

    training_graph_1 = {utils.T.NODES: [1, 2, 1], utils.T.EDGES: [(2, 1, 1), (2, 0, 0)]}
    training_graph_2 = {utils.T.NODES: [1, 2, 1], utils.T.EDGES: [(2, 1, 1), (2, 0, 0)]}

    train_generate_and_validate_default_graphs([training_graph_1, training_graph_2],
                                               config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.acceptance
def test_train_and_gen_clang_codegraph_small():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'hidden_size': 32,

        "learning_rate": 0.001,
        "num_training_unroll": 33,
        "run_id": "clang_codegraph_small",

        "num_node_types": 6,
        "num_edge_types": 8,

        "num_epochs": 500,
        "gen_num_node_max": 10
    })

    with open(os.path.join(SCRIPT_DIR, 'data', 'sample_clang_graph_small.json')) as json_data:
        jRoot = json.load(json_data)

    training_graph = clang_codegraph_models.codegraph_create_from_miner_output(jRoot)

    train_generate_and_validate_clang_graph(training_graph, config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.performance
def test_train_and_gen_clang_codegraph_medium():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'num_timesteps': 2,
        'hidden_size': 64,

        "learning_rate": 0.001,
        "num_training_unroll": 81,
        "run_id": "clang_codegraph_medium",

        "num_node_types": 12,
        "num_edge_types": 4,

        "num_epochs": 1000,
        "gen_num_node_max": 15
    })

    with open(os.path.join(SCRIPT_DIR, 'data', 'sample_clang_graph_medium.json')) as json_data:
        jRoot = json.load(json_data)

    training_graph = clang_codegraph_models.codegraph_create_from_miner_output(jRoot)

    training_graph_2 = clang_codegraph_models.transform_graph(training_graph)
    clang_codegraph_models.save_dot_graph(training_graph_2, '/tmp/out.png', 'png')

    train_generate_and_validate_clang_graph(training_graph, config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)


@pytest.mark.performance
def test_train_and_gen_clang_codegraph_large():
    # Config
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    config = {}
    config.update(CONFIG_DEFAULTGRAPH)
    config.update({
        'num_timesteps': 4,
        'hidden_size': 64,

        "learning_rate": 0.001,
        "num_training_unroll": 137,
        "run_id": "clang_codegraph_large",

        "num_edge_types": 8,
        "num_node_types": 20,

        "num_epochs": 1500,
        "gen_num_node_max": 30
    })

    with open(os.path.join(SCRIPT_DIR, 'data', 'sample_clang_graph_large.json')) as json_data:
        jRoot = json.load(json_data)

    training_graph = clang_codegraph_models.codegraph_create_from_miner_output(jRoot)

    train_generate_and_validate_clang_graph(training_graph, config, NUM_GRAPHS_TO_GENERATE, NUM_GRAPHS_TO_BE_EQUAL)
