import copy
import json
import numpy as np
import tensorflow as tf
from collections import defaultdict
from typing import Tuple, Dict


# Constants

MODERATELY_SMALL_NUMBER= 1e-4
SMALL_NUMBER = 1e-7
VERY_SMALL_NUMBER = 1e-30

LABEL_OFFSET = 20
ACTION_OFFSET = 30

# Enums
#######
class AE:
    GRAPH_IDX, STEP_IDX, ACTION, \
    LAST_ADDED_NODE_ID, LAST_ADDED_NODE_TYPE, \
    ACTIONS, \
    GRAPH, NODE_STATES, ADJ_LIST, ACTION_CURRENT_IDX, ACTION_CURRENT, \
    SKIP_NEXT, \
    SUBGRAPH_START, \
    NUM_NODES, \
    PROBABILITY \
    = range(0, 15)


# Labels
class L:
    LABEL_0, LABEL_1 = range(LABEL_OFFSET, LABEL_OFFSET + 2)


# Actions
class A:
    INIT_NODE, ADD_NODE, ADD_EDGE, ADD_EDGE_TO, ADD_FUNCTION, ADD_BASIC_BLOCK,\
    ADD_INSTRUCTION_NODE, ADD_TYPE_NODE, ADD_CONST_VALUE_NODE, ADD_STRUCT, ADD_GLOBAL,  \
    ADD_BACKWARDS_EDGE, CHOOSE_BR_EDGE, CHOOSE_FUNCTION, CHOOSE_LOCAL_FUNCTION, ADD_OPERAND, \
    CHOOSE_NUMBER, CHOOSE_STRUCTURAL_NUMBER, CHOOSE_STRUCT, CHOOSE_STATIC = range(ACTION_OFFSET, ACTION_OFFSET + 20)

# Type
class T:
    NODES, EDGES = range(30, 32)


# Functions
###########
def action_pretty_print(action, id=0):
    # Action name
    action_name = ''

    if action[AE.ACTION] == A.INIT_NODE:
        action_name = '<init_node>'
    if action[AE.ACTION] == A.ADD_NODE:
        if L.LABEL_0 in action and action[L.LABEL_0] != 0:
            action_name = '<add_node>'
        else:
            action_name = '<not_add_node>'
    elif action[AE.ACTION] == A.ADD_EDGE:
        if L.LABEL_0 in action and action[L.LABEL_0] != 0:
            action_name = '  <add_edge>'
        else:
            action_name = '  <not_add_edge>'
    elif action[AE.ACTION] == A.ADD_EDGE_TO:
        action_name = '  <add_edge_to>'

    # Label names
    l0_name = ''
    l1_name = ''

    if L.LABEL_0 in action:
        l0_name = action[L.LABEL_0]
    if L.LABEL_1 in action:
        l1_name = action[L.LABEL_1]

    # Probability
    p = ''
    if AE.PROBABILITY in action:
        p = action[AE.PROBABILITY]

    print('{:<5s}{:<30s}{:<10s}{:<10s}{:<20s}{:<22s}{:<15s}{:<25s}'.format(
        str(id),
        action_name,
        str(l0_name),
        str(l1_name),
        str(action[AE.LAST_ADDED_NODE_ID]),
        str(action[AE.LAST_ADDED_NODE_TYPE]),
        str(p),
        str(action[AE.ADJ_LIST]).replace('\n      ', '')))


def print_dash():
    print('-' * 200)


def action_pretty_print_header():
    print_dash()
    print('{:<5s}{:<30s}{:<10s}{:<10s}{:<20s}{:<22s}{:<15s}{:<25s}'.format(
        'ID',
        'ACTION',
        'LABEL_0',
        'LABEL_1',
        'LAST_ADDED_NODE_ID',
        'LAST_ADDED_NODE_TYPE',
        'PROBABILITY',
        'ADJ_LIST'))
    print_dash()


