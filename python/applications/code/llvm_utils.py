from random import random, randint, shuffle
import  numpy as np
import math
import  os
import re
import struct
from copy import copy
from codecs import decode
from applications.code.codegraph_models import *

from model.DeepGMGModel import  DeepGMGModel, DeepGMGState, GGNNModelLayer, DeepGMGCell
import applications.utils_llvm as app_utils
import utils as general_utils
import tensorflow as tf


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
    INIT_NODE, ADD_NODE, ADD_EDGE, ADD_EDGE_TO, ADD_FUNCTION, ADD_BASIC_BLOCK, \
    ADD_INSTRUCTION_NODE, ADD_TYPE_NODE, ADD_CONST_VALUE_NODE, ADD_STRUCT, ADD_GLOBAL, \
    ADD_BACKWARDS_EDGE, CHOOSE_BR_EDGE, CHOOSE_FUNCTION, CHOOSE_LOCAL_FUNCTION, ADD_OPERAND, \
    CHOOSE_NUMBER, CHOOSE_STRUCTURAL_NUMBER, CHOOSE_STRUCT, CHOOSE_STATIC = range(ACTION_OFFSET, ACTION_OFFSET + 20)

# Type
class T:
    NODES, EDGES = range(30, 32)

def get_class_key(class_to_get, class_value):
    class_dict = class_to_get.__dict__
    for key in class_dict:
        if class_dict[key] == class_value:
            return key
    #raise ValueError("\"" + class_value + "\" not in " + class_to_get.__name__)

def get_class_value(class_to_get, class_key):
    class_dict = class_to_get.__dict__
    if not class_key in class_dict:
        raise ValueError("\"" + class_key + "\" not in " + class_to_get.__name__)
    return class_dict[class_key]

def make_action_readable(action):
    readable_action = {}
    for key in action:
        key_name = get_class_key(AE, key)
        value_name = str(action[key])
        if not key_name:
            key_name = get_class_key(L, key)
        if key == AE.ACTION:
            value_name = get_class_key(A, action[key])
        if key == AE.LAST_ADDED_NODE_TYPE:
            value_name = get_class_key(LLVM_NODE_TYPES, action[key])
        readable_action.update({key_name : value_name})
    return readable_action





class LLVM_NODE_TYPES:
    node_offset = 0
    NUM_NODE_TYPES = 92

    none_type, phi, call, trunc, add, icmp, and_type, or_type, mul, br, zext, getelementptr, bitcast, load, store, shl, ret, ashr, sdiv,sub,\
    sext, insertelement, shufflevector, srem, urem, select, fadd, fmul, fsub, xor, alloca, lshr, extractelement,\
    fdiv, fcmp, sitofp, fptoui, udiv, fpext, fptrunc, fptosi, insertvalue, extractvalue, switch, uitofp, ptrtoint,\
    unreachable, inttoptr, struct, i1, i2, i6, i8, void, i16, half, float, i31, i32, i33, i64, double, pointer_of,\
    array_of, vector_of, struct_of, number, fp_number, undef, zeroinitializer, null, function, operand, argument, global_var,  eq_predicate, ne_predicate, \
    ugt_predicate, uge_predicate, ult_predicate, ule_predicate, sgt_predicate, sge_predicate, slt_predicate, \
    sle_predicate, ogt_predicate, olt_predicate, oeq_predicate, oge_predicate, ole_predicate, une_predicate, \
    ueq_predicate = range(node_offset, NUM_NODE_TYPES + node_offset)

    primitive_types = [i8, i1, i6, void, i64, float, i16, i31, i2, i33, i32, double]
    unary_types =     [i8, i1, i6,       i64, float, i16, i31, i2, i33, i32, double]
    composite_types = [pointer_of, array_of, vector_of, struct_of]
    all_types = primitive_types + composite_types
    terminator_opcodes = [ret, br, switch]
    predicates = [eq_predicate, ne_predicate, ugt_predicate, uge_predicate, ult_predicate, ule_predicate, sgt_predicate,
                  sge_predicate, slt_predicate, sle_predicate, ogt_predicate, olt_predicate, oeq_predicate,
                  oge_predicate, ole_predicate, une_predicate, ueq_predicate]

    void_ops = [br, switch, store, ret]
    integer_types = [i1, i2, i6, i8, i16, i31, i32, i33, i64]
    floating_point_types = [double, float, half]

    var_ops = [getelementptr, switch, phi, call]
    opcodes_with_explicit_types = [trunc, zext, bitcast, sext, alloca, sitofp, fptoui, fpext, fptrunc, fptosi, uitofp, ptrtoint, inttoptr]
    cast_const_expression_opcodes = [bitcast, ptrtoint, inttoptr]
    const_expression_opcodes = [select, icmp, getelementptr] + cast_const_expression_opcodes

    num_ops_list = []
    call_dict_by_name = {}
    call_dict_by_id = {}

    @staticmethod
    def get_color_for_node_type(node_type):
        if node_type in LLVM_NODE_TYPES.all_types:
            return "red"
        node_types = [LLVM_NODE_TYPES.number, LLVM_NODE_TYPES.undef, LLVM_NODE_TYPES.operand, LLVM_NODE_TYPES.argument, LLVM_NODE_TYPES.function]
        colors = ["blue", "blue", "green", "orange", "orange"]
        if node_type in node_types:
            return colors[node_types.index(node_type)]
        return "black"

    @staticmethod
    def parse_opcode(opcode):
        if isinstance(opcode, str):
            if opcode == "and":
                result = LLVM_NODE_TYPES.and_type
            elif opcode == "or":
                result = LLVM_NODE_TYPES.or_type
            else:
                result = get_class_value(LLVM_NODE_TYPES, opcode)
            return result

        if opcode == LLVM_NODE_TYPES.and_type:
            result = "and"
        elif opcode == LLVM_NODE_TYPES.or_type:
            result = "or"
        else:
            result = get_class_key(LLVM_NODE_TYPES, opcode)
        return result

    @staticmethod
    def get_call_data(map_by_name):
        if map_by_name and len(LLVM_NODE_TYPES.call_dict_by_name) != 0:
            return LLVM_NODE_TYPES.call_dict_by_name

        if not map_by_name and len(LLVM_NODE_TYPES.call_dict_by_id) != 0:
            return LLVM_NODE_TYPES.call_dict_by_id

        call_dict = {}
        path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "..", "..", "..", "data", "call_data")
        call_data = open(path, "r").readlines()
        call_id = -1
        for call_record in call_data:
            call_id += 1
            call_record = call_record.strip()
            call_split = call_record.split(";")
            call_name = call_split[0]
            call_return_type = call_split[1]
            call_signature = []
            if call_split[2] != "":
                call_signature = call_split[2].split(",")
            func = CalledFunction(call_id, call_name, call_return_type, call_signature)
            if map_by_name:
                call_dict.update({call_name : func})
            else:
                call_dict.update({call_id : func})

        if map_by_name:
            LLVM_NODE_TYPES.call_dict_by_name = call_dict
        else:
            LLVM_NODE_TYPES.call_dict_by_id = call_dict
        return call_dict

    @staticmethod
    def get_name(node_type):
        class_dict = LLVM_NODE_TYPES.__dict__
        for key in class_dict:
            if class_dict[key] == node_type:
                return key
        raise ValueError("Not in class")

    @staticmethod
    def get_node_type(name):
        class_dict = LLVM_NODE_TYPES.__dict__
        if not name in class_dict:
            raise ValueError("Not in class")
        return class_dict[name]

    @staticmethod
    def get_num_node_types():
        return LLVM_NODE_TYPES.NUM_NODE_TYPES


    @staticmethod
    def get_num_ops(node_type):
        if len(LLVM_NODE_TYPES.num_ops_list) == 0:
            LLVM_NODE_TYPES.build_num_ops_list()
        return LLVM_NODE_TYPES.num_ops_list[node_type - LLVM_NODE_TYPES.node_offset]

    @staticmethod
    def build_num_ops_list():
        num_ops_list = [2 for _ in range(0, LLVM_NODE_TYPES.NUM_NODE_TYPES)]
        num_ops_list[LLVM_NODE_TYPES.trunc - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.icmp - LLVM_NODE_TYPES.node_offset] = 3
        num_ops_list[LLVM_NODE_TYPES.br - LLVM_NODE_TYPES.node_offset] = -1
        num_ops_list[LLVM_NODE_TYPES.zext - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.getelementptr - LLVM_NODE_TYPES.node_offset] = -1
        num_ops_list[LLVM_NODE_TYPES.bitcast - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.load - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.ret - LLVM_NODE_TYPES.node_offset] = -1
        num_ops_list[LLVM_NODE_TYPES.sext - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.insertelement - LLVM_NODE_TYPES.node_offset] = 3
        num_ops_list[LLVM_NODE_TYPES.shufflevector - LLVM_NODE_TYPES.node_offset] = 3
        num_ops_list[LLVM_NODE_TYPES.select - LLVM_NODE_TYPES.node_offset] = 3
        num_ops_list[LLVM_NODE_TYPES.alloca - LLVM_NODE_TYPES.node_offset] = 0
        num_ops_list[LLVM_NODE_TYPES.fcmp - LLVM_NODE_TYPES.node_offset] = 3
        num_ops_list[LLVM_NODE_TYPES.sitofp - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.fptoui - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.fpext - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.fptrunc - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.fptosi - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.insertvalue - LLVM_NODE_TYPES.node_offset] = 3
        num_ops_list[LLVM_NODE_TYPES.switch - LLVM_NODE_TYPES.node_offset] = -1
        num_ops_list[LLVM_NODE_TYPES.uitofp - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.ptrtoint - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.unreachable - LLVM_NODE_TYPES.node_offset] = 0
        num_ops_list[LLVM_NODE_TYPES.inttoptr - LLVM_NODE_TYPES.node_offset] = 1
        num_ops_list[LLVM_NODE_TYPES.phi - LLVM_NODE_TYPES.node_offset] = -1
        num_ops_list[LLVM_NODE_TYPES.struct_of - LLVM_NODE_TYPES.node_offset] = -1

        LLVM_NODE_TYPES.num_ops_list = num_ops_list



    @staticmethod
    def get_num_node_types():
        return LLVM_NODE_TYPES.NUM_NODE_TYPES





class LLVM_EDGE_TYPES:
    NUM_EDGE_TYPES = 17

    none_type, op_0, op_0_backwards, op_1, op_1_backwards, op_2, op_3, op_multi, op_multi_backwards,cfg, cfg_1, \
    type, type_backwards, first_list_element, first_list_element_backwards, successor_list_element, \
    successor_list_element_backwards = range(0, NUM_EDGE_TYPES)

    @staticmethod
    def get_color_for_edge_type(edge_type):
        colors = ["pink", "purple", "purple", "blue", "blue", "orange", "yellow", "green",
                  "green", "black", "black", "red", "red", "brown", "brown", "pink", "pink"]
        return colors[edge_type]

    @staticmethod
    def get_edge_types():
        result = ['']
        for i in range(1, LLVM_EDGE_TYPES.NUM_EDGE_TYPES):
            result.append(get_class_key(LLVM_EDGE_TYPES, i))

        return result

    @staticmethod
    def get_num_edge_types():
        return LLVM_EDGE_TYPES.NUM_EDGE_TYPES

class LLVM_Node:
    __id = 0

    @staticmethod
    def choose_id():
        result =  LLVM_Node.__id
        LLVM_Node.__id +=1
        return result

    @staticmethod
    def reset_id():
        LLVM_Node.__id = 0

    def get_identifier(self):
        return "n_" + str(self.id) + "_" + get_class_key(LLVM_NODE_TYPES, self.node_type) + "_" + str(self.label)

    def __str__(self):
        return self.get_identifier()

    def __init__(self, node_type, label = 0):
        self.id = LLVM_Node.choose_id()
        self.node_type = node_type
        self.label = label
        self.llvm_type = LLVM_Type(LLVM_NODE_TYPES.none_type)

class LLVM_Edge:
    def __init__(self, from_node, edge_type, to_node):
        self.from_node = from_node
        self.edge_type = edge_type
        self.to_node = to_node

    def get_identifier(self):
        return "e:" + str(self.from_node.id) + "_" + get_class_key(LLVM_NODE_TYPES, self.from_node.node_type) + "--" \
               + get_class_key(LLVM_EDGE_TYPES, self.edge_type) + "->" + str(self.to_node.id) + "_" + \
               get_class_key(LLVM_NODE_TYPES, self.to_node.node_type)

class LLVM_Container:
    def __init__(self, graph = None):
        self.nodes = []
        self.edges = []
        self.basic_blocks = []
        self.llvm_graph = graph
        self.outgoing = {}
        self.instructions = []

    def add_instruction(self, node_id):
        self.instructions.append(self.get_node(node_id))

    def is_equivalent_to(self, other):
        if len(self.nodes) != len(other.nodes):
            print("Containers have different number of nodes")
            return False
        self_identifiers = [x.get_identifier() for x in self.nodes + self.edges]
        other_identifiers = [x.get_identifier() for x in other.nodes + other.edges]
        for i in range(len(self_identifiers)):
            if self_identifiers[i] != other_identifiers[i]:
                print("Node/Edge \"" + self_identifiers[i] + "\" not equal to \"" + other_identifiers[i] + "\"")
                return False
        return True





    def get_node(self, node_id):
        for node in self.nodes:
            if node.id == node_id:
                return node

    def add_node(self, node_type, label = 0):
        self.llvm_graph._add_node_stats(node_type)
        node = LLVM_Node(node_type, label)
        self.nodes.append(node)
        self.llvm_graph.node_dict[node.id] = self
        return node.id

    def add_edge(self, from_id, edge_type, to_id, is_global_edge = True):
        from_node = self.get_node(from_id)
        if is_global_edge:
            to_node = self.llvm_graph.globals_and_structs.get_node(to_id)
            if to_node is None:
                for function in self.llvm_graph.functions:
                    to_node = function.get_node(to_id)
                    if to_node is not None:
                        break
        else:
            to_node = self.get_node(to_id)
        if to_node is None:
            a = 3
        edge_type_name = get_class_key(LLVM_EDGE_TYPES, edge_type)
        if "backwards" in edge_type_name:
            if to_id not in self.outgoing:
                self.outgoing[to_id] = []
            self.outgoing[to_id].append((from_id, get_class_value(LLVM_EDGE_TYPES, edge_type_name[:-len("_backwards")])))
        else:
            if from_id not in self.outgoing:
                self.outgoing[from_id] = []
            self.outgoing[from_id].append((to_id, edge_type))

        edge = LLVM_Edge(from_node, edge_type, to_node)
        self.edges.append(edge)

