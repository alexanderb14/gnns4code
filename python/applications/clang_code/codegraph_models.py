import collections
import os
import pydot
import sys

import utils


LHS_UNARY_OPERATORS = ['*', '&', '!', '+', '-']
LITERAL_NAMES = ['IntegerLiteral', 'FloatLiteral', 'CharacterLiteral']


# Helper functions
def get_id_for_edge_type(name: str) -> int:
    if name == 'AST':
        return 0
    elif name == 'LIVE':
        return 1

def get_id_for_reverse_edge_type(name: str) -> int:
    if name == 'AST':
        return 2
    elif name == 'LIVE':
        return 3

def is_forward_edge_type(edge_type_id) -> bool:
    if edge_type_id == 0 or edge_type_id == 1:
        return True
    else:
        return False

def get_edge_name_by_edge_type(edge_type_id) -> str:
    if edge_type_id == 0 or edge_type_id == 2:
        return 'AST'
    elif edge_type_id == 1 or edge_type_id == 3:
        return 'LIVE'

def sort_edges_conforming_c_syntax(edges_in):
    if len(edges_in) == 0:
        return []

    edges_AST = []
    edges_LIVE = []

    for edge in edges_in:
        if edge.type == 'AST':
            edges_AST.append(edge)
        elif edge.type == 'LIVE':
            edges_LIVE.append(edge)

    if edges_in[0].src.name in ['BinaryOperator', 'CompoundAssignOperator']:
        if len(edges_AST) == 0 and edges_LIVE[0].dest.name in LITERAL_NAMES:
            edges_LIVE = [edges_LIVE[1], edges_LIVE[0]]

        if len(edges_AST) == 1:
            if edges_LIVE[0].dest.name in LITERAL_NAMES:
                return edges_AST + edges_LIVE
            else:
                return edges_LIVE + edges_AST

        if len(edges_AST) == 2 and edges_AST[0].dest.name =='CallExpr':
            edges_AST = [edges_AST[1], edges_AST[0]]

        return edges_AST + edges_LIVE
    else:
        return edges_LIVE + edges_AST

# Entity classes
class CodeGraph(object):
    """
    This class represents a code graph
    """
    def __init__(self):
        self.functions = []

        self.has_complex_types = False

    def accept(self, visitor: object, sorting_function=None) -> None:
        visitor.visit(self)
        for function in self.functions:
            function.accept(visitor, sorting_function)
        visitor.visit_end(self)


class Function(object):
    """
    This class represents a function
    """
    def __init__(self):
        self.name = 'Function'
        self.specifics = {}

        self.all_statements = []
        # self.all_cfg_blocks = []
        self.edges = []

        self.function_node_type = -1
        self.node_id = -1

        self.is_first = True

    def accept(self, visitor: object, sorting_function=None) -> None:
        if sorting_function:
            edges = sorting_function(self.edges)
        else:
            edges = self.edges

        visitor.visit(self)

        # AST
        for edge in edges:
            if edge.type == 'AST':
                edge.accept(visitor, sorting_function)

        # # CFG
        # for cfg_block in self.all_cfg_blocks:
        #     cfg_block.accept(visitor)

        visitor.visit_end(self)

    def get_root_statement(self):
        for edge in self.edges:
            if edge.dest.name == 'CompoundStmt':
                return edge.dest

    def get_arguments(self):
        arguments = []

        for edge in self.edges:
            if edge.dest.name == 'FunctionArgument':
                arguments.append(edge.dest)

        return arguments

    def apply_action(self, action: dict, node_types: dict):
        if action[utils.AE.ACTION] == utils.A.ADD_NODE:
            node_type_id = action[utils.L.LABEL_0]

            if self.is_first:
                self.is_first = False

                node_type = ''
                specifics = {}
                for _, nt in node_types.items():
                    if nt['id'] == node_type_id:
                        node_type = nt['name']
                        specifics = nt['specifics']

                self.name = node_type
                self.specifics = specifics
            else:
                node_type = ''
                specifics = {}
                for _, nt in node_types.items():
                    if nt['id'] == node_type_id:
                        node_type = nt['name']
                        specifics = nt['specifics']

                stmt = Statement(node_type)
                stmt.specifics = specifics

                if utils.AE.PROBABILITY in action:
                    stmt.probability = action[utils.AE.PROBABILITY]
                    stmt.p_pick = action[utils.AE.PROBABILITY][node_type_id]

                stmt.step_idx = len(self.all_statements)

                self.all_statements.append(stmt)

        elif action[utils.AE.ACTION] == utils.A.ADD_EDGE_TO:
            if len(self.all_statements) == 0:
                return

            edge_type_id = action[utils.L.LABEL_1]
            edge_type = get_edge_name_by_edge_type(edge_type_id)

            src = self.all_statements[-1]

            dest_node_id = action[utils.L.LABEL_0]
            if dest_node_id == 0:
                dest = self
            else:
                dest = self.all_statements[dest_node_id-1]

            if is_forward_edge_type(edge_type_id):
                edge = Edge(edge_type, src, dest)
                src.edges.append(edge)
            else:
                edge = Edge(edge_type, dest, src)
                dest.edges.append(edge)

class Statement(object):
    """
    This class represents a statement
    """
    def __init__(self, name):
        self.name = name
        self.specifics = {}

        self.edges = []

        self.node_id = 1337

    def accept(self, visitor: object, sorting_function=None) -> None:
        if sorting_function:
            edges = sorting_function(self.edges)
        else:
            edges = self.edges

        visitor.visit(self)

        for edge_idx, edge in enumerate(edges):
            edge.accept(visitor, sorting_function)

            if edge_idx < len(self.edges) - 1:
                visitor.visit_intermediate(self, edge)

        visitor.visit_end(self)

# class CFGBlock(object):
#     def __init__(self):
#         self.edges = []
#
#     def accept(self, visitor:object) -> None:
#         visitor.visit(self)