def action_sequence_pretty_print(actions):
    action_pretty_print_header()

    actions = copy.deepcopy(actions)

    for id, action_idx in enumerate(actions):
        action = actions[action_idx]
        action_pretty_print(action, id)


def glorot_init(shape):
    initialization_range = np.sqrt(6.0 / (shape[-2] + shape[-1]))
    return np.random.uniform(low=-initialization_range, high=initialization_range, size=shape).astype(np.float32)


def actionize_default_graphs(graphs, verbose=False):
    # Load data
    action_datas = []
    for graph in graphs:
        action_data = graph_to_action_sequence(graph[T.EDGES], graph[T.NODES], 0)

        enrich_action_sequence_with_graph_data(action_data, graph)
        enrich_action_sequence_with_adj_list_data(action_data)

        action_datas.append(action_data)

        if verbose:
            print('number of actions: %i' % len(action_data))
            action_sequence_pretty_print(action_data)

    return action_datas


def graph_to_action_sequence(edges_in:list, nodes:list, graph_idx:int) -> dict:
    # print(edges_in)
    # print(nodes)
    num_node_states_max = 0
    actions = {}

    last_added_node_type = 0
    current = 0

    step_idx = 0
    for current, node in enumerate(nodes):
        num_node_states_max = max(node, num_node_states_max)

        actions[step_idx] = {
                AE.ACTION:          A.ADD_NODE,
                L.LABEL_0:          node,
                AE.LAST_ADDED_NODE_ID: max(current-1, 0),
                AE.LAST_ADDED_NODE_TYPE: last_added_node_type
        }
        step_idx = step_idx + 1

        last_added_node_type = node

        actions[step_idx] = {
                AE.ACTION:              A.INIT_NODE,
                AE.LAST_ADDED_NODE_ID:     current,
                AE.LAST_ADDED_NODE_TYPE: last_added_node_type
        }
        step_idx = step_idx + 1

        seen_edges = set()
        for edge_in in edges_in:
            start = edge_in[0]
            edge_type = edge_in[1]
            end = edge_in[2]

            if (start == current and end < current) or (end == current and start < current):
                if (start, edge_type, end) not in seen_edges:
                    seen_edges.add((start, edge_type, end))
                else:
                    continue

                actions[step_idx] = {
                        AE.ACTION:              A.ADD_EDGE,
                        L.LABEL_0:              1,
                        AE.LAST_ADDED_NODE_ID:     current,
                        AE.LAST_ADDED_NODE_TYPE: last_added_node_type
                }
                step_idx = step_idx + 1

                actions[step_idx] = {
                        AE.ACTION:              A.ADD_EDGE_TO,
                        L.LABEL_0:              min(start, end),
                        L.LABEL_1:              edge_type,
                        AE.LAST_ADDED_NODE_ID:     current,
                        AE.LAST_ADDED_NODE_TYPE: last_added_node_type
                }
                step_idx = step_idx + 1

        # Action 2 Termination
        actions[step_idx] = {
                AE.ACTION:              A.ADD_EDGE,
                L.LABEL_0:              0,
                AE.LAST_ADDED_NODE_ID:     current,
                AE.LAST_ADDED_NODE_TYPE: last_added_node_type
        }
        step_idx = step_idx + 1


    # Action 1 Termination
    actions[step_idx] = {
        AE.ACTION:          A.ADD_NODE,
        AE.LAST_ADDED_NODE_ID: current,
        AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
        L.LABEL_0:          0
    }

    return actions


def enrich_action_sequence_with_graph_data(actions:dict, graph: dict) -> dict:

    for action_idx, action in actions.items():
        action[AE.GRAPH] = graph


def enrich_action_sequence_with_adj_list_data(actions:dict) -> dict:
    graph_current = {T.NODES: [], T.EDGES: []}

    for action_idx, action in actions.items():
        adj_list, _ = graph_to_adjacency_lists(graph_current[T.EDGES])
        apply_action_to_graph(graph_current, action)

        action[AE.ADJ_LIST] = adj_list
        action[AE.NUM_NODES] = len(graph_current[T.NODES])