class LLVM_Graph:
    def __init__(self):
        self.functions = []
        self.globals_and_structs = None
        self.node_dict = {}
        self.global_dict = {}
        self.node_stats = {}

    def _get_unique_id(self, map: dict, name: str):
        id = len(map)
        if name not in map:
            map[name] = {
                'id': id,
                'count': 0
            }

        map[name]['count'] += 1
        return map[name]['id']

    def _add_node_stats(self, node_type):
        node_type = get_class_key(LLVM_NODE_TYPES, node_type)
        self._get_unique_id(self.node_stats, node_type)

    def get_node_stats(self):
        #----------------
        num_funcs = len(self.functions)
        if self.globals_and_structs is not None and len(self.globals_and_structs.nodes) > 0:
            num_funcs += 1
        return {
            'num_functions': num_funcs,
            'node_types': self.node_stats,
            'num_node_types': len(self.node_stats),
            'edge_types': LLVM_EDGE_TYPES.get_edge_types(),
            'num_edge_types': len(LLVM_EDGE_TYPES.get_edge_types()),
            'num_nodes': utils.min_max_avg(self.num_nodes),
            'num_codegraphs': self.num_codegraphs
        }

    def to_adj_list(self):
        nodes = []
        edges = []

        if self.globals_and_structs is not None:
            containers = [self.globals_and_structs] + self.functions
        else:
            containers = self.functions

        for container in containers:
            for node in container.nodes:
                nodes.append(node.node_type)

            for edge in container.edges:
                edges.append((edge.from_node.id, edge.edge_type, edge.to_node.id))

        return general_utils.graph_to_adjacency_lists(edges)


    def is_equivalent_to(self, other):
        if len(self.functions) != len(other.functions):
            print("Graphs have different amount of functions")
            return False
        if not self.globals_and_structs.is_equivalent_to(other.globals_and_structs):
            return False
        for i in range(len(self.functions)):
            if not self.functions[i].is_equivalent_to(other.functions[i]):
                return False
        return True

    def to_picture(self, path, show_labels, show_ids = False):
        dot = pydot.Dot(graph_type="digraph", compound="true")
        function_index = 0
        node_dict = {}
        for container in [self.globals_and_structs] + self.functions:
            cluster_name = "func_" + str(function_index)
            function_cluster = pydot.Cluster(cluster_name, label=cluster_name)
            dot.add_subgraph(function_cluster)
            for node in container.nodes:
                if show_ids:
                    node_name = LLVM_NODE_TYPES.get_name(node.node_type) + " (" + str(node.id) + ")"
                else:
                    node_name = LLVM_NODE_TYPES.get_name(node.node_type)
                node_color = LLVM_NODE_TYPES.get_color_for_node_type(node.node_type)
                pydot_node = pydot.Node(node_name + "_" + str(node.id), label=node_name, color=node_color)
                node_dict.update({node : pydot_node})
                function_cluster.add_node(pydot_node)
            for edge in container.edges:
                from_id = node_dict[edge.from_node]
                to_id = node_dict[edge.to_node]
                edge_type_name = get_class_key(LLVM_EDGE_TYPES, edge.edge_type)
                if "backwards" in edge_type_name:
                    from_id, to_id = to_id, from_id
                color = LLVM_EDGE_TYPES.get_color_for_edge_type(edge.edge_type)
                match = re.search(r"\d", edge_type_name)
                if show_labels and match:
                    label = edge_type_name[match.start()]
                    pydot_edge = pydot.Edge(from_id, to_id, color=color, label=label)
                else:
                    pydot_edge = pydot.Edge(from_id, to_id, color=color)
                function_cluster.add_edge(pydot_edge)
            function_index += 1
        dir = path[0: path.rfind(os.sep)]
        dot.write_raw(os.path.join(dir, 'graph.dot'))
        (graph,) = pydot.graph_from_dot_file(os.path.join(dir, 'graph.dot'))
        graph.write_png(path)

    def get_node(self, node_id):
        containers = [self.globals_and_structs] + self.functions
        for container in containers:
            if len(container.nodes) == 0:
                continue
            if container.nodes[0].id > node_id:
                return containers[containers.index(container) - 1].get_node(node_id)
            if containers.index(container) == (len(containers) - 1):
                return container.get_node(node_id)

    def get_entity_name(self, number):
        result = ""
        higher_entity_names = "_ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        entity_names = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        modulus = len(entity_names)
        multiplier = 0
        while (modulus ** multiplier) * modulus <= number :
            multiplier += 1

        while multiplier >= 0:
            factor = int(number / modulus ** multiplier)
            entity_list = entity_names if multiplier == 0 else higher_entity_names
            result += entity_list[factor]
            number -= factor * (modulus ** multiplier)
            multiplier -= 1

        return result

    def get_num_nodes(self):
        result = 0
        if self.globals_and_structs is not None:
            result += len(self.globals_and_structs.nodes)

        for func in self.functions:
            result += len(func.nodes)

        return result


    def to_codegraph(self, type_dict):
        static_function_dict = LLVM_NODE_TYPES.get_call_data(map_by_name=False)
        bb_boundaries = self.get_basic_block_boundaries()
        cg = CodeGraph()
        function_dict = {}
        node_dict = {}
        next_global_var_id = 0
        next_struct_id = 0
        for node in self.globals_and_structs.nodes:
            if node.node_type == LLVM_NODE_TYPES.global_var:
                outgoing_node, _ = self.get_outgoing_nodes(node)[0]
                constant_value = self.assemble_constant_value(outgoing_node, static_function_dict, function_dict)
                name = "G" + self.get_entity_name(next_global_var_id)
                global_var = GlobalVariable(node.llvm_type.to_string(), next_global_var_id, name, constant_value)
                self.global_dict[node.id] = global_var
                cg.global_variables.append(global_var)
                node_dict[node.id] = global_var
                next_global_var_id += 1
            elif node.node_type == LLVM_NODE_TYPES.struct_of:
                type_list = []
                for type in node.llvm_type.parts:
                    type_list.append(type.to_string())
                struct_var = Struct(next_struct_id, "%struct." + str(next_struct_id), type_list)
                cg.structs.append(struct_var)
                next_struct_id += 1
        for container in self.functions:
            arg_id = 0
            func_name = self.get_entity_name(self.functions.index(container))
            func = Function(func_name, False, "None")
            cg.functions.append(func)
            function_dict[container.nodes[0].id] = func
            for node in container.nodes:

                if node.node_type == LLVM_NODE_TYPES.ret:
                    outgoing_node_tuples = self.get_outgoing_nodes(node)
                    ret_type = "void"
                    for outgoing_node, edge_type in outgoing_node_tuples:
                        if edge_type == LLVM_EDGE_TYPES.op_0:
                            ret_type = outgoing_node.llvm_type.to_string(supress_type_keyword=True)
                    func.llvm_type = ret_type

                elif node.node_type == LLVM_NODE_TYPES.argument:
                    type_string = type_dict[node.id].to_string(supress_type_keyword=True)
                    arg = Argument(arg_id, len(container.instructions) + arg_id, type_string, func.name)
                    node_dict[node.id] = arg
                    func.args[len(container.instructions) + arg_id] = arg
                    arg_id += 1

        basic_block_end = -1
        last_bb = 0
        static_function_ids = set()
        for container in self.functions:
            func = function_dict[container.nodes[0].id]
            basic_blocks = 0
            instruction_counter = 0
            void_instructions = 0
            first_instr_in_bb = False

            for node in container.instructions:
                instruction_counter += 1
                if node.id > basic_block_end:
                    if basic_blocks < len(bb_boundaries):
                        basic_block = BasicBlock("bb" + str(basic_blocks))
                        first_instr_in_bb = True
                        func.basic_blocks.append(basic_block)
                        basic_block_end = bb_boundaries[last_bb][1]
                    basic_blocks += 1
                    last_bb += 1


                instr = Instruction(LLVM_NODE_TYPES.parse_opcode(node.node_type), instruction_counter, len(func.args),
                                    void_instructions, basic_blocks - 1, basic_block)
                if node.llvm_type.equivalent_to(LLVM_Type(LLVM_NODE_TYPES.void)):
                    void_instructions += 1
                node_dict[node.id] = instr
                if first_instr_in_bb:
                    basic_block.create_label(instr.get_name_number() - 1)
                    first_instr_in_bb = False

                type_value = TypeValue(node.llvm_type.to_string(supress_type_keyword=True))
                if node.node_type != LLVM_NODE_TYPES.getelementptr:
                    instr.operands.append(type_value)
                    instr.edges.append(Edge("llvm_type", type_value, instr))
                basic_block.instructions.append(instr)

            for node in container.instructions:
                instr = node_dict[node.id]



                outgoing_node_tuples = self.get_outgoing_nodes(node)

                if node.node_type == LLVM_NODE_TYPES.call:
                    if len(self.get_outgoing_nodes(outgoing_node_tuples[0][0])) == 0:
                        function_id = outgoing_node_tuples[0][0].label
                        if not function_id in static_function_ids:
                            static_function_ids.add(function_id)
                            called_function = static_function_dict[function_id]
                            func = Function(called_function.name, True, called_function.type)
                            cg.functions.insert(0, func)
                            arg_id = 0
                            for type_string in called_function.signature:
                                arg = Argument(arg_id, arg_id, type_string, func.name)
                                func.args[arg_id] = arg
                                arg_id += 1

                index = 0
                for outgoing_node, edge_type in outgoing_node_tuples:
                    if edge_type in [LLVM_EDGE_TYPES.op_multi, LLVM_EDGE_TYPES.op_0, LLVM_EDGE_TYPES.op_1,
                                     LLVM_EDGE_TYPES.op_2, LLVM_EDGE_TYPES.op_3]\
                            or (edge_type in [LLVM_EDGE_TYPES.cfg, LLVM_EDGE_TYPES.cfg_1] and node.node_type in [LLVM_NODE_TYPES.br, LLVM_NODE_TYPES.switch]):
                        operand_node = outgoing_node
                        if edge_type == LLVM_EDGE_TYPES.op_multi or (operand_node.node_type == LLVM_NODE_TYPES.operand and edge_type == LLVM_EDGE_TYPES.cfg):
                            operand_tuples = self.get_outgoing_nodes(outgoing_node)
                            if node.node_type == LLVM_NODE_TYPES.phi:
                                operand_tuples[0], operand_tuples[1] = operand_tuples[1], operand_tuples[0]
                            outgoing_node_tuples += operand_tuples
                            continue
                        if operand_node.node_type in [LLVM_NODE_TYPES.argument, LLVM_NODE_TYPES.global_var] or \
                                (operand_node.id in node_dict):
                            instr.operands.append(None)
                            edge = Edge("dataflow", node_dict[operand_node.id], instr)
                            instr.edges.append(edge)
                        elif operand_node not in container.instructions:
                            constant_value = self.assemble_constant_value(operand_node, static_function_dict, function_dict)
                            instr.operands.append(constant_value)
                        if node.node_type == LLVM_NODE_TYPES.getelementptr and index == 0:
                            type_value = TypeValue(node.llvm_type.to_string(supress_type_keyword=True))
                            instr.operands.insert(0, type_value)
                            instr.edges.insert(0,Edge("llvm_type", type_value, instr))
                            type_value = TypeValue(operand_node.llvm_type.parts[0].to_string(supress_type_keyword=True))
                            instr.operands.insert(1,type_value)
                            instr.edges.insert(1, Edge("llvm_type", type_value, instr))
                        index += 1
                if node.node_type == LLVM_NODE_TYPES.alloca:
                    type_value = TypeValue(node.llvm_type.parts[0].to_string(supress_type_keyword=True))
                    instr.operands.append(type_value)
                    instr.edges.append(Edge("llvm_type", type_value, instr))



        return cg

    def assemble_constant_value(self, node, func_dict, local_func_dict):
        constant_value = None
        if node.node_type in [LLVM_NODE_TYPES.undef, LLVM_NODE_TYPES.null, LLVM_NODE_TYPES.zeroinitializer]:
            constant_value = LiteralValue(node.llvm_type.to_string(supress_type_keyword=True), get_class_key(LLVM_NODE_TYPES, node.node_type))
        elif node.node_type == LLVM_NODE_TYPES.function:
            if node.id in local_func_dict:
                function = local_func_dict[node.id]
                type_string = function.llvm_type + " ("
                for arg_key in function.args:
                    arg = function.args[arg_key]
                    type_string += arg.llvm_type + ","
                if len(function.args) > 0:
                    type_string = type_string[:-1]
                type_string += ")*"
                constant_value = LiteralValue(type_string, function.name)
            else:
                function = func_dict[node.label]
                type_string = function.type + " ("
                for arg in function.signature:
                    type_string += arg + ","
                if len(function.signature) > 0:
                    type_string = type_string[:-1]
                type_string +=")*"
                constant_value = LiteralValue(type_string, function.name)
        elif node.node_type in LLVM_NODE_TYPES.unary_types:
            is_double = node.node_type in LLVM_NODE_TYPES.floating_point_types
            value = node.label
            exact_representation = self.get_exact_representation(value, is_double)
            type_string = node.llvm_type.to_string(supress_type_keyword=True)
            constant_value = LiteralValue(type_string, exact_representation)
        elif node.node_type in LLVM_NODE_TYPES.predicates:
            type_string = node.llvm_type.to_string(supress_type_keyword=True)
            constant_value = LiteralValue(type_string, ConstantValue.translatePredicate(type_string.split("_")[0]))
        elif node.node_type in [LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.vector_of]:
            list_nodes = self.get_list_nodes(node)
            result_list = []
            for list_node in list_nodes:
                result_list.append(self.assemble_constant_value(list_node, func_dict, local_func_dict))
            constant_value = ListValue(node.llvm_type.to_string(supress_type_keyword=True), result_list)
        elif node.node_type == LLVM_NODE_TYPES.getelementptr:
            operands = []
            outgoing_nodes = self.get_outgoing_nodes(node)
            for outgoing_node, edge_type in outgoing_nodes:
                if edge_type == LLVM_EDGE_TYPES.op_multi:
                    outgoing_nodes += self.get_outgoing_nodes(outgoing_node)
                    continue
                if edge_type == LLVM_EDGE_TYPES.op_0:
                    constant_operand = self.assemble_constant_value(outgoing_node, func_dict, local_func_dict)
                    operands.append(constant_operand)
            constant_value = GetElementPtrExpression(node.llvm_type.to_string(supress_type_keyword=True),
                                                     get_class_key(LLVM_NODE_TYPES, node.node_type),operands[0].llvm_type[:-1], False, operands)
        elif node.node_type == LLVM_NODE_TYPES.global_var:
            global_var = self.global_dict[node.id]
            constant_value = LiteralValue(global_var.llvm_type, "@" + global_var.name)

        elif node.node_type in LLVM_NODE_TYPES.cast_const_expression_opcodes:
            outgoing_node, _ = self.get_outgoing_nodes(node)[0]
            constant_operand = self.assemble_constant_value(outgoing_node, func_dict, local_func_dict)
            dest_type = node.llvm_type.to_string(supress_type_keyword=True)
            constant_value = CastExpression(dest_type, constant_operand, get_class_key(LLVM_NODE_TYPES, node.node_type),
                                            constant_operand.llvm_type, dest_type)

        else:

            debug_node_type = get_class_key(LLVM_NODE_TYPES, node.node_type)

            a = 3

        return constant_value

    def get_list_nodes(self, base_node):
        result = []
        target_edge_type = LLVM_EDGE_TYPES.first_list_element
        while True:
            outgoing_node_tuples = self.get_outgoing_nodes(base_node)
            stop = True
            for outgoing_node, edge_type in outgoing_node_tuples:
                if edge_type == target_edge_type:
                    result.append(outgoing_node)
                    target_edge_type = LLVM_EDGE_TYPES.successor_list_element
                    base_node = outgoing_node
                    stop = False
                    break
            if stop:
                break
        return result

    def get_exact_representation(self, number, is_double):
        number = str(number)
        cmd = [app_utils.LLVM_CONVERTER_EXECUTABLE, number, str(is_double).lower()]
        p = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out, _ = p.communicate()
        return out.strip().decode("utf-8")

    def get_operand_node_op(self, operand_node):
        outgoing_node_tuples = self.get_outgoing_nodes(operand_node)
        for outgoing_node, edge_type in outgoing_node_tuples:
            if edge_type == LLVM_EDGE_TYPES.op_0:
                return outgoing_node

    def get_basic_block_boundaries(self):
        function_starts = []
        bb_terminators = []
        for container in self.functions:
            first_instr = True
            for node in container.instructions:
                if first_instr:
                    function_starts.append(node.id)
                    first_instr = False
                if node.node_type in LLVM_NODE_TYPES.terminator_opcodes:
                    bb_terminators.append(node.id)

        all_instructions = []
        for container in self.functions:
            all_instructions += container.instructions
        all_instructions = [x.id for x in all_instructions]
        bb_boundaries = []
        for bb_end in bb_terminators:
            if len(function_starts) > 0 and bb_end >= function_starts[0]:
                bb_start = function_starts[0]
                function_starts.remove(bb_start)
            bb_boundaries.append((bb_start, bb_end))
            if not bb_end == bb_terminators[len(bb_terminators) - 1]:
                bb_start = all_instructions[all_instructions.index(bb_end) + 1]

        return bb_boundaries



    def get_outgoing_nodes(self, node):
        if isinstance(node, int):
            node_id = node
        else:
            node_id = node.id

        outgoing_node_tuples = []
        for container in [self.globals_and_structs] + self.functions:
            if node_id in container.outgoing:
                for (outgoing_node_id, edge_type) in container.outgoing[node_id]:
                    outgoing_node_tuples.append((self.node_dict[outgoing_node_id].get_node(outgoing_node_id), edge_type))
        outgoing_node_tuples.sort(key=lambda tup: tup[1])
        return outgoing_node_tuples




class ML_Model_Simulator:
    @staticmethod
    def sample_add_node_action():
        resultList = []
        for i in range(0, LLVM_NODE_TYPES.get_num_node_types()):
            resultList.append(random())
        return resultList

    @staticmethod
    def sample_add_function_action():
        return random() > random()

    @staticmethod
    def sample_add_edge_action():
        resultList = []
        for i in range(0, LLVM_EDGE_TYPES.get_num_edge_types()):
            resultList.append(random())
        return resultList

    @staticmethod
    def sample_add_edge_to_action(num_nodes):
        resultList = []
        for i in range(0, num_nodes):
            resultList.append(random())
        return resultList

    @staticmethod
    def sample_choose_struct_action(num_structs): # might be replacable by add_edge_to_module
        return randint(0, num_structs - 1)

    @staticmethod
    def sample_get_type_number_action():
        return randint(1, 4096)

    @staticmethod
    def sample_get_var_num_operands_action():
        return randint(0, 20)

    @staticmethod
    def sample_get_standard_num_operands_action():
        return [random() for _ in range(0, 4)]

class LLVM_Type:
    def __init__(self, partial_type, node_id = -1):
        self.parts = list()
        self.number = 0
        self.node_type = partial_type
        self.node_id = node_id

    def equivalent_to(self, other_type, self_sub_type = None):
        self_type = self
        if self_sub_type is not None:
            self_type = self_sub_type
        if self_type.node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types + [LLVM_NODE_TYPES.void]:
            return  self_type.node_type == other_type.node_type
        elif self_type.node_type in [LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.vector_of]:
            if self_type.number != other_type.number or self_type.node_type != other_type.node_type:
                return False
            if len(other_type.parts) != 1:
                return False
            return self.equivalent_to(other_type.parts[0], self.parts[0])
        elif self_type.node_type == LLVM_NODE_TYPES.pointer_of:
            if self_type.node_type != other_type.node_type:
                return False
            if len(other_type.parts) != 1:
                return False
            return self.equivalent_to(other_type.parts[0], self.parts[0])
        elif self_type.node_type == LLVM_NODE_TYPES.struct:
            return self_type.number == other_type.number and self_type.node_type == other_type.node_type
        elif self_type.node_type == LLVM_NODE_TYPES.struct_of:
            if self_type.node_type != other_type.node_type:
                return False
            if len(other_type.parts) != len(self_type.parts):
                return False
            for i in range(len(self_type.parts)):
                if not self.equivalent_to(other_type.parts[i], self_type.parts[i]):
                    return False
            return True



    def to_string(self, anonymous = False, supress_type_keyword = False):
        if self.node_type == LLVM_NODE_TYPES.struct_of:
            if anonymous or supress_type_keyword:
                result = "{"
            else:
                result = "type {"
            for part in self.parts:
                result += part.to_string(True) + ", "
            if len(self.parts) > 0:
                result = result[:-2]
            result += "}"
        elif self.node_type == LLVM_NODE_TYPES.array_of:
            result = "[" + str(int(self.number)) + " x " + self.parts[0].to_string(True) + "]"
        elif self.node_type == LLVM_NODE_TYPES.vector_of:
            result = "<" + str(int(self.number)) + " x " + self.parts[0].to_string(True) + ">"
        elif self.node_type == LLVM_NODE_TYPES.pointer_of:
            result = self.parts[0].to_string(True) + "*"
        elif self.node_type == LLVM_NODE_TYPES.struct:
            result = "%struct." + str(int(self.number))
        else:
            result= LLVM_NODE_TYPES.get_name(self.node_type)
        return result

    def __str__(self):
        return self.to_string()

class TypeCreator:

    @staticmethod
    def string_to_type(type_string, struct_name_dict = None, specify_structs = True):
        result = None
        last_type = None
        type_string = type_string.strip()
        while len(type_string) > 0:

            if type_string.endswith("*"):
                current_type = LLVM_Type(LLVM_NODE_TYPES.pointer_of, -1)
                type_string = type_string[:-1].strip()
            elif type_string in LLVM_NODE_TYPES.__dict__:
                current_type = LLVM_Type(get_class_value(LLVM_NODE_TYPES, type_string), -1)
                type_string = ""
            elif type_string.startswith("["):
                number = int(type_string[1:type_string.index("x")].strip())
                current_type = LLVM_Type(LLVM_NODE_TYPES.array_of, -1)
                current_type.number = number
                type_string = type_string[type_string.index("x") + 1: -1].strip()
            elif type_string.startswith("<"):
                number = int(type_string[1:type_string.index("x")].strip())
                current_type = LLVM_Type(LLVM_NODE_TYPES.vector_of, -1)
                current_type.number = number
                type_string = type_string[type_string.index("x") + 1: -1].strip()
            # assumes following struct naming convention: %struct.X, X being an integer >= 0
            elif type_string.startswith("%"):
                if not specify_structs:
                    number = 0
                elif not struct_name_dict:
                    number = int(type_string[8])
                else:
                    number = struct_name_dict[type_string]
                current_type = LLVM_Type(LLVM_NODE_TYPES.struct, -1)
                current_type.number = number
                type_string = ""
            else:
                sub_types = []
                if type_string != "type opaque":
                    if type_string.startswith("type"):
                        type_string = type_string[4:].strip()
                    type_string = type_string[1:-1].strip()
                    sub_types = type_string.split(",")
                current_type = LLVM_Type(LLVM_NODE_TYPES.struct_of, -1)
                current_type.number = len(sub_types)
                for sub_type in sub_types:
                    sub_type = sub_type.strip()
                    current_type.parts.append(TypeCreator.string_to_type(sub_type, struct_name_dict))
                type_string = ""


            if not result:
                result = current_type
            else:
                last_type.parts.append(current_type)
            last_type = current_type
        return result


    @staticmethod
    def create_type_lists(type):
        type_list = list()
        numbers = list()
        while True:
            current_node_type = type.node_type
            type_list.append(current_node_type)
            if current_node_type == LLVM_NODE_TYPES.struct_of:
                type_list.append(LLVM_NODE_TYPES.number)
                numbers.append(type.number)
                for part in type.parts:
                    part_type_list, part_numbers = TypeCreator.create_type_lists(part)
                    type_list += part_type_list
                    numbers += part_numbers
                return type_list, numbers
            elif current_node_type in [LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.struct]:
                type_list.append(LLVM_NODE_TYPES.number)
                numbers.append(type.number)
            if len(type.parts) == 0:
                break
            type = type.parts[0]
        return type_list, numbers

    @staticmethod
    def size_of(type):
        node_type = type.node_type
        if node_type in [LLVM_NODE_TYPES.pointer_of, LLVM_NODE_TYPES.double, LLVM_NODE_TYPES.float] + LLVM_NODE_TYPES.integer_types:
            return TypeCreator.size_of_node_type(node_type)
        elif node_type == LLVM_NODE_TYPES.vector_of:
            return type.number * TypeCreator.size_of(type.parts[0])
        elif node_type == LLVM_NODE_TYPES.struct_of:
            result = 0
            for part in type.parts:
                result += TypeCreator.size_of(part)
            return result
        else:
            raise ValueError("Cannot calc size of type.")

    @staticmethod
    def size_of_node_type(node_type):
        if node_type == LLVM_NODE_TYPES.pointer_of:
            return 64
        elif node_type in LLVM_NODE_TYPES.integer_types:
            return int(LLVM_NODE_TYPES.get_name(node_type)[1:])
        elif node_type == LLVM_NODE_TYPES.double:
            return 64
        elif node_type == LLVM_NODE_TYPES.float:
            return 32
        else:
            raise ValueError("Cannot calc size of node type.")

    def __init__(self, llvm_node_container):
        self.type = None
        self.stack = list()
        self.state = CT_Internal_State.start
        self.llvm_node_container = llvm_node_container
        self.num_types = LLVM_NODE_TYPES.composite_types.copy()
        self.num_types.remove(LLVM_NODE_TYPES.pointer_of)

    def to_string(self, anonymous = False):
        return self.type.to_string(anonymous)

    def get_type(self):
        return self.type

    def update(self, node_type, number = -1):
        node_name_debug = LLVM_NODE_TYPES.get_name(node_type)
        if not self.type:
            node_id = self.llvm_node_container.add_node(node_type)
            start_part = LLVM_Type(node_type, node_id)
            if node_type == LLVM_NODE_TYPES.pointer_of:
                start_part.number = 1
            self.type = start_part
            if node_type in LLVM_NODE_TYPES.primitive_types:
                self.state = CT_Internal_State.end
            else:
                self.stack.append(start_part)
        elif self.state == CT_Internal_State.end:
            raise ValueError("Can not extend type.")
        else:
            current_type = self.stack[len(self.stack) - 1]
            curr_node_type = current_type.node_type
            debug_node_type_name = LLVM_NODE_TYPES.get_name(curr_node_type)
            current_node_id = current_type.node_id
            if node_type == LLVM_NODE_TYPES.number:

                if curr_node_type not in self.num_types + [LLVM_NODE_TYPES.struct] or current_type.number >=0:
                    raise ValueError("Cannot append number")
                if number < 0:
                    raise ValueError("Number not specified")
                node_id = self.llvm_node_container.add_node(node_type, number)
                self.llvm_node_container.add_edge(node_id, LLVM_EDGE_TYPES.type_backwards, current_node_id)
                current_type.number = number
                if curr_node_type == LLVM_NODE_TYPES.struct:
                    self.stack.pop()
            elif current_type.number < 0:
                raise ValueError("Current type needs number specification")
            elif node_type in self.num_types or node_type == LLVM_NODE_TYPES.struct:
                node_id = self.llvm_node_container.add_node(node_type)
                self.llvm_node_container.add_edge(node_id, LLVM_EDGE_TYPES.type_backwards, current_node_id)
                partial_type =  LLVM_Type(node_type, node_id)
                self.stack.append(partial_type)
                current_type.parts.append(partial_type)
            elif node_type == LLVM_NODE_TYPES.pointer_of:
                node_id = self.llvm_node_container.add_node(node_type)
                self.llvm_node_container.add_edge(node_id, LLVM_EDGE_TYPES.type_backwards, current_node_id)
                partial_type = LLVM_Type(node_type, node_id)
                partial_type.number = 1
                self.stack.append(partial_type)
                current_type.parts.append(partial_type)
            elif node_type in LLVM_NODE_TYPES.primitive_types:
                node_id = self.llvm_node_container.add_node(node_type)
                self.llvm_node_container.add_edge(node_id, LLVM_EDGE_TYPES.type_backwards, current_node_id)
                partial_type = LLVM_Type(node_type, node_id)
                partial_type.number = 0
                current_type.parts.append(partial_type)
                needed_parts = 0
                while needed_parts == 0 and len(self.stack) > 0:
                    current_type = self.stack.pop()
                    if current_type.node_type == LLVM_NODE_TYPES.struct_of:
                        needed_parts =  current_type.number - len(current_type.parts)
                    elif current_type.node_type in self.num_types or current_type.node_type == LLVM_NODE_TYPES.pointer_of:
                        needed_parts = 1 - len(current_type.parts)
                    else:
                        needed_parts = 0
                if needed_parts == 0:
                    self.state = CT_Internal_State.end
                else:
                    self.stack.append(current_type)
            else:
                raise ValueError("Non-type node")