class Edge(object):
    """
    This class represents an edge
    """
    def __init__(self, type: int, src: object, dest: object):
        self.type = type
        self.src = src
        self.dest = dest

    def accept(self, visitor: object, sorting_function=None) -> None:
        visitor.visit(self)

        if self.type == 'AST' \
                or (self.type == 'LIVE' and self.dest.name == 'IntegerLiteral'):
            self.dest.accept(visitor, sorting_function)

        visitor.visit_end(self)


# Visitor classes
class VisitorBase(object):
    """
    Base class for all visitors
    """
    def visit(self, obj: object) -> None:
        pass

    def visit_intermediate(self, obj: object, edge: object) -> None:
        pass

    def visit_end(self, obj: object) -> None:
        pass

class StatisticsVisitor(VisitorBase):
    """
    Visitor for gathering various statistics of a code graph
    """
    def __init__(self, debug: int = False):
        super(StatisticsVisitor, self).__init__()

        self.num_nodes = 0

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement) or isinstance(obj, Function):
            self.num_nodes += 1

class DFSNodeIdCreateVisitor(VisitorBase):
    """
    Visitor for assigning incremental ids to node objects
    """
    def __init__(self, debug: int = False):
        super(DFSNodeIdCreateVisitor, self).__init__()

        self.current_node_id = 0

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement) or isinstance(obj, Function):
            obj.node_id = self.current_node_id
            self.current_node_id += 1

class EdgeIdxCreateVisitor(VisitorBase):
    """
    Visitor for assigning ids to edge objects
    """
    def __init__(self, debug: int = False):
        super(EdgeIdxCreateVisitor, self).__init__()

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement) or isinstance(obj, Function):
            edge_idxs = {}

            for edge in obj.edges:
                if 'type' not in edge_idxs:
                    edge_idxs['type'] = 0
                else:
                    edge_idxs['type'] += 1

                edge.idx = edge_idxs['type']

class NodeRankCreateVisitor(VisitorBase):
    def __init__(self, debug: int = False):
        super(NodeRankCreateVisitor, self).__init__()

    def visit(self, obj: object) -> None:
        if isinstance(obj, Function):
            obj.rank = 0

            for edge in obj.edges:
                if edge.type == 'AST':
                    statement = edge.dest
                    statement.rank = 1

        if isinstance(obj, Statement):
            for edge in obj.edges:
                if edge.type == 'AST' or (edge.type == 'LIVE' and edge.dest.name == 'IntegerLiteral'):
                    statement = edge.dest
                    statement.rank = obj.rank + 1

class RankNeighborsCreateVisitor(VisitorBase):
    def __init__(self, debug: int = False):
        super(RankNeighborsCreateVisitor, self).__init__()

        self.last_node_of_rank = {}
        self.first_node_of_rank = {}

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement) or isinstance(obj, Function):
            if obj.rank not in self.last_node_of_rank:
                self.last_node_of_rank[obj.rank] = obj
                self.first_node_of_rank[obj.rank] = obj
            else:
                self.last_node_of_rank[obj.rank].rank_next = obj
                self.last_node_of_rank[obj.rank] = obj

            # Statements might have the rank_next attribute from a previous iteration of the
            # graph transformer. Therefore: delete if attribute exists
            if hasattr(obj, 'rank_next'):
                del obj.rank_next

class IntegerLiteralLiveEdgeCreateVisitor(VisitorBase):
    def __init__(self, debug: int = False):
        super(IntegerLiteralLiveEdgeCreateVisitor, self).__init__()
        self.debug = debug

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement):
            for edge in obj.edges:
                if edge.type == 'AST':
                    if edge.dest.name == 'IntegerLiteral':
                        new_edge = Edge('LIVE', obj, edge.dest)
                        obj.edges.append(new_edge)

                        obj.edges.remove(edge)

class FunctionNameResolvingVisitor(VisitorBase):
    """
    Visitor for resolving function names. In the live analysis, function names are subject to
    liveness too. This visitor dissolves this and makes function names own entities.
    """
    def __init__(self, debug: int = False):
        super(FunctionNameResolvingVisitor, self).__init__()
        self.debug = debug

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement):
            for edge in obj.edges:
                if edge.type == 'LIVE' \
                        and obj.name == 'DeclRefExpr' \
                        and edge.dest.name == 'DeclRefExpr' \
                        and 'function_name' in edge.dest.specifics:

                        obj.specifics['function_name'] = edge.dest.specifics['function_name']
                        obj.edges.remove(edge)

class EliminationVisitor(VisitorBase):
    """
    Visitor for eliminating nodes and maintaining the relationships
    """
    def __init__(self, to_eliminate, debug: int = False):
        super(EliminationVisitor, self).__init__()
        self.debug = debug

        self.to_eliminate = to_eliminate

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement):
            for edge in obj.edges:
                if edge.type == 'AST' and edge.dest.name in self.to_eliminate:
                    if 'function_name' in edge.dest.specifics:
                        obj.specifics['function_name'] = edge.dest.specifics['function_name']

                    obj.edges.remove(edge)
                    for child_edge in edge.dest.edges:
                        new_edge = Edge(child_edge.type, obj, child_edge.dest)
                        obj.edges.append(new_edge)

