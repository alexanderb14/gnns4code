import os
import pydot
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')

import utils


# Entity classes
class CodeGraph(object):
    """
    This class represents a code graph
    """
    def __init__(self):
        self.functions = []

        self.all_instructions = {}
        self.all_basic_blocks = {}

    def __eq__(self, other):
        if not len(self.functions) == len(other.functions):
            print('FAIL: len(self.functions) == len(other.functions): %i != %i' % (len(self.functions), len(other.functions)))
            return False

        if not all(self.functions[i] == other.functions[i] for i, _ in enumerate(self.functions)):
            print('FAIL: set(self.functions) == set(other.functions)')
            return False

        return True

    def visit(self, visitor: object) -> None:
        visitor.visit(self)
        for function in self.functions:
            function.visit(visitor)

        visitor.visit_end(self)


class Function(object):
    """
    This class represents a function
    """
    def __init__(self, name: str):
        self.name = name
        self.basic_blocks = []

    def __eq__(self, other):
        if not len(self.basic_blocks) == len(other.basic_blocks):
            print('FAIL: len(self.basic_blocks) == len(other.basic_blocks): %i != %i' % (len(self.basic_blocks), len(other.basic_blocks)))
            return False

        if not all(self.basic_blocks[i] == other.basic_blocks[i] for i, _ in enumerate(self.basic_blocks)):
            print('FAIL: set(self.basic_blocks) == set(other.basic_blocks)')
            return False

        return True

    def visit(self, visitor: object) -> None:
        visitor.visit(self)
        for basic_block in self.basic_blocks:
            basic_block.visit(visitor)

        visitor.visit_end(self)


class BasicBlock(object):
    """
    This class represents a basic block
    """
    def __init__(self, name: str):
        self.name = name
        self.instructions = []

    def __eq__(self, other):
        self_instructions = sorted(self.instructions, key=lambda k: (str(k.opcode), len(k.edges)))
        other_instructions = sorted(other.instructions, key=lambda k: (str(k.opcode), len(k.edges)))

        if not len(self_instructions) == len(other_instructions):
            print('FAIL: len(self.instructions) == len(other.instructions): %i != %i' % (len(self.instructions), len(other.instructions)))
            return False

        if not all(self_instructions[i] == other_instructions[i] for i, _ in enumerate(self.instructions)):
            print('FAIL: set(self.instructions) == set(other.instructions)')
            return False

        return True

    def visit(self, visitor: object) -> None:
        visitor.visit(self)
        for instruction in self.instructions:
            instruction.visit(visitor)

        visitor.visit_end(self)


class Instruction(object):
    """
    This class represents an instruction
    """
    def __init__(self, opcode):
        self.opcode = opcode
        self.edges = []

    def __eq__(self, other):
        self_edges = sorted(self.edges, key=lambda k: (str(k.type), str(k.dest.opcode)))
        other_edges = sorted(other.edges, key=lambda k: (str(k.type), str(k.dest.opcode)))

        if not len(self_edges) == len(other_edges):
            print('FAIL: len(self.edges) == len(other.edges): %i != %i' % (len(self_edges), len(other_edges)))
            return False

        if not self.opcode == other.opcode:
            print('FAIL: self.opcode == other.opcode: %s != %s' % (self.opcode, other.opcode))
            return False

        if not all(self_edges[i] == other_edges[i] for i, _ in enumerate(self_edges)):
            print('FAIL: set(self.edges) == set(other.edges)')
            return False

        return True

    def visit(self, visitor: object) -> None:
        visitor.visit(self)
        for cfg_edge in self.edges:
            cfg_edge.visit(visitor)
        visitor.visit_end(self)


class Edge(object):
    """
    This class represents an edge
    """
    def __init__(self, type: int, src: object, dest: object):
        self.type = type
        self.src = src
        self.dest = dest

    def __eq__(self, other):
        if not self.type == other.type:
            print('FAIL: self.type == other.type: %s %s' % (self.type, other.type))
            return False

        if not self.src.opcode == other.src.opcode:
            print('FAIL: self.src.opcode == other.src.opcode: %s != %s' % (self.src.opcode, other.src.opcode))
            return False

        if not self.dest.opcode == other.dest.opcode:
            print('FAIL: self.dest.opcode == other.dest.opcode: %s != %s' % (self.dest.opcode, other.dest.opcode))
            return False

        return True

    def visit(self, visitor: object) -> None:
        visitor.visit(self)
        visitor.visit_end(self)