class CT_Internal_State:
    start, generic_start, internal_state, added_array, added_vector, added_struct, added_pointer, added_generic_pointer, added_primitive_type, added_number, end, error = range(0, 12)

class CreateTypeStateMachine:
    class BaseCreateType:
        def __init__(self):
            self.state = CT_Internal_State.start
            self.numbers = list()

        def is_error_state(self):
            return self.state == CT_Internal_State.error

        def get_state(self):
            return self.state

        def get_next_number(self, get_number_action):
            if len(self.numbers) > 0:
                return self.numbers[0]
            return get_number_action

        def merge_and_mul(self, add_node_action, allowed_types):
            result = [0 for _ in range(0, LLVM_NODE_TYPES.NUM_NODE_TYPES)]
            for type in allowed_types:
                list_index = type - LLVM_NODE_TYPES.node_offset
                result[list_index] = 1

            return [a * b for a, b in zip(add_node_action, result)]

    class BaseCreateOperatorType(BaseCreateType):
        def __init__(self, num_ops = None, op_number = None, previous_type = None):
            super().__init__()

            if op_number and op_number not in range(0,num_ops):
                raise ValueError("op_number not matching the opcode")
            if op_number != None:
                self.op_number = op_number


        def update(self, node_type, _):
            return self.state.update(node_type, _)

        def verify(self, add_node_action):
            return self.state.verify(add_node_action)

        def get_state(self):
            return self.state.get_state()

        def get_next_number(self, get_number_action):
            return self.state.get_next_number(get_number_action)

    class CreateStruct(BaseCreateType):
        def __init__(self):
            super().__init__()
            self.internal_state = CreateTypeStateMachine.CreateGenericTargetType()
            self.num_parts = 0
            self.current_num_parts = 0
            self.recursive_struct_state = None


        def __pop_stack(self):
            self.current_num_parts += 1
            if self.current_num_parts >= self.num_parts:
                self.state = CT_Internal_State.end
            else:
                self.state = CT_Internal_State.generic_start
                self.internal_state = CreateTypeStateMachine.CreateGenericTargetType()
                self.recursive_struct_state = None

        def update(self, node_type, number):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.struct_of:
                    self.state = CT_Internal_State.added_struct
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_struct:
                if node_type == LLVM_NODE_TYPES.number:
                    self.num_parts = number
                    if number == 0:
                        self.state = CT_Internal_State.end
                    else:
                        self.state = CT_Internal_State.generic_start
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.generic_start:
                if node_type == LLVM_NODE_TYPES.struct_of:
                    self.recursive_struct_state = CreateTypeStateMachine.CreateStruct()
                    self.recursive_struct_state.update(node_type, number)
                    self.state = CT_Internal_State.internal_state
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types\
                + [LLVM_NODE_TYPES.pointer_of, LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.struct]:
                    self.internal_state.update(node_type, number)
                    if self.internal_state.get_state() == CT_Internal_State.end:
                        self.__pop_stack()
                    elif self.internal_state.get_state() == CT_Internal_State.error:
                        self.state = CT_Internal_State.error
                    else:
                        self.state = CT_Internal_State.internal_state
            elif self.state == CT_Internal_State.internal_state:
                if self.recursive_struct_state == None:
                    self.internal_state.update(node_type, number)
                    if self.internal_state.state == CT_Internal_State.end:
                        self.__pop_stack()
                    elif self.internal_state.state != CT_Internal_State.error:
                        pass
                    else:
                        self.state = CT_Internal_State.error
                else:
                    self.recursive_struct_state.update(node_type, number)
                    if self.recursive_struct_state.state == CT_Internal_State.end:
                        self.__pop_stack()
                    elif self.recursive_struct_state.state != CT_Internal_State.error:
                        pass
                    else:
                        self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error


            '''elif self.state == CT_Internal_State.generic_start or self.state == CT_Internal_State.internal_state:
                self.internal_state.update(node_type, None)
                if self.internal_state.state == CT_Internal_State.end:
                    self.current_num_parts += 1
                    if self.current_num_parts >= self.num_parts:
                        self.state = CT_Internal_State.end
                    else:
                        self.state = CT_Internal_State.generic_start
                        self.internal_state  = CreateTypeStateMachine.CreateGenericTargetType()
                elif self.internal_state.state != CT_Internal_State.error:
                    self.state = CT_Internal_State.internal_state
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error'''


        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                return self.merge_and_mul(add_node_action, [LLVM_NODE_TYPES.struct_of])
            elif self.state == CT_Internal_State.added_struct:
                return self.merge_and_mul(add_node_action, [LLVM_NODE_TYPES.number])
            elif self.state == CT_Internal_State.generic_start:
                return self.merge_and_mul(add_node_action, LLVM_NODE_TYPES.integer_types.copy() +
                                          LLVM_NODE_TYPES.floating_point_types + LLVM_NODE_TYPES.composite_types +
                                          [LLVM_NODE_TYPES.struct])
            elif self.state == CT_Internal_State.internal_state:
                if self.recursive_struct_state:
                    return self.recursive_struct_state.verify(add_node_action)
                return self.internal_state.verify(add_node_action)
            return self.merge_and_mul(add_node_action, [])


    # tested
    class CreateTruncTargetType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type in LLVM_NODE_TYPES.integer_types and node_type != LLVM_NODE_TYPES.i64:
                    self.state = CT_Internal_State.end
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type in LLVM_NODE_TYPES.integer_types and node_type != LLVM_NODE_TYPES.i64:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + [LLVM_NODE_TYPES.vector_of]
                allowed_types.remove(LLVM_NODE_TYPES.i64)
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy()
                allowed_types.remove(LLVM_NODE_TYPES.i64)
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    # tested
    class CreateZextOrSextTargetType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type in LLVM_NODE_TYPES.integer_types and node_type != LLVM_NODE_TYPES.i1:
                    self.state = CT_Internal_State.end
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type in LLVM_NODE_TYPES.integer_types and node_type != LLVM_NODE_TYPES.i1:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + [LLVM_NODE_TYPES.vector_of]
                allowed_types.remove(LLVM_NODE_TYPES.i1)
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy()
                allowed_types.remove(LLVM_NODE_TYPES.i1)
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    # tested
    class CreateBitcastTargetType(BaseCreateType):
        def __init__(self):
            super().__init__()
            self.allowed_start_types = LLVM_NODE_TYPES.all_types.copy()
            self.allowed_start_types.remove(LLVM_NODE_TYPES.void)
            self.allowed_start_types.remove(LLVM_NODE_TYPES.array_of)
            self.allowed_start_types.remove(LLVM_NODE_TYPES.struct_of)

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    self.state = CT_Internal_State.generic_start
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type in self.allowed_start_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    self.state = CT_Internal_State.generic_start
                elif node_type in self.allowed_start_types and node_type != LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.generic_start:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    pass
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type in self.allowed_start_types:
                    self.state = CT_Internal_State.end
                elif node_type == LLVM_NODE_TYPES.array_of:
                    self.state = CT_Internal_State.added_array
                elif node_type == LLVM_NODE_TYPES.struct:
                    self.state = CT_Internal_State.added_struct
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_array:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.generic_start
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_struct:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = self.allowed_start_types
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = self.allowed_start_types.copy()
                allowed_types.remove(LLVM_NODE_TYPES.vector_of)
            elif self.state == CT_Internal_State.generic_start:
                allowed_types = LLVM_NODE_TYPES.all_types.copy() + [LLVM_NODE_TYPES.struct]
                allowed_types.remove(LLVM_NODE_TYPES.void)
                allowed_types.remove(LLVM_NODE_TYPES.struct_of)
            elif self.state == CT_Internal_State.added_array:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_struct:
                allowed_types = [LLVM_NODE_TYPES.number]
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    #tested
    class CreateSitofpOrUitofpTargetType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type in LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type in LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.floating_point_types.copy() + [LLVM_NODE_TYPES.vector_of]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.floating_point_types.copy()
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    # tested
    class CreateIntegerOrIntegerVectorType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type in LLVM_NODE_TYPES.integer_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type in LLVM_NODE_TYPES.integer_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + [LLVM_NODE_TYPES.vector_of]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy()
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    # tested
    class CreateFpextOrFptruncType(BaseCreateType):
        def __init__(self, isFfpextType, isTargetType):
            super().__init__()
            self.allowed_type = LLVM_NODE_TYPES.double if isFfpextType == isTargetType else LLVM_NODE_TYPES.float

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start and node_type == self.allowed_type:
                self.state = CT_Internal_State.end
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = [self.allowed_type]
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    # tested
    class CreatePtrtointTargetType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type in LLVM_NODE_TYPES.integer_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type in LLVM_NODE_TYPES.integer_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + [LLVM_NODE_TYPES.vector_of]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy()
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    # tested
    class CreateInttoptrTargetType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type == LLVM_NODE_TYPES.pointer_of:
                    self.state = CT_Internal_State.added_generic_pointer
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    self.state = CT_Internal_State.added_pointer
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_pointer:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    pass
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_generic_pointer:
                if node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type == LLVM_NODE_TYPES.pointer_of:
                    pass
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                elif node_type == LLVM_NODE_TYPES.struct:
                    self.state = CT_Internal_State.added_struct
                elif node_type == LLVM_NODE_TYPES.array_of:
                    self.state = CT_Internal_State.added_array
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_array:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.generic_start
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.generic_start:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    self.state = CT_Internal_State.added_generic_pointer
                elif node_type == LLVM_NODE_TYPES.struct:
                    self.state = CT_Internal_State.added_struct
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type == LLVM_NODE_TYPES.array_of:
                    self.state = CT_Internal_State.added_array
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_struct:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.pointer_of]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = [LLVM_NODE_TYPES.pointer_of]
            elif self.state == CT_Internal_State.added_pointer:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + LLVM_NODE_TYPES.floating_point_types.copy()
            elif self.state == CT_Internal_State.added_generic_pointer:
                allowed_types = LLVM_NODE_TYPES.composite_types.copy() + LLVM_NODE_TYPES.integer_types.copy()\
                                + LLVM_NODE_TYPES.floating_point_types.copy() + [LLVM_NODE_TYPES.struct]
                allowed_types.remove(LLVM_NODE_TYPES.struct_of)
            elif self.state == CT_Internal_State.added_array:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.generic_start:
                allowed_types = LLVM_NODE_TYPES.composite_types.copy() + LLVM_NODE_TYPES.integer_types.copy()\
                                + LLVM_NODE_TYPES.floating_point_types.copy() + [LLVM_NODE_TYPES.struct]
                allowed_types.remove(LLVM_NODE_TYPES.struct_of)
            elif self.state == CT_Internal_State.added_struct:
                allowed_types = [LLVM_NODE_TYPES.number]
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    class CreateSelectTargetType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type == LLVM_NODE_TYPES.i1:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type == LLVM_NODE_TYPES.i1:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_number_action):
            if self.state == CT_Internal_State.start:
                allowed_types = [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.i1]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = [LLVM_NODE_TYPES.i1]
            else:
                allowed_types = []
            return self.merge_and_mul(add_number_action, allowed_types)

    class CreateVectorType(BaseCreateType):
        def __init__(self):
            super().__init__()
            self.internal_state = CreateTypeStateMachine.CreateGenericTargetType()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    self.state = CT_Internal_State.internal_state
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.internal_state:
                self.internal_state.update(node_type, _)
                if self.internal_state.get_state() in [CT_Internal_State.end, CT_Internal_State.error]:
                    self.state = self.internal_state.get_state()
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.internal_state:
                return self.internal_state.verify(add_node_action)
            if self.state == CT_Internal_State.start:
                allowed_types = [LLVM_NODE_TYPES.vector_of]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + LLVM_NODE_TYPES.floating_point_types.copy() + [LLVM_NODE_TYPES.pointer_of]
            else:
                allowed_types = []
            return self.merge_and_mul(add_node_action, allowed_types)

    class CreateIntegerType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type in LLVM_NODE_TYPES.integer_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy()
            else:
                allowed_types = []
            return self.merge_and_mul(add_node_action, allowed_types)

    class CreateFpOrFpVectorType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type in LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type in LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.floating_point_types.copy() + [LLVM_NODE_TYPES.vector_of]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.floating_point_types.copy()
            else:
                allowed_types = []
            return self.merge_and_mul(add_node_action, allowed_types)

    # tested
    class CreateGenericTargetType(BaseCreateType):
        def __init__(self):
            super().__init__()

        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    pass
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type == LLVM_NODE_TYPES.array_of:
                    self.state = CT_Internal_State.added_array
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                elif node_type == LLVM_NODE_TYPES.struct:
                    self.state = CT_Internal_State.added_struct
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_array:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.start
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    pass
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_struct:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + LLVM_NODE_TYPES.floating_point_types.copy()\
                + [LLVM_NODE_TYPES.pointer_of, LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.struct]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_array:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + LLVM_NODE_TYPES.floating_point_types.copy()\
                + [LLVM_NODE_TYPES.pointer_of]
            elif self.state == CT_Internal_State.added_struct:
                allowed_types = [LLVM_NODE_TYPES.number]
            else:
                allowed_types = []
            return self.merge_and_mul(add_node_action, allowed_types)

    class CreateGenericPointerType(BaseCreateType):
        def __init__(self):
            super().__init__()
            self.state = CreateTypeStateMachine.CreateGenericTargetType()
            self.first_action = True

        def update(self, node_type, _):
            if self.first_action:
                if node_type != LLVM_NODE_TYPES.pointer_of:
                    raise ValueError("Pointer-type must begin with a pointer")
                self.first_action = False
            else:
                self.state.update(node_type, _)

        def verify(self, add_node_action):
            if self.first_action:
                return self.merge_and_mul(add_node_action, [LLVM_NODE_TYPES.pointer_of])
            return self.state.verify(add_node_action)

        def get_next_number(self, get_number_action):
            return self.state.get_next_number(get_number_action)

        def get_state(self):
            if self.first_action:
                return CT_Internal_State.start
            return self.state.get_state()

    struct_info = dict()

    def __init__(self):
        self.state = None


    @staticmethod
    def update_struct_info(struct_dict):
        CreateTypeStateMachine.struct_info.update(struct_dict)

    @staticmethod
    def get_struct_size(struct_num):
        return CreateTypeStateMachine.struct_info[struct_num]

    def update(self, node_type, number):
        self.state.update(node_type, number)

    def verify(self, add_node_action):
        return self.state.verify(add_node_action)

    def start_creating_target_type(self, node_type):
        if node_type == LLVM_NODE_TYPES.trunc:
            self.state = CreateTypeStateMachine.CreateTruncTargetType()
        elif node_type == LLVM_NODE_TYPES.zext or node_type == LLVM_NODE_TYPES.sext:
            self.state = CreateTypeStateMachine.CreateZextOrSextTargetType()
        elif node_type == LLVM_NODE_TYPES.bitcast:
            self.state = CreateTypeStateMachine.CreateBitcastTargetType()
        elif node_type == LLVM_NODE_TYPES.sitofp or node_type == LLVM_NODE_TYPES.uitofp:
            self.state = CreateTypeStateMachine.CreateSitofpOrUitofpTargetType()
        elif node_type == LLVM_NODE_TYPES.fptoui or node_type == LLVM_NODE_TYPES.fptosi:
            self.state = CreateTypeStateMachine.CreateIntegerOrIntegerVectorType()
        elif node_type == LLVM_NODE_TYPES.fpext:
            self.state = CreateTypeStateMachine.CreateFpextOrFptruncType(True, True)
        elif node_type == LLVM_NODE_TYPES.fptrunc:
            self.state = CreateTypeStateMachine.CreateFpextOrFptruncType(False, True)
        elif node_type == LLVM_NODE_TYPES.ptrtoint:
            self.state = CreateTypeStateMachine.CreatePtrtointTargetType()
        elif node_type == LLVM_NODE_TYPES.inttoptr:
            self.state = CreateTypeStateMachine.CreateInttoptrTargetType()
        elif node_type == LLVM_NODE_TYPES.none_type:
            self.state = CreateTypeStateMachine.CreateGenericTargetType()
        elif node_type == LLVM_NODE_TYPES.struct_of:
            self.state = CreateTypeStateMachine.CreateStruct()
        else:
            raise ValueError("Target type currently not implemented")

    def start_creating_operand_type(self, node_type,num_operand = None, previous_type = None):
        if node_type in [LLVM_NODE_TYPES.and_type, LLVM_NODE_TYPES.add, LLVM_NODE_TYPES.mul, LLVM_NODE_TYPES.shl,
                         LLVM_NODE_TYPES.ashr, LLVM_NODE_TYPES.sdiv, LLVM_NODE_TYPES.sub, LLVM_NODE_TYPES.sext,
                         LLVM_NODE_TYPES.srem, LLVM_NODE_TYPES.urem, LLVM_NODE_TYPES.or_type, LLVM_NODE_TYPES.xor,
                         LLVM_NODE_TYPES.lshr, LLVM_NODE_TYPES.udiv]:
            self.state = CreateTypeStateMachine.CreateSameIntOrIntVectorOperatorType(num_operand, previous_type)
        elif node_type in [LLVM_NODE_TYPES.fadd, LLVM_NODE_TYPES.fmul, LLVM_NODE_TYPES.fsub, LLVM_NODE_TYPES.fdiv]:
            self.state = CreateTypeStateMachine.CreateSameFpOrFPVectorOperatorType(num_operand, previous_type)
        elif node_type == LLVM_NODE_TYPES.icmp:
            self.state = CreateTypeStateMachine.CreateIcmpOperatorType(num_operand, previous_type)
        elif node_type == LLVM_NODE_TYPES.zext or node_type == LLVM_NODE_TYPES.sext:
            self.state = CreateTypeStateMachine.CreateZextOrSextOperatorType(previous_type)
        elif node_type == LLVM_NODE_TYPES.pointer_of:
            self.state = CreateTypeStateMachine.CreateGenericPointerType()
        elif node_type == LLVM_NODE_TYPES.bitcast:
            self.state = CreateTypeStateMachine.CreateBitcastOperatorType(previous_type)
        elif node_type == LLVM_NODE_TYPES.load or node_type == LLVM_NODE_TYPES.store:
            self.state = CreateTypeStateMachine.CreateLoadOrStoreOperatorType()
        elif node_type == LLVM_NODE_TYPES.ret:
            self.state = CreateTypeStateMachine.CreateGenericTargetType()
        elif node_type == LLVM_NODE_TYPES.getelementptr:
            self.state = CreateTypeStateMachine.CreateGetelementptrOperatorType(num_operand)
        elif node_type == LLVM_NODE_TYPES.insertelement:
            self.state = CreateTypeStateMachine.CreateInsertelementOperatorType(num_operand, previous_type)
        elif node_type == LLVM_NODE_TYPES.shufflevector:
            self.state = CreateTypeStateMachine.CreateShufflevectorOperatorType(num_operand, previous_type)
        elif node_type == LLVM_NODE_TYPES.select:
            self.state = CreateTypeStateMachine.CreateSelectOperatorType(num_operand, previous_type)
        elif node_type == LLVM_NODE_TYPES.alloca:
            self.state = CreateTypeStateMachine.CreateGenericTargetType()
        elif node_type == LLVM_NODE_TYPES.extractelement:
            self.state = CreateTypeStateMachine.CreateExtractelementOperatorType(num_operand, previous_type)
        elif node_type == LLVM_NODE_TYPES.fcmp:
            self.state = CreateTypeStateMachine.CreateFcmpOperatorType(num_operand, previous_type)
        elif node_type == LLVM_NODE_TYPES.sitofp:
            self.state = CreateTypeStateMachine.CreateIntegerOrIntegerVectorType()
        elif node_type in [LLVM_NODE_TYPES.fptosi, LLVM_NODE_TYPES.fptoui]:
            self.state = CreateTypeStateMachine.CreateFpOrFpVectorType()
        elif node_type == LLVM_NODE_TYPES.fpext:
            self.state = CreateTypeStateMachine.CreateFpextOrFptruncType(True, False)
        elif node_type == LLVM_NODE_TYPES.fptrunc:
            self.state = CreateTypeStateMachine.CreateFpextOrFptruncType(False, False)
        elif node_type == LLVM_NODE_TYPES.none_type:
            self.state = CreateTypeStateMachine.CreateFirstInsertvalueOperatorType()

        else:
            raise ValueError("Operand type currently not implemented")

    def start_recreating_type(self, type):
        self.state = CreateTypeStateMachine.RecreateType(type)

    def get_next_number(self, get_number_action):
        return self.state.get_next_number(get_number_action)

    def is_error_state(self):
        return self.state.is_error_state()

    def get_state(self):
        return self.state.get_state()

    class RecreateType(BaseCreateOperatorType):
        def __init__(self, type):
            super().__init__()
            type_list, numbers = TypeCreator.create_type_lists(type)
            self.state = CreateTypeStateMachine.RecreateTypeFromList(type_list, numbers)

    class RecreateTypeFromList(BaseCreateType):
        def __init__(self,  type_list, numbers):
            super().__init__()
            self.type_list, self.numbers = type_list, numbers

        def update(self, node_type, _):
            if self.state not in [CT_Internal_State.error, CT_Internal_State.end]:
                allowed_type = self.type_list[0]
                self.type_list = self.type_list[1:]
                if node_type != allowed_type:
                    self.state = CT_Internal_State.error
                elif len(self.type_list) == 0:
                    self.state = CT_Internal_State.end
                if allowed_type == LLVM_NODE_TYPES.number:
                    self.numbers = self.numbers[1:]
        def verify(self, add_node_action):
            allowed_types = [self.type_list[0]]
            return self.merge_and_mul(add_node_action, allowed_types)

    class CreateIcmpFirstOperatorType(BaseCreateType):
        def __init__(self,):
            super().__init__()


        def update(self, node_type, _):
            if self.state == CT_Internal_State.start:
                if node_type in LLVM_NODE_TYPES.integer_types:
                    self.state = CT_Internal_State.end
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type == LLVM_NODE_TYPES.pointer_of:
                    self.state = CT_Internal_State.generic_start
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if node_type in LLVM_NODE_TYPES.integer_types:
                    self.state = CT_Internal_State.end
                elif node_type == LLVM_NODE_TYPES.pointer_of:
                    self.state = CT_Internal_State.generic_start
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.generic_start:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    pass
                elif node_type == LLVM_NODE_TYPES.struct:
                    self.state = CT_Internal_State.added_struct
                elif node_type == LLVM_NODE_TYPES.vector_of:
                    self.state = CT_Internal_State.added_vector
                elif node_type == LLVM_NODE_TYPES.array_of:
                    self.state = CT_Internal_State.added_array
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_struct:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_array:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.generic_start
                else:
                    self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.start:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.pointer_of]
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                allowed_types = LLVM_NODE_TYPES.integer_types.copy() + [LLVM_NODE_TYPES.pointer_of]
            elif self.state == CT_Internal_State.generic_start:
                allowed_types = [LLVM_NODE_TYPES.pointer_of, LLVM_NODE_TYPES.struct, LLVM_NODE_TYPES.vector_of,
                                 LLVM_NODE_TYPES.array_of] + LLVM_NODE_TYPES.integer_types.copy() +\
                                LLVM_NODE_TYPES.floating_point_types.copy()
            elif self.state == CT_Internal_State.added_struct or self.state == CT_Internal_State.added_array:
                allowed_types = [LLVM_NODE_TYPES.number]
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

    class CreateIcmpOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type = None):
            super().__init__(2, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateIcmpFirstOperatorType()
            else:
                self.state = CreateTypeStateMachine.RecreateType(previous_type)

    class CreateFcmpOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type = None):
            super().__init__(2, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateFpOrFpVectorType()
            else:
                self.state = CreateTypeStateMachine.RecreateType(previous_type)

    class CreateSameIntOrIntVectorOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type = None):
            super().__init__(2, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateIntegerOrIntegerVectorType()
            else:
                self.state = CreateTypeStateMachine.RecreateType(previous_type)

    class CreateSameFpOrFPVectorOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type = None):
            super().__init__(2, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateFpOrFpVectorType()
            else:
                self.state = CreateTypeStateMachine.RecreateType(previous_type)

    class CreateZextOrSextOperatorType(BaseCreateType):
        def __init__(self,target_type):
            super().__init__()
            self.type_list, self.numbers = TypeCreator.create_type_lists(target_type)

        def update(self, node_type, _):
            if self.state not in [CT_Internal_State.error, CT_Internal_State.end]:
                allowed_type = self.type_list[0]
                self.type_list = self.type_list[1:]
                if node_type != allowed_type and not (node_type in LLVM_NODE_TYPES.integer_types and node_type < allowed_type):
                    self.state = CT_Internal_State.error
                elif len(self.type_list) == 0:
                    self.state = CT_Internal_State.end
                if allowed_type == LLVM_NODE_TYPES.number:
                    self.numbers = self.numbers[1:]

        def verify(self, add_node_action):
            allowed_type = self.type_list[0]
            allowed_types = [allowed_type]
            if allowed_type in LLVM_NODE_TYPES.integer_types:
                allowed_types = [x for x in LLVM_NODE_TYPES.integer_types.copy() if x < allowed_type]
            return self.merge_and_mul(add_node_action, allowed_types)

    class RecreateTypeWithPointer(BaseCreateOperatorType):
        def __init__(self, type):
            super().__init__()
            new_type = LLVM_Type(LLVM_NODE_TYPES.pointer_of, -1)
            new_type.parts.append(type)
            new_type.number = 1
            self.state = CreateTypeStateMachine.RecreateType(new_type)

    class CreateGetelementptrOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number):
            super().__init__()
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateGenericPointerType()
            elif op_number > 0:
                self.state = CreateTypeStateMachine.CreateIntegerType()

    class CreateLoadOrStoreOperatorType(BaseCreateOperatorType):
        def __init__(self):
            super().__init__()
            self.state = CreateTypeStateMachine.CreateGenericPointerType()

    class CreateBitcastOperatorType(BaseCreateOperatorType):
        def __init__(self, target_type):
            super().__init__()
            self.target_is_pointer = True if target_type.node_type == LLVM_NODE_TYPES.pointer_of else False
            self.taget_is_vec = True if target_type.node_type == LLVM_NODE_TYPES.vector_of else False
            self.taget_is_vec_of_pointer = True if target_type.node_type == LLVM_NODE_TYPES.vector_of and \
                                                   target_type.parts[0].node_type == LLVM_NODE_TYPES.pointer_of else False
            self.internal_state = CreateTypeStateMachine.CreateGenericTargetType()
            self.target_size = TypeCreator.size_of(target_type)
            self.guaranteed_valid_number = -1
            self.number_returned = False

        def __get_constant_types(self):
            const_types = LLVM_NODE_TYPES.integer_types.copy() + LLVM_NODE_TYPES.floating_point_types.copy()
            shuffle(const_types)
            return const_types

        def update(self, node_type, number):
            if self.state == CT_Internal_State.start:
                if self.target_is_pointer:
                    if node_type == LLVM_NODE_TYPES.pointer_of:
                        self.state = CT_Internal_State.internal_state
                    else:
                        self.state = CT_Internal_State.error
                elif self.taget_is_vec:
                    if node_type == LLVM_NODE_TYPES.vector_of:
                        self.state = CT_Internal_State.added_vector
                    elif node_type == LLVM_NODE_TYPES.pointer_of and self.taget_is_vec_of_pointer:
                        self.state = CT_Internal_State.internal_state
                    elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                        self.state = CT_Internal_State.end
                    else:
                        self.state = CT_Internal_State.error
                else:
                    if node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                        self.state = CT_Internal_State.end
                    elif node_type == LLVM_NODE_TYPES.vector_of:
                        self.state = CT_Internal_State.added_vector
                    else:
                        self.state = CT_Internal_State.end
            elif self.state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.added_number
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_number:
                if self.taget_is_vec_of_pointer:
                    if node_type == LLVM_NODE_TYPES.pointer_of:
                        self.state = CT_Internal_State.internal_state
                    else:
                        self.state = CT_Internal_State.error
                else:
                    if node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                        self.state = CT_Internal_State.end
                    else:
                        self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.internal_state:
                self.internal_state.update(node_type, number)
                if self.internal_state.get_state() in [CT_Internal_State.error, CT_Internal_State.end]:
                    self.state = self.internal_state.get_state()
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.internal_state:
                return self.internal_state.verify(add_node_action)
            elif self.state == CT_Internal_State.start:
                if self.target_is_pointer:
                    allowed_types = [LLVM_NODE_TYPES.pointer_of]
                elif self.taget_is_vec and not self.taget_is_vec_of_pointer:
                    allowed_types = [LLVM_NODE_TYPES.vector_of]
                    for node_type in self.__get_constant_types():
                        if TypeCreator.size_of_node_type(node_type) == self.target_size:
                            allowed_types.append(node_type)
                        if (self.target_size / TypeCreator.size_of_node_type(node_type)).is_integer():
                            self.guaranteed_valid_number = int(self.target_size / TypeCreator.size_of_node_type(node_type))
                            self.number_returned = False
                elif self.taget_is_vec_of_pointer:
                    allowed_types = [LLVM_NODE_TYPES.vector_of]
                    self.guaranteed_valid_number = int(self.target_size / TypeCreator.size_of_node_type(LLVM_NODE_TYPES.pointer_of))
                    self.number_returned = False
                    if TypeCreator.size_of_node_type(LLVM_NODE_TYPES.pointer_of) == self.target_size:
                        allowed_types.append(LLVM_NODE_TYPES.pointer_of)
                else:
                    allowed_types = []
                    for node_type in self.__get_constant_types():
                        if LLVM_NODE_TYPES.vector_of not in allowed_types and (self.target_size / TypeCreator.size_of_node_type(node_type)).is_integer():
                            allowed_types.append(LLVM_NODE_TYPES.vector_of)
                            self.guaranteed_valid_number = int(self.target_size / TypeCreator.size_of_node_type(node_type))
                            self.number_returned = False
                        if TypeCreator.size_of_node_type(node_type) == self.target_size:
                            allowed_types.append(node_type)
            elif self.state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.state == CT_Internal_State.added_number:
                if self.taget_is_vec_of_pointer:
                    allowed_types = [LLVM_NODE_TYPES.pointer_of]
                else:
                    allowed_types = []
                    for node_type in self.__get_constant_types():
                        if self.guaranteed_valid_number * TypeCreator.size_of_node_type(node_type) == self.target_size:
                            allowed_types.append(node_type)
            else:
                allowed_types = []
            return self.merge_and_mul(add_node_action, allowed_types)

        def get_next_number(self, get_number_action):
            if self.guaranteed_valid_number >= 0 and not self.number_returned:
                self.number_returned = True
                return self.guaranteed_valid_number
            return get_number_action

        def get_state(self):
            return self.state

    class CreateInsertelementOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type = None):
            super().__init__(3, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateVectorType()
            elif op_number == 1:
                type_list, numbers = TypeCreator.create_type_lists(previous_type)
                type_list = type_list[2:]
                numbers = numbers[1:]
                self.state = CreateTypeStateMachine.RecreateTypeFromList(type_list, numbers)
            else:
                self.state = CreateTypeStateMachine.CreateIntegerType()

    class CreateShufflevectorOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type = None):
            super().__init__(3, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateVectorType()
            elif op_number ==1:
                self.state = CreateTypeStateMachine.RecreateType(previous_type)
            elif op_number == 2:
                type_list, numbers = TypeCreator.create_type_lists(previous_type)
                type_list = type_list[:2] + [LLVM_NODE_TYPES.i32]
                numbers = numbers[:1]
                self.state = CreateTypeStateMachine.RecreateTypeFromList(type_list, numbers)

    class CreateSelectOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type=None):
            super().__init__(3, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateSelectTargetType()
            elif op_number == 1:
                self.target_is_vector = True if previous_type.node_type == LLVM_NODE_TYPES.vector_of else False
                self.vector_size = -1 if not self.target_is_vector else previous_type.number
                self.internal_state = CT_Internal_State.start if self.target_is_vector else CT_Internal_State.internal_state
                self.state = CreateTypeStateMachine.CreateGenericTargetType()
            else:
                self.state = CreateTypeStateMachine.RecreateType(previous_type)

        def update(self, node_type, number):
            if self.op_number != 1:
                self.state.update(node_type, number)
                return

            if self.internal_state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.vector_of:
                    self.internal_state = CT_Internal_State.added_vector
                else:
                    self.internal_state = CT_Internal_State.error
            elif self.internal_state == CT_Internal_State.added_vector:
                if node_type == LLVM_NODE_TYPES.number:
                    self.internal_state = CT_Internal_State.added_number
                else:
                    self.internal_state = CT_Internal_State.error
            elif self.internal_state == CT_Internal_State.added_number:
                if node_type == LLVM_NODE_TYPES.pointer_of:
                    self.internal_state = CT_Internal_State.internal_state
                elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
                    self.internal_state = CT_Internal_State.end
                else:
                    self.internal_state = CT_Internal_State.error
            elif self.internal_state == CT_Internal_State.internal_state:
                self.state.update(node_type, number)
                if self.state.get_state() in [CT_Internal_State.end, CT_Internal_State.error]:
                    self.internal_state = self.state.get_state()
            else:
                self.internal_state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.op_number != 1 or self.internal_state == CT_Internal_State.internal_state:
                return self.state.verify(add_node_action)

            if self.internal_state == CT_Internal_State.start:
                allowed_types = [LLVM_NODE_TYPES.vector_of]
            elif self.internal_state == CT_Internal_State.added_vector:
                allowed_types = [LLVM_NODE_TYPES.number]
            elif self.internal_state == CT_Internal_State.added_number:
                allowed_types = [LLVM_NODE_TYPES.pointer_of] + LLVM_NODE_TYPES.integer_types.copy() + LLVM_NODE_TYPES.floating_point_types.copy()
            else:
                allowed_types = []

            return self.merge_and_mul(add_node_action, allowed_types)

        def get_state(self):
            if self.op_number != 1:
                return self.state.get_state()
            return self.internal_state

        def get_next_number(self, get_number_action):
            if self.op_number != 1:
                return self.state.get_next_number(get_number_action)

            if self.vector_size != -1:
                result = self.vector_size
                self.vector_size = -1
                return result
            return get_number_action

    class CreateExtractelementOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type=None):
            super().__init__(2, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateVectorType()
            else:
                self.state = CreateTypeStateMachine.CreateIntegerType()

    class CreateFirstInsertvalueOperatorType(BaseCreateType):
        def __init__(self):
            super().__init__()
            self.internal_state = CreateTypeStateMachine.CreateStruct()

        def update(self, node_type, number):
            if self.state == CT_Internal_State.start:
                if node_type == LLVM_NODE_TYPES.struct:
                    self.state = CT_Internal_State.added_struct
                elif node_type == LLVM_NODE_TYPES.struct_of:
                    self.state = CT_Internal_State.internal_state
                    self.internal_state.update(LLVM_NODE_TYPES.struct_of, number)
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.added_struct:
                if node_type == LLVM_NODE_TYPES.number:
                    self.state = CT_Internal_State.end
                else:
                    self.state = CT_Internal_State.error
            elif self.state == CT_Internal_State.internal_state:
                self.internal_state.update(node_type, number)
                if self.internal_state.get_state() in [CT_Internal_State.end, CT_Internal_State.error]:
                    self.state = self.internal_state.get_state()
            else:
                self.state = CT_Internal_State.error

        def verify(self, add_node_action):
            if self.state == CT_Internal_State.internal_state:
                return self.internal_state.verify(add_node_action)

            if self.state == CT_Internal_State.start:
                allowed_types = [LLVM_NODE_TYPES.struct_of, LLVM_NODE_TYPES.struct]
            elif self.state == CT_Internal_State.added_struct:
                allowed_types = [LLVM_NODE_TYPES.number]
            else:
                allowed_types = []
            return self.merge_and_mul(add_node_action, allowed_types)


    class CreateInsertvalueOperatorType(BaseCreateOperatorType):
        def __init__(self, op_number, previous_type=None):
            super().__init__(3, op_number, previous_type)
            if op_number == 0:
                self.state = CreateTypeStateMachine.CreateFirstInsertvalueOperatorType()


class CalledFunction():
    def __init__(self, id, name, type, signature):
        self.id = id
        self.name = name
        self.type = type
        self.signature = signature


class GraphActionizer():

    def __init__(self, include_deterministic_actions = False, debug = False):
        self.actions = {}
        self.last_added_node_id = 0
        self.last_added_node_type = 0
        self.is_first_instruction = True
        self.active_instruction_node_id = 0
        self.active_instruction_node_type = 0
        self.node_dict = {}
        self.node_type_dict = {}
        self.struct_dict = {}
        self.function_dict = {}
        self.struct_name_dict = {}
        self.instruction_dict = {}
        self.highest_node_id = 0
        self.node_id_stack = []
        self.node_type_stack = []
        self.first_occurrence_of_ret = True
        self.cfg_edge_dict = None
        self.include_deterministic_instructions = include_deterministic_actions
        self.switch_dict = {}
        self.debug = debug
        self.internal_llvm_graph = LLVM_Graph()
        self.active_llvm_container = LLVM_Container(self.internal_llvm_graph)
        self.internal_llvm_graph.globals_and_structs = self.active_llvm_container
        self.call_dict = LLVM_NODE_TYPES.get_call_data(map_by_name=True)
        self.current_function_start_node = None
        self.constant_expression_classes = [CastExpression, SelectExpression,
                                       IcmpExpression, GetElementPtrExpression]
        self.num_structs = 0
        self.br_actions = {}

    def string_to_double(self, double_string):
        if double_string.startswith("0x"):
            double_string = double_string[2:]
            binary_string = bin(int(double_string, 16))[2:]
            bf = decode('%%0%dx' % (8 << 1) % int(binary_string, 2), 'hex')[-8:]
            double = struct.unpack('>d', bf)[0]
        elif "e" in double_string:
            split = double_string.split("e")
            num_places = int(split[1])
            old_dot_index = double_string.index(".")
            dot_index = old_dot_index + num_places
            if dot_index < 1:
                new_symbols = abs(dot_index - 1)
                for i in range(new_symbols):
                    split[0] = "0" + split[0]
                    dot_index += 1
            elif dot_index >= len(split[0]):
                new_symbols = (dot_index - len(split[0])) + 2
                for i in range(new_symbols):
                    split[0] += "0"

            old_dot_index = split[0].index(".")
            split[0] = split[0][:old_dot_index] + split[0][old_dot_index+1:]
            split[0] = split[0][:dot_index] + "." + split[0][dot_index:]



            double = float(split[0])
        else:
            double = float(double_string)
        return double

    def append_active_node(self, node_type):
        if self.is_first_instruction:
            self.is_first_instruction = False
        else:
            self.last_added_node_id = self.highest_node_id + 1
            self.highest_node_id += 1
        self.last_added_node_type = node_type
        self.node_id_stack.append(self.last_added_node_id)
        self.node_type_stack.append(node_type)
        self.node_type_dict[self.last_added_node_id] = node_type

    def get_new_node_id(self):
        if self.is_first_instruction:
            return self.highest_node_id
        return self.highest_node_id + 1

    def get_previous_node_id(self):
        index = self.node_id_stack.index(self.last_added_node_id) + -1
        return self.node_id_stack[index]

    def set_active_node(self, node_id, node_type = None):
        if len(self.node_type_stack) == 0:
            return
        if node_id in self.node_id_stack:
            index = self.node_id_stack.index(node_id) + 1
            self.node_id_stack = self.node_id_stack[:index]
            self.node_type_stack = self.node_type_stack[:index]
            self.last_added_node_id = self.node_id_stack[len(self.node_id_stack) - 1]
            self.last_added_node_type = self.node_type_stack[len(self.node_type_stack) - 1]
        else:
            if node_type is None:
                node_type = self.node_type_dict[node_id]
            self.node_id_stack.append(node_id)
            self.node_type_stack.append(node_type)
            self.last_added_node_id = node_id
            self.last_added_node_type = node_type

    def get_node_id_of_struct_base_node(self, struct_number):
        return self.struct_dict[struct_number]

    def get_regular_cfg_edge(self, instruction):
        opcode = LLVM_NODE_TYPES.parse_opcode(instruction.opcode)
        if opcode in LLVM_NODE_TYPES.terminator_opcodes:
            return None
        for edge in instruction.edges:
            if edge.type == 'cfg':
                return edge
        raise ValueError("No cfg edge found")

    def get_operand_from_edges(self, instruction, index):
        curr_index = 0
        for edge in instruction.edges:
            if edge.type == "dataflow":
                if curr_index == index:
                    return edge.src
                else:
                    curr_index += 1

    def opcode_needs_explicit_type(self, opcode):
        return opcode in LLVM_NODE_TYPES.opcodes_with_explicit_types

    def get_active_node_string(self):
        return "[active node-id: " + str(self.last_added_node_id) + ", type: " + str(self.last_added_node_type) + "]"

    def create_cfg_edge_dict(self, code_graph):
        cfg_edge_dict = dict()

        for function in code_graph.functions:
            for basic_block in function.basic_blocks:
                for instruction in basic_block.instructions:
                    cfg_index = 0
                    for edge in instruction.edges:
                        if edge.type == 'cfg':
                            dest_id = id(edge.dest)
                            if not dest_id in cfg_edge_dict:
                                cfg_edge_dict[dest_id] = list()
                            if LLVM_NODE_TYPES.parse_opcode(edge.src.opcode) == LLVM_NODE_TYPES.br:
                                cfg_edge_dict[dest_id].append([id(edge.src), LLVM_NODE_TYPES.br, cfg_index])
                            elif LLVM_NODE_TYPES.parse_opcode(edge.src.opcode) == LLVM_NODE_TYPES.switch:
                                cfg_edge_dict[dest_id].append([id(edge.src), LLVM_NODE_TYPES.switch])
                            else:
                                cfg_edge_dict[dest_id].append([id(edge.src), LLVM_NODE_TYPES.none_type])
                            cfg_index += 1
        return cfg_edge_dict

    def find_existing_cfg_edges(self, instruction, is_first_instr):
        result = []
        if is_first_instr:
            return [(self.current_function_start_node, LLVM_EDGE_TYPES.cfg, False)]
        all_cfg_sources = self.cfg_edge_dict[id(instruction)]
        highest_node_id = -1
        edge_type = -1
        is_switch_instr = False
        for src_list in all_cfg_sources:
            src_id = src_list[0]
            if src_id in self.node_dict:
                opcode = src_list[1]
                if opcode == LLVM_NODE_TYPES.switch:
                    edge_type = LLVM_EDGE_TYPES.cfg
                    is_switch_instr = True
                elif opcode == LLVM_NODE_TYPES.br:
                    is_switch_instr = False
                    if src_list[2] == 0:
                        edge_type = LLVM_EDGE_TYPES.cfg
                    else:
                        edge_type = LLVM_EDGE_TYPES.cfg_1
                else:
                    is_switch_instr = False
                    edge_type = LLVM_EDGE_TYPES.cfg
                result.append((self.node_dict[src_id], edge_type, is_switch_instr))
        return result

    def find_phi_operands(self, phi_instruction, existing_label = None):
        operands = []
        labels = []
        skip = False
        for edge in phi_instruction.edges:
            if not edge.type in ['dataflow', 'operand']:
                continue
            if skip:
                skip = False
                continue
            edge_index = phi_instruction.edges.index(edge)
            if isinstance(edge.src, ConstantValue):
                operands.append(edge.src)
            else:
                operands.append(id(edge.src))
            label = phi_instruction.edges[edge_index + 1].src
            labels.append(id(label))
            skip = True

        lowest_label_id = 0
        lowest_label = sys.maxsize
        result_operands, result_labels = [], []
        for label in labels:
            if label in self.node_dict:
                if existing_label == None and self.node_dict[label] < lowest_label:
                    lowest_label = self.node_dict[label]
                    lowest_label_id = label
                elif existing_label != None:
                    result_label = self.node_dict[label]
                    if existing_label != result_label:
                        operand = operands[labels.index(label)]
                        if not isinstance(operand, ConstantValue):
                            operand = self.node_dict[operand]
                        result_labels.append(result_label)
                        result_operands.append(operand)
        if existing_label != None:
            sorted_labels = result_labels.copy()
            sorted_labels.sort(reverse=True)
            sorted_operands = [result_operands[result_labels.index(x)] for x in sorted_labels]
            return sorted_operands, sorted_labels

        operand = operands[labels.index(lowest_label_id)]
        if not isinstance(operand, ConstantValue):
            operand = self.node_dict[operand]
        return operand, lowest_label

    def find_switch_operand(self, switch_instruction):
        for edge in switch_instruction.edges:
            if edge.type in ['dataflow', 'operand']:
                if isinstance(edge.src, ConstantValue):
                    return edge.src
                return self.node_dict[id(edge.src)]

    def actionize(self, code_graph):
        LLVM_Node.reset_id()

        self.cfg_edge_dict = self.create_cfg_edge_dict(code_graph)

        for struct in code_graph.structs:
            self.create_add_struct_action(1)
            self.struct_name_dict.update({struct.name: struct.id})
            self.struct_dict.update({struct.id: self.get_new_node_id()})
            type_string = "type { "
            if struct.types is None or len(struct.types) == 0:
                type_string = "type opaque"
            else:
                for partial_type_string in struct.types:
                    type_string += partial_type_string + ", "
                if len(struct.types) > 0:
                    type_string = type_string[:-2]
                type_string += " }"
            struct_type = TypeCreator.string_to_type(type_string, self.struct_name_dict)
            self.construct_type(struct_type, is_type_declaration=True)
        self.create_add_struct_action(0)
        for global_variable in code_graph.global_variables:
            self.create_add_global_action(1)
            self.create_add_node_action(LLVM_NODE_TYPES.global_var, is_deterministic=True)
            self.create_init_node_action(LLVM_NODE_TYPES.global_var)
            self.node_dict[id(global_variable)] = self.last_added_node_id
            self.construct_constant_value(global_variable)
            #self.create_edge_actions(end_node=base_node, type_id=LLVM_EDGE_TYPES.op_0, is_deterministic=True)
        self.create_add_global_action(0)
        for function in code_graph.functions:
            if function.is_declaration:
                continue
            unfinished_instructions = list()
            pending_cfg_edges = {}
            self.create_add_function_action()
            self.create_add_node_action(LLVM_NODE_TYPES.function, is_deterministic=True)
            self.active_instruction_node_id = self.last_added_node_id
            self.create_init_node_action(LLVM_NODE_TYPES.function)
            self.function_dict.update({function.name: self.last_added_node_id})
            self.current_function_start_node = self.last_added_node_id
            is_first_instruction = True
            for key in function.args:
                argument = function.args[key]
                self.create_add_instruction_node_action(argument)
                self.create_init_node_action(LLVM_NODE_TYPES.argument)
                type = TypeCreator.string_to_type(argument.llvm_type, self.struct_name_dict)
                self.construct_type(type)
                self.set_active_node(self.active_instruction_node_id)
            for basic_block in function.basic_blocks:
                for instruction in basic_block.instructions:
                    self.set_active_node(self.active_instruction_node_id)
                    opcode = LLVM_NODE_TYPES.parse_opcode(instruction.opcode)
                    # create the new instruction node and initialize it
                    action_label = self.create_add_instruction_node_action(instruction)
                    self.create_init_node_action(action_label)

                    cfg_list = self.find_existing_cfg_edges(instruction, instruction == function.basic_blocks[0].instructions[0])
                    for cfg_source, edge_type, is_switch_instr in cfg_list:
                        if cfg_source == self.current_function_start_node:
                            self.create_add_edge_to_action(end_node=cfg_source, type_id=edge_type, is_deterministic=True, reverse_edge=True)
                        elif is_switch_instr and id(instruction) in self.switch_dict[self.instruction_dict[cfg_source]][0]:
                            switch_instr_id = self.instruction_dict[cfg_source]
                            switch_has_default_op = self.switch_dict[switch_instr_id][2]
                            switch_operand = self.switch_dict[switch_instr_id][0][id(instruction)].pop(0)
                            switch_node = self.switch_dict[switch_instr_id][1]
                            self.construct_switch_operand(switch_instr_id, switch_operand, switch_has_default_op)
                            self.set_active_node(self.active_instruction_node_id)
                        else:
                            self.create_add_edge_action(1)
                            self.create_add_edge_to_action(end_node=cfg_source, type_id=edge_type, reverse_edge=True)
                            if cfg_source in self.br_actions and self.br_actions[cfg_source]:
                                self.create_choose_br_edge_action(edge_type == LLVM_EDGE_TYPES.cfg_1)
                                self.br_actions[cfg_source] = False
                            if is_switch_instr:
                                self.create_add_operand_action(True)
                                self.switch_dict[self.instruction_dict[cfg_source]][2] = True


                    if is_first_instruction:
                        is_first_instruction = False
                    else:
                        self.create_add_edge_action(0)

                    if opcode == LLVM_NODE_TYPES.call:
                        skipped_call = False
                        operand_index, edge_index = 0, 0
                        for operand in instruction.operands:
                            if isinstance(operand, LiteralValue) and not skipped_call:
                                self.choose_add_operand_action(opcode, edge_index, True)
                                skipped_call = True
                                function_name = operand.value
                                self.create_is_operand_static_action(not function_name in self.function_dict)
                                if function_name in self.function_dict:
                                    function_node = self.function_dict[function_name]
                                    self.create_choose_local_function(function_node)
                                    self.create_edge_actions(end_node=function_node, type_id=LLVM_EDGE_TYPES.op_0, is_global_edge=True, is_deterministic=True)
                                else:
                                    function_name = operand.value
                                    label = self.create_choose_function_action(function_name)
                                    self.create_add_node_action(LLVM_NODE_TYPES.function, is_deterministic=True, node_label=label)
                                    self.create_init_node_action(LLVM_NODE_TYPES.function, label)
                                    self.create_edge_actions(end_node=self.active_instruction_node_id, type_id=LLVM_EDGE_TYPES.op_0_backwards, is_deterministic=True)
                                    self.set_active_node(self.active_instruction_node_id)
                            else:

                                operand_index, edge_index = self.handle_operand(instruction, operand, operand_index, edge_index, construct_type_deterministically=True, handle_variable_op_opcode=True)
                        self.choose_add_operand_action(opcode, edge_index, False)
                    # if the opcode cannot have operands that may not exist in the graph yet
                    elif opcode not in [LLVM_NODE_TYPES.phi, LLVM_NODE_TYPES.br, LLVM_NODE_TYPES.switch]:
                        is_variable_op_opcode = opcode == LLVM_NODE_TYPES.getelementptr
                        operand_index, edge_index = 0, 0
                        for operand in instruction.operands:
                            operand_index, edge_index = self.handle_operand(instruction, operand, operand_index, edge_index, handle_variable_op_opcode=is_variable_op_opcode)
                        self.choose_add_operand_action(opcode, edge_index, False)
                        if is_variable_op_opcode:
                            self.set_active_node(self.active_instruction_node_id)
                    elif opcode == LLVM_NODE_TYPES.phi:
                        phi_node = self.active_instruction_node_id
                        operand, label = self.find_phi_operands(instruction)

                        self.create_add_node_action(LLVM_NODE_TYPES.operand, is_deterministic=True)
                        self.create_init_node_action(LLVM_NODE_TYPES.operand)
                        self.create_edge_actions(end_node=phi_node, type_id=LLVM_EDGE_TYPES.op_multi,
                                                 is_deterministic=True, reverse_edge=True)
                        operand_node_id = self.last_added_node_id
                        self.create_edge_actions(end_node=label, type_id=LLVM_EDGE_TYPES.op_0)
                        is_static = isinstance(operand, ConstantValue)
                        self.create_is_operand_static_action(is_static)
                        if is_static:
                            self.construct_constant_value(operand, edge_type=LLVM_EDGE_TYPES.op_1)
                            #self.create_edge_actions(end_node=operand, type_id=LLVM_EDGE_TYPES.op_1, is_deterministic=True)
                        else:
                            self.create_edge_actions(end_node=operand, type_id=LLVM_EDGE_TYPES.op_1)
                        unfinished_instructions.append([instruction, label, operand_node_id])

                    elif opcode == LLVM_NODE_TYPES.br:
                        if len(instruction.operands) not in [2,4]:
                            raise ValueError("incorrect number of 'br' operands")

                        is_conditional_br = len(instruction.operands) == 4
                        self.br_actions[self.active_instruction_node_id] = is_conditional_br
                        br_node_id = self.last_added_node_id
                        edge_type = LLVM_EDGE_TYPES.cfg_1 if is_conditional_br else LLVM_EDGE_TYPES.cfg
                        cfg_targets = [(id(instruction.edges[len(instruction.edges) - 1].src), edge_type)]
                        if not is_conditional_br:
                            self.choose_add_operand_action(opcode, 0, is_conditional_br)
                        else:
                            self.handle_operand(instruction, instruction.operands[1], 0, 0)
                            cfg_targets = [(id(instruction.edges[len(instruction.edges) - 2].src), LLVM_EDGE_TYPES.cfg)] + cfg_targets

                        already_existing_cfg_sources = 0
                        for cfg_target, edge_type in cfg_targets:
                            if cfg_target in self.node_dict:
                                already_existing_cfg_sources += 1
                                cfg_targets[cfg_targets.index((cfg_target, edge_type))] = (None, None)
                                node_id = self.node_dict[cfg_target]
                                self.create_add_edge_action(1)
                                self.create_add_edge_to_action(node_id, edge_type)
                                if self.br_actions[self.active_instruction_node_id]:
                                    self.create_choose_br_edge_action(edge_type == LLVM_EDGE_TYPES.cfg_1)
                                    self.br_actions[self.active_instruction_node_id] = False

                        if already_existing_cfg_sources == 0 or (already_existing_cfg_sources == 1 and is_conditional_br):
                            self.create_add_edge_action(0)
                        for cfg_target, edge_type in cfg_targets:
                            if cfg_target is not None:
                                if cfg_target not in pending_cfg_edges:
                                    pending_cfg_edges.update({cfg_target: [(br_node_id, edge_type)]})
                                else:
                                    pending_cfg_edges[cfg_target].append((br_node_id, edge_type))


                    elif opcode == LLVM_NODE_TYPES.switch:
                        self.choose_add_operand_action(opcode, 0, True)
                        operand = self.find_switch_operand(instruction)
                        operand_static = isinstance(operand, ConstantValue)
                        self.create_is_operand_static_action(operand_static)
                        if operand_static:
                            self.construct_constant_value(operand)
                            #self.create_edge_actions(end_node=base_node, type_id=LLVM_EDGE_TYPES.op_0, is_deterministic=True)
                        else:
                            self.create_edge_actions(end_node=operand, type_id=LLVM_EDGE_TYPES.op_0)
                        switch_operand_dict = {}
                        for edge in instruction.edges:
                            edge_type = edge.type
                            if edge_type != 'operand':
                                continue
                            operand = edge.src
                            label = instruction.edges[instruction.edges.index(edge) + 1].src
                            if id(label) not in switch_operand_dict:
                                switch_operand_dict.update({id(label) : []})
                            switch_operand_dict[id(label)].append(operand)
                        self.switch_dict.update({id(instruction) : [switch_operand_dict, self.active_instruction_node_id, False]})
                    if self.opcode_needs_explicit_type(opcode):
                        type_string = instruction.operands[0].value
                        type = TypeCreator.string_to_type(type_string, self.struct_name_dict)
                        self.construct_type(type)
            self.create_add_instruction_node_action()

            #unfinished_instructions.reverse()
            for instruction_list in unfinished_instructions:
                instruction = instruction_list[0]
                opcode = LLVM_NODE_TYPES.parse_opcode(instruction.opcode)
                if opcode == LLVM_NODE_TYPES.phi:
                    phi_node = self.node_dict[id(instruction)]
                    operands, labels = self.find_phi_operands(instruction, instruction_list[1])
                    last_operand_node = instruction_list[2]
                    for i in range(0, len(operands)):
                        self.set_active_node(last_operand_node)
                        self.choose_add_operand_action(LLVM_NODE_TYPES.phi, i + 1, True)
                        operand, label = operands[i], labels[i]
                        self.create_add_node_action(LLVM_NODE_TYPES.operand, is_deterministic=True)
                        self.create_init_node_action(LLVM_NODE_TYPES.operand)
                        self.create_edge_actions(end_node=last_operand_node,
                                                 type_id=LLVM_EDGE_TYPES.op_multi, is_deterministic=True, reverse_edge=True)
                        last_operand_node = self.last_added_node_id
                        self.create_edge_actions(end_node=label, type_id=LLVM_EDGE_TYPES.op_0)
                        is_static = isinstance(operand, ConstantValue)
                        self.create_is_operand_static_action(is_static)
                        if is_static:
                            self.construct_constant_value(operand, edge_type=LLVM_EDGE_TYPES.op_1)
                            #self.create_edge_actions(end_node=operand, type_id=LLVM_EDGE_TYPES.op_1,
                            #                         is_deterministic=True)
                        else:
                            self.create_edge_actions(end_node=operand, type_id=LLVM_EDGE_TYPES.op_1)
                    self.choose_add_operand_action(LLVM_NODE_TYPES.phi, len(operands), False)
                    self.set_active_node(phi_node)

            self.set_active_node(self.active_instruction_node_id)

        self.create_add_function_action(0)
        if self.debug:
            print("Number of actions: " + str(len(self.actions)))

    def construct_switch_operand(self, switch_instr_id, constant_operand, switch_has_default_op):
        current_node_id = self.last_added_node_id
        switch_node = self.node_dict[switch_instr_id]
        operand_node = self.switch_dict[switch_instr_id][1]
        self.create_add_edge_action(1)
        self.create_add_edge_to_action(end_node=switch_node, type_id=LLVM_EDGE_TYPES.cfg, is_pseudo_edge=True)
        if not switch_has_default_op:
            self.create_add_operand_action()
        self.create_add_node_action(LLVM_NODE_TYPES.operand, is_deterministic=True)
        self.create_init_node_action(LLVM_NODE_TYPES.operand)
        self.create_add_edge_to_action(end_node=operand_node, type_id=LLVM_EDGE_TYPES.cfg, is_deterministic=True, reverse_edge=True)
        self.switch_dict[switch_instr_id][1] = self.last_added_node_id
        self.construct_constant_value(constant_operand)
        #self.create_edge_actions(end_node=base_node, type_id=LLVM_EDGE_TYPES.op_0, is_deterministic=True)
        self.create_add_edge_to_action(end_node=current_node_id, type_id=LLVM_EDGE_TYPES.cfg, is_deterministic=True)

    def handle_operand(self, instruction, operand, operand_index, edge_index, construct_type_deterministically = False, handle_variable_op_opcode=False):
        current_node_id, current_node_type = self.last_added_node_id, self.last_added_node_type
        # not real operands
        if operand and (isinstance(operand, TypeValue) or
                        isinstance(operand, AttributeValue)):
            return operand_index, edge_index
        opcode = LLVM_NODE_TYPES.parse_opcode(instruction.opcode)
        self.choose_add_operand_action(opcode, operand_index, True)
        if handle_variable_op_opcode:
            edge_type = LLVM_EDGE_TYPES.op_multi
            last_operand_node = self.last_added_node_id
            self.create_add_node_action(LLVM_NODE_TYPES.operand, is_deterministic=True)
            self.create_init_node_action(LLVM_NODE_TYPES.operand)
            operand_index = 0
            operand_node_id, operand_node_type = self.last_added_node_id, self.last_added_node_type
            #TODO backwards
            self.create_edge_actions(end_node=last_operand_node, type_id=LLVM_EDGE_TYPES.op_multi_backwards, is_deterministic=True)
        self.create_is_operand_static_action(operand)
        if not operand_index in range(0, 4):
            raise ValueError("operand index out of range")
        edge_type = get_class_value(LLVM_EDGE_TYPES, "op_" + str(operand_index))
        if not operand:
            operand = self.get_operand_from_edges(instruction, edge_index)
            is_global_edge = isinstance(operand, GlobalVariable)
            node_id = self.node_dict[id(operand)]
            self.create_edge_actions(end_node=node_id, type_id=edge_type, is_global_edge=is_global_edge)
            edge_index += 1
        else:
            self.construct_constant_value(operand, edge_type=edge_type, construct_type_deterministically=construct_type_deterministically, reset_active_node=True)
            if handle_variable_op_opcode:
                self.set_active_node(operand_node_id, operand_node_type)
            #self.create_edge_actions(end_node=base_node, type_id=edge_type, is_deterministic=True)
        if not handle_variable_op_opcode:
            self.set_active_node(current_node_id, current_node_type)
        return operand_index + 1, edge_index

    def choose_add_operand_action(self, opcode, index, operands_left):
        create_action = True
        num_operands = LLVM_NODE_TYPES.get_num_ops(opcode)
        if num_operands >= 0 or opcode == LLVM_NODE_TYPES.call:
            create_action = False
        if opcode == LLVM_NODE_TYPES.getelementptr:
            if index == 0:
                create_action = False
        elif opcode == LLVM_NODE_TYPES.switch:
            if index < 2 or index % 2 == 1:
                create_action = False
        elif opcode == LLVM_NODE_TYPES.br:
            if index != 0:
                create_action = False
        elif opcode == LLVM_NODE_TYPES.ret:
            if self.first_occurrence_of_ret:
                self.first_occurrence_of_ret = False
            else:
                create_action = False

        if create_action:
            self.create_add_operand_action(not operands_left)
        elif self.debug:
            print("\tAdd operand: " + ("yes" if operands_left else "no") + " [Non-ML] " + self.get_active_node_string())

    def get_number_label(self, node_type, value):
        if node_type in LLVM_NODE_TYPES.integer_types:
            value = int(value)
        if node_type in LLVM_NODE_TYPES.floating_point_types:
            value = float(value)

        return value

    def construct_constant_value(self, constant_value, edge_type = LLVM_EDGE_TYPES.op_0, is_deterministic = False, reset_active_node = True,
                                 construct_type_deterministically = False, construct_type = True):
        current_node_id, current_node_type = self.last_added_node_id, self.last_added_node_type
        if isinstance(constant_value, str):
            if (constant_value + "_predicate") in LLVM_NODE_TYPES.__dict__:
                node_type = LLVM_NODE_TYPES.get_node_type(constant_value + "_predicate")
            elif constant_value in ["undef", "zeroinitializer", "null"]:
                node_type = LLVM_NODE_TYPES.get_node_type(constant_value)
            else:
                raise ValueError("Not implemented yet")
            self.create_add_node_action(node_type, is_deterministic=is_deterministic, is_type_node=False)
            self.create_init_node_action(node_type)
            self.active_llvm_container.add_edge(current_node_id, edge_type, self.last_added_node_id)
            base_node = self.last_added_node_id
            if reset_active_node:
                self.set_active_node(current_node_id, current_node_type)
            return base_node
        type_string = constant_value.llvm_type
        if isinstance(constant_value, GlobalVariable):
            type_string = type_string[:-1]
        type = TypeCreator.string_to_type(type_string, self.struct_name_dict)
        primary_type = type.node_type
        debug_prim_type = LLVM_NODE_TYPES.get_name(primary_type)
        if constant_value.__class__ in self.constant_expression_classes:
            expression_type = TypeCreator.string_to_type(constant_value.llvm_type)
            opcode = LLVM_NODE_TYPES.get_node_type(constant_value.opcode)
            self.create_add_node_action(opcode, is_deterministic=is_deterministic, is_type_node=False)
            self.create_init_node_action(opcode)
            self.active_llvm_container.add_edge(current_node_id, edge_type, self.last_added_node_id)
            base_node = self.last_added_node_id
            if isinstance(constant_value, CastExpression):
                self.handle_operand(constant_value, constant_value.value, 0, 0)
                if construct_type:
                    self.construct_type(expression_type)
            elif isinstance(constant_value, GetElementPtrExpression):
                operand_index, edge_index = 0, 0
                for operand in constant_value.operands:
                    operand_index, edge_index = self.handle_operand(constant_value, operand, operand_index, edge_index,
                                                handle_variable_op_opcode=True)
                self.choose_add_operand_action(opcode, operand_index, False)
            elif isinstance(constant_value, (SelectExpression, IcmpExpression)):
                operand_index, edge_index = self.handle_operand(constant_value, constant_value.cond, 0, 0)
                for operand in constant_value.operands:
                    operand_index, edge_index = self.handle_operand(constant_value, operand, operand_index, edge_index)
                self.choose_add_operand_action(opcode, operand_index, False)
            if reset_active_node:
                self.set_active_node(current_node_id, current_node_type)
            return base_node

        elif primary_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types or "predicate" in type_string:
            value = constant_value.value
            if isinstance(constant_value, GlobalVariable):
                if value.__class__ in self.constant_expression_classes:
                    base_node = self.construct_constant_value(value, edge_type=edge_type, is_deterministic=is_deterministic)
                    if reset_active_node:
                        self.set_active_node(current_node_id, current_node_type)
                    return base_node
                value = constant_value.value.value
            if value in ["undef", "zeroinitializer", "null"]:
                base_node = self.construct_constant_value(value, edge_type=edge_type, reset_active_node=False, is_deterministic=is_deterministic)
                if construct_type:
                    self.construct_type(TypeCreator.string_to_type(type_string, self.struct_name_dict), is_deterministic=construct_type_deterministically)
                if reset_active_node:
                    self.set_active_node(current_node_id, current_node_type)
            elif primary_type in LLVM_NODE_TYPES.integer_types:
                self.create_add_node_action(primary_type, is_deterministic=is_deterministic, is_type_node=False, is_pseudo_node=True)
                number_label = self.get_number_label(primary_type, value)
                self.create_choose_number_action(number_label)
                self.active_llvm_container.add_node(primary_type, number_label)
                self.append_active_node(primary_type)
                self.create_init_node_action(primary_type, number_label)
                self.active_llvm_container.add_edge(current_node_id, edge_type, self.last_added_node_id)
                base_node = self.last_added_node_id
            elif primary_type in LLVM_NODE_TYPES.floating_point_types:
                #TODO order of operations (test with current kernel)
                self.create_add_node_action(primary_type, is_deterministic=is_deterministic, is_type_node=False, is_pseudo_node=True)
                value = self.string_to_double(value)
                number_label = self.get_number_label(primary_type, value)
                self.create_choose_number_action(number_label)
                self.active_llvm_container.add_node(primary_type, number_label)
                self.append_active_node(primary_type)
                self.create_init_node_action(primary_type, number_label)
                self.active_llvm_container.add_edge(current_node_id, edge_type, self.last_added_node_id)
                base_node = self.last_added_node_id
            else:
                self.create_add_node_action(primary_type, is_deterministic=is_deterministic, is_type_node=False)
                self.create_init_node_action(primary_type)
                self.active_llvm_container.add_edge(current_node_id, edge_type, self.last_added_node_id)
                base_node = self.last_added_node_id
            if reset_active_node:
                self.set_active_node(current_node_id, current_node_type)
            return base_node
        elif primary_type in [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.array_of] :
            base_node = self.construct_list_value(constant_value, edge_type, type, is_deterministic=(is_deterministic or construct_type_deterministically))
            if reset_active_node:
                self.set_active_node(current_node_id, current_node_type)
            return base_node
        elif primary_type in [LLVM_NODE_TYPES.pointer_of, LLVM_NODE_TYPES.struct_of, LLVM_NODE_TYPES.struct]:
            value = constant_value.value
            if isinstance(constant_value, GlobalVariable):
                if value.__class__ in self.constant_expression_classes:
                    base_node = self.construct_constant_value(value, edge_type=edge_type)
                    if reset_active_node:
                        self.set_active_node(current_node_id, current_node_type)
                    return base_node
                value = constant_value.value.value
            if value not in ["undef", "null", "zeroinitializer"]:
                raise ValueError("Complex static struct/pointer found")
            base_node = self.construct_constant_value(value, edge_type=edge_type, is_deterministic=is_deterministic, reset_active_node=False)
            #self.create_edge_actions(end_node=base_node, type_id=LLVM_EDGE_TYPES.op_0_backwards,
            #                         is_deterministic=True)
            if construct_type:
                self.construct_type(type, is_deterministic=construct_type_deterministically)
            if reset_active_node:
                self.set_active_node(current_node_id, current_node_type)
            return base_node

    def construct_list_value(self, list_value, edge_type, type, is_deterministic, omit_type=False):
        #TODO check order of init node actions
        starting_node = self.last_added_node_id

        if not (isinstance(list_value, ListValue) or  (isinstance(list_value, GlobalVariable) and
                isinstance(list_value.value, ListValue))):
            value = list_value.value
            if isinstance(list_value, GlobalVariable):
                value = list_value.value.value
            node_type = get_class_value(LLVM_NODE_TYPES, value)
            self.create_add_node_action(node_type, is_type_node=False)
            self.create_init_node_action(node_type)
            self.active_llvm_container.add_edge(starting_node, edge_type, self.last_added_node_id)
            base_node = self.last_added_node_id
            self.construct_type(type, is_deterministic=is_deterministic)
            self.set_active_node(starting_node)
            return base_node

        if isinstance(list_value, GlobalVariable):
            values = list_value.value.values
        else:
            values = list_value.values
        primary_type = type.node_type
        self.create_add_node_action(primary_type, is_type_node=False, is_pseudo_node=True)
        number = self.get_number_label(primary_type, type.number)
        self.create_choose_number_action(number, is_deterministic, structural_number=True)
        self.active_llvm_container.add_node(primary_type, number)
        self.append_active_node(primary_type)
        self.create_init_node_action(primary_type, number)
        self.active_llvm_container.add_edge(starting_node, edge_type, self.last_added_node_id)
        base_node = self.last_added_node_id
        if not omit_type:
            self.construct_type(type.parts[0], is_deterministic=is_deterministic)
        self.set_active_node(base_node)
        aggregate_type = type.parts[0].node_type
        if aggregate_type in LLVM_NODE_TYPES.floating_point_types + LLVM_NODE_TYPES.integer_types:
            index = 0
            for aggregate_constant_value in values:
                edge_type = LLVM_EDGE_TYPES.successor_list_element
                if index == 0:
                    edge_type = LLVM_EDGE_TYPES.first_list_element
                current_node = self.last_added_node_id
                sub_base_node = self.construct_constant_value(aggregate_constant_value, edge_type=edge_type, reset_active_node=False, construct_type=False)
                index += 1

        elif aggregate_type in [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.array_of]:
            index = 0
            for aggregate_constant_value in values:
                edge_type = LLVM_EDGE_TYPES.successor_list_element
                if index == 0:
                    edge_type = LLVM_EDGE_TYPES.first_list_element
                is_undef = True
                if isinstance(aggregate_constant_value, ListValue):
                    is_undef = False

                aggregate_node_type = aggregate_type if not is_undef else LLVM_NODE_TYPES.undef
                #self.create_add_node_action(aggregate_node_type, is_pseudo_node=True, is_type_node=False)
                if not is_undef:
                    sub_type = TypeCreator.string_to_type(aggregate_constant_value.llvm_type)
                    previous_base_node = self.last_added_node_id
                    sub_base_node = self.construct_list_value(aggregate_constant_value, edge_type, sub_type, is_deterministic=True, omit_type=True)
                    self.set_active_node(sub_base_node)
                    #self.create_add_edge_to_action(end_node=previous_base_node, type_id=LLVM_EDGE_TYPES.list_element_backwards, is_deterministic=True)
                else:
                    previous_node = self.last_added_node_id
                    self.create_add_node_action(LLVM_NODE_TYPES.undef, is_deterministic=True, is_type_node=False)
                    self.create_init_node_action(LLVM_NODE_TYPES.undef)

                    self.create_add_edge_to_action(end_node=previous_node, type_id=edge_type, is_deterministic=True, reverse_edge=True)

                index += 1



        #self.set_active_node(starting_node)
        return base_node

    def construct_type(self, type, is_type_declaration = False, is_deterministic = False):
        node_type = type.node_type
        self.create_add_node_action(node_type, is_pseudo_node=True, is_deterministic=(is_deterministic or is_type_declaration))
        if node_type == LLVM_NODE_TYPES.struct:
            struct_number = type.number
            end_node = self.get_node_id_of_struct_base_node(struct_number)
            self.create_choose_struct_action(end_node)
            self.create_edge_actions(end_node=end_node, type_id=LLVM_EDGE_TYPES.type, is_global_edge=True, is_deterministic=True)
            return
        self.create_add_node_action(node_type, is_deterministic=True)
        if node_type in [LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.vector_of]:
            num_elements = self.get_number_label(node_type, type.number)
            self.create_choose_number_action(num_elements, is_deterministic, structural_number=True)
            self.create_init_node_action(node_type, num_elements)
        else:
            self.create_init_node_action(node_type)
        if not is_type_declaration:
            self.create_edge_actions(end_node=self.get_previous_node_id(), type_id=LLVM_EDGE_TYPES.type_backwards, is_deterministic=True)
        if node_type in [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.array_of]:
            pass
        elif node_type == LLVM_NODE_TYPES.struct_of:
            base_node_id = self.last_added_node_id
            self.active_llvm_container.get_node(base_node_id).label = self.num_structs
            self.num_structs += 1
            index = 0
            for partial_type in type.parts:
                self.choose_add_operand_action(node_type, index, True)
                self.construct_type(partial_type, is_deterministic=is_deterministic)
                self.set_active_node(base_node_id)
                index += 1
            self.choose_add_operand_action(node_type, index, False)
            return base_node_id
        if len(type.parts) > 0:
            self.construct_type(type.parts[0], is_deterministic=is_deterministic)

    def create_add_function_action(self, label=1):
        self.actions[len(self.actions)] = {
            AE.ACTION: A.ADD_FUNCTION,
            L.LABEL_0: label,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if label == 1:
            self.active_llvm_container = LLVM_Container(self.internal_llvm_graph)
            self.internal_llvm_graph.functions.append(self.active_llvm_container)
            self.first_occurrence_of_ret = True
        if self.debug:
            print("Add function: " + ("yes" if label == 1 else "no"))

    def create_choose_br_edge_action(self, second_edge):
        self.actions[len(self.actions)] = {
            AE.ACTION: A.CHOOSE_BR_EDGE,
            L.LABEL_0: second_edge,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug:
            print("\tChoose br edge: " + str(second_edge))

    def create_choose_function_action(self, function_name):
        function = self.call_dict[function_name]
        label = function.id

        self.actions[len(self.actions)] = {
            AE.ACTION: A.CHOOSE_FUNCTION,
            L.LABEL_0: label,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug:
            print("\tChoose function: " + str(function.id) + " (" + function.name + ")")
        return label

    def create_add_operand_action(self, stop = False):
        # TODO add nodetype and index to input of this action
        self.actions[len(self.actions)] = {
            AE.ACTION: A.ADD_OPERAND,
            L.LABEL_0: 1 if not stop else 0,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug:
            if not stop:
                print("\tAdd operand: yes " + self.get_active_node_string())
            else:
                print("\tAdd operand: no " + self.get_active_node_string())

    def create_is_operand_static_action(self, is_static):
        self.actions[len(self.actions)] = {
            AE.ACTION: A.CHOOSE_STATIC,
            L.LABEL_0: 1 if is_static else 0,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug:
            if is_static:
                print("\tChoose static operand: yes")
            else:
                print("\tChoose static operand: no")

    def create_add_instruction_node_action(self, node = None):
        label = LLVM_NODE_TYPES.none_type
        if isinstance(node, Argument):
            label = LLVM_NODE_TYPES.argument
        elif node != None:
            label = LLVM_NODE_TYPES.parse_opcode(node.opcode)

        self.actions[len(self.actions)] = {
            AE.ACTION: A.ADD_INSTRUCTION_NODE,
            L.LABEL_0: label,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if node != None:
            self.append_active_node(label)
            self.active_instruction_node_id = self.last_added_node_id
            self.active_instruction_node_type = self.last_added_node_type
            self.node_dict[id(node)] = self.last_added_node_id
            self.instruction_dict[self.last_added_node_id] = id(node)

        if node != None:
            self.active_llvm_container.add_node(label)
        if self.debug:
            print("Add instruction node: " + (get_class_key(LLVM_NODE_TYPES, label) if node else "No") + " " + self.get_active_node_string())

        return label

    def create_add_struct_action(self, label):
        self.actions[len(self.actions)] = {
            AE.ACTION: A.ADD_STRUCT,
            L.LABEL_0: label,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug:
            print("Add struct: " + ("yes " if label == 1 else "no ") + self.get_active_node_string())

    def create_add_global_action(self, label):
        self.actions[len(self.actions)] = {
            AE.ACTION: A.ADD_GLOBAL,
            L.LABEL_0: label,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug:
            print("Add global: " + ("yes " if label == 1 else "no ") + self.get_active_node_string())

    def create_add_node_action(self, node_type, node_label = 0, is_deterministic = False, is_pseudo_node = False, is_type_node = True):
        if not is_deterministic:
            self.actions[len(self.actions)] = {
                AE.ACTION: A.ADD_TYPE_NODE if is_type_node else A.ADD_CONST_VALUE_NODE,
                L.LABEL_0: node_type,
                AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
                AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                AE.SUBGRAPH_START: 0,
                AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
            }
        pseudo_text = " [pseudo node]"
        if not is_pseudo_node:
            pseudo_text = ""
        if self.debug and not is_deterministic:
            print("\tAdd node: " + get_class_key(LLVM_NODE_TYPES, node_type) + pseudo_text + " " + self.get_active_node_string())
        if not is_pseudo_node:
            self.append_active_node(node_type)
            self.active_llvm_container.add_node(node_type, node_label)

    def create_init_node_action(self, label, label_1 = None):
        self.actions[len(self.actions)] = {
            AE.ACTION: A.INIT_NODE,
            L.LABEL_0: label,
            L.LABEL_1: 0 if label_1 is None else label_1,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }

        if self.debug:
            print("\tInit node: " + str(label) + " " + self.get_active_node_string())

    def create_edge_actions(self, end_node = None, type_id = None, is_pseudo_edge = False, is_global_edge = False, is_deterministic = False, reverse_edge = False):
        self.create_add_edge_action(1, True)
        self.create_add_edge_to_action(end_node, type_id, is_pseudo_edge, is_global_edge, is_deterministic, reverse_edge)
        self.create_add_edge_action(0, True)

    def create_add_edge_action(self, label, is_deterministic = False):
        if not (is_deterministic and not self.include_deterministic_instructions):
            self.actions[len(self.actions)] = {
                AE.ACTION: A.ADD_EDGE,
                L.LABEL_0: label,
                AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
                AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                AE.SUBGRAPH_START: 0,
                AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
            }

        if self.debug and not is_deterministic:
            print("\tAdd edge: " + ("yes" if label == 1 else "no"))

    def create_add_edge_to_action(self, end_node, type_id, is_pseudo_edge = False, is_global_edge = False, is_deterministic = False, reverse_edge = False):
        pseudo_text = " [pseudo edge]"
        if not is_deterministic:
            self.actions[len(self.actions)] = {
                AE.ACTION: A.ADD_EDGE_TO,
                L.LABEL_0: end_node,
                L.LABEL_1: 0,
                #L.LABEL_1: type_id,
                AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
                AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                AE.SUBGRAPH_START: 0,
                AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
            }
        if not is_pseudo_edge:
            pseudo_text = ""
            if reverse_edge:
                self.active_llvm_container.add_edge(end_node, type_id, self.last_added_node_id, is_global_edge)
            else:
                self.active_llvm_container.add_edge(self.last_added_node_id, type_id, end_node, is_global_edge)
        if self.debug and not is_deterministic:
            print("\tAdd edge to: " + str(end_node) + pseudo_text + self.get_active_node_string())

    def create_choose_local_function(self, end_node):
        self.actions[len(self.actions)] = {
            AE.ACTION: A.CHOOSE_LOCAL_FUNCTION,
            L.LABEL_0: end_node,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug:
            print("\tChoose local function: " + str(end_node) + " " + self.get_active_node_string())

    def create_choose_struct_action(self, end_node):
        self.actions[len(self.actions)] = {
            AE.ACTION: A.CHOOSE_STRUCT,
            L.LABEL_0: end_node,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.SUBGRAPH_START: 0,
            AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug:
            print("\tChoose struct-node: " + str(end_node) + " " + self.get_active_node_string())

    def create_choose_number_action(self, label, is_deterministic = False, structural_number = False):
        if not is_deterministic:
            self.actions[len(self.actions)] = {
                AE.ACTION: A.CHOOSE_NUMBER if not structural_number else A.CHOOSE_STRUCTURAL_NUMBER,
                L.LABEL_0: label,
                AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
                AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                AE.SUBGRAPH_START: 0,
                AE.ADJ_LIST : self.internal_llvm_graph.to_adj_list()[0]
            }

        if self.debug and not is_deterministic:
            print("\tChoose number: " + str(label))


class GraphGenerator(DeepGMGModel):

    def __init__(self, debug = False, debug_actions = None, debug_print = False, config = None, state = None):
        if not debug_actions and not config:
            raise KeyError("'debug_actions' and/or 'config' needs to be set in the constructor.")
        self.debug = debug
        self.debug_print = debug_print
        self.debug_actions = debug_actions
        self.config = None
        self.initialize()

        if config:
            super().__init__(config, state)
            self.num_nodes_max = config['gen_num_node_max']
            with self.state.graph.as_default():
                self.__make_model()

    def initialize(self):
        self.last_debug_action_index = -1
        self.internal_llvm_graph = LLVM_Graph()
        self.active_llvm_container = LLVM_Container(self.internal_llvm_graph)
        self.internal_llvm_graph.globals_and_structs = self.active_llvm_container
        self.node_id_stack = []
        self.node_type_stack = []
        self.node_type_dict = {}
        self.last_added_node_id = 0
        self.last_added_node_type = 0
        self.highest_node_id = 0
        self.is_first_instruction = True
        self.active_instruction_node_id = 0
        self.active_instruction_node_type = 0
        self.call_dict = LLVM_NODE_TYPES.get_call_data(map_by_name=False)
        self.first_occurrence_of_ret = True
        self.is_current_func_void = True
        self.structs = []
        self.struct_nodes = []
        self.node_dict = {}
        self.current_function_start_node = None
        self.unfinished_phi_instructions = []
        self.type_dict = {}
        self.br_dict = {}

    def compare_actions(self, debug_action, real_action):
        if not debug_action:
            return
        readable_debug_action = make_action_readable(debug_action)
        readable_real_action = make_action_readable(real_action)
        a = 3

    def __make_model(self):
        """
        Create tf model
        """
        self.placeholders['embeddings_in'] = tf.placeholder(tf.float32, [None, self.config['hidden_size']], name='embeddings_in')

        # Create layer and propagate
        ggnn_layer = GGNNModelLayer(self.config, self.state.ggnn_layer_state)
        embeddings = ggnn_layer.compute_embeddings(self.placeholders['embeddings_in'])
        self.ops['peek'] = embeddings

        # Create cell and predict
        deepgmg_cell = DeepGMGCell(self.config, True, self.state.deepgmg_cell_state, 0)
        self.placeholders['embeddings_out'] = deepgmg_cell.compute_predictions(embeddings)

        self.ggnn_layers.append(ggnn_layer)
        self.cells.append(deepgmg_cell)

    def __sample_add_node_action(self, action_type):
        if action_type not in [A.ADD_INSTRUCTION_NODE, A.ADD_CONST_VALUE_NODE, A.ADD_TYPE_NODE]:
            raise ValueError("Action type needs to be an 'add node' type.")
        function_name = "f_" + get_class_key(A, action_type).lower()

        # Prepare
        action = {
            AE.ACTION:                    action_type,
            AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            AE.ADJ_LIST:                  self.internal_llvm_graph.to_adj_list()[0]
        }


        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops[function_name]]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_addnode = result[1][0]

        # Sample if to add node
        p_addnode_norm = p_addnode / (np.sum(p_addnode) + SMALL_NUMBER)   # Normalize to sum up to 1
        node_type = np.random.multinomial(1, p_addnode_norm)                    # Sample categorial
        node_type = np.argmax(node_type)                                        # One hot -> integer

        # Print
        action[L.LABEL_0] = node_type
        action[AE.PROBABILITY] = p_addnode_norm[node_type]
        #utils.action_pretty_print(action)

        action[L.LABEL_0] = str(node_type)
        if self.debug_actions:
            self.compare_actions(self.get_next_debug_action(), action)

        return node_type, p_addnode_norm

    def __do_init_node_action(self, init_number):
        # Prepare
        action = {
            AE.ACTION:                    A.INIT_NODE,
            AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            L.LABEL_1:                    init_number,
            AE.ADJ_LIST:                  self.internal_llvm_graph.to_adj_list()[0]
        }
        if self.debug_actions:
            self.compare_actions(self.get_next_debug_action(), action)

        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings']]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]

        # Print
        #utils.action_pretty_print(action)

    def __sample_add_edge_action(self, action_type):
        if action_type not in [A.ADD_EDGE, A.ADD_STRUCT, A.ADD_GLOBAL, A.ADD_FUNCTION, A.ADD_OPERAND, A.CHOOSE_STATIC, A.CHOOSE_BR_EDGE]:
            raise ValueError("Action type needs to be an 'add edge' type.")
        function_name = "f_" + get_class_key(A, action_type).lower()

        # Prepare
        action = {
            AE.ACTION:                    action_type,
            AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            AE.ADJ_LIST:                  self.internal_llvm_graph.to_adj_list()[0]
        }


        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops[function_name]]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_addedge = result[1][0]

        # Sample if to add edge
        p_addedge_norm = p_addedge / (np.sum(p_addedge) + utils.SMALL_NUMBER)
        add_edge = np.random.multinomial(1, p_addedge_norm)                          # Sample bernoulli
        add_edge = np.argmax(add_edge)                                          # One hot -> integer

        # Print
        action[L.LABEL_0] = add_edge
        action[AE.PROBABILITY] = p_addedge[add_edge]
        #utils.action_pretty_print(action)

        action[L.LABEL_0] = str(add_edge)
        if self.debug_actions:
            self.compare_actions(self.get_next_debug_action(), action)

        return add_edge, p_addedge

    def __sample_add_edge_to_action(self, action_type):
        if action_type not in [A.ADD_EDGE_TO, A.CHOOSE_STRUCT, A.CHOOSE_LOCAL_FUNCTION]:
            raise ValueError("Action type needs to be an 'add edge to' type.")
        function_name = "f_" + get_class_key(A, action_type).lower()
        # Prepare
        action = {
            AE.ACTION:                    action_type,
            AE.LAST_ADDED_NODE_ID:        self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE:      self.last_added_node_type,
            AE.ADJ_LIST:                  self.internal_llvm_graph.to_adj_list()[0]
        }

        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops[function_name]]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_nodes = result[1]

        # Sample where to add edge to
        p_nodes_limited = p_nodes[0:self.internal_llvm_graph.get_num_nodes()] # Limit choice of sampling
        for i in range(len(p_nodes_limited[self.last_added_node_id])):
            p_nodes_limited[self.last_added_node_id][i] = 0
        p_nodes_limited = np.reshape(p_nodes_limited, (-1))
        p_nodes_limited = p_nodes_limited / (np.sum(p_nodes_limited) + SMALL_NUMBER)  # Normalize to sum up to 1
        sum = 0
        for i in range(len(p_nodes_limited)):
            sum += p_nodes_limited[i]
        p_nodes_limited_reshaped = np.reshape(p_nodes_limited, (-1, self.config['num_edge_types']))

        v_t = np.random.multinomial(1, p_nodes_limited)                         # Sample categorial
        v_t = np.reshape(v_t, (-1, self.config['num_edge_types']))

        node = np.sum(np.argmax(v_t, axis = 0))                                 # One-hot 2D np-array
        edge_type = np.sum(np.argmax(v_t, axis = 1))                            # -> Positions for col, row

        # Print
        action[L.LABEL_0] = node
        action[L.LABEL_1] = edge_type
        action[AE.PROBABILITY] = p_nodes_limited_reshaped[node][edge_type]
        #utils.action_pretty_print(action)

        action[L.LABEL_0] = str(node)
        if self.debug_actions:
            self.compare_actions(self.get_next_debug_action(), action)

        return node, edge_type, p_nodes_limited_reshaped[node][edge_type]

    def __sample_choose_number_action(self, action_type):
        if action_type not in [A.CHOOSE_NUMBER, A.CHOOSE_STRUCTURAL_NUMBER]:
            raise ValueError("Action type needs to be an 'choose number' type.")

        function_name = "f_" + get_class_key(A, action_type).lower()
        action = {
            AE.ACTION: action_type,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.ADJ_LIST: self.internal_llvm_graph.to_adj_list()[0]
        }

        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops[function_name]]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        result_number = result[1][0][0]

        action[L.LABEL_0] = result_number
        if self.debug_actions:
            self.compare_actions(self.get_next_debug_action(), action)

        return result_number

    def __sample_choose_function_action(self):
        action = {
            AE.ACTION: A.CHOOSE_FUNCTION,
            AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            AE.ADJ_LIST: self.internal_llvm_graph.to_adj_list()[0]
        }

        feed_dict = self._graphs_to_batch_feed_dict([{0: action}], [self.num_nodes_max], 1)
        feed_dict[self.placeholders['embeddings_in']] = self.embeddings

        fetch_list = [self.cells[0].ops['embeddings'], self.cells[0].ops["f_choose_function"]]

        # Predict
        result = self.state.sess.run(fetch_list, feed_dict=feed_dict)

        # Update/Extract
        self.embeddings = result[0]
        p_choose_function = result[1][0]
        chosen_function = np.random.multinomial(1, p_choose_function)  # Sample bernoulli
        chosen_function = np.argmax(chosen_function)

        action[L.LABEL_0] = chosen_function
        if self.debug_actions:
            self.compare_actions(self.get_next_debug_action(), action)

        return chosen_function

    def add_node(self, node_type, label=0):
        #TODO delete the assertion
        node_id = self.active_llvm_container.add_node(node_type, label)
        self.append_active_node(node_type)
        return node_id

    def append_active_node(self, node_type):
        if self.is_first_instruction:
            self.is_first_instruction = False
        else:
            self.last_added_node_id = self.highest_node_id + 1
            self.highest_node_id += 1
        self.last_added_node_type = node_type
        self.node_id_stack.append(self.last_added_node_id)
        self.node_type_stack.append(node_type)
        self.node_type_dict[self.last_added_node_id] = node_type
        return self.last_added_node_id

    def set_active_node(self, node_id, node_type = None):
        if len(self.node_type_stack) == 0:
            return
        if node_id in self.node_id_stack:
            index = self.node_id_stack.index(node_id) + 1
            self.node_id_stack = self.node_id_stack[:index]
            self.node_type_stack = self.node_type_stack[:index]
            self.last_added_node_id = self.node_id_stack[len(self.node_id_stack) - 1]
            self.last_added_node_type = self.node_type_stack[len(self.node_type_stack) - 1]
        else:
            if node_type is None:
                node_type  = self.node_type_dict[node_id]
            self.node_id_stack.append(node_id)
            self.node_type_stack.append(node_type)
            self.last_added_node_id = node_id
            self.last_added_node_type = node_type

    def get_next_debug_action(self):
        self.last_debug_action_index += 1
        if len(self.debug_actions) > self.last_debug_action_index:
            return self.debug_actions[self.last_debug_action_index]

    def check_debug_action_result(self, debug_action, action_type, init_number = None):
        if debug_action[AE.ACTION] != action_type:
            raise ValueError("Wrong action type. Expected \"" + get_class_key(A, action_type) + "\", got \"" +
                             get_class_key(A, debug_action[AE.ACTION]) + "\"")
        if self.last_added_node_id != debug_action[AE.LAST_ADDED_NODE_ID]:
            raise ValueError("Wrong active node-id. Expected \"" + str(self.last_added_node_id) + "\", got \"" +
                             str(debug_action[AE.LAST_ADDED_NODE_ID]) + "\"")
        if action_type == A.INIT_NODE and init_number != debug_action[L.LABEL_1] \
                and not (math.isnan(init_number) and math.isnan(debug_action[L.LABEL_1])):
            raise ValueError("Wrong init number, expected \"" + str(init_number) + "\", got \"" + str(debug_action[L.LABEL_1]) + "\"")

        debug_string = get_class_key(A, action_type) + ": " + str(debug_action[L.LABEL_0]) + \
                       " [active node-id: " + str(self.last_added_node_id) + "]"
        if self.debug_print:
            print(debug_string)
        if action_type in [A.ADD_TYPE_NODE, A.ADD_CONST_VALUE_NODE, A.ADD_INSTRUCTION_NODE, A.CHOOSE_NUMBER, A.CHOOSE_STRUCTURAL_NUMBER,
                           A.ADD_EDGE_TO, A.CHOOSE_FUNCTION, A.CHOOSE_LOCAL_FUNCTION, A.CHOOSE_STRUCT]:
            return debug_action[L.LABEL_0]
        return bool(debug_action[L.LABEL_0])


    def sample_choose_br_edge_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.CHOOSE_BR_EDGE)
        else:
            return bool(self.__sample_add_edge_action(A.CHOOSE_BR_EDGE)[0])


    def do_init_node_action(self, init_number = 0):
        if self.debug:
            action = self.get_next_debug_action()
            self.check_debug_action_result(action, A.INIT_NODE, init_number)
        else:
            self.__do_init_node_action(init_number)

    def sample_add_struct_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.ADD_STRUCT)
        else:
            return bool(self.__sample_add_edge_action(A.ADD_STRUCT)[0])


    def sample_add_global_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.ADD_GLOBAL)
        else:
            return bool(self.__sample_add_edge_action(A.ADD_GLOBAL)[0])

    def sample_add_function_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.ADD_FUNCTION)
        else:
            return bool(self.__sample_add_edge_action(A.ADD_FUNCTION)[0])

    def sample_add_type_node_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.ADD_TYPE_NODE)
        else:
            return self.__sample_add_node_action(A.ADD_TYPE_NODE)[0]

    def sample_add_const_value_node_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.ADD_CONST_VALUE_NODE)
        else:
            return self.__sample_add_node_action(A.ADD_CONST_VALUE_NODE)[0]

    def sample_add_instruction_node_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.ADD_INSTRUCTION_NODE)
        else:
            return self.__sample_add_node_action(A.ADD_INSTRUCTION_NODE)[0]

    def sample_choose_struct_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.CHOOSE_STRUCT)
        else:
            return self.__sample_add_edge_to_action(A.CHOOSE_STRUCT)[0]

    def sample_choose_function_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.CHOOSE_FUNCTION)
        else:
            return self.__sample_choose_function_action()

    def sample_choose_local_function_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.CHOOSE_LOCAL_FUNCTION)
        else:
            return self.__sample_add_edge_to_action(A.CHOOSE_LOCAL_FUNCTION)[0]

    def sample_choose_number_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.CHOOSE_NUMBER)
        else:
            return self.__sample_choose_number_action(A.CHOOSE_NUMBER)
    def sample_choose_structural_number_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.CHOOSE_STRUCTURAL_NUMBER)
        else:
            return int(round(self.__sample_choose_number_action(A.CHOOSE_STRUCTURAL_NUMBER)))

    def sample_add_operand_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return  self.check_debug_action_result(action, A.ADD_OPERAND)
        else:
            return bool(self.__sample_add_edge_action(A.ADD_OPERAND)[0])

    def sample_is_operand_static_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.CHOOSE_STATIC)
        else:
            return bool(self.__sample_add_edge_action(A.CHOOSE_STATIC)[0])

    def sample_add_edge_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.ADD_EDGE)
        else:
            return bool(self.__sample_add_edge_action(A.ADD_EDGE)[0])

    def sample_add_edge_to_action(self):
        if self.debug:
            action = self.get_next_debug_action()
            return self.check_debug_action_result(action, A.ADD_EDGE_TO)
        else:
            return self.__sample_add_edge_to_action(A.ADD_EDGE_TO)[0]


    def choose_add_operand_action(self, opcode, index, function_id = None):
        create_action = True
        result = True
        first_ret = False
        num_operands = LLVM_NODE_TYPES.get_num_ops(opcode)

        if opcode == LLVM_NODE_TYPES.call:
            if function_id is None:
                raise ValueError("function name not specified")
            called_function = self.call_dict[function_id]
            result = index < len(called_function.signature)
            create_action = False
        elif opcode == LLVM_NODE_TYPES.getelementptr:
            if index == 0:
                create_action = False
        elif opcode == LLVM_NODE_TYPES.switch:
            if index < 2 or index % 2 == 1:
                create_action = False
        elif opcode == LLVM_NODE_TYPES.br:
            if index in [0, 2]:
                create_action = False
            elif index == 3:
                result = False
                create_action = False
        elif opcode == LLVM_NODE_TYPES.ret:
            if self.first_occurrence_of_ret:
                self.first_occurrence_of_ret = False
                first_ret = True
            else:
                create_action = False
                result = not (self.is_current_func_void or index > 0)
        elif num_operands >= 0:
            result = index < num_operands
            create_action = False

        if create_action:
            result = self.sample_add_operand_action()
            if first_ret:
                self.is_current_func_void = not result

        return result


    def generate_graph(self):
        self.initialize()
        if self.config is not None:
            self.embeddings = np.ones((self.num_nodes_max, self.config['hidden_size']))

        # TODO eliminate backwards edges
        LLVM_Node.reset_id()

        while self.sample_add_struct_action():
            base_node, llvm_type = self.generate_type(declaration_type=LLVM_NODE_TYPES.struct_of)
            self.active_llvm_container.get_node(base_node).llvm_type = llvm_type



        while self.sample_add_global_action():
            base_node = self.add_node(LLVM_NODE_TYPES.global_var)
            self.do_init_node_action()
            _, _, base_type = self.generate_constant_value()
            llvm_type = LLVM_Type(LLVM_NODE_TYPES.pointer_of)
            llvm_type.parts.append(base_type)
            self.active_llvm_container.get_node(base_node).llvm_type = llvm_type


        while self.sample_add_function_action():
            self.active_llvm_container = LLVM_Container(self.internal_llvm_graph)
            self.internal_llvm_graph.functions.append(self.active_llvm_container)
            self.first_occurrence_of_ret = True
            self.add_node(LLVM_NODE_TYPES.function)
            self.do_init_node_action()
            instruction_node_type = self.sample_add_instruction_node_action()
            is_first_instruction = True
            self.current_function_start_node = self.last_added_node_id
            self.node_dict[self.last_added_node_id] = {"type" : LLVM_NODE_TYPES.function, "args" : []}

            while instruction_node_type != LLVM_NODE_TYPES.none_type:
                self.add_node(instruction_node_type)
                self.do_init_node_action()
                instruction_node_id = self.last_added_node_id
                self.active_instruction_node_id = self.last_added_node_id


                self.node_dict.update({instruction_node_id: {"type": instruction_node_type}})
                if instruction_node_type == LLVM_NODE_TYPES.switch:
                    self.node_dict[instruction_node_id]["has_default_op"] = False
                    self.node_dict[instruction_node_id]["prev_operand_node"] = instruction_node_id

                if instruction_node_type == LLVM_NODE_TYPES.argument:
                    _, arg_type = self.generate_type()
                    self.active_llvm_container.get_node(instruction_node_id).llvm_type = arg_type
                    self.node_dict[self.current_function_start_node]["args"].append(arg_type)
                    self.set_active_node(self.active_instruction_node_id)
                    instruction_node_type = self.sample_add_instruction_node_action()
                    continue

                self.active_llvm_container.add_instruction(instruction_node_id)

                if is_first_instruction:
                    self.active_llvm_container.add_edge(self.current_function_start_node, LLVM_EDGE_TYPES.cfg, self.last_added_node_id)
                    add_edge = False
                    is_first_instruction = False
                else:
                    add_edge = self.sample_add_edge_action()

                while add_edge:
                    edge_target_id = self.sample_add_edge_to_action()
                    edge_target_type = self.node_dict[edge_target_id]["type"]

                    if edge_target_type == LLVM_NODE_TYPES.switch:
                        add_operand = True
                        switch_has_default_op = self.node_dict[edge_target_id]["has_default_op"]
                        if not switch_has_default_op:
                            add_operand = self.sample_add_operand_action()
                        if add_operand:
                            self.add_node(LLVM_NODE_TYPES.operand)
                            self.do_init_node_action()
                            previous_operand_node = self.node_dict[edge_target_id]["prev_operand_node"]
                            self.node_dict[edge_target_id]["prev_operand_node"] = self.last_added_node_id
                            edge_target_id = self.last_added_node_id
                            self.active_llvm_container.add_edge(previous_operand_node, LLVM_EDGE_TYPES.cfg, self.last_added_node_id)
                            base_node_id, _, _ = self.generate_constant_value()
                        else:
                            self.node_dict[edge_target_id]["has_default_op"] = True

                    self.set_active_node(self.active_instruction_node_id)
                    edge_type = LLVM_EDGE_TYPES.cfg
                    if edge_target_type == LLVM_NODE_TYPES.br:
                        edge_type = self.choose_br_edge_type(edge_target_id)
                    self.active_llvm_container.add_edge(edge_target_id, edge_type, self.last_added_node_id)

                    add_edge = self.sample_add_edge_action()

                if instruction_node_type == LLVM_NODE_TYPES.call:
                    is_const_function_op = self.sample_is_operand_static_action()
                    if is_const_function_op:
                        chosen_function_id = self.sample_choose_function_action()
                        chosen_function = self.call_dict[chosen_function_id]
                        llvm_type = TypeCreator.string_to_type(chosen_function.type, specify_structs=False)

                        self.type_dict[instruction_node_id] = chosen_function.type
                        self.add_node(LLVM_NODE_TYPES.function, chosen_function_id)
                        self.do_init_node_action(chosen_function_id)
                        self.active_llvm_container.add_edge(self.last_added_node_id, LLVM_EDGE_TYPES.op_0_backwards, self.active_instruction_node_id)
                        self.set_active_node(self.active_instruction_node_id)
                        func_signature = []
                        for type_string in chosen_function.signature:
                            func_signature.append(TypeCreator.string_to_type(type_string, specify_structs=False))
                    else:
                        function_node_id = self.sample_choose_local_function_action()
                        llvm_type = self.internal_llvm_graph.get_node(function_node_id).llvm_type
                        self.active_llvm_container.add_edge(self.active_instruction_node_id, LLVM_EDGE_TYPES.op_0, function_node_id)
                        func_signature = self.node_dict[function_node_id]["args"]

                    for i in range(0, len(func_signature)):
                        self.generate_operand(instruction_node_type, predetermined_type=func_signature[i])

                elif instruction_node_type == LLVM_NODE_TYPES.phi:
                    operand_base_node, llvm_type = self.generate_phi_operand(self.active_instruction_node_id)

                    self.unfinished_phi_instructions.append({"node_id" : self.active_instruction_node_id, "prev_operand_node" : operand_base_node})

                elif instruction_node_type == LLVM_NODE_TYPES.br:
                    llvm_type = LLVM_Type(LLVM_NODE_TYPES.void)
                    self.generate_br_instruction()

                elif instruction_node_type == LLVM_NODE_TYPES.switch:
                    llvm_type = LLVM_Type(LLVM_NODE_TYPES.void)
                    is_operand_static = self.sample_is_operand_static_action()
                    if is_operand_static:
                        self.generate_constant_value()
                    else:
                        edge_target_id = self.sample_add_edge_to_action()
                        self.active_llvm_container.add_edge(self.active_instruction_node_id, LLVM_EDGE_TYPES.op_0, edge_target_id)

                else:
                    index = 0
                    add_operand = self.choose_add_operand_action(instruction_node_type, index)
                    sub_llvm_types = []
                    while add_operand:

                        sub_llvm_types.append(self.generate_operand(instruction_node_type, index))
                        index += 1
                        add_operand = self.choose_add_operand_action(instruction_node_type, index)
                    if instruction_node_type == LLVM_NODE_TYPES.ret:
                        func_type = LLVM_Type(LLVM_NODE_TYPES.void)
                        if len(sub_llvm_types) > 0:
                            func_type = sub_llvm_types[0]
                        self.active_llvm_container.get_node(self.current_function_start_node).llvm_type = func_type


                    llvm_type = self.calculate_type(instruction_node_type, sub_llvm_types)

                self.set_active_node(self.active_instruction_node_id)

                if instruction_node_type in LLVM_NODE_TYPES.opcodes_with_explicit_types:
                    _, llvm_type = self.generate_type()
                    self.set_active_node(self.active_instruction_node_id)

                instruction_node_type = self.sample_add_instruction_node_action()
                self.active_llvm_container.get_node(instruction_node_id).llvm_type = llvm_type

            for unfinished_phi_instruction in self.unfinished_phi_instructions:
                previous_operand_node = unfinished_phi_instruction["prev_operand_node"]
                self.set_active_node(previous_operand_node)

                while self.sample_add_operand_action():
                    previous_operand_node, _ = self.generate_phi_operand(previous_operand_node)

            self.unfinished_phi_instructions = []
            self.set_active_node(self.active_instruction_node_id)

    def specify_struct(self, llvm_type):
        changes = True
        while changes:
            smallest_struct_type = None
            working_type = copy(llvm_type)
            while working_type.node_type not in LLVM_NODE_TYPES.unary_types:
                if working_type.node_type == LLVM_NODE_TYPES.struct_of:
                    working_type = llvm_type
                    while working_type.node_type != LLVM_NODE_TYPES.struct_of:
                        working_type = working_type.parts[0]
                    for i in range(len(working_type.parts)):
                        working_type.parts[i] = self.specify_struct(working_type.parts[i])
                    changes = False
                    break
                if working_type.node_type == LLVM_NODE_TYPES.struct:
                    smallest_struct_type = copy(working_type)
                working_type = working_type.parts[0]

            if smallest_struct_type is None:
                break

            #for






        return llvm_type





    def calculate_type(self, opcode, operand_types):
        if opcode in LLVM_NODE_TYPES.opcodes_with_explicit_types:
            return None
        elif opcode in LLVM_NODE_TYPES.void_ops:
            return LLVM_Type(LLVM_NODE_TYPES.void)
        elif opcode in [LLVM_NODE_TYPES.add, LLVM_NODE_TYPES.and_type, LLVM_NODE_TYPES.or_type, LLVM_NODE_TYPES.mul,
                        LLVM_NODE_TYPES.shl, LLVM_NODE_TYPES.ashr, LLVM_NODE_TYPES.sdiv, LLVM_NODE_TYPES.sub,
                        LLVM_NODE_TYPES.insertelement, LLVM_NODE_TYPES.srem, LLVM_NODE_TYPES.urem, LLVM_NODE_TYPES.fadd,
                        LLVM_NODE_TYPES.fmul, LLVM_NODE_TYPES.fsub, LLVM_NODE_TYPES.xor, LLVM_NODE_TYPES.lshr,
                        LLVM_NODE_TYPES.fdiv, LLVM_NODE_TYPES.udiv, LLVM_NODE_TYPES.insertvalue]:
            return operand_types[0]
        elif opcode in [LLVM_NODE_TYPES.icmp, LLVM_NODE_TYPES.fcmp]:
            if operand_types[2].node_type != LLVM_NODE_TYPES.vector_of:
                return LLVM_Type(LLVM_NODE_TYPES.i1)
            return_type = LLVM_Type(LLVM_NODE_TYPES.vector_of)
            return_type.number = operand_types[1].number
            return_type.parts.append(LLVM_Type(LLVM_NODE_TYPES.i1))
            return return_type
        elif opcode == LLVM_NODE_TYPES.getelementptr:
            sub_type = operand_types[0]
            indices = [int(x.number) for x in operand_types[1:]]
            for index in indices:
                if sub_type.node_type in [LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.pointer_of]:
                    index = 0
                elif sub_type.node_type == LLVM_NODE_TYPES.struct:
                    struct_index = sub_type.to_string()
                    struct_index = int(struct_index[len(struct_index) - 1])
                    sub_type = self.structs[struct_index]
                sub_type = sub_type.parts[index]
            end_type = LLVM_Type(LLVM_NODE_TYPES.pointer_of)
            end_type.parts.append(sub_type)
            return end_type
        elif opcode in [LLVM_NODE_TYPES.load, LLVM_NODE_TYPES.extractelement]:
            return operand_types[0].parts[0]
        elif opcode == LLVM_NODE_TYPES.shufflevector:
            end_type = copy(operand_types[0])
            end_type.number = operand_types[len(operand_types) - 1].number
            return end_type
        elif opcode == LLVM_NODE_TYPES.select:
            return operand_types[len(operand_types) - 1]
        elif opcode == LLVM_NODE_TYPES.extractvalue:
            end_type = operand_types[0]
            for i in range(1, len(operand_types)):
                index = operand_types[i].number
                end_type = end_type.parts[index]

            return end_type









    def generate_br_instruction(self):
        add_operand = self.sample_add_operand_action()
        num_potential_edges = 1
        conditional_br = False
        if add_operand:
            self.generate_operand(LLVM_NODE_TYPES.br, 0)
            num_potential_edges = 2
            conditional_br = True
        self.br_dict[self.active_instruction_node_id] = {"action" : conditional_br, "edge_type" : None if conditional_br else LLVM_EDGE_TYPES.cfg}

        for _ in range(num_potential_edges):
            add_edge = self.sample_add_edge_action()
            if not add_edge:
                return

            edge_target_id = self.sample_add_edge_to_action()
            edge_type = self.choose_br_edge_type(self.active_instruction_node_id)
            self.active_llvm_container.add_edge(self.active_instruction_node_id, edge_type, edge_target_id)

    def choose_br_edge_type(self, node_id):
        is_second_edge = False
        if self.br_dict[node_id]["action"]:
            is_second_edge = self.sample_choose_br_edge_action()
            self.br_dict[node_id]["action"] = False
            self.br_dict[node_id]["edge_type"] = LLVM_EDGE_TYPES.cfg \
                if is_second_edge else LLVM_EDGE_TYPES.cfg_1
        else:
            is_second_edge = True if self.br_dict[node_id]["edge_type"] == LLVM_EDGE_TYPES.cfg_1 else False
        return  LLVM_EDGE_TYPES.cfg_1 if is_second_edge else LLVM_EDGE_TYPES.cfg

    def generate_phi_operand(self, prev_operand_node):
        self.add_node(LLVM_NODE_TYPES.operand)
        self.do_init_node_action()
        self.active_llvm_container.add_edge(prev_operand_node, LLVM_EDGE_TYPES.op_multi,
                                            self.last_added_node_id)
        label_target_node_id = self.sample_add_edge_to_action()
        self.active_llvm_container.add_edge(self.last_added_node_id, LLVM_EDGE_TYPES.op_0, label_target_node_id)

        is_operand_static = self.sample_is_operand_static_action()
        operand_base_node = self.last_added_node_id
        if is_operand_static:
            _, _, llvm_type = self.generate_constant_value(edge_type=LLVM_EDGE_TYPES.op_1)
        else:
            edge_target_id = self.sample_add_edge_to_action()
            llvm_type = self.active_llvm_container.get_node(edge_target_id).llvm_type
            self.active_llvm_container.add_edge(operand_base_node, LLVM_EDGE_TYPES.op_1, edge_target_id)

        return operand_base_node, llvm_type











    def generate_type(self, declaration_type = None, predetermined_type = None):
        starting_node = self.last_added_node_id
        is_declaration = declaration_type is not None
        node_type = declaration_type
        if not is_declaration:
            if predetermined_type is not None:
                node_type = predetermined_type.node_type
            else:
                node_type = self.sample_add_type_node_action()
            if node_type == LLVM_NODE_TYPES.struct:
                struct_node = self.sample_choose_struct_action()
                llvm_type = LLVM_Type(LLVM_NODE_TYPES.struct)
                llvm_type.number = self.struct_nodes.index(struct_node)
                self.active_llvm_container.add_edge(self.last_added_node_id, LLVM_EDGE_TYPES.type, struct_node,
                                                    is_global_edge=True)
                self.type_dict[starting_node] = llvm_type
                return starting_node, llvm_type

        node_id = self.add_node(node_type)
        llvm_type = LLVM_Type(node_type)
        init_number = 0
        if node_type in [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.array_of]:
            if predetermined_type is not None:
                init_number = predetermined_type.number
            else:
                init_number = int(round(self.sample_choose_structural_number_action()))
            llvm_type.number = init_number
        self.do_init_node_action(init_number)

        if not is_declaration:
            self.active_llvm_container.add_edge(self.last_added_node_id, LLVM_EDGE_TYPES.type_backwards, starting_node)

        if node_type in [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.array_of]:
            if predetermined_type is not None:
                _, sub_type = self.generate_type(predetermined_type=predetermined_type.parts[0])
            else:
                _, sub_type = self.generate_type()
            llvm_type.parts.append(sub_type)
        elif node_type == LLVM_NODE_TYPES.struct_of:
            llvm_type.number = 0
            struct_of_base_node = self.last_added_node_id
            while self.sample_add_operand_action():
                _, sub_type = self.generate_type()
                llvm_type.parts.append(sub_type)
                llvm_type.number += 1
                self.set_active_node(struct_of_base_node)
            self.structs.append(llvm_type)
            self.struct_nodes.append(node_id)
            self.active_llvm_container.get_node(node_id).label = self.structs.index(llvm_type)
        elif node_type == LLVM_NODE_TYPES.pointer_of:
            if predetermined_type is not None:
                _, sub_type = self.generate_type(predetermined_type=predetermined_type.parts[0])
            else:
                _, sub_type = self.generate_type()
            llvm_type.parts.append(sub_type)

        self.type_dict[starting_node] = llvm_type
        return node_id, llvm_type

    def generate_constant_value(self, edge_type = LLVM_EDGE_TYPES.op_0, omit_type = False, predetermined_type = None):
        # TODO connect base node to starting node immediately
        starting_node = self.last_added_node_id
        node_type = self.sample_add_const_value_node_action()
        base_node = None
        llvm_type = predetermined_type
        if node_type in [LLVM_NODE_TYPES.undef, LLVM_NODE_TYPES.zeroinitializer, LLVM_NODE_TYPES.null] + LLVM_NODE_TYPES.predicates:
            base_node = self.add_node(node_type)
            self.do_init_node_action()
            self.active_llvm_container.add_edge(starting_node, edge_type, base_node)
            if not omit_type and node_type not in LLVM_NODE_TYPES.predicates:
                _, llvm_type = self.generate_type(predetermined_type=predetermined_type)
            if node_type in LLVM_NODE_TYPES.predicates:
                llvm_type = LLVM_Type(node_type)
        elif node_type in LLVM_NODE_TYPES.integer_types + LLVM_NODE_TYPES.floating_point_types:
            if node_type in LLVM_NODE_TYPES.integer_types:
                init_number = int(round(self.sample_choose_number_action()))
            else:
                init_number = float(self.sample_choose_number_action())
            base_node = self.add_node(node_type, init_number)
            self.do_init_node_action(init_number)
            self.active_llvm_container.add_edge(starting_node, edge_type, base_node)
            llvm_type = LLVM_Type(node_type)
            llvm_type.number = init_number
        elif node_type in [LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.vector_of]:
            is_array = node_type == LLVM_NODE_TYPES.array_of
            # TODO check if the init_number stuff is correct
            init_number = -1
            if predetermined_type is not None:
                init_number = predetermined_type.number
            base_node, llvm_type = self.generate_list_value(is_array, edge_type, predetermined_type=predetermined_type, init_number=init_number)
        elif node_type in LLVM_NODE_TYPES.cast_const_expression_opcodes:
            base_node = self.add_node(node_type)
            self.do_init_node_action()
            self.active_llvm_container.add_edge(starting_node, edge_type, base_node)
            self.generate_operand(node_type, 0)
            _, llvm_type = self.generate_type()
        elif node_type in LLVM_NODE_TYPES.const_expression_opcodes:
            base_node = self.add_node(node_type)
            self.do_init_node_action()
            self.active_llvm_container.add_edge(starting_node, edge_type, base_node)
            index = 0
            sub_types = []
            while self.choose_add_operand_action(node_type, index):
                sub_llvm_type = self.generate_operand(node_type, index)
                sub_types.append(sub_llvm_type)
                index += 1
            llvm_type = self.calculate_type(node_type, sub_types)

        self.set_active_node(starting_node)
        self.active_llvm_container.get_node(base_node).llvm_type = llvm_type
        return base_node, node_type, llvm_type

    def generate_list_value(self, is_array, edge_type, predetermined_type = None, omit_type=False, init_number = -1):
        starting_node = self.last_added_node_id
        is_deterministic = predetermined_type is not None
        type_main_node = LLVM_NODE_TYPES.array_of if is_array else LLVM_NODE_TYPES.vector_of
        if is_deterministic:
            init_number = init_number
        else:
            init_number = int(self.sample_choose_structural_number_action())
        base_node = self.add_node(type_main_node, init_number)
        self.do_init_node_action(init_number)
        self.active_llvm_container.add_edge(starting_node, edge_type, base_node)
        list_base_node = self.last_added_node_id
        sub_type = predetermined_type
        if not omit_type:
            if predetermined_type:
                _, sub_type = self.generate_type(predetermined_type=predetermined_type.parts[0])
            else:
                _, sub_type = self.generate_type()
            self.set_active_node(list_base_node)

        return_type = LLVM_Type(type_main_node)
        return_type.number = init_number
        return_type.parts.append(sub_type)
        if sub_type.node_type in [LLVM_NODE_TYPES.array_of, LLVM_NODE_TYPES.vector_of]:
                for i in range(0, init_number):
                    sub_starting_node = self.last_added_node_id
                    sub_node_type = self.sample_add_const_value_node_action()
                    edge_type = LLVM_EDGE_TYPES.successor_list_element
                    if i == 0:
                        edge_type = LLVM_EDGE_TYPES.first_list_element
                    if sub_node_type == LLVM_NODE_TYPES.undef:
                        self.add_node(sub_node_type)
                        self.do_init_node_action()
                        self.active_llvm_container.add_edge(sub_starting_node, edge_type, self.last_added_node_id)
                    else:
                        sub_base_node, _ = self.generate_list_value(sub_type.node_type == LLVM_NODE_TYPES.array_of, edge_type, sub_type.parts[0], omit_type=True, init_number=sub_type.number)
                        self.set_active_node(sub_base_node)
        else:
            for i in range(0, init_number):
                edge_type = LLVM_EDGE_TYPES.successor_list_element
                if i == 0:
                    edge_type = LLVM_EDGE_TYPES.first_list_element
                sub_starting_node = self.last_added_node_id
                sub_base_node_id, sub_base_node_type, llvm_type = self.generate_constant_value(edge_type=edge_type, omit_type=True, predetermined_type=sub_type)
                self.internal_llvm_graph.get_node(sub_base_node_id).llvm_type = llvm_type
                self.set_active_node(sub_base_node_id, sub_base_node_type)

        self.set_active_node(starting_node)
        self.active_llvm_container.get_node(base_node).llvm_type = return_type
        return base_node, return_type


        #if type_main_node == LLVM_NODE_TYPES

    def generate_operand(self, opcode, op_number = 0, predetermined_type = None):
        reset_node = self.last_added_node_id
        is_var_op_opcode = opcode in LLVM_NODE_TYPES.var_ops
        if is_var_op_opcode:
            self.add_node(LLVM_NODE_TYPES.operand)
            self.do_init_node_action()
            self.active_llvm_container.add_edge(self.last_added_node_id, LLVM_EDGE_TYPES.op_multi_backwards, reset_node)
            reset_node = self.last_added_node_id
            op_number = 0

        is_operand_static = self.sample_is_operand_static_action()

        edge_type = get_class_value(LLVM_EDGE_TYPES, "op_" + str(op_number))
        if is_operand_static:
            _, _, llvm_type = self.generate_constant_value(edge_type=edge_type, predetermined_type=predetermined_type)
        else:
            end_node = self.sample_add_edge_to_action()
            llvm_type = self.internal_llvm_graph.get_node(end_node).llvm_type
            self.active_llvm_container.add_edge(reset_node, edge_type, end_node)

        self.set_active_node(reset_node)
        return llvm_type