class DotGraphVisitor(VisitorBase):
    """
    Visitor for creating a PNG dot-graph
    """
    def __init__(self, node_types, debug: int = False):
        super(DotGraphVisitor, self).__init__()
        self.debug = debug
        self.node_types = node_types

        self.rank_subraphs = {}
        # self.cfg_subgraph = None
        self.ast_subgraph = None

        self.dot = pydot.Dot(graph_type="digraph", rankdir="TB")

        self.ast_subgraph = pydot.Cluster('ast', label="AST", style="invis")
        self.dot.add_subgraph(self.ast_subgraph)

        # self.cfg_subgraph = pydot.Cluster('cfg', label="CFG", style="invis")
        # self.dot.add_subgraph(self.cfg_subgraph)

    def visit(self, obj: object) -> None:
        if isinstance(obj, Function):
            # Create function node
            function_display_name = self._build_node_name(obj)
            node = pydot.Node('node_0', label=function_display_name, color="black", shape='box')

            subgraph = pydot.Subgraph(rank='same')
            subgraph.add_node(node)
            self.ast_subgraph.add_subgraph(subgraph)

            # Add edges
            for edge in obj.edges:
                from_name = 'node_' + str(edge.src.node_id)
                to_name = 'node_' + str(edge.dest.node_id)

                if edge.type == 'LIVE':
                    color = "blue"
                    from_name, to_name = to_name, from_name
                    constraint = False
                elif edge.type == 'AST':
                    color = "black"
                    constraint = True

                self.ast_subgraph.add_edge(pydot.Edge(from_name, to_name, color=color, constraint=constraint))

        if isinstance(obj, Statement):
            # Get or create subgraph
            if obj.rank not in self.rank_subraphs:
                self.rank_subraphs[obj.rank] = pydot.Subgraph(rank='same', rankdir="LR")
                self.ast_subgraph.add_subgraph(self.rank_subraphs[obj.rank])
            subgraph = self.rank_subraphs[obj.rank]

            # Create node
            node_name = 'node_' + str(obj.node_id)
            node_display_name = self._build_node_name(obj)
            node = pydot.Node(node_name, label=node_display_name, color="black", shape='box')

            subgraph.add_node(node)

            # Add invisible edges to enforce node order
            if hasattr(obj, 'rank_next'):
                from_name = 'node_' + str(obj.node_id)
                to_name = 'node_' + str(obj.rank_next.node_id)
                self.ast_subgraph.add_edge(pydot.Edge(from_name, to_name, color='green' if self.debug else 'invis'))

            # Add edges
            for edge in obj.edges:
                from_name = 'node_' + str(edge.src.node_id)
                to_name = 'node_' + str(edge.dest.node_id)

                if edge.type == 'LIVE':
                    color = "blue"
                    from_name, to_name = to_name, from_name
                    constraint = False
                elif edge.type == 'AST':
                    color = "black"
                    constraint = True

                if self.debug:
                    self.ast_subgraph.add_edge(pydot.Edge(from_name, to_name, color=color, xlabel=str(edge.idx), constraint=constraint))
                else:
                    self.ast_subgraph.add_edge(pydot.Edge(from_name, to_name, color=color, constraint=constraint))

        # if isinstance(obj, CFGBlock):
        #     # Create node
        #     node_name = 'node_' + str(obj.node_id)
        #     node = pydot.Node(node_name, label="BB", color="black", shape="circle")
        #     self.cfg_subgraph.add_node(node)
        #
        #     # Add edges
        #     for edge in obj.edges:
        #         from_name = 'node_' + str(edge.src.node_id)
        #         to_name = 'node_' + str(edge.dest.node_id)
        #
        #         if edge.type == 'CFG':
        #             color = "red"
        #         elif edge.type == 'BB':
        #             color = "grey"
        #
        #         if isinstance(edge.src, Statement) or isinstance(edge.dest, Statement):
        #             constraint = False
        #         else:
        #             constraint = True
        #         self.dot.add_edge(pydot.Edge(from_name, to_name, color=color, constraint=constraint))

    def _build_node_name(self, obj: object):
        ret = str(obj.name)

        if hasattr(obj, 'specifics'):
            ret += '\l' + str(obj.specifics)

        if self.debug:
            if hasattr(obj, 'node_type_id'):
                ret = 'node_type_id: ' + str(obj.node_type_id) + '\l' + ret

            if hasattr(obj, 'node_id'):
                ret = 'node_id: ' + str(obj.node_id) + '\l' + ret

            if hasattr(obj, 'step_idx'):
                ret = 'step_idx: ' + str(obj.step_idx) + '\l' + ret

            if hasattr(obj, 'p_pick'):
                ret = 'p_pick: ' + '%.2f' % obj.p_pick + '\l' + ret

            # Print top most likely node types
            if hasattr(obj, 'probability'):
                # Convert probability array to indexed dict and sort it
                p = {k: v for k, v in enumerate(obj.probability)}
                p_sorted_keys = sorted(p.items(), key=lambda kv: kv[1], reverse=True)
                p_sorted = collections.OrderedDict(p_sorted_keys)

                top_p_str = ''
                pos = 0
                for i, p in p_sorted.items():
                    pos += 1
                    if pos == 5:
                        break

                    node_type_name = ''
                    for _, nt in self.node_types.items():
                        if nt['id'] == i:
                            node_type_name = nt['name']
                            break
                    top_p_str += '%.2f %s\l' % (p, node_type_name)

                ret = top_p_str + ret

        return ret

    def save_to(self, filename: str, filetype: str) -> None:
        self.dot.write_raw('/tmp/graph.dot')
        (graph,) = pydot.graph_from_dot_file('/tmp/graph.dot')

        if filetype == 'png':
            graph.write_png(filename)
        elif filetype == 'pdf':
            graph.write_pdf(filename)
        elif filetype == 'dot':
            graph.write_dot(filename)