# Visitor classes
class VisitorBase(object):
    """
    Base class for all visitors
    """
    def __init__(self):
        self.node_types = {}
        self.edge_types = {}

    def visit(self, obj: object) -> None:
        pass

    def visit_end(self, obj: object) -> None:
        pass

    def _get_id_for_node_type(self, name: str) -> int:
        return self._get_unique_id(self.node_types, name) + 1

    def _get_id_for_edge_type(self, name: str) -> int:
        if name == 'cfg':
            return 1
        elif name == 'dataflow':
            return 3
        elif name == 'call':
            return 5
        elif name == 'memaccess':
            return 7

    def _get_id_for_reverse_edge_type(self, name: str) -> int:
        if name == 'cfg':
            return 2
        elif name == 'dataflow':
            return 4
        elif name == 'call':
            return 6
        elif name == 'memaccess':
            return 8

    def _get_unique_id(self, map: dict, name: str) -> int:
        id = len(map)
        if name not in map:
            map[name] = {
                'id': id,
                'count': 0
            }

        map[name]['count'] += 1
        return map[name]['id']


class StatisticsVisitor(VisitorBase):
    """
    Visitor for gathering various statistics of a code graph
    """
    def __init__(self, debug: int = False):
        super(StatisticsVisitor, self).__init__()

        self.num_codegraphs = 0

        self.current_num_nodes = 0
        self.num_nodes = []

    def visit(self, obj: object) -> None:
        if isinstance(obj, CodeGraph):
            self.num_codegraphs += 1

            self.current_num_nodes = 0
            self.current_num_functions = 0

        if isinstance(obj, Instruction):
            self._get_id_for_node_type(obj.opcode)
            self.current_num_nodes += 1

        if isinstance(obj, Edge):
            self._get_id_for_edge_type(obj.type)

    def visit_end(self, obj: object):
        if isinstance(obj, CodeGraph):
            if self.current_num_nodes != 0:
                self.num_nodes.append(self.current_num_nodes)

    def get_current_num_nodes(self) -> int:
        return self.current_num_nodes

    def get_summary(self) -> dict:
        # Edge types are always the same and have a fixed order
        edge_types = ['', 'cfg', 'cfg', 'dataflow', 'dataflow', 'call', 'call', 'memaccess', 'memaccess', '', '']

        return {
            'node_types': self.node_types,
            'num_node_types': len(self.node_types),
            'edge_types': edge_types,
            'num_edge_types': len(self.edge_types),
            'num_nodes': utils.min_max_avg(self.num_nodes),
            'num_codegraphs': self.num_codegraphs
        }


class NodeInfoExtractionVisitor(VisitorBase):
    """
    Visitor for extracting node infos of a CodeGraph
    """
    def __init__(self, node_types_of_all_graphs, debug: int = False):
        super(NodeInfoExtractionVisitor, self).__init__()

        self.__node_types = {}
        self.__node_types_of_all_graphs = node_types_of_all_graphs

    def visit(self, obj: object) -> None:
        if isinstance(obj, Instruction):
            if obj.node_id not in self.__node_types:
                self.__node_types[obj.node_id] = self.__node_types_of_all_graphs[obj.opcode]['id']

    def get_node_types(self):
        ret = []
        for idx in range(0, max(self.__node_types, key=int)):
            if idx not in self.__node_types:
                raise Exception()

            if len(ret) > idx:
                raise Exception()

            ret.append(self.__node_types[idx])

        return ret