# testing
import subprocess

class DummyInstruction():
    def __init__(self, opcode):
        self.opcode = opcode

def debug_create_type(isOp, node_type, op_number = None, prev_type = None):
    f = LLVM_Container()
    t = TypeCreator(f)
    sm = CreateTypeStateMachine()
    sm.update_struct_info({"0": 6})
    if isOp:
        sm.start_creating_operand_type(node_type, op_number, prev_type)
    else:
        sm.start_creating_target_type(node_type)
    next_number = 3
    for i in range(0, 100):
        sampled_add_node_action = ML_Model_Simulator.sample_add_node_action()
        if sm.get_state() in [CT_Internal_State.end, CT_Internal_State.error]:
            break
        verified_add_node_action = sm.verify(sampled_add_node_action)
        selected_node_type = np.argmax(verified_add_node_action)
        debug_node_type_name = LLVM_NODE_TYPES.get_name(selected_node_type)
        if selected_node_type == LLVM_NODE_TYPES.struct_of:
            next_number = 3
        if selected_node_type == LLVM_NODE_TYPES.struct:
            next_number = sm.get_next_number(ML_Model_Simulator.sample_choose_struct_action(1))
        elif selected_node_type in [LLVM_NODE_TYPES.vector_of, LLVM_NODE_TYPES.array_of]:
            next_number = sm.get_next_number(ML_Model_Simulator.sample_get_type_number_action())
        if selected_node_type == LLVM_NODE_TYPES.number:
            t.update(selected_node_type, next_number)
        else:
            t.update(selected_node_type)
        sm.update(selected_node_type, next_number)
    return t.get_type()