class CodeGenVisitor(VisitorBase):
    """
    Visitor for code generation
    """
    def __init__(self, num_visits_limit: int, debug: int = False):
        super(CodeGenVisitor, self).__init__()

        self.num_visits_limit = num_visits_limit

        self.variable_ids = {}
        self.num_visits = 0

        self.ret_type = '<type>'
        self.function_name = 'A'
        self.arguments = []
        self.body = []

        self.statement_positions = {}

    def visit(self, obj: object) -> None:
        self._inc_and_check_num_visits()

        if isinstance(obj, Function):
            # Return type
            self.ret_type = obj.specifics['type']

            # Arguments
            for argument in obj.get_arguments():
                arg_type = argument.specifics['type']
                arg_id = self._get_id_for_declaration(argument)

                self.arguments.append(arg_type + ' ' + arg_id)

        if isinstance(obj, Statement):
            if obj.name == 'ArraySubscriptExpr':
                pass

            elif obj.name == 'BinaryOperator':
                pass

            elif obj.name == 'CallExpr':
                function_name = obj.specifics['function_name']
                self.body.append(function_name + '(')

            elif obj.name == 'CharacterLiteral':
                self.body.append('"H"')

            elif obj.name == 'CompoundAssignOperator':
                pass

            elif obj.name == 'CompoundStmt':
                self.body.append('{')

            elif obj.name == 'DeclStmt':
                decl_type = obj.specifics['type']
                decl_id = self._get_id_for_declaration(obj)

                if len(obj.edges) == 0:
                    self.body.append(decl_type + ' ' + decl_id)
                else:
                    self.body.append(decl_type + ' ' + decl_id + ' = ')

            elif obj.name == 'ForStmt':
                self.body.append('for (')

            elif obj.name == 'FunctionArgument':
                pass

            elif obj.name == 'IfStmt':
                self.body.append('if (')

            elif obj.name == 'IntegerLiteral':
                pass

            elif obj.name == 'ParenExpr':
                self.body.append('(')

            elif obj.name == 'ReturnStmt':
                self.body.append('return')

            elif obj.name == 'UnaryOperator':
                operator = obj.specifics['operator']
                if operator in LHS_UNARY_OPERATORS:
                    self.body.append(operator)

            elif obj.name == 'WhileStmt':
                self.body.append('while (')

            else:
                raise Exception('Unknown statement: %s' % obj.name)

        if isinstance(obj, Edge):
            if obj.type == "LIVE":
                var_id = self._get_id_for_declaration(obj.dest)
                self.body.append(var_id)

    def visit_intermediate(self, obj: object, edge: object) -> None:
        self._inc_and_check_num_visits()

        if isinstance(obj, Statement):
            if obj.name == 'ArraySubscriptExpr':
                pos = self._get_and_increment_statement_position('ArraySubscriptExpr_%i' % id(obj))

                self.body.append('[')

            elif obj.name == 'BinaryOperator':
                operator = obj.specifics['operator']
                self.body.append(operator)

            elif obj.name == 'CallExpr':
                self.body.append(',')

            elif obj.name == 'CompoundAssignOperator':
                operator = obj.specifics['operator']
                self.body.append(operator)

            elif obj.name == 'CompoundStmt':
                if edge.dest.name in ['ForStmt', 'WhileStmt']:
                    return
                self.body.append(';')

            elif obj.name == 'ForStmt':
                pos = self._get_and_increment_statement_position('ForStmt_%i' % id(obj))
                if pos == 0 or pos == 1:
                    self.body.append(';')
                elif pos == 2:
                    self.body.append(')')

            elif obj.name == 'IfStmt':
                pos = self._get_and_increment_statement_position('IfStmt_%i' % id(obj))
                if pos == 0:
                    self.body.append(')')
                elif pos == 1:
                    if edge.dest.name != 'CompoundStmt':
                        self.body.append(';')
                    self.body.append('else')

            elif obj.name == 'WhileStmt':
                pos = self._get_and_increment_statement_position('WhileStmt_%i' % id(obj))
                if pos == 0:
                    self.body.append(')')

    def visit_end(self, obj: object) -> None:
        self._inc_and_check_num_visits()

        if isinstance(obj, Statement):
            self._reset_statement_position(obj.name)

            if obj.name == 'ArraySubscriptExpr':
                self.body.append(']')

            elif obj.name == 'CallExpr':
                self.body.append(')')

            elif obj.name == 'CompoundStmt':
                self.body.append(';')
                self.body.append('}')

            elif obj.name == 'ForStmt':
                last_edge = obj.edges[-1]
                if last_edge.dest.name != 'CompoundStmt':
                    self.body.append(';')

            elif obj.name == 'IfStmt':
                last_edge = obj.edges[-1]
                if last_edge.dest.name != 'CompoundStmt':
                    self.body.append(';')

            elif obj.name == 'ParenExpr':
                self.body.append(')')

            elif obj.name == 'UnaryOperator':
                operator = obj.specifics['operator']
                if operator not in LHS_UNARY_OPERATORS:
                    self.body.append(operator)

            elif obj.name == 'WhileStmt':
                last_edge = obj.edges[-1]
                if last_edge.dest.name != 'CompoundStmt':
                    self.body.append(';')

    def get_code_as_str(self):
        ret_type_str = self.ret_type
        arguments_str = ', '.join(self.arguments)
        body_str = ' '.join(self.body)

        return ret_type_str + ' ' \
               + self.function_name + \
               '(' + arguments_str + ') ' + \
               body_str

    def _inc_and_check_num_visits(self):
        self.num_visits += 1
        if self.num_visits > self.num_visits_limit:
            raise Exception('num_visits_limit exceeded: %i' % self.num_visits)

    def _get_id_for_declaration(self, declaration):
        if declaration.name == 'IntegerLiteral':
            return declaration.specifics['value']

        if declaration not in self.variable_ids:
            self.variable_ids[declaration] = 'var_' + str(len(self.variable_ids) + 1)
        return self.variable_ids[declaration]

    def _get_and_increment_statement_position(self, statement):
        if statement not in self.statement_positions:
            self.statement_positions[statement] = 0
            return 0

        self.statement_positions[statement] += 1

        return self.statement_positions[statement]

    def _reset_statement_position(self, statement):
        if statement in self.statement_positions:
            del self.statement_positions[statement]