class EdgeExtractionVisitor(VisitorBase):
    """
    Visitor for extracting the edges of a CodeGraph
    """
    def __init__(self, edge_types: dict = None, debug: int = False):
        super(EdgeExtractionVisitor, self).__init__()

        self.edges = []
        self.edge_types = edge_types

    def visit(self, obj: object) -> None:
        if isinstance(obj, Edge):
            if obj.type == 'dataflow':
                src = obj.dest.node_id
                dest = obj.src.node_id
            else:
                src = obj.src.node_id
                dest = obj.dest.node_id

            edge_info = (src,
                         self.edge_types[obj.type] if self.edge_types else self._get_id_for_edge_type(obj.type),
                         dest)

            if edge_info not in self.edges:
                self.edges.append(edge_info)


class NodeIdCreateVisitor(VisitorBase):
    """
    Visitor for assigning incremental ids to instruction objects
    """
    def __init__(self, debug: int = False):
        super(NodeIdCreateVisitor, self).__init__()

        self.current_node_id = 0

    def visit(self, obj: object) -> None:
        if isinstance(obj, Instruction):
            obj.node_id = self.current_node_id
            self.current_node_id += 1


class OpcodeIdCreateVisitor(VisitorBase):
    """
    Visitor for mapping a string opcode to an int opcode_id and assigning it to each instruction
    """
    def __init__(self, node_types: dict, debug: int = False):
        super(OpcodeIdCreateVisitor, self).__init__()

        self.node_types = node_types

    def visit(self, obj: object) -> None:
        if isinstance(obj, Instruction):
            obj.opcode_id = self.node_types[obj.opcode]['id']


class CurrentBBStartIdCreateVisitor(VisitorBase):
    """
    Visitor for figuring out the node id of the current basic block and assigning it to each instruction
    """
    def __init__(self, debug: int = False):
        super(CurrentBBStartIdCreateVisitor, self).__init__()

        self.last_visit_has_been_basic_block = False
        self.current_bb_starts_at_this_node_id = 0

        self.is_first_basic_block = True
        self.last_seen_node_id = 0

    def visit(self, obj: object) -> None:
        if isinstance(obj, Instruction):
            if self.last_visit_has_been_basic_block:
                self.current_bb_starts_at_this_node_id = obj.node_id

                self.last_visit_has_been_basic_block = False

            obj.current_bb_starts_at_this_node_id = self.current_bb_starts_at_this_node_id
            self.last_seen_node_id = obj.node_id

            return

        if isinstance(obj, BasicBlock):
            self.last_visit_has_been_basic_block = True

            obj.current_bb_starts_at_this_node_id = self.current_bb_starts_at_this_node_id

            return

        obj.current_bb_starts_at_this_node_id = self.current_bb_starts_at_this_node_id

