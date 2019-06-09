import json
import numpy as np
import queue
import tensorflow as tf
import threading


# Constants
SMALL_NUMBER = 1e-5
VERY_SMALL_NUMBER = 1e-30

LABEL_OFFSET = 20
ACTION_OFFSET = 30

# Enums
#######
class AE:
    GRAPH_IDX, STEP_IDX, ACTION, \
    LAST_ADDED_NODE_ID, LAST_ADDED_NODE_TYPE, \
    ACTIONS, \
    GRAPH, NODE_STATES, ADJ_MAT, ACTION_CURRENT_IDX, ACTION_CURRENT, \
    SKIP_NEXT, \
    SUBGRAPH_START \
    = range(0, 13)

# Labels
class L:
    LABEL_0, LABEL_1 = range(LABEL_OFFSET, LABEL_OFFSET + 2)

# Actions
class A:
    INIT_NODE, ADD_NODE, ADD_EDGE, ADD_BACKWARDS_EDGE, ADD_EDGE_TO, ADD_FUNCTION, ADD_BASIC_BLOCK = range(ACTION_OFFSET, ACTION_OFFSET + 7)

# Type
class T:
    NODES, EDGES = range(30, 32)


# Functions
###########
def apply_action_to_code_graph(cg: object, action: dict) -> object:
    if action[AE.ACTION] == A.ADD_NODE:
        opcode = action[L.LABEL_0]

        instr = Instruction(0, opcode)
        cg.functions[-1].basic_blocks[-1].instructions.append(instr)

    elif action[AE.ACTION] == A.ADD_EDGE_TO:
        instr_to = action[L.LABEL_0]
        edge = Edge('cfg', instr_to)

        cg.functions[-1].basic_blocks[-1].instructions[-1].edges.append(edge)

    elif action[AE.ACTION] == A.ADD_FUNCTION:
        fn = Function('')
        cg.functions.append(fn)

    elif action[AE.ACTION] == A.ADD_BASIC_BLOCK:
        bb = BasicBlock('')
        cg.functions[-1].basic_blocks.append(bb)

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

def pretty_print_dict(d: dict) -> None:
    print(json.dumps(d, indent=2))

def min_max_avg(l: list) -> dict:
    return {
        'min': min(l),
        'max': max(l),
        'avg': int(sum(l) / float(len(l)))
    }

def glorot_init(shape):
    initialization_range = np.sqrt(6.0 / (shape[-2] + shape[-1]))
    return np.random.uniform(low=-initialization_range, high=initialization_range, size=shape).astype(np.float32)

def graph_to_adj_mat(graph, max_n_nodes, num_edge_types):
    bwd_edge_offset = 0

    amat = np.zeros((num_edge_types, max_n_nodes, max_n_nodes))
    for src, e, dest in graph:
        # if e % 2 == 0:
        #     bwd_edge_offset = 1
        # else:
        #     bwd_edge_offset = -1

        amat[e-1, dest, src] = 1
        amat[e-1 + bwd_edge_offset, src, dest] = 1
    return amat

def json_keys_to_int(x):
    if isinstance(x, dict):
            return { int(k):v for k,v in x.items() }
    return x

def freeze_dict(d):
    if isinstance(d, dict):
        return frozenset((key, freeze_dict(value)) for key, value in d.items())
    elif isinstance(d, list):
        return tuple(freeze_dict(value) for value in d)
    return d

def onehot(idx, len):
    z = [0 for _ in range(len)]

    if idx is not -1:
        z[idx] = 1

    return z

def graph_to_action_sequence(edges_in:list, nodes:list, graph_idx:int) -> dict:
    print(edges_in)
    print(nodes)
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
                L.LABEL_0:              node,
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

    return {
            AE.GRAPH_IDX:       graph_idx,
            AE.ACTIONS:         actions
    }

def get_null_action(batch_size, num_edge_types):
    null_action = {}
    null_action[AE.ACTIONS] = []
    null_action[AE.ADJ_MAT] = graph_to_adj_mat(
        [], batch_size, num_edge_types
    )

    return null_action

def action_sequence_pretty_print(actions_data):
    print('-------------------------')

    actions = actions_data[AE.ACTIONS]
    for action_idx in actions:
        action = actions[action_idx]

        if action[AE.ACTION] == A.INIT_NODE:
            print('<init_node> \t\t %s' % str(action))
        if action[AE.ACTION] == A.ADD_NODE:
            if action[L.LABEL_0] != 5:
                print('<add_node> \t\t %s' % str(action))
            else:
                print('<not_add_node>')
        elif action[AE.ACTION] == A.ADD_EDGE:
            if action[L.LABEL_0] != 0:
                print('  <add_edge> \t\t %s' % str(action))
            else:
                print('  <not_add_edge> \t %s' % str(action))
        elif action[AE.ACTION] == A.ADD_EDGE_TO:
            print('  <add_edge_to> \t %s' % str(action))


# Classes
#########
class ThreadedIterator:
    """An iterator object that computes its elements in a parallel thread to be ready to be consumed.
    The iterator should *not* return None"""

    def __init__(self, original_iterator, max_queue_size: int=4):
        self.__queue = queue.Queue(maxsize=max_queue_size)
        self.__thread = threading.Thread(target=lambda: self.worker(original_iterator))
        self.__thread.start()

    def worker(self, original_iterator):
        for element in original_iterator:
            assert element is not None, 'By convention, iterator elements much not be None'
            self.__queue.put(element, block=True)
        self.__queue.put(None, block=True)

    def __iter__(self):
        next_element = self.__queue.get(block=True)
        while next_element is not None:
            yield next_element
            next_element = self.__queue.get(block=True)
        self.__thread.join()

class MLP(object):
    def __init__(self, in_size, out_size, hid_sizes, activation):
        self.in_size = in_size
        self.out_size = out_size
        self.hid_sizes = hid_sizes
        self.activation = activation
        self.params = self.make_network_params()

    def make_network_params(self):
        dims = [self.in_size] + self.hid_sizes + [self.out_size]
        weight_sizes = list(zip(dims[:-1], dims[1:]))
        weights = [tf.Variable(self.init_weights(s), name='MLP_W_layer%i' % i)
                   for (i, s) in enumerate(weight_sizes)]
        biases = [tf.Variable(np.zeros(s[-1]).astype(np.float32), name='MLP_b_layer%i' % i)
                  for (i, s) in enumerate(weight_sizes)]

        network_params = {
            'weights': weights,
            'biases': biases,
        }

        return network_params

    def init_weights(self, shape):
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