class NodeTypeIdCreateVisitor(VisitorBase):
    """
    Visitor for assigning unique ids to nodes
    """
    def __init__(self, with_functionnames: bool = True, with_callnames: bool = True):
        super(NodeTypeIdCreateVisitor, self).__init__()

        self.with_functionnames = with_functionnames
        self.with_callnames = with_callnames
        self.node_type_ids_by_statements = {}

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement) or isinstance(obj, Function):
            classname = obj.__class__.__name__

            if classname == 'Function' and self.with_functionnames == False:
                key_hashed = hash((classname, utils.freeze_dict(obj.specifics)))
            elif obj.name == 'CallExpr' and self.with_callnames == False:
                key_hashed = hash((obj.name))
            elif obj.name == 'IntegerLiteral':
                key_hashed = hash((obj.name))
            else:
                specifics = obj.specifics
                if 'function_name' in specifics:
                    del specifics['function_name']
                key_hashed = hash((obj.name, utils.freeze_dict(specifics)))

            # Add to map
            if key_hashed in self.node_type_ids_by_statements:
                self.node_type_ids_by_statements[key_hashed]['count'] += 1
            else:
                self.node_type_ids_by_statements[key_hashed] = {
                    # id is incremented by 1 because type 0 is reserved as terminator type
                    'id': len(self.node_type_ids_by_statements) + 1,
                    'classname': classname,
                    'name': obj.name,
                    'specifics': obj.specifics,
                    'count': 1
                }

            # Assign node id
            obj.node_type_id = self.node_type_ids_by_statements[key_hashed]['id']

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
            if obj.type == 'LIVE':
                src = obj.dest.node_id
                dest = obj.src.node_id
            else:
                src = obj.src.node_id
                dest = obj.dest.node_id

            edge_info = (src,
                         self.edge_types[obj.type] if self.edge_types else get_id_for_edge_type(obj.type),
                         dest)

            if edge_info not in self.edges:
                self.edges.append(edge_info)

class NodeInfoExtractionVisitor(VisitorBase):
    """
    Visitor for extracting node infos of a CodeGraph
    """
    def __init__(self, debug: int = False):
        super(NodeInfoExtractionVisitor, self).__init__()

        self.__node_types = {}
        self.__node_values = {}

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement) or isinstance(obj, Function):
            if obj.node_id not in self.__node_types:
                self.__node_types[obj.node_id] = obj.node_type_id

            if 'value' in obj.specifics:
                if obj.node_id not in self.__node_values:
                    self.__node_values[obj.node_id] = int(obj.specifics['value'])

    def node_types(self):
        ret = []
        for idx in range(0, max(self.__node_types.keys()) + 1):
            if idx not in self.__node_types:
                raise Exception()

            if len(ret) > idx:
                raise Exception()

            ret.append(self.__node_types[idx])

        return ret

    def node_values(self):
        ret = []
        for i in range(0, max(list(self.__node_types.keys()))):
            if i in self.__node_values:
                ret.append(self.__node_values[i])
            else:
                ret.append(0)

        return ret

class StmtNameQueryVisitor(VisitorBase):
    """
    Visitor for querying the names of all statements of a graph
    """
    def __init__(self):
        super(StmtNameQueryVisitor, self).__init__()

        self.statement_names = set()

    def visit(self, obj: object) -> None:
        if isinstance(obj, Statement):
            statement_name = obj.name

            self.statement_names.add(statement_name)

class ActionSequenceVisitor(VisitorBase):
    """
    Visitor for creating a graph-generating action sequence
    """
    def __init__(self, debug: int = False):
        super(ActionSequenceVisitor, self).__init__()

        self.debug = debug
        self.actions = {}

        self.edges_pending = {}

        self.last_added_node_id = 0
        self.is_first_node = True

    def visit(self, obj: object) -> None:
        step_idx = len(self.actions)

        if isinstance(obj, Statement) or isinstance(obj, Function):
            label = obj.node_type_id
            self.actions[step_idx] = {
                    utils.AE.ACTION:                utils.A.ADD_NODE,
                    utils.L.LABEL_0:                label,
            }
            if self.debug:
                print('    <add_node (type %i)> \t\t %s' % (label, str(self.actions[step_idx])))

            if self.is_first_node:
                self.is_first_node = False
            else:
                self.last_added_node_id += 1

            # Add edges if there are any pending for the current node id
            if self.last_added_node_id in self.edges_pending:
                for edge_info in self.edges_pending[self.last_added_node_id]:
                    end_node = edge_info[utils.L.LABEL_0]
                    type_id = edge_info[utils.L.LABEL_1]

                    self.actions[step_idx] = {
                        utils.AE.ACTION: utils.A.ADD_EDGE,
                        utils.L.LABEL_0: 1,
                    }
                    if self.debug:
                        print('      <add_edge> \t\t\t\t %s' % str(self.actions[step_idx]))
                    step_idx += 1

                    self.actions[step_idx] = {
                        utils.AE.ACTION: utils.A.ADD_EDGE_TO,
                        utils.L.LABEL_0: end_node,
                        utils.L.LABEL_1: type_id,
                    }
                    if self.debug:
                        print('      <add_edge_to %i (type: %i)>  %s' % (
                        end_node, type_id, str(self.actions[step_idx])))
                    step_idx += 1

                self.edges_pending.pop(self.last_added_node_id)

        if isinstance(obj, Edge):
            # Problem: Destination nodes might not exist yet
            # Therefore, check if destination node exists
            end_node = obj.dest.node_id
            if end_node < last_added_node_id:
                type_id = get_id_for_edge_type(obj.type)

                self.actions[step_idx] = {
                    utils.AE.ACTION: utils.A.ADD_EDGE,
                    utils.L.LABEL_0: 1,
                }
                if self.debug:
                    print('      <add_edge> \t\t\t\t %s' % str(self.actions[step_idx]))
                step_idx += 1

                self.actions[step_idx] = {
                    utils.AE.ACTION: utils.A.ADD_EDGE_TO,
                    utils.L.LABEL_0: end_node,
                    utils.L.LABEL_1: type_id,
                }
                if self.debug:
                    print('      <add_edge_to %i (type: %i)>  %s' % (end_node, type_id, str(self.actions[step_idx])))
                step_idx += 1

            # If not, add to edges_pending and add later when the node is created with
            # a reverse edge type
            else:
                if end_node not in self.edges_pending:
                    self.edges_pending[end_node] = []

                type_id = get_id_for_reverse_edge_type(obj.type)
                self.edges_pending[end_node].append({
                    utils.L.LABEL_0:                self.last_added_node_id,
                    utils.L.LABEL_1:                type_id
                })

    def visit_end(self, obj: object) -> None:
        step_idx = len(self.actions)

        if isinstance(obj, Function):
            label = obj.node_type_id
            self.actions[step_idx] = {
                    utils.AE.ACTION:                utils.A.ADD_NODE,
                    utils.L.LABEL_0:                0,
            }
            if self.debug:
                print('    <not_add_node (type %i)> \t\t %s' % (label, str(self.actions[step_idx])))

        if isinstance(obj, Statement):
            self.actions[step_idx] = {
                    utils.AE.ACTION:                utils.A.ADD_EDGE,
                    utils.L.LABEL_0:                0,
            }
            if self.debug:
                print('      <not_add_edge> \t\t\t %s' % str(self.actions[step_idx]))