class ActionSequenceVisitor(VisitorBase):
    """
    Visitor for creating a graph-generating action sequence
    """
    def __init__(self, node_types: dict, edge_types: dict, debug: int = False):
        super(ActionSequenceVisitor, self).__init__()

        self.debug = debug
        self.node_types = node_types
        self.edge_types = edge_types

        self.edges_pending = {}

        self.actions = {}
        self.last_added_node_id = 0
        self.last_added_node_type = 0

        self.last_seen_basic_block_start_id = 0

        self.is_first_instruction = True

        # HERE
        self.terminator_node_type = 0 # len(self.node_types)

    def visit(self, obj: object) -> None:
        step_idx = len(self.actions)

        if isinstance(obj, Function):
            self.actions[step_idx] = {
                    utils.AE.ACTION:              utils.A.ADD_FUNCTION,
                    utils.L.LABEL_0:              1,
                    utils.AE.LAST_ADDED_NODE_ID:  self.last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                    utils.AE.SUBGRAPH_START:      obj.current_bb_starts_at_this_node_id
            }

            if self.debug:
                print('<add_function> \t\t\t\t\t %s' % str(self.actions[step_idx]))

        if isinstance(obj, BasicBlock):
            self.actions[step_idx] = {
                    utils.AE.ACTION:              utils.A.ADD_BASIC_BLOCK,
                    utils.L.LABEL_0:              1,
                    utils.AE.LAST_ADDED_NODE_ID:  self.last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                    utils.AE.SUBGRAPH_START:      obj.current_bb_starts_at_this_node_id
            }

            if self.debug:
                print('  <add_basic_block> \t\t\t %s' % str(self.actions[step_idx]))

        if isinstance(obj, Instruction):
            label = self._get_id_for_node_type(obj.opcode)
            self.actions[step_idx] = {
                    utils.AE.ACTION:                utils.A.ADD_NODE,
                    utils.L.LABEL_0:                label,
                    utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
                    utils.AE.SUBGRAPH_START:        obj.current_bb_starts_at_this_node_id
            }
            if self.debug:
                print('    <add_node (type %i)> \t\t %s' % (label, str(self.actions[step_idx])))
            step_idx = step_idx + 1

            if self.is_first_instruction:
                self.is_first_instruction = False
            else:
                self.last_added_node_id += 1
            self.last_added_node_type = self._get_id_for_node_type(obj.opcode)

            label = self._get_id_for_node_type(obj.opcode)
            self.actions[step_idx] = {
                    utils.AE.ACTION:                utils.A.INIT_NODE,
                    utils.L.LABEL_0:                label,
                    utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
                    utils.AE.SUBGRAPH_START:        obj.current_bb_starts_at_this_node_id
            }
            if self.debug:
                print('    <init_node> \t\t %s' % (str(self.actions[step_idx])))
            step_idx = step_idx + 1


            self.last_seen_basic_block_start_id = obj.current_bb_starts_at_this_node_id

            # If there are any pending edges
            if self.last_added_node_id in self.edges_pending:
                for edge_info in self.edges_pending[self.last_added_node_id]:
                    end_node = edge_info[utils.L.LABEL_0]
                    type_id = edge_info[utils.L.LABEL_1]

                    self.actions[step_idx] = {
                        utils.AE.ACTION:                utils.A.ADD_EDGE,
                        utils.L.LABEL_0:                1,
                        utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                        utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
                        utils.AE.SUBGRAPH_START:        obj.current_bb_starts_at_this_node_id
                    }
                    if self.debug:
                        print('      <add_edge> \t\t\t\t %s' % str(self.actions[step_idx]))
                    step_idx += 1

                    self.actions[step_idx] = {
                        utils.AE.ACTION:                utils.A.ADD_EDGE_TO,
                        utils.L.LABEL_0:                end_node,
                        utils.L.LABEL_1:                type_id,
                        utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                        utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
                        utils.AE.SUBGRAPH_START:        obj.current_bb_starts_at_this_node_id
                    }
                    if self.debug:
                        print('      <add_edge_to %i (type: %i)>  %s' % (end_node, type_id, str(self.actions[step_idx])))
                    step_idx += 1

                self.edges_pending.pop(self.last_added_node_id)

        if isinstance(obj, Edge):
            # Problem: Destination nodes might not exist yet
            # Therefore, check if destination node exists
            end_node = obj.dest.node_id
            if end_node < self.last_added_node_id:
                type_id = self._get_id_for_edge_type(obj.type)

                self.actions[step_idx] = {
                        utils.AE.ACTION:                utils.A.ADD_EDGE,
                        utils.L.LABEL_0:                1,
                        utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                        utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
                        utils.AE.SUBGRAPH_START:        obj.current_bb_starts_at_this_node_id
                }
                if self.debug:
                    print('      <add_edge> \t\t\t\t %s' % str(self.actions[step_idx]))
                step_idx += 1

                self.actions[step_idx] = {
                        utils.AE.ACTION:                utils.A.ADD_EDGE_TO,
                        utils.L.LABEL_0:                end_node,
                        utils.L.LABEL_1:                type_id,
                        utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                        utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
                        utils.AE.SUBGRAPH_START:        obj.current_bb_starts_at_this_node_id
                }
                if self.debug:
                    print('      <add_edge_to %i (type: %i)>  %s' % (end_node, type_id, str(self.actions[step_idx])))
                step_idx += 1

            # If not, add to edges_pending and add later when the node is created with
            # a reverse edge type
            else:
                if end_node not in self.edges_pending:
                    self.edges_pending[end_node] = []

                type_id = self._get_id_for_reverse_edge_type(obj.type)
                self.edges_pending[end_node].append({
                    utils.L.LABEL_0:                self.last_added_node_id,
                    utils.L.LABEL_1:                type_id
                })

    def visit_end(self, obj: object) -> None:
        step_idx = len(self.actions)

        if isinstance(obj, CodeGraph):
            self.actions[step_idx] = {
                    utils.AE.ACTION:              utils.A.ADD_FUNCTION,
                    utils.L.LABEL_0:              0,
                    utils.AE.LAST_ADDED_NODE_ID:  self.last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                    utils.AE.SUBGRAPH_START:      obj.current_bb_starts_at_this_node_id
            }
            if self.debug:
                print('<not_add_function> \t\t %s' % str(self.actions[step_idx]))

        if isinstance(obj, Function):
            self.actions[step_idx] = {
                    utils.AE.ACTION:              utils.A.ADD_BASIC_BLOCK,
                    utils.L.LABEL_0:              0,
                    utils.AE.LAST_ADDED_NODE_ID:  self.last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                    utils.AE.SUBGRAPH_START:      self.last_seen_basic_block_start_id
            }
            if self.debug:
                print('  <not_add_basic_block> \t %s' % str(self.actions[step_idx]))

        if isinstance(obj, BasicBlock):
            self.actions[step_idx] = {
                    utils.AE.ACTION:                utils.A.ADD_NODE,
                    utils.L.LABEL_0:                self.terminator_node_type,
                    utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                    utils.AE.SUBGRAPH_START:        self.last_seen_basic_block_start_id,
                    utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
            }
            if self.debug:
                print('    <not_add_node> \t\t %s' % str(self.actions[step_idx]))

        if isinstance(obj, Instruction):
            self.actions[step_idx] = {
                    utils.AE.ACTION:                utils.A.ADD_EDGE,
                    utils.L.LABEL_0:                0,
                    utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
                    utils.AE.SUBGRAPH_START:        obj.current_bb_starts_at_this_node_id
            }
            if self.debug:
                print('      <not_add_edge> \t\t\t %s' % str(self.actions[step_idx]))

    def get_actions_sequence(self) -> dict:
        return self.actions