def apply_action_to_graph(graph:dict, action:dict) -> None:
    if action[AE.ACTION] == A.ADD_NODE:
        node_type = action[L.LABEL_0]
        if node_type == 0:
            return

        graph[T.NODES].append(node_type)

    elif action[AE.ACTION] == A.ADD_EDGE_TO:
        graph[T.EDGES].append([ \
                action[AE.LAST_ADDED_NODE_ID], \
                action[L.LABEL_1], \
                action[L.LABEL_0] \
        ])


def graph_to_adjacency_lists(graph) -> (Dict[int, np.ndarray], Dict[int, Dict[int, int]]):
    adj_lists = defaultdict(list)
    num_incoming_edges_dicts_per_type = defaultdict(lambda: defaultdict(lambda: 0))
    for src, e, dest in graph:
        fwd_edge_type = e
        adj_lists[fwd_edge_type].append((src, dest))
        num_incoming_edges_dicts_per_type[fwd_edge_type][dest] += 1

#        adj_lists[fwd_edge_type].append((dest, src))
#        num_incoming_edges_dicts_per_type[fwd_edge_type][src] += 1

    final_adj_lists = {e: np.array(sorted(lm), dtype=np.int32)
                       for e, lm in adj_lists.items()}

    return final_adj_lists, num_incoming_edges_dicts_per_type


def pretty_print_dict(d: dict) -> None:
    print(json.dumps(d, indent=2))


def json_keys_to_int(x):
    if isinstance(x, dict):
            return { int(k):v for k,v in x.items() }
    return x


def get_data_stats(data):
    num_actions = []
    node_types = []
    edge_types = []

    for actions in data:
        actions = actions[AE.ACTIONS]
        num_actions.append(len(actions))

        for _, action in actions.items():
            action_type = action[AE.ACTION]
            if action_type == A.ADD_NODE:
                node_type = action[L.LABEL_0]
                node_types.append(node_type)

            elif action_type == A.ADD_EDGE_TO:
                edge_type = action[L.LABEL_1]
                edge_types.append(edge_type)


    print("Dataset Statistics")
    print("- num_graphs: %i" % (len(data)))
    print("- num_actions min: %i, max: %i" % (min(num_actions), max(num_actions)))
    print("- node_types (max of it): %i" % (max(node_types)))
    print("- edge_types (max of it): %i" % (max(edge_types)))

# Classes
#########
class MLP(object):
    def __init__(self, in_size, out_size, hid_sizes, activation, func_name):
        self.in_size = in_size
        self.out_size = out_size
        self.hid_sizes = hid_sizes
        self.activation = activation
        self.func_name = func_name
        self.params = self.make_network_params()

    def make_network_params(self) -> dict:
        dims = [self.in_size] + self.hid_sizes + [self.out_size]
        weight_sizes = list(zip(dims[:-1], dims[1:]))
        weights = [tf.Variable(self.init_weights(s), name='%s_W_layer%i' % (self.func_name, i))
                   for (i, s) in enumerate(weight_sizes)]
        biases = [tf.Variable(np.zeros(s[-1]).astype(np.float32), name='%s_b_layer%i' % (self.func_name, i))
                  for (i, s) in enumerate(weight_sizes)]

        network_params = {
            'weights': weights,
            'biases': biases,
        }

        return network_params

    def init_weights(self, shape: tuple):
        return np.sqrt(6.0 / (shape[-2] + shape[-1])) * (2 * np.random.rand(*shape).astype(np.float32) - 1)

    def __call__(self, inputs):
        acts = inputs
        for W, b in zip(self.params['weights'], self.params['biases']):
            hid = tf.matmul(acts, W) + b
            if self.activation == 'relu':
                acts = tf.nn.relu(hid)
            elif self.activation == 'sigmoid':
                acts = tf.nn.sigmoid(hid)
            elif self.activation == 'linear':
                acts = hid
            else:
                raise Exception('Unknown activation function: %s' % self.activation)
        last_hidden = hid
        return last_hidden