# Functions
def transform_graph(graph: object) -> object:
    # Add live edges to IntegerLiteral nodes
    ill_vstr = IntegerLiteralLiveEdgeCreateVisitor()
    for i in range(0, 10):
        graph.accept(ill_vstr)

    fnres_vstr = FunctionNameResolvingVisitor()
    graph.accept(fnres_vstr)

    # Eliminate nodes
    ele_vstr = EliminationVisitor(['ImplicitCastExpr', 'DeclRefExpr'])

    nic_vstr = DFSNodeIdCreateVisitor()
    graph.accept(nic_vstr)
    num_nodes = nic_vstr.current_node_id

    previous_num_nodes = -1

    # Do until fixpoint is reached
    while num_nodes != previous_num_nodes:
        nic_vstr = DFSNodeIdCreateVisitor()
        graph.accept(nic_vstr)
        previous_num_nodes = nic_vstr.current_node_id

        graph.accept(ele_vstr)

        nic_vstr = DFSNodeIdCreateVisitor()
        graph.accept(nic_vstr)
        num_nodes = nic_vstr.current_node_id

    # # Eliminate CFG nodes that don't have BB references
    # for function in graph.functions:
    #     if len(function.all_cfg_blocks) > 0:
    #         # Create predecessor lookup map
    #         predecessors = {}
    #         for cfg_block in function.all_cfg_blocks:
    #             for edge in cfg_block.edges:
    #                 if edge.type == 'CFG':
    #                     if edge.dest not in predecessors:
    #                         predecessors[edge.dest] = []
    #                     predecessors[edge.dest].append(edge)
    #
    #         # Eliminate
    #         all_cfg_blocks_new = []
    #         for cfg_block in function.all_cfg_blocks:
    #             bb_edges = []
    #             for edge in cfg_block.edges:
    #                 if edge.type == 'BB':
    #                     bb_edges.append(edge)
    #
    #             # Get succ cfg edges
    #             succ_cfg_edges = []
    #             for edge in cfg_block.edges:
    #                 if edge.type == 'CFG':
    #                     succ_cfg_edges.append(edge)
    #
    #             # Get pred cfg edges
    #             if cfg_block in predecessors:
    #                 pred_cfg_edges = predecessors[cfg_block]
    #             else:
    #                 pred_cfg_edges = []
    #
    #             if len(bb_edges) == 0 and len(succ_cfg_edges) == 1:
    #                 if len(succ_cfg_edges) == 1:
    #                     succ_cfg_edge = succ_cfg_edges[0]
    #
    #                     for pred_cfg_edge in pred_cfg_edges:
    #                         pred_cfg_edge.dest = succ_cfg_edge.dest
    #             else:
    #                 all_cfg_blocks_new.append(cfg_block)
    #
    #         function.all_cfg_blocks = all_cfg_blocks_new

    return graph

def save_dot_graph(graph: object, filename: str, filetype: str, node_types: dict, debug: bool = False):
    # Assign node ids
    assign_node_ids_in_bfs_order(graph)
    # for function in graph.functions:
    #     num_statements = len(function.all_statements)
    #
    #     for i, cfg_block in enumerate(function.all_cfg_blocks):
    #         cfg_block.node_id = num_statements + i


    # Assign edge idx
    eic_vstr = EdgeIdxCreateVisitor()
    graph.accept(eic_vstr)

    # Create dot Graph
    rnk_vstr = NodeRankCreateVisitor()
    graph.accept(rnk_vstr)

    rnkn_vstr = RankNeighborsCreateVisitor()
    graph.accept(rnkn_vstr)

    dg_vstr = DotGraphVisitor(node_types, debug)
    graph.accept(dg_vstr)
    dg_vstr.save_to(filename, filetype)

def assign_node_ids_in_bfs_order(graph: object):
    # Rank nodes according to their distance to the root node
    rnk_vstr = NodeRankCreateVisitor()
    graph.accept(rnk_vstr)

    rnkn_vstr = RankNeighborsCreateVisitor()
    graph.accept(rnkn_vstr)

    # Create a list of nodes to process in this order
    nodes = []
    for rank, first_node in rnkn_vstr.first_node_of_rank.items():
        current_node = first_node

        while True:
            nodes.append(current_node)

            if not hasattr(current_node, 'rank_next'):
                break
            current_node = current_node.rank_next

    for idx, node in enumerate(nodes):
        node.node_id = idx
    num_nodes = len(nodes)

    # for function in graph.functions:
    #     for idx, cfg_block in enumerate(function.all_cfg_blocks):
    #         cfg_block.node_id = idx + num_nodes

def get_node_types(graphs, with_functionnames, with_callnames):
    nic_vstr = NodeTypeIdCreateVisitor(with_functionnames=with_functionnames, with_callnames=with_callnames)

    if type(graphs) == list:
        for graph in graphs:
            graph.accept(nic_vstr)
    elif type(graphs) == dict:
        for _, graph in graphs.items():
            graph.accept(nic_vstr)

    node_types = nic_vstr.node_type_ids_by_statements

    return node_types