class DotGraphVisitor(VisitorBase):
    """
    Visitor for creating a PNG dot-graph
    """
    def __init__(self, debug: int = False):
        super(DotGraphVisitor, self).__init__()

        self.debug = debug

        self.fns = []
        self.bbs = []
        self.instrs = []

        self.dot = pydot.Dot(graph_type="digraph", compound="true")

    def visit(self, obj: object) -> None:
        if isinstance(obj, Function):
            fn_name = 'fn_' + str(len(self.fns))

            cluster = pydot.Cluster(fn_name, label=fn_name)
            self.dot.add_subgraph(cluster)

            self.fns.append(cluster)

        if isinstance(obj, BasicBlock):
            last_fn = self.fns[-1]
            bb_name = 'bb_' + str(len(self.bbs))

            cluster = pydot.Cluster(bb_name, label=bb_name)
            last_fn.add_subgraph(cluster)

            self.bbs.append(cluster)

        if isinstance(obj, Instruction):
            last_bb = self.bbs[-1]
            instr_name = 'inst_' + str(obj.node_id)

            instr_opname = obj.opcode

            if instr_opname == 'load' or instr_opname == 'store':
                color = "green"
            else:
                color = "black"

            if self.debug:
                node = pydot.Node(instr_name, label=instr_opname, xlabel=str(obj.node_id) + ':'  + str(round(obj.prop, 2)), color=color)
            else:
                node = pydot.Node(instr_name, label=instr_opname, color=color)

            last_bb.add_node(node)

            self.instrs.append(node)

        if isinstance(obj, Edge):
            from_name = 'inst_' + str(obj.src.node_id)
            to_name = 'inst_' + str(obj.dest.node_id)

            if obj.type == 'dataflow':
                color = "blue"
            elif obj.type == 'call':
                color = "red"
            elif obj.type == 'memaccess':
                color = "green"
            else:
                color = "black"

            if self.debug:
                self.dot.add_edge(pydot.Edge(from_name, to_name, xlabel=str(round(obj.prop, 2)), color=color))
            else:
                self.dot.add_edge(pydot.Edge(from_name, to_name, color=color))

    def save_to(self, filename: str, filetype: str) -> None:
        try:
            self.dot.write_raw('/tmp/graph.dot')
            (graph,) = pydot.graph_from_dot_file('/tmp/graph.dot')
            if filetype == 'png':
                graph.write_png(filename)
            elif filetype == 'pdf':
                graph.write_pdf(filename)
        except:
            print('except')