for j in range(0, 0):
    if(j % 1000 == 0): print(j)

    type1 = debug_create_type(False, LLVM_NODE_TYPES.none_type, 0)
    type_string = type1.to_string(True)
    '''if True:
        print(type_string)
        ga = GraphActionizer(debug=True)
        ga.create_add_function_action()
        ga.create_add_type_node_action(LLVM_NODE_TYPES.struct)
        label = ga.create_add_instruction_node_action(DummyInstruction("add"))
        ga.create_init_node_action(label)
        ga.construct_type(type1)
     


    print(LLVM_NODE_TYPES.get_num_ops(LLVM_NODE_TYPES.add))

    #type2 = debug_create_type(True, LLVM_NODE_TYPES.fptrunc, 1, type1)
    #type_string_2 = type2.to_string()

    #type3 = debug_create_type(True, LLVM_NODE_TYPES.select, 2, type2)
    #type_string_3 = type3.to_string()'''





'''code = "%struct.0 = " + type_string + "\ndefine i32 @main() #0 {\n\t%1 = add i32 undef, undef\n\tret i32 0\n}\ndeclare i32 @printf(i8*, ...)"
    cmd = ["/usr/bin/llvm-as-6.0"]
    #print(code + "\n")
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    _, stderr = process.communicate(code.encode('utf-8'))
    if stderr:
        print(stderr)
        print(type_string)'''