def graph_to_export_format(graph):
    # Extract node infos
    ni_vstr = NodeInfoExtractionVisitor()
    graph.accept(ni_vstr)
    nodes = ni_vstr.node_types()
    node_values = ni_vstr.node_values()

    # Extract edges
    ee_vstr = EdgeExtractionVisitor(edge_types={'AST': 0, 'LIVE': 1})
    graph.accept(ee_vstr)
    edges = ee_vstr.edges

    graph_export = {
        utils.T.NODES: nodes,
        utils.T.NODE_VALUES: node_values,
        utils.T.EDGES: edges
    }

    return graph_export

def create_action_sequence(graph: object, debug: bool = False):
    # Assign node ids
    assign_node_ids_in_bfs_order(graph)

    # Rank nodes according to their distance to the root node
    rnk_vstr = NodeRankCreateVisitor()
    graph.accept(rnk_vstr)

    rnkn_vstr = RankNeighborsCreateVisitor()
    graph.accept(rnkn_vstr)

    # Create a list of nodes to process in this order
    nodes = []
    for rank, first_node in rnkn_vstr.first_node_of_rank.items():
        current_node = first_node

        while True:
            nodes.append(current_node)

            if not hasattr(current_node, 'rank_next'):
                break
            current_node = current_node.rank_next

    if debug:
        for node in nodes:
            print(node.rank, node.name)

    # Create action sequence from list of nodes
    actions = {}
    edges_pending = {}
    step_idx = 0
    last_added_node_id = 0
    last_added_node_type = 0
    is_first_node = True

    for node in nodes:
        # Add node
        ##########
        label = node.node_type_id
        actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_NODE,
            utils.L.LABEL_0: label,
            utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
        }
        if debug:
            print('    <add_node (type %i)> \t\t %s' % (label, str(actions[step_idx])))
        step_idx += 1

        if is_first_node:
            is_first_node = False
        else:
            last_added_node_id += 1
        last_added_node_type = node.node_type_id

        # Init node
        ##########
        label = node.node_type_id
        actions[step_idx] = {
            utils.AE.ACTION: utils.A.INIT_NODE,
            utils.L.LABEL_0: label,
            utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
        }
        if debug:
            print('    <init_node> \t\t %s' % str(actions[step_idx]))
        step_idx += 1

        # Add edges if there are any pending for the current node id
        if last_added_node_id in edges_pending:
            for edge_info in edges_pending[last_added_node_id]:
                end_node = edge_info[utils.L.LABEL_0]
                type_id = edge_info[utils.L.LABEL_1]

                actions[step_idx] = {
                    utils.AE.ACTION: utils.A.ADD_EDGE,
                    utils.L.LABEL_0: 1,
                    utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
                }
                if debug:
                    print('      <add_edge> \t\t\t\t %s' % str(actions[step_idx]))
                step_idx += 1

                actions[step_idx] = {
                    utils.AE.ACTION: utils.A.ADD_EDGE_TO,
                    utils.L.LABEL_0: end_node,
                    utils.L.LABEL_1: type_id,
                    utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
                }
                if debug:
                    print('      <add_edge_to %i (type: %i)>  %s' % (
                    end_node, type_id, str(actions[step_idx])))
                step_idx += 1

            edges_pending.pop(last_added_node_id)

        # Add edges
        ###########
        for edge in node.edges:
            # Problem: Destination nodes might not exist yet
            # Therefore, check if destination node exists
            end_node = edge.dest.node_id
            if end_node < last_added_node_id:
                type_id = get_id_for_edge_type(edge.type)

                actions[step_idx] = {
                    utils.AE.ACTION: utils.A.ADD_EDGE,
                    utils.L.LABEL_0: 1,
                    utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
                }
                if debug:
                    print('      <add_edge> \t\t\t\t %s' % str(actions[step_idx]))
                step_idx += 1

                actions[step_idx] = {
                    utils.AE.ACTION: utils.A.ADD_EDGE_TO,
                    utils.L.LABEL_0: end_node,
                    utils.L.LABEL_1: type_id,
                    utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
                }
                if debug:
                    print('      <add_edge_to %i (type: %i)>  %s' % (end_node, type_id, str(actions[step_idx])))
                step_idx += 1

            # If not, add to edges_pending and add later when the node is created with
            # a reverse edge type
            else:
                if end_node not in edges_pending:
                    edges_pending[end_node] = []

                type_id = get_id_for_reverse_edge_type(edge.type)
                edges_pending[end_node].append({
                    utils.L.LABEL_0:                last_added_node_id,
                    utils.L.LABEL_1:                type_id,
                    utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
                    utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
                })

        # Edge Terminator
        actions[step_idx] = {
                utils.AE.ACTION:                utils.A.ADD_EDGE,
                utils.L.LABEL_0:                0,
                utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
                utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
        }
        if debug:
            print('      <not_add_edge> \t\t\t %s' % str(actions[step_idx]))
        step_idx += 1

    # Node Terminator
    actions[step_idx] = {
            utils.AE.ACTION:                utils.A.ADD_NODE,
            utils.L.LABEL_0:                0,
            utils.AE.LAST_ADDED_NODE_ID: last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: last_added_node_type,
    }
    if debug:
        print('    <not_add_node (type %i)> \t\t %s' % (0, str(actions[step_idx])))
    step_idx += 1

    if debug:
        print('Total length of action sequence: %i' % len(actions))

    return actions

def create_graph_from_action_sequence(actions: dict, node_types: dict):
    cg = CodeGraph()

    fn = Function()
    cg.functions.append(fn)

    for step_idx, action in actions.items():
        fn.apply_action(action, node_types)

    return cg