class ValidationCheckVisitor(VisitorBase):
    """
    Visitor for performing several validation checks on a CodeGraph
    """
    def __init__(self, debug: int = False):
        super(ValidationCheckVisitor, self).__init__()

        self.all_last_instrs_br_or_ret = True
        self.all_instrs_reachable = True
        self.all_bb_instrs_cfg_edge_reachable = True

        self.more_than_zero_instructions = False

    def visit(self, obj: object) -> None:
        if isinstance(obj, CodeGraph):
            # Check if all instructions in CodeGraph are connected with edges
            instrs_all = obj.all_instructions
            if len(instrs_all) == 0:
                self.all_instrs_reachable = False
                return

            instr_entry = instrs_all[0]
            instrs_to_explore = [instr_entry]
            instrs_seen = [instr_entry]
            while len(instrs_to_explore) != 0:
                instr_current = instrs_to_explore.pop(0)
                for edge in instr_current.edges:
                    if edge.dest not in instrs_seen:
                        instrs_to_explore.append(edge.dest)
                        instrs_seen.append(edge.dest)

            if len(instrs_all) != len(instrs_seen):
                self.all_instrs_reachable = False

        if isinstance(obj, BasicBlock):
            # Check if last element of each BB is br or ret
            if len(obj.instructions) == 0:
                self.all_last_instrs_br_or_ret = False
                return

            instr_last = obj.instructions[-1].opcode
            if instr_last != 'br' and instr_last != 'ret':
                self.all_last_instrs_br_or_ret = False

            # Check if all instructions in a BasicBlock are connected with edges
            instrs_all = obj.instructions
            if len(instrs_all) == 0:
                self.all_instrs_reachable = False
                return

            instr_entry = instrs_all[0]
            instrs_to_explore = [instr_entry]
            instrs_seen = [instr_entry]
            while len(instrs_to_explore) != 0:
                instr_current = instrs_to_explore.pop(0)
                for edge in instr_current.edges:
                    if edge.dest not in instrs_seen and edge.dest in instrs_all and (edge.type == 'cfg' or edge.type == 'call'):
                        instrs_to_explore.append(edge.dest)
                        instrs_seen.append(edge.dest)

            if len(instrs_all) != len(instrs_seen):
                self.all_bb_instrs_cfg_edge_reachable = False

        if isinstance(obj, Instruction):
            # Check if more than 0 instructions
            self.more_than_zero_instructions = True


class FeatureExtractionVisitor(VisitorBase):
    """
    Visitor for extraction of partial features (4/5 )according to the paper
    "Portable Mapping of Data Parallel Programs to OpenCL for Heterogeneous Systems" by Grewe et al.
    """
    def __init__(self, debug: int = False):
        super(FeatureExtractionVisitor, self).__init__()

        # LLVM instructions
        self.terminator_instructions =      ['ret', 'br', 'switch', 'indirectbr', 'invoke',
                                            'resume', 'catchswitch', 'catchret', 'cleanupret',
                                            'unreachable']
        self.binary_instructions =          ['add', 'fadd', 'sub', 'fsub', 'mul', 'fmul', 'udiv',
                                            'sdiv', 'fdiv', 'urem', 'srem', 'frem',
                                            'shl', 'lshr', 'ashr', 'and', 'or', 'xor']
        self.binary_bitwise_instructions =  ['extractelement', 'insertelement', 'shufflevector']
        self.aggregate_instructions =       ['extractvalue', 'insertvalue']
        self.memory_instructions =          ['alloca', 'load', 'store', 'fence', 'cmpxchg',
                                            'atomicrmw', 'getelementptr']
        self.conversion_instructions =      ['trunc', 'zext', 'sext', 'fptrunc', 'fpext', 'fptoui',
                                             'fptosi', 'uitofp', 'sitofp', 'ptrtoint', 'inttoptr',
                                             'bitcast', 'addrspacecast']
        self.rational_instructions =        ['icmp', 'fcmp']
        self.misc_instructions =            ['phi', 'select', 'call', 'va_arg', 'landingpad',
                                             'catchpad', 'cleanuppad']
        self.branching_instructions =       ['br']

        self.num_compute_operations = 0
        self.num_vector_operations = 0
        self.num_rational_operations = 0
        self.num_memory_operations = 0
        self.num_branching_operations = 0

    def visit(self, obj: object) -> None:
        if isinstance(obj, Instruction):
            if obj.opcode in self.binary_instructions + self.binary_bitwise_instructions:
                self.num_compute_operations += 1

            if obj.opcode in self.rational_instructions:
                self.num_rational_operations += 1

            if obj.opcode in self.memory_instructions:
                self.num_memory_operations += 1

            if obj.opcode in self.branching_instructions:
                self.num_branching_operations += 1

    def get_summary(self) -> dict:
        return {
            'num_compute_operations': self.num_compute_operations,
            'num_vector_operations': self.num_vector_operations,
            'num_rational_operations': self.num_rational_operations,
            'num_memory_operations': self.num_memory_operations,
            'num_branching_operations': self.num_branching_operations
        }


# Functions
def __get_edge_dests_by_type(edges, type):
    """
    Filters edges by a given type
    """
    edges_filtered = []
    for edge in edges:
        if edge.type == type:
            edges_filtered.append(edge.dest)

    return edges_filtered


def codegraphs_create_from_miner_output(jRoot: dict) -> object:
    """
    Creates CodeGraphs and associated domain objects by parsing the output of the LLVM miner pass
    """

    cgs = []
    for fn_name, fn_obj in jRoot['functions'].items():
        cg = CodeGraph()

        fn = Function(fn_name)
        cg.functions.append(fn)

        entry_instr_id = fn_obj['basic blocks'][fn_obj['entry block']]['entry instruction']

        # Create BBs and instructions
        for bb_name, bb_obj in fn_obj['basic blocks'].items():
            bb = BasicBlock(bb_name)
            fn.basic_blocks.append(bb)
            cg.all_basic_blocks[bb_name] = bb

            # Create all instructions
            for instr_obj in fn_obj['instructions']:
                if instr_obj['basic block'] == bb_name:
                    instr_id = instr_obj['id']

                    instr = Instruction(instr_obj['opcode'])
                    bb.instructions.append(instr)
                    cg.all_instructions[instr_id] = instr

                    # If neccessary, assign entry instruction
                    if instr_id == entry_instr_id:
                        fn.entry_instr = instr

                    # If neccessary, create call target node and edge
                    if instr_obj['calls'] != '':
                        instr_calltarget = Instruction(instr_obj['calls'])
                        bb.instructions.append(instr_calltarget)

                        edge = Edge('call', instr, instr_calltarget)
                        instr.edges.append(edge)

        # Create CFG edges between instructions
        instrs_by_bb = {}
        for instr_obj in fn_obj["instructions"]:
            bb_name = instr_obj['basic block']
            instr_id = instr_obj['id']

            if bb_name not in instrs_by_bb:
                instrs_by_bb[bb_name] = []
            instrs_by_bb[bb_name].append(instr_id)
        for bb_name, bb_obj in fn_obj['basic blocks'].items():
            instrs = instrs_by_bb[bb_name]

            for i in range(0, len(instrs) - 1):
                if i <= len(cg.all_instructions):
                    instr_from = cg.all_instructions[instrs[i]]
                    instr_to = cg.all_instructions[instrs[i + 1]]

                    edge = Edge('cfg', instr_from, instr_to)
                    instr_from.edges.append(edge)

        # Create CFG edges between BBs
        for bb_name, bb_obj in fn_obj['basic blocks'].items():
            for bb_succ_name in bb_obj["successors"]:
                instr_from_id = instrs_by_bb[bb_name][-1]
                instr_from = cg.all_instructions[instr_from_id]
                instr_to_id = instrs_by_bb[bb_succ_name][0]
                instr_to = cg.all_instructions[instr_to_id]

                edge = Edge('cfg', instr_from, instr_to)
                instr_from.edges.append(edge)

        # Create dataflow edges
        for bb_name, bb_obj in fn_obj['basic blocks'].items():
            for instr_obj in fn_obj['instructions']:
                if instr_obj['basic block'] == bb_name:
                    instr_to_id = instr_obj['id']
                    instr_to = cg.all_instructions[instr_to_id]

                    for operand_id in instr_obj['operands']:
                        instr_from_id = operand_id
                        instr_from = cg.all_instructions[instr_from_id]

                        edge = Edge('dataflow', instr_from, instr_to)
                        instr_from.edges.append(edge)

        # Create memory access edges
        for mem_access_obj in fn_obj['memory accesses']:
            instr_to_id = mem_access_obj['inst']
            if instr_to_id != -1:
                instr_to = cg.all_instructions[instr_to_id]

                for dep_idx in mem_access_obj['dependencies']:
                    instr_from_id = fn_obj['memory accesses'][dep_idx]['inst']
                    if instr_from_id != -1:
                        instr_from = cg.all_instructions[instr_from_id]

                        edge = Edge('memaccess', instr_from, instr_to)
                        instr_from.edges.append(edge)
        cgs.append(cg)

    return cgs