def are_graphs_equal(graph1, graph2) -> bool:
    def check_edges(edges1, edges2):
        if len(edges1) != len(edges2):
            return False

        ok = True
        for edge1 in edges1:
            # Find in other edge list. This is because permutations in the edge set are unavoidable
            edge2 = None
            for e in edges2:
                if e.dest.node_id == edge1.dest.node_id:
                    edge2 = e

            if edge2 == None:
                return False

            if edge1.dest.name != edge2.dest.name or edge1.dest.node_id != edge2.dest.node_id:
                return False

            if check_edges(edge1.dest.edges, edge2.dest.edges) == False:
                ok = False

        return ok

    #
    # Assign node ids
    assign_node_ids_in_bfs_order(graph1)
    assign_node_ids_in_bfs_order(graph2)

    if len(graph1.functions) != len(graph2.functions):
        return False

    for f_idx, _ in enumerate(graph1.functions):
        function1 = graph1.functions[f_idx]
        function2 = graph2.functions[f_idx]

        if check_edges(function1.edges, function2.edges) == False:
            return False

    return True

def is_graph_in_statement_names_whitelist(graph, statement_names) -> bool:
    snq_vstr = StmtNameQueryVisitor()
    graph.accept(snq_vstr)
    for statement_name in snq_vstr.statement_names:
        if statement_name not in statement_names:
            print('Failed because of:', statement_name)
            return False

    return True

def codegraphs_create_from_miner_output(jRoot: dict, with_cfg: bool=False) -> list:
    """
    Creates a CodeGraph and associated domain objects by parsing the output of the Clang miner pass
    """
    CLANG_SCALAR_TYPES = ['int*', 'blockPtr', 'objCPtr', 'memberPtr', 'bool', 'int', 'float', 'complexInt', 'complexFloat', 'someComplexType']

    cgs = []
    for jFunction in jRoot['functions']:
        cg = CodeGraph()

        # Create function
        function = Function()
        function.name = jFunction['name']
        if jFunction['type'] == -1:
            function.specifics['type'] = 'void'
        else:
            function.specifics['type'] = CLANG_SCALAR_TYPES[jFunction['type']]
        cg.functions.append(function)

        # Create arguments
        if jFunction['arguments'] is not None:
            for node_obj in jFunction['arguments']:
                stmt = Statement(node_obj['name'])

                if stmt.name == 'FunctionArgument':
                    if node_obj['type'] == -1:
                        cg.has_complex_types = True
                    stmt.specifics['type'] = CLANG_SCALAR_TYPES[node_obj['type']]
                    stmt.rank = 0

                stmt_from = function
                stmt_to = stmt

                edge = Edge('AST', stmt_from, stmt_to)
                stmt_from.edges.append(edge)

        # Create statements
        for node_obj in jFunction['body']:
            stmt = Statement(node_obj['name'])

            # Specific statement information
            if stmt.name == 'DeclRefExpr' and 'function_name' in node_obj:
                stmt.specifics['function_name'] = node_obj['function_name']
            if stmt.name == 'DeclStmt':
                if node_obj['type'] == -1:
                    cg.has_complex_types = True
                stmt.specifics['type'] = CLANG_SCALAR_TYPES[node_obj['type']]
            if stmt.name == 'IntegerLiteral':
                stmt.specifics['value'] = node_obj['value']
            if stmt.name == 'UnaryOperator' or stmt.name == 'BinaryOperator' or stmt.name == 'CompoundAssignOperator':
                stmt.specifics['operator'] = node_obj['operator']

            function.all_statements.append(stmt)

            if node_obj['is_root']:
                stmt_from = function
                stmt_to = stmt

                edge = Edge('AST', stmt_from, stmt_to)
                stmt_from.edges.append(edge)

        # Create AST edges
        for node_idx, node_obj in enumerate(jFunction['body']):
            stmt_from = function.all_statements[node_idx]

            if 'ast_relations' in node_obj:
                for stmt_to_idx in node_obj['ast_relations']:
                    stmt_to = function.all_statements[stmt_to_idx]

                    edge = Edge('AST', stmt_from, stmt_to)
                    stmt_from.edges.append(edge)

        # Create Liveness edges for statements
        for node_idx, node_obj in enumerate(jFunction['body']):
            stmt_from = function.all_statements[node_idx]

            if 'liveness_relations' in node_obj:
                for stmt_to_idx in node_obj['liveness_relations']:
                    stmt_to = function.all_statements[stmt_to_idx]

                    edge = Edge('LIVE', stmt_to, stmt_from)
                    stmt_to.edges.append(edge)

        # Create Liveness edges for arguments
        if jFunction['arguments'] is not None:
            for node_idx, node_obj in enumerate(jFunction['arguments']):
                all_arguments = function.get_arguments()
                stmt_from = all_arguments[node_idx]

                if 'liveness_relations' in node_obj:
                    for stmt_to_idx in node_obj['liveness_relations']:
                        stmt_to = function.all_statements[stmt_to_idx]

                        edge = Edge('LIVE', stmt_to, stmt_from)
                        stmt_to.edges.append(edge)
        cgs.append(cg)

        # CFG
        if with_cfg:
            if jFunction['cfg_blocks'] is not None:
                # Create CFG blocks
                for cfg_block_idx, cfg_block_obj in enumerate(jFunction['cfg_blocks']):
                    cfg_block = CFGBlock()
                    function.all_cfg_blocks.append(cfg_block)

                # Create CFG edges
                for cfg_block_idx, cfg_block_obj in enumerate(jFunction['cfg_blocks']):
                    block_from = function.all_cfg_blocks[cfg_block_idx]

                    # Between CFG blocks
                    if 'successors' in cfg_block_obj:
                        for cfg_block_to_idx in cfg_block_obj['successors']:
                            block_to = function.all_cfg_blocks[cfg_block_to_idx]

                            edge = Edge('CFG', block_from, block_to)
                            block_from.edges.append(edge)

                    # Between CFG blocks and statements
                    if 'statements' in cfg_block_obj:
                        for stmt_to_idx in cfg_block_obj['statements']:
                            stmt_to = function.all_statements[stmt_to_idx]

                            edge = Edge('BB', stmt_to, block_from)
                            block_from.edges.append(edge)

    return cgs