def save_dot_graph(graph: object, filename: str, filetype: str, debug: bool = False):
    # Create node ids
    nic_vstr = NodeIdCreateVisitor()
    graph.visit(nic_vstr)

    # Create dot graph
    dog_vstr = DotGraphVisitor(debug)
    graph.visit(dog_vstr)

    dog_vstr.save_to(filename, filetype)


def reorder(graph, search_policy: str, debug: bool = False):
    """
    Reorders a CodeGraph to meet a BFS/DFS across the CFG edges. In case of ambiguities,
    a alphabetic order is applied.
    """
    # Find entry instruction
    assert len(graph.functions) == 1
    instr_entry = graph.functions[0].entry_instr

    # Annotate nodes with order
    order_idx = 0

    instructions_todo = [instr_entry]

    visited = []
    while len(instructions_todo) != 0:
        # Get current
        if search_policy == 'BFS':
            instruction_current = instructions_todo.pop(0)
        elif search_policy == 'DFS':
            instruction_current = instructions_todo.pop()
        visited.append(id(instruction_current))

        instruction_current.order_idx = order_idx
        order_idx += 1

        # Expand
        instruction_current_dests = __get_edge_dests_by_type(instruction_current.edges, 'cfg')
        instruction_current_dests_new = []
        for instruction_current_dest in sorted(instruction_current_dests, key=lambda x: x.opcode, reverse=True):
            if id(instruction_current_dest) not in visited:
                instruction_current_dests_new.append(instruction_current_dest)

        instructions_todo += instruction_current_dests_new

    # Sort graph structure
    bbs = graph.functions[0].basic_blocks
    for i in range(len(bbs)):
        for j in range(len(bbs) - 1 - i):
            if bbs[j].instructions[0].order_idx > bbs[j+1].instructions[0].order_idx:
                bbs[j], bbs[j+1] = bbs[j+1], bbs[j]

    return graph


def codegraph_to_action_sequence(graph, node_types, edge_types, debug: bool = False):
    """
    Generates a graph-generating sequence, taking a CodeGraph and a mapping of node and
    edge types to IDs as input
    """
    # Create node ids
    node_id_vstr = NodeIdCreateVisitor(debug)
    graph.visit(node_id_vstr)

    # Create opcode ids
    opcode_id_vstr = OpcodeIdCreateVisitor(node_types, debug)
    graph.visit(opcode_id_vstr)

    # Create basic block ids
    bb_id_vstr = CurrentBBStartIdCreateVisitor(debug)
    graph.visit(bb_id_vstr)

    # Actionize
    action_vstr = ActionSequenceVisitor(node_types, edge_types, debug)
    graph.visit(action_vstr)
    actions = action_vstr.get_actions_sequence()

    print(graph.name)
    print('Total length of action sequence: %i' % len(actions))

    return actions
