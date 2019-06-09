import os
import pydot
import sys
import re

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')
import graphgen.utils as utils
from collections import defaultdict


# Entity classes
class CodeGraph(object):
    """
    This class represents a code graph
    """
    def __init__(self):
        self.functions = []
        self.global_variables = []
        self.structs = []
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

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for global_var in self.global_variables:
            global_var.accept(visitor)
        for struct in self.structs:
            struct.accept(visitor)
        for function in self.functions:
            function.accept(visitor)

        visitor.visit_end(self)

class Function(object):
    """
    This class represents a function
    """
    def __init__(self, name: str, is_declaration: bool, llvm_type: str):
        self.name = name
        self.basic_blocks = []
        self.args = dict()
        self.is_declaration = is_declaration
        self.llvm_type = llvm_type

    '''def __eq__(self, other):
        if not len(self.basic_blocks) == len(other.basic_blocks):
            print('FAIL: len(self.basic_blocks) == len(other.basic_blocks): %i != %i' % (len(self.basic_blocks), len(other.basic_blocks)))
            return False

        if not all(self.basic_blocks[i] == other.basic_blocks[i] for i, _ in enumerate(self.basic_blocks)):
            print('FAIL: set(self.basic_blocks) == set(other.basic_blocks)')
            return False

        return True'''

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for arg in self.args:
            self.args[arg].accept(visitor)
        for basic_block in self.basic_blocks:
            basic_block.accept(visitor)

        visitor.visit_end(self)

class BasicBlock(object):
    """
    This class represents a basic block
    """
    def __init__(self, name: str):
        self.name = name
        self.instructions = []

    '''def __eq__(self, other):
        self_instructions = sorted(self.instructions, key=lambda k: (str(k.opcode), len(k.edges)))
        other_instructions = sorted(other.instructions, key=lambda k: (str(k.opcode), len(k.edges)))

        if not len(self_instructions) == len(other_instructions):
            print('FAIL: len(self.instructions) == len(other.instructions): %i != %i' % (len(self.instructions), len(other.instructions)))
            return False

        if not all(self_instructions[i] == other_instructions[i] for i, _ in enumerate(self.instructions)):
            print('FAIL: set(self.instructions) == set(other.instructions)')
            return False

        return True'''

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for instruction in self.instructions:
            instruction.accept(visitor)

        visitor.visit_end(self)

    def create_label(self, label: int):
        self.label = label

class Struct(object):
    def __init__(self, id: int, name: str = None, types: list = None):
        self.id = id;
        self.name = name
        self.types = types
        self.is_opaque = True
        if types:
            self.is_opaque = False

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        visitor.visit_end(self)

class Instruction(object):
    """
    This class represents an instruction
    """
    def __init__(self, opcode, instructionCounter: int, argOffset: int, void_instructions, previous_bbs: int, bb: BasicBlock):
        self.id = instructionCounter + argOffset
        self.instr_id = instructionCounter
        self.void_instructions = void_instructions
        self.previous_bbs = previous_bbs
        self.bb = bb
        self.opcode = opcode
        self.operands = []
        self.edges = []

    '''def __eq__(self, other):
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

        return True'''

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for edge in self.edges:
            edge.accept(visitor)
        for operand in self.operands:
            if operand is not None:
                operand.accept(visitor)
        visitor.visit_end(self)

    def get_type(self):
        typeString = "tbd"
        if len(self.operands) > 0:
            typeString = self.operands[0].value
        return typeString

    def get_name_number(self):
        return self.id - self.void_instructions + self.previous_bbs

    def get_name(self):
        return "%" + str(self.get_name_number())

    def __str__(self):
        return self.get_type() + " " + self.get_name()


class Edge(object):
    """
    This class represents an edge
    """

    @staticmethod
    def get_operand_EdgeType(operand):
        if isinstance(operand, TypeValue):
            return 'llvm_type'
        if isinstance(operand, AttributeValue):
            return 'llvm_attribute'
        return 'operand'


    def __init__(self, type: str, src: object, dest: object):

        self.type = type
        self.src = src
        self.dest = dest

    '''def __eq__(self, other):
        if not self.type == other.type:
            #print('FAIL: self.type == other.type: %s %s' % (self.type, other.type))
            return False

        if not self.src.opcode == other.src.opcode:
            #print('FAIL: self.src.opcode == other.src.opcode: %s != %s' % (self.src.opcode, other.src.opcode))
            return False

        if not self.dest.opcode == other.dest.opcode:
            #print('FAIL: self.dest.opcode == other.dest.opcode: %s != %s' % (self.dest.opcode, other.dest.opcode))
            return False

        return True'''

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        visitor.visit_end(self)


class Argument(object):
    """
    This class represents a function argument
    """

    def __init__(self,arg_id: int,  id: int, llvm_type: str, function_name: str):
        self.arg_id = arg_id
        self.id = id
        self.llvm_type = llvm_type
        self.function_name = function_name
        self.attributes = []
        self.edges = []


    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for edge in self.edges:
            edge.accept(visitor)
        for attribute in self.attributes:
            attribute.accept(visitor)
        visitor.visit_end(self)

    def get_type(self):
        return self.llvm_type

    def get_name(self):
        return "%" + str(self.arg_id)

    def __str__(self):
        return self.llvm_type + " " + self.get_name()

class ConstantValue(object):

    _next_id = -1

    @staticmethod
    def _get_next_id():
        ConstantValue._next_id += 1
        return  ConstantValue._next_id

    @staticmethod
    def reset_static_id():
        ConstantValue._next_id = -1

    def __init__(self, llvm_type: str, isLiteral: bool):
        self.id = ConstantValue._get_next_id()
        self.isLiteral = isLiteral
        self.llvm_type = llvm_type
        self.edges = []
    def accept(self, visitor: object):
        pass

    def _replace_non_constant_Value(self, value, cg: CodeGraph, curr_fn: Function):
        if ConstantValue.should_be_edge(value):
            id, instr_type = ConstantValue.get_instruction_info(value.value, cg, curr_fn)
            if instr_type == 'arg':
                instr_from = curr_fn.args[id]
            elif instr_type == 'instr':
                instr_from = cg.all_instructions[id]
            elif instr_type == 'global':
                instr_from = cg.global_variables[GlobalVariable.get_global_id(id)]
            else:
                raise Exception("Tried to transform a constant value into an edge.")
            edgeIndex = -1
            for edge in self.edges:
                if edge.type =='operand' and edge.src == value:
                    edgeIndex = self.edges.index(edge)
                    self.edges.remove(edge)
                    break
            new_edge = Edge('dataflow', instr_from, self)
            if edgeIndex >= 0:
                self.edges.insert(edgeIndex, new_edge)
            else:
                self.edges.append(new_edge)

            return True
        return False

    def replace_non_constant_Values(self, cg: CodeGraph, curr_fn: Function):
        pass

    @staticmethod
    def assembleConstantValue(valueDict, llvm_type):
        result = None
        if isinstance(valueDict, str):
            if llvm_type == "llvm_type":
                result = TypeValue(valueDict)
            elif llvm_type == "llvm_attribute":
                result = AttributeValue(valueDict)
            elif llvm_type == "predicate":
                result = LiteralValue(valueDict + "_predicate", ConstantValue.translatePredicate(valueDict))
            else:
                result = LiteralValue(llvm_type, valueDict)
        elif isinstance(valueDict, list):
            result_list = []
            for list_entry in valueDict:
                result_list.append(ConstantValue.assembleConstantValue(list_entry, ListValue.get_list_type(llvm_type)))
            result = ListValue(llvm_type, result_list)
        elif isinstance(valueDict, dict):
            opcode = valueDict['opcode']
            if opcode == "select":
                operands = [ConstantValue.assembleConstantValue(valueDict['op0'], valueDict['op0_type']), ConstantValue.assembleConstantValue(valueDict['op1'], valueDict['op1_type'])]
                result = SelectExpression(llvm_type, ConstantValue.assembleConstantValue(valueDict['cond'],  valueDict['selty']), opcode, valueDict['selty'], operands)
            elif opcode == "icmp":
                operands = [ConstantValue.assembleConstantValue(valueDict['op0'], valueDict['op0_type']), ConstantValue.assembleConstantValue(valueDict['op1'], valueDict['op1_type'])]
                result = IcmpExpression(llvm_type, valueDict['cond'], opcode, operands)
            elif opcode == "getelementptr":
                inbounds = bool(int(valueDict['inbounds']))
                operands = []
                index = -1
                while True:
                    index += 1
                    operand = "op" + str(index)
                    operandType = operand + "_type"
                    if operand in valueDict:
                        operands.append(ConstantValue.assembleConstantValue(valueDict[operand], valueDict[operandType]))
                    else:
                        break
                result = GetElementPtrExpression(llvm_type, opcode, valueDict['srcTy'], inbounds, operands)
            elif opcode == "bitcast" or opcode == "addrspacecast" or opcode == "ptrtoint" or opcode == "inttoptr":
                srcTy = valueDict['srcTy']
                destTy = valueDict['destTy']
                value = ConstantValue.assembleConstantValue(valueDict['value'], srcTy)
                result = CastExpression(llvm_type, value, opcode, srcTy, destTy)


        return result

    @staticmethod
    def should_be_edge(value):
        return (isinstance(value, LiteralValue) and (value.value.startswith("@") or value.value.startswith("%")))

    @staticmethod
    def get_instruction_info(name: str, cg: CodeGraph, curr_fn: Function):
        resultType = 'literal'
        resultId = -1
        if name.startswith("%"):
            name_id = int(name[1:])
            if name_id < len(curr_fn.args):
                resultType = 'arg'
                resultId = name_id
                for bb in curr_fn.basic_blocks:
                    resultId += len(bb.instructions)
            else:
                resultType = 'instr'
                resultId = name_id - len(curr_fn.args)
        elif name.startswith("@"):
            resultType = 'global'
            resultId = cg.global_variables[int(name[1:])].id
            #var_name = name[1:]
            #for global_variable in cg.global_variables:
            #    if global_variable.name == var_name:
            #        resultType = 'global'
            #        resultId = global_variable.id
            #       break
        return resultId, resultType

    @staticmethod
    def isComposite(value):
        if isinstance(value, LiteralValue) or isinstance(value, ListValue):
            return False
        return True

    @staticmethod
    def translatePredicate(pred):
        preds = ["eq", "ne", "ugt", "uge", "ult", "ule", "sgt", "sge", "slt", "sle", "ogt", "olt", "oeq", "oge", "ole", "une", "ueq"]
        if pred.isdigit():
            return preds[int(pred)]
        return preds.index(pred)


    def get_type(self):
        return self.llvm_type

class LiteralValue(ConstantValue):
    def __init__(self, llvm_type: str, value: str):
        super().__init__(llvm_type, True)
        self.value = value

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        visitor.visit_end(self)

    def get_type(self):
        return self.llvm_type

    def get_value(self):
        return str(self.value)

    def __str__(self):
        result = self.get_type() + " " + self.get_value()
        if "predicate" in self.get_type():
            result = ConstantValue.translatePredicate(self.get_value())
        return result

class TypeValue(ConstantValue):
    def __init__(self, value: str):
        super().__init__("llvm_type", True)
        self.value = value

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        visitor.visit_end(self)

    def __str__(self):
        return self.value

class AttributeValue(ConstantValue):
    def __init__(self, value: str):
        super().__init__("llvm_attribute", True)
        self.value = value

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        visitor.visit_end(self)

    def __str__(self):
        return self.value

class ListValue(ConstantValue):
    def __init__(self, llvm_type: str, values: list):
        super().__init__(llvm_type, False)
        self.values = values
        self.edges = []

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        visitor.visit_end(self)

    def replace_non_constant_Values(self, cg: CodeGraph, curr_fn: Function):
        for i in range(0, len(self.values)):
            value = self.values[i]
            if self._replace_non_constant_Value(value, cg, curr_fn):
                self.values[i] = None
            else:
                value.replace_non_constant_Values(cg, curr_fn)

    def get_value(self):
        member_type = self.get_type()
        start_symbol = "["
        end_symbol = "]"
        if member_type[0] == "<":
            start_symbol = "<"
            end_symbol = ">"
        result = start_symbol + " "
        for value in self.values:
            result += str(value) + ", "
        if len(self.values) > 0:
            result = result[0: len(result) - 2]
        result += end_symbol
        return result
        #return self.listify(self.values, member_type)[len(member_type):]

    def get_member_type(self):
        return self.get_type()[self.get_type().find("x") + 1: len(self.get_type()) - 1].strip()

    @staticmethod
    def get_list_type(type_string):
        member_type = type_string[type_string.find("x") + 1: len(type_string) - 1].strip()
        if member_type[0] == 'x':
            member_type = member_type[2:]
        return member_type

    def __str__(self):
        return self.get_type() + " " + self.get_value()

    def listify(self, list_inst, member_type):
        b_symbol = "["
        end_symbol = "]"
        if member_type:
            b_symbol = member_type[0]
            if b_symbol == "<":
                end_symbol = ">"

        if isinstance(list_inst, list):
            result = member_type + " " + b_symbol
            for value in list_inst:
                result += self.listify(value, ListValue.get_list_type(member_type)) + ", "
            if len(self.values) > 0:
                result = result[0: len(result) - 2]
            result += end_symbol
        else:
            #const_value = ConstantValue.assembleConstantValue(list_inst, member_type)
            #TODO
            result = member_type + " " + str(list_inst)
        return result

class CastExpression(ConstantValue):
    def __init__(self, llvm_type: str, value: ConstantValue, opcode: str, srcTy: str, destTy: str):
        super().__init__(llvm_type, False)
        self.value = value
        self.srcTy = srcTy
        self.destTy = destTy
        self.opcode = opcode
        operandEdge = Edge(Edge.get_operand_EdgeType(self.value), self.value, self)
        self.edges.append(operandEdge)

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for edge in self.edges:
            edge.accept(visitor)
        if self.value is not None:
            self.value.accept(visitor)
        visitor.visit_end(self)

    def replace_non_constant_Values(self, cg: CodeGraph, curr_fn: Function):
        if self._replace_non_constant_Value(self.value, cg, curr_fn):
            self.value = None
        else:
            self.value.replace_non_constant_Values(cg, curr_fn)

    def get_value(self):
        if self.value:
            value_string = str(self.value)
        else:
            value_string = str(self.edges[0].src)
        return self.opcode + " (" + value_string + " to " + self.destTy + ")"

    def __str__(self):
        return self.get_type() + " " + self.get_value()




class GetElementPtrExpression(ConstantValue):
    def __init__(self, llvm_type:str, opcode: str, srcTy: str, inbounds: bool, operands:list):
        super().__init__(llvm_type, False)
        self.opcode = opcode
        self.srcTy =srcTy
        self.operands = operands
        self.inbounds = inbounds
        for operand in operands:
            operandEdge = Edge(Edge.get_operand_EdgeType(operand), operand, self)
            self.edges.append(operandEdge)

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for edge in self.edges:
            edge.accept(visitor)
        for operand in self.operands:
            if operand is not None:
                operand.accept(visitor)
        visitor.visit_end(self)

    def replace_non_constant_Values(self, cg: CodeGraph, curr_fn: Function):
        index = 0
        for operand in self.operands:
            if self._replace_non_constant_Value(operand, cg, curr_fn):
                self.operands[index] = None
            else:
                self.operands[index].replace_non_constant_Values(cg, curr_fn)
            index += 1



    def get_value(self):
        inboundsString = " "
        if(self.inbounds):
            inboundsString = " inbounds"

        operandString = ""
        edgeIndex = 0
        for operand in self.operands:
            if operand:
                operandString += str(operand) + ", "
            else:
                operandString += str(self.edges[edgeIndex].src) + ", "
                edgeIndex += 1
        if len(self.operands) > 1:
            operandString = operandString[0:len(operandString) - 2]
        return self.opcode + inboundsString + " (" + self.srcTy + ", " + operandString + ")"

    def __str__(self):
        return self.get_type() + " " + self.get_value()

class SelectExpression(ConstantValue):
    def __init__(self, llvm_type: str, cond: ConstantValue, opcode:str, selTy: str, operands: list):
        super().__init__(llvm_type, False)
        self.opcode = opcode
        self.cond = cond
        self.selTy = selTy
        self.operands = operands
        condEdge = Edge('operand', self.cond, self)
        self.edges.append(condEdge)
        for operand in operands:
            operandEdge = Edge(Edge.get_operand_EdgeType(operand), operand, self)
            self.edges.append(operandEdge)

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for edge in self.edges:
            edge.accept(visitor)
        self.cond.accept(visitor)
        for operand in self.operands:
            if operand is not None:
                operand.accept(visitor)
        visitor.visit_end(self)

    def replace_non_constant_Values(self, cg: CodeGraph, curr_fn: Function):
        if self._replace_non_constant_Value(self.cond, cg, curr_fn):
            self.cond = None
        else:
            self.cond.replace_non_constant_Values(cg, curr_fn)
        index = 0
        for operand in self.operands:
            if self._replace_non_constant_Value(operand, cg, curr_fn):
                self.operands[index] = None
            else:
                self.operands[index].replace_non_constant_Values(cg, curr_fn)
            index += 1

    def get_value(self):
        edge_index = 0
        if self.cond:
            cond_string = str(self.cond) + ", "
        else:
            cond_string = str(self.edges[edge_index].src) + ", "
            edge_index += 1

        operand_string = ""
        for operand in self.operands:
            if operand:
                operand_string += str(operand) + ", "
            else:
                operand_string += str(self.edges[edge_index].src) + ", "
                edge_index += 1
        if len(self.operands) > 1:
            operand_string = operand_string[0:len(operand_string) - 2]
        return self.opcode + " (" + cond_string + " " + operand_string + ")"

    def __str__(self):
        return self.get_type() + " " + self.get_value()

class IcmpExpression(ConstantValue):
    def __init__(self, llvm_type: str, cond: str, opcode: str, operands: list):
        super().__init__(llvm_type, False)
        self.cond = cond
        self.opcode = opcode
        self.operands = operands
        for operand in operands:
            operandEdge = Edge(Edge.get_operand_EdgeType(operand), operand, self)
            self.edges.append(operandEdge)

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for edge in self.edges:
            edge.accept(visitor)
        for operand in self.operands:
            if operand is not None:
                operand.accept(visitor)
        visitor.visit_end(self)

    def replace_non_constant_Values(self, cg: CodeGraph, curr_fn: Function):
        index = 0
        for operand in self.operands:
            if self._replace_non_constant_Value(operand, cg, curr_fn):
                self.operands[index] = None
            else:
                self.operands[index].replace_non_constant_Values(cg, curr_fn)
            index += 1

    def get_value(self):
        operand_string = ""
        edge_index = 0
        for operand in self.operands:
            if operand:
                operand_string += str(operand) + ", "
            else:
                operand_string += str(self.edges[edge_index].src) + ", "
                edge_index+=1;
        if len(self.operands) > 1:
            operand_string = operand_string[0:len(operand_string) - 2]
        return self.opcode + " " + self.cond + " (" + operand_string + ")"

    def __str__(self):
        return self.get_type() + " " + self.get_value()

class GlobalVariable(object):
    def __init__(self, llvm_type: str, id:int, name: str, value: ConstantValue, linkageType: int = 0, isConstantGlobal: bool = True, hasGlobalUnnamedAddr: bool = True, isInternal: bool = False):
        self.llvm_type = llvm_type
        self.name = name
        self.value = value
        self.linkageType = linkageType
        self.isConstantGlobal = isConstantGlobal
        self.hasGlobalUnnamedAddr = hasGlobalUnnamedAddr
        self.id = (id * -1) - 2
        self.globalVarId = id
        self.isInternal = isInternal
        self.edges = []
        self.edges.append(Edge(Edge.get_operand_EdgeType(value), value, self))

    def accept(self, visitor: object) -> None:
        visitor.visit(self)
        for edge in self.edges:
            edge.accept(visitor)
        self.value.accept(visitor)
        visitor.visit_end(self)

    def replace_non_constant_Values(self, cg: CodeGraph, curr_fn: Function):
        if ConstantValue.should_be_edge(self.value):
            raise Exception("Global Variables need edges")

    @staticmethod
    def get_global_id(id: int):
        if id > -2:
            raise ValueError("Global ids must be smaller then -1")
        return (id + 2) * -1

    def __str__(self):
        return self.llvm_type + " @" + self.name

    def get_name(self):
        return "@" + self.name

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


class CodeGeneratorVisitor(VisitorBase):
    # DEBUG
    redef_func = False
    CallSet = dict()
    void_set = set()
    currentFuncsList = list()
    func_dict = {}
    typeSet = set()
    typeList = list()
    structSet = set()
    numConstExpressions = 0
    hasStructs = False
    stop = False

    typeSets = dict()


    # END DEBUG

    def __init__(self):
        #DEBUG
        self.hastConstExpressions = False
        #END DEBUG


        super().__init__()
        self.code = []
        self.code_string = ""


    def get_code(self):
        return self.code_string

    def find_next_edge(self, edges, edge_label, edge_index):
        result_edge = None
        for i in range(edge_index, len(edges)):
            edge = edges[i]
            if edge.type == edge_label:
                result_edge = edge
                edge_index += 1
                break
            edge_index += 1
        return edge_index, result_edge


    def visit(self, obj: object) -> None:
        if isinstance(obj, CodeGraph):
            CodeGeneratorVisitor.currentFuncsList = list()
            for func in obj.functions:
                f_name = func.name
                if not func.is_declaration:
                    CodeGeneratorVisitor.currentFuncsList.append(f_name)

        elif isinstance(obj, GlobalVariable):
            global_definition = obj.get_name() + " = "
            if obj.isInternal:
                global_definition += "internal "
            if obj.isConstantGlobal:
                global_definition += "constant "
            else:
                global_definition += "global "
            global_definition +=  str(obj.value)
            self.code.append(global_definition)
        if isinstance(obj, Struct):
            struct_definition = obj.name + " = type "
            if not obj.is_opaque:
                struct_definition += "{ "
                for type in obj.types:
                    struct_definition += type + ", "
                struct_definition = struct_definition[0: len(struct_definition) - 2] + " "
                struct_definition += "}"
            else:
                struct_definition += "opaque"
            self.code.append(struct_definition)

            CodeGeneratorVisitor.hasStructs = True
            CodeGeneratorVisitor.structSet.add(struct_definition)

        if isinstance(obj, Function):
            function_definition = ""
            if obj.is_declaration:
                function_definition += "declare"
                name = obj.name
                return_type = obj.llvm_type
                signature = ""
                for arg_key in obj.args:
                    arg_type = obj.args[arg_key].llvm_type
                    signature += arg_type + ", "
                if len(obj.args) > 0:
                    signature = signature[:-2]
                dict_value = name + ";" + return_type + ";" + signature
                if not name in CodeGeneratorVisitor.func_dict:
                    CodeGeneratorVisitor.func_dict.update({name : dict_value})
                elif dict_value != CodeGeneratorVisitor.func_dict[name]:
                    CodeGeneratorVisitor.redef_func = True
            else:
                function_definition += "define"
            function_definition += " " + obj.llvm_type + " @" + obj.name + "("
            for key in obj.args:
                argument = obj.args[key]
                function_definition +=argument.get_type() + " "
                for attribute in argument.attributes:
                    function_definition += str(attribute) + " "
                function_definition = function_definition[0: len(function_definition) - 1]
                function_definition += ", "
            if len(obj.args) > 0:
                function_definition = function_definition[0: len(function_definition) - 2]
            function_definition += ")"
            if not obj.is_declaration:
                function_definition += " {"
            self.code.append(function_definition)
        if isinstance(obj, BasicBlock):
            self.code.append("; <label>:" + str(obj.label) + ":")
        if isinstance(obj, Instruction):


            cast_instructions = ["sext", "fpext", "fptrunc", "inttoptr"]
            binary_instructions = ["xor", "urem", "udiv", "shl", "ashr", "mul", "fsub", "sub", "fadd", "srem", "and", "add", "fmul", "sdiv", "or", "fdiv", "lshr"]
            unary_instructions = ["fptoui", "trunc", "zext", "fptosi", "ptrtoint", "uitofp", "bitcast", "sitofp"]
            definition = "   "
            if not str(obj.operands[0]) == "void":
                definition += obj.get_name() + " = "
            else:
                #TODO remove
                CodeGeneratorVisitor.void_set.add(obj.opcode)
            definition += obj.opcode + " "

            if obj.opcode in cast_instructions:
                operandString = str(obj.operands[1])
                if not obj.operands[1]:
                    _, next_edge = self.find_next_edge(obj.edges, 'dataflow', 0)
                    operandString = str(next_edge.src)
                definition += operandString + " to " + obj.get_type()

            elif obj.opcode in binary_instructions:
                for edge in obj.edges:
                    if edge.type == 'llvm_attribute':
                        definition += str(edge.src) + " "
                edge_index = 0
                if obj.operands[len(obj.operands) - 2]:
                    definition += str(obj.operands[len(obj.operands) - 2]) + ", "
                else:
                    edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                    definition += str(next_edge.src) + ", "
                if obj.operands[len(obj.operands) - 1]:
                    definition += obj.operands[len(obj.operands) - 1].get_value()
                else:
                    edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                    definition += next_edge.src.get_name() + " "

            elif obj.opcode == "extractvalue" or obj.opcode == "extractelement":
                edge_index = 0
                if obj.operands[1]:
                    definition += str(obj.operands[1]) + ", "
                else:
                    edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                    definition += str(next_edge.src) + ", "
                for i in range(2, len(obj.operands)):
                    if obj.opcode == "extractvalue":
                        definition += obj.operands[i].get_value() + ", "
                    elif obj.opcode == "extractelement":
                        if obj.operands[i]:
                            definition += str(obj.operands[i]) + ", "
                        else:
                            edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                            definition += str(next_edge.src) + ", "
                definition = definition[0:len(definition) - 2]

            elif obj.opcode == "insertvalue":
                edge_index = 0
                for i in range(1, len(obj.operands)):
                    if obj.operands[i]:
                        if i < 3:
                            definition += str(obj.operands[i]) + ", "
                        else:
                            definition += obj.operands[i].get_value() + ", "
                    else:
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        if i < 3:
                            definition += str(next_edge.src) + ", "
                        else:
                            definition += next_edge.src.get_value()
                definition = definition[0: len(definition) - 2]

            elif obj.opcode in unary_instructions:
                if obj.operands[1]:
                    definition += str(obj.operands[1])
                else:
                    _, next_edge = self.find_next_edge(obj.edges, 'dataflow', 0)
                    definition += str(next_edge.src)
                definition += " to " + obj.get_type()

            elif obj.opcode == "ret":
                if len(obj.operands) > 1:
                    if obj.operands[1]:
                        definition += str(obj.operands[1])
                    else:
                        _, next_edge = self.find_next_edge(obj.edges, 'dataflow', 0)
                        definition += str(next_edge.src)
                else:
                    definition += obj.get_type()

            elif obj.opcode == "store" or obj.opcode == "load":
                begin_index  = 0
                for edge in obj.edges:
                    if edge.type == 'llvm_attribute':
                        definition += str(edge.src) + " "
                        begin_index += 1
                if obj.opcode == "load":
                    definition += str(obj.operands[0]) + ", "
                edge_index = 0

                for i in range(1 + begin_index, len(obj.operands)):
                    if obj.operands[i]:
                        definition += str(obj.operands[i]) + ", "
                    else:
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        definition += str(next_edge.src) + ", "
                definition = definition[0:len(definition) - 2]


            elif obj.opcode == "switch":
                edge_index = 0
                for i in range(1, len(obj.operands)):
                    if i == 3:
                        definition += " [" + os.linesep
                    if i % 2 == 1:
                        if i >= 3:
                            definition += "     "
                        if obj.operands[i]:
                            definition += str(obj.operands[i]) + ", "
                        else:
                            edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                            definition += str(next_edge.src) + ", "
                    else:
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        definition += "label %" + str(next_edge.src.bb.label)
                        if i > 3:
                            definition += os.linesep
                if len(obj.operands) > 3:
                    definition += "   ]"


            elif obj.opcode == "fcmp" or obj.opcode == "icmp":
                definition += str(obj.operands[1]) + " "
                edge_index = 0
                for i in range(2, 4):
                    if obj.operands[i]:
                        if i == 2:
                            definition += str(obj.operands[i]) + ", "
                        else:
                            definition += obj.operands[i].get_value()
                    else:
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        if i == 2:
                            definition += str(next_edge.src) + ", "
                        else:
                            definition += next_edge.src.get_name()

            elif obj.opcode == "alloca":
                definition += str(obj.operands[1])

            elif obj.opcode == "select" or obj.opcode == "shufflevector" or obj.opcode == "insertelement":
                edge_index = 0
                for i in range(1, len(obj.operands)):
                    if obj.operands[i]:
                        definition += str(obj.operands[i]) + ", "
                    else:
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        definition += str(next_edge.src) + ", "
                definition = definition[0:len(definition) - 2]

            elif obj.opcode == "getelementptr":
                _, next_edge = self.find_next_edge(obj.edges, 'llvm_attribute', 0)
                if next_edge:
                    definition += str(next_edge.src) + " "
                edge_index, _ = self.find_next_edge(obj.edges, 'llvm_type', 0)
                edge_index, next_edge = self.find_next_edge(obj.edges, 'llvm_type', edge_index)
                definition += str(next_edge.src) + ", "
                for i in range(2, len(obj.operands)):
                    if not isinstance(obj.operands[i], TypeValue):
                        if obj.operands[i]:
                            definition += str(obj.operands[i]) + ", "
                        else:
                            edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                            definition += str(next_edge.src) + ", "
                definition = definition[0:len(definition) - 2]

            elif obj.opcode == "phi":
                edge_index = 0
                definition += str(obj.operands[0]) + " [ "
                for i in range(1, len(obj.operands)):
                    if i % 2 == 1 and i != 1:
                        definition += "], [ "
                    if obj.operands[i]:
                        if i % 2 == 1:
                            definition += obj.operands[i].get_value()
                        else:
                            definition += "%" + str(obj.operands[i].bb.label)
                    else:
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        if i % 2 == 1:
                            definition += next_edge.src.get_name()
                        else:
                            definition += "%" + str(next_edge.src.bb.label)
                    if i % 2 == 1:
                        definition += ", "
                    else:
                        definition += " "
                definition = definition[0:len(definition) - 1]
                definition += " ]"

            elif obj.opcode == "call":
                edge_index = 0
                tail_attribute =""
                inserted_attribute = False
                _, next_edge = self.find_next_edge(obj.edges, 'llvm_attribute', 0)
                if next_edge:
                    tail_attribute = str(next_edge.src) + " "
                else:
                    inserted_attribute = True
                    obj.operands.insert(1, None)
                return_type = str(obj.operands[0])
                if return_type == "void":
                    definition = ""
                else:
                    definition = "   " + obj.get_name() + " = "
                #if not obj.operands[2].isLiteral:
                #    definition += tail_attribute + obj.opcode + " " + str(obj.operands[0]) + " " + obj.operands[2].get_value() + "("
                #else:
                definition += tail_attribute + obj.opcode + " " + str(obj.operands[0]) + " @" + obj.operands[2].get_value() + "("
                for i in range(3, len(obj.operands)):
                    if obj.operands[i]:
                        definition += str(obj.operands[i]) + ", "
                    else:
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        definition += str(next_edge.src) + ", "
                if len(obj.operands) > 3:
                    definition = definition[0:len(definition) - 2]
                definition += ")"
                if inserted_attribute:
                    obj.operands.pop(1)

            elif obj.opcode == "br":
                if len(obj.operands) == 2:
                    _, next_edge = self.find_next_edge(obj.edges, 'dataflow', 0)
                    definition += "label %" + str(next_edge.src.bb.label)
                else:
                    edge_index = 0
                    if obj.operands[1]:
                        definition += str(obj.operands[1]) + ", "
                    else:
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        definition += str(next_edge.src) + ", "
                    for i in range(2, len(obj.operands)):
                        edge_index, next_edge = self.find_next_edge(obj.edges, 'dataflow', edge_index)
                        definition += "label %" + str(next_edge.src.bb.label) + ", "
                    definition = definition[0:len(definition) - 2]

            elif obj.opcode == "unreachable":
                definition = "   unreachable"

            else:
                print("unknown opcode found")
                definition = "unknown"
            self.code.append(definition)



    def visit_end(self, obj: object):
        if isinstance(obj, CodeGraph):
            self.code = self.code[0: len(self.code) - 1]
            codeString = ""
            for line in self.code:
                codeString += line + os.linesep
            self.code_string = codeString


        if isinstance(obj, Function):
            if not obj.is_declaration:
                self.code.append("}")
            self.code.append("")

class StatisticsVisitor(VisitorBase):
    """
    Visitor for gathering various statistics of a code graph
    """
    def __init__(self, debug: int = False):
        super(StatisticsVisitor, self).__init__()

        self.num_codegraphs = 0

        self.current_num_nodes = 0
        self.num_nodes = []

        self.current_num_functions = 0

    def visit(self, obj: object) -> None:
        if isinstance(obj, CodeGraph):
            self.num_codegraphs += 1

            self.current_num_nodes = 0
            self.current_num_functions = 0

        if isinstance(obj, Function):
            self.current_num_functions += 1

        if isinstance(obj, Instruction):
            self._get_id_for_node_type(obj.opcode)
            self.current_num_nodes += 1

        if isinstance(obj, GlobalVariable):
            self._get_id_for_node_type("global")
            self.current_num_nodes += 1

        if isinstance(obj, Argument):
            self._get_id_for_node_type("argument")
            self.current_num_nodes += 1

        if isinstance(obj, Struct):
            self._get_id_for_node_type("struct")
            self.current_num_nodes += 1

        if isinstance(obj, ConstantValue):
            self._get_id_for_node_type(obj.llvm_type)
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
            'num_functions': self.current_num_functions,
            'node_types': self.node_types,
            'num_node_types': len(self.node_types),
            'edge_types': edge_types,
            'num_edge_types': len(self.edge_types),
            'num_nodes': utils.min_max_avg(self.num_nodes),
            'num_codegraphs': self.num_codegraphs
        }

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


class ActionSequenceVisitorExperimental(VisitorBase):
    def __init__(self, node_types: dict, edge_types: dict, debug: int = False):
        super(ActionSequenceVisitorExperimental, self).__init__()

        self.debug = debug
        self.node_types = node_types
        self.edge_types = edge_types

        self.edges_pending = {}

        self.actions = {}
        self.last_added_node_id = -1
        self.last_added_node_type = 0

        self.last_seen_basic_block_start_id = 0

        self.is_first_instruction = True

        self.terminator_node_type = 0 # len(self.node_types)

        self.globals = dict()
        self.arguments = dict()
        self.currentSubgraphStart = None

    def visit(self, obj: object) -> None:
        step_idx = len(self.actions)

        if isinstance(obj, Function):
            self.createAddFunctionAction(obj)

        if isinstance(obj, BasicBlock):
            self.createAddBasicBlockAction(obj)

        if isinstance(obj, Instruction):
            pass

    def createGlobal(self, name):
        label = self._get_id_for_node_type("global")
        if not name in self.globals:
            self.last_added_node_id += 1
            step_idx = len(self.actions)
            self.actions[step_idx] = {
                utils.AE.ACTION: utils.A.ADD_NODE,
                utils.L.LABEL_0: label,
                utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
                utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
                utils.AE.SUBGRAPH_START: self.currentSubgraphStart
            }

    def createConstantValue(self, constValue: ConstantValue):
        if isinstance(constValue, LiteralValue):
            label = constValue.value


    def createActions(self, graph: CodeGraph):
        visitedNodes = []
        dangling_edges = []
        for function in graph.functions:
            self.createAddFunctionAction(function)
            self.arguments.clear()
            for bb in function.basic_blocks:
                self.createAddBasicBlockAction(bb)
                self.currentSubgraphStart = bb.current_bb_starts_at_this_node_id
                for instruction in bb.instructions:
                    self.createAddInstructionAction(instruction)
                    visitedNodes.append(id(instruction))

                    for edge in dangling_edges:
                        if instruction == edge.src or instruction == edge.dest:
                            dangling_edges.remove(edge)
                            if instruction == edge.src:
                                self.createAddEdgeInstruction(edge, False)
                            else:
                                self.createAddEdgeInstruction(edge, True)

                    for operand in instruction.operands:
                        if operand is not None:
                            pass


                    for operand in instruction.operands:
                        if isinstance(operand, ConstantValue):
                            print("a")

                self.createEndBasicBlockAction(bb)
            self.createEndFunctionAction(function)
        self.createEndCodeGraphAction(graph)


    def createAddFunctionAction(self, obj):
        step_idx = len(self.actions)
        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_FUNCTION,
            utils.L.LABEL_0: 1,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: obj.current_bb_starts_at_this_node_id
        }

        if self.debug:
            print('<add_function> \t\t\t\t\t %s' % str(self.actions[step_idx]))

    def createAddBasicBlockAction(self, obj):
        step_idx = len(self.actions)
        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_BASIC_BLOCK,
            utils.L.LABEL_0: 1,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: obj.current_bb_starts_at_this_node_id
        }

        if self.debug:
            print('  <add_basic_block> \t\t\t %s' % str(self.actions[step_idx]))

    def createAddInstructionAction(self, obj, optionalLabel = None, optionalNodeType = None):
        step_idx = len(self.actions)
        if not optionalLabel:
            label = self._get_id_for_node_type(obj.opcode)
        else:
            label = optionalLabel
        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_NODE,
            utils.L.LABEL_0: label,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: obj.current_bb_starts_at_this_node_id
        }
        if self.debug:
            print('    <add_node (type %i)> \t\t %s' % (label, str(self.actions[step_idx])))
        step_idx =+ 1

        if self.is_first_instruction:
            self.is_first_instruction = False
        self.last_added_node_id += 1

        if not optionalNodeType:
            self.last_added_node_type = self._get_id_for_node_type(obj.opcode)
        else:
            self.last_added_node_type = optionalNodeType
        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.INIT_NODE,
            utils.L.LABEL_0: label,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: obj.current_bb_starts_at_this_node_id
        }
        if self.debug:
            print('    <init_node> \t\t %s' % (str(self.actions[step_idx])))

        self.last_seen_basic_block_start_id = obj.current_bb_starts_at_this_node_id

    def createAddEdgeInstruction(self, obj, backwards: bool):
        step_idx = len(self.actions)
        end_node = obj.dest.node_id

        type_id = self._get_id_for_edge_type(obj.type)

        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_EDGE if not backwards else utils.A.ADD_BACKWARDS_EDGE,
            utils.L.LABEL_0: 1,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: obj.current_bb_starts_at_this_node_id
        }
        if self.debug:
            print('      <add_edge> \t\t\t\t %s' % str(self.actions[step_idx]))
        step_idx += 1

        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_EDGE_TO,
            utils.L.LABEL_0: end_node,
            utils.L.LABEL_1: type_id,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: obj.current_bb_starts_at_this_node_id
        }
        if self.debug:
            print('      <add_edge_to %i (type: %i)>  %s' % (end_node, type_id, str(self.actions[step_idx])))
        step_idx += 1

    def createEndCodeGraphAction(self, obj):
        step_idx = len(self.actions)
        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_FUNCTION,
            utils.L.LABEL_0: 0,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: obj.current_bb_starts_at_this_node_id
        }
        if self.debug:
            print('<not_add_function> \t\t %s' % str(self.actions[step_idx]))

    def createEndFunctionAction(self, obj):
        step_idx = len(self.actions)
        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_BASIC_BLOCK,
            utils.L.LABEL_0: 0,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: self.last_seen_basic_block_start_id
        }
        if self.debug:
            print('  <not_add_basic_block> \t %s' % str(self.actions[step_idx]))

    def createEndBasicBlockAction(self, obj):
        step_idx = len(self.actions)
        self.actions[step_idx] = {
                    utils.AE.ACTION:                utils.A.ADD_NODE,
                    utils.L.LABEL_0:                self.terminator_node_type,
                    utils.AE.LAST_ADDED_NODE_ID:    self.last_added_node_id,
                    utils.AE.SUBGRAPH_START:        self.last_seen_basic_block_start_id,
                    utils.AE.LAST_ADDED_NODE_TYPE:  self.last_added_node_type,
            }
        if self.debug:
            print('    <not_add_node> \t\t %s' % str(self.actions[step_idx]))

    def createEndInstructionAction(self, obj):
        step_idx = len(self.actions)
        self.actions[step_idx] = {
            utils.AE.ACTION: utils.A.ADD_EDGE,
            utils.L.LABEL_0: 0,
            utils.AE.LAST_ADDED_NODE_ID: self.last_added_node_id,
            utils.AE.LAST_ADDED_NODE_TYPE: self.last_added_node_type,
            utils.AE.SUBGRAPH_START: obj.current_bb_starts_at_this_node_id
        }
        if self.debug:
            print('      <not_add_edge> \t\t\t %s' % str(self.actions[step_idx]))


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
                #print('    <add_node (type %i)> \t\t %s' % (label, str(self.actions[step_idx])))
                print('    <add_node (type %s)> \t\t %s' % (obj.opcode, str(self.actions[step_idx])))
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
                        #print('      <add_edge_to %i (type: %i)>  %s' % (end_node, type_id, str(self.actions[step_idx])))
                        print('      <add_edge_to %i (type: %s)>  %s' % (end_node, self.edge_types[type_id], str(self.actions[step_idx])))
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
                    #print('      <add_edge_to %i (type: %i)>  %s' % (end_node, type_id, str(self.actions[step_idx])))
                    print('      <add_edge_to %i (type: %s)>  %s' % (end_node, obj.type, str(self.actions[step_idx])))
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

#TODO
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
        self.current_operand_cluster = None
        self.current_func_arg_cluster = None
        self.global_variable_cluster = None
        self.struct_cluster = None
        self.dot = pydot.Dot(graph_type="digraph", compound="true")

    def visit(self, obj: object) -> None:
        if isinstance(obj, CodeGraph):
            if len(obj.global_variables) > 0:
                global_var_cluster = pydot.Cluster("global_varibales", label="global_varibales")

                self.global_variable_cluster = global_var_cluster
                self.dot.add_subgraph(global_var_cluster)
            if len(obj.structs) > 0:
                struct_cluster = pydot.Cluster("structs", label="structs")
                self.struct_cluster = struct_cluster
                self.dot.add_subgraph(struct_cluster)
        if isinstance(obj, Function):
            fn_name = 'fn_' + str(len(self.fns))

            cluster = pydot.Cluster(fn_name, label=fn_name)
            if len(obj.args) > 0:
                arg_cluster = pydot.Cluster(fn_name + "_args", label=fn_name + "_args")
                cluster.add_subgraph(arg_cluster)
                self.current_func_arg_cluster = arg_cluster
            self.dot.add_subgraph(cluster)

            self.fns.append(cluster)

        if isinstance(obj, Argument):
            arg_id = self.getName(obj)
            arg_name = "arg_" + str(obj.arg_id)
            node = pydot.Node(arg_id, label= arg_name, color="blue")
            self.current_func_arg_cluster.add_node(node)
            self.current_operand_cluster = self.current_func_arg_cluster
        if isinstance(obj, BasicBlock):
            last_fn = self.fns[-1]
            bb_name = 'bb_' + str(len(self.bbs))

            cluster = pydot.Cluster(bb_name, label=bb_name)
            last_fn.add_subgraph(cluster)
            self.current_operand_cluster = cluster

            self.bbs.append(cluster)

        if isinstance(obj, Instruction):
            last_bb = self.bbs[-1]
            instr_name = 'inst_' + str(obj.node_id)

            instr_opname = obj.opcode

            color = "black"

            if self.debug:
                node = pydot.Node(instr_name, label=instr_opname, xlabel=str(obj.node_id) + ':'  + str(round(obj.prop, 2)), color=color)
            else:
                node = pydot.Node(instr_name, label=instr_opname, color=color)

            last_bb.add_node(node)

            self.instrs.append(node)

        if isinstance(obj, Edge):
            from_name = self.getName(obj.src)
            to_name = self.getName(obj.dest)

            if obj.type == 'dataflow':
                color = "blue"
            elif obj.type == 'operand':
                color = "red"
            elif obj.type == "llvm_type":
                color = "green"
            elif obj.type == "llvm_attribute":
                color = "orange"
            elif obj.type == 'memaccess':
                color = "green"
            else:
                color = "black"

            if self.debug:
                self.dot.add_edge(pydot.Edge(from_name, to_name, xlabel=str(round(obj.prop, 2)), color=color))
            else:
                self.dot.add_edge(pydot.Edge(from_name, to_name, color=color))

        if isinstance(obj, GlobalVariable):
            nameLabel = self.getName(obj)
            node = pydot.Node(nameLabel, label=nameLabel, color="blue")
            self.global_variable_cluster.add_node(node)
            self.current_operand_cluster = self.global_variable_cluster

        if isinstance(obj, Struct):
            nameLabel = self.getName(obj)
            node = pydot.Node(nameLabel, label=nameLabel, color="blue")
            self.struct_cluster.add_node(node)

        if isinstance(obj, ConstantValue):
            nameLabel = self.getName(obj)
            if isinstance(obj, LiteralValue) or isinstance(obj, AttributeValue) or isinstance(obj, TypeValue):
                label_str =obj.value
            elif isinstance(obj, ListValue):
                label_str = "list"
            else:
                label_str = obj.opcode

            color = "red"
            if isinstance(obj, AttributeValue):
                color = "orange"
            elif isinstance(obj, TypeValue):
                color = "green"
            node = pydot.Node(nameLabel, label=label_str, color=color)
            self.current_operand_cluster.add_node(node)



    def getName(self, obj):
        if isinstance(obj, Argument):
            name = 'arg_' + str(obj.id) + "_" +  obj.function_name
        elif isinstance(obj, GlobalVariable):
            name = 'gv_' + str(obj.globalVarId)
        elif isinstance(obj, ConstantValue):
            name = 'constant_' + str(obj.id)
        elif isinstance(obj, Instruction):
            name = 'inst_' + str(obj.node_id)
        elif isinstance(obj, Struct):
                name = 'struct_' + str(obj.id)
        else:
            raise ValueError("nodetype without name")
        return name

    def save_to(self, filename: str, filetype: str) -> None:
        try:
            self.dot.write_raw('/tmp/graph.dot')
            (graph,) = pydot.graph_from_dot_file('/tmp/graph.dot')
            if filetype == 'png':
                graph.write_png(filename)
            elif filetype == 'pdf':
                graph.write_pdf(filename)
        except Exception as e:
            print(e)

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

def codegraph_create_from_miner_output(jRoot: dict) -> object:
    """
    Creates a CodeGraph and associated domain objects by parsing the output of the LLVM miner pass
    """
    cg = CodeGraph()
    ConstantValue.reset_static_id()
    if 'globalVariables' in jRoot:
        next_global_var_id = 0
        for global_var_name , global_var_obj in jRoot['globalVariables'].items():
            const_value = ConstantValue.assembleConstantValue(global_var_obj['value'], global_var_obj['valueType'])
            const_value.replace_non_constant_Values(cg, None)
            global_var = GlobalVariable(global_var_obj['type'], next_global_var_id, global_var_obj['name'], const_value, global_var_obj['linkageType'],
                                        global_var_obj['isConstant'], global_var_obj['hasGlobalUnnamedAddr'], global_var_obj['isInternal'])
            cg.global_variables.append(global_var)
            next_global_var_id += 1
    if 'structs' in jRoot:
        struct_counter = -1
        for struct_obj in jRoot['structs']:
            struct_counter += 1
            structName = struct_obj['name']
            if bool(struct_obj["isOpaque"]):
                cg.structs.append(Struct(struct_counter, structName))
                continue
            structTypes = list()
            if 'types' in struct_obj:
                for type in struct_obj['types']:
                    structTypes.append(type)
            struct = Struct(struct_counter, structName, structTypes)
            cg.structs.append(struct)
    for fn_obj in jRoot['functions']:
        fn_name = fn_obj['name']
        fn = Function(fn_name, fn_obj['isDeclaration'], fn_obj['return type'])
        current_func_instructions = 0
        cg.functions.append(fn)
        if 'args' in fn_obj:
            if 'instructions' in fn_obj:
                index = len(fn_obj['instructions'])
            else:
                index = 0
            arg_index = 0
            for _, arg_obj in fn_obj['args'].items():
                argument = Argument(arg_index, index, arg_obj['type'], fn_name)
                fn.args[index] = argument
                if 'attributes' in arg_obj:
                    for attribute in arg_obj['attributes']:
                        attributeValue = AttributeValue(attribute)
                        attributeEdge = Edge(Edge.get_operand_EdgeType(attributeValue), attributeValue, argument)
                        argument.attributes.append(attributeValue)
                        argument.edges.append(attributeEdge)
                index += 1
                arg_index += 1

        function_is_declaration = bool(fn_obj['isDeclaration'])
        if function_is_declaration:
            continue

        entry_instr_id = fn_obj['basic blocks'][fn_obj['entry block']]['entry instruction']

        # llvm starts counting instructions at 1, not 0
        instructionCounter = 1
        void_instructions = 0
        basic_blocks = -1
        # Create BBs and instructions
        for bb_name, bb_obj in fn_obj['basic blocks'].items():
            first_instruction_in_bb = True
            basic_blocks += 1
            bb = BasicBlock(bb_name)
            fn.basic_blocks.append(bb)
            cg.all_basic_blocks[bb_name] = bb

            # Create all instructions
            for instr_obj in fn_obj['instructions']:
                if instr_obj['basic block'] == bb_name:
                    instr_id = instr_obj['id']
                    instr = Instruction(instr_obj['opcode'], instructionCounter, len(fn.args), void_instructions, basic_blocks, bb)
                    if instr_obj['type'] == 'void':
                        void_instructions += 1
                    instructionCounter += 1
                    bb.instructions.append(instr)
                    if first_instruction_in_bb:
                        bb.create_label(instr.get_name_number() - 1)
                        first_instruction_in_bb = False
                    cg.all_instructions[instr_id] = instr
                    current_func_instructions += 1

                    # If neccessary, assign entry instruction
                    if instr_id == entry_instr_id:
                        fn.entry_instr = instr

                    # If neccessary, create call target node and edge
                    '''if instr_obj['calls'] != '':
                        instr_calltarget = Instruction(instr_obj['calls'])
                        bb.instructions.append(instr_calltarget)

                        edge = Edge('call', instr, instr_calltarget)
                        instr.edges.append(edge)'''

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
                    if 'operands' in instr_obj:
                        for operand in instr_obj['operands']:
                            instr_from_id = operand['id']
                            if instr_from_id != -1:
                                if instr_from_id < -1:
                                    instr_from = cg.global_variables[GlobalVariable.get_global_id(instr_from_id)]
                                elif instr_from_id < len(fn_obj['instructions']):
                                    instr_from = cg.all_instructions[instr_from_id]
                                else:
                                    instr_from = fn.args[instr_from_id]
                                instr_to.operands.append(None)
                                edge = Edge('dataflow', instr_from, instr_to)
                                instr_to.edges.append(edge)
                            else:
                                operandValue = ConstantValue.assembleConstantValue(operand['value'], operand['type'])
                                operandValue.replace_non_constant_Values(cg, fn)

                                instr_to.operands.append(operandValue)
                                instr_to.edges.append(Edge(Edge.get_operand_EdgeType(operandValue), operandValue, instr_to))



        # Create memory access edges
        '''for mem_access_obj in fn_obj['memory accesses']:
            instr_to_id = mem_access_obj['inst']
            if instr_to_id != -1:
                instr_to = cg.all_instructions[instr_to_id]

                for dep_idx in mem_access_obj['dependencies']:
                    instr_from_id = fn_obj['memory accesses'][dep_idx]['inst']
                    if instr_from_id != -1:
                        instr_from = cg.all_instructions[instr_from_id]

                        edge = Edge('memaccess', instr_from, instr_to)
                        instr_from.edges.append(edge) '''

    return cg

def save_dot_graph(graph: object, filename: str, filetype: str, debug: bool = False):
    # Create node ids
    nic_vstr = NodeIdCreateVisitor()
    graph.accept(nic_vstr)


    # Create dot graph
    dog_vstr = DotGraphVisitor(debug)
    graph.accept(dog_vstr)
    dog_vstr.save_to(filename, filetype)

def generate_code(graph: object):
    cgv = CodeGeneratorVisitor()
    graph.accept(cgv)
    return cgv.get_code()

def get_called_function(call_instruction):
    for operand in call_instruction.operands:
        if isinstance(operand, LiteralValue):
            return operand.value

class TopologicalGraph:
    def __init__(self):
        self.graph = defaultdict(list)
        self.V = 0
        self.existing_edges = set()
        self.verticies = set()

    def addEdge(self, u, v):
        if (u,v) in self.existing_edges:
            return
        self.verticies.add(u)
        self.verticies.add(v)
        self.existing_edges.add((u,v))
        self.graph[u].append(v)
        self.V = len(self.verticies)

    def topologicalSortUtil(self, v, visited, stack):

        visited[v] = True

        for i in self.graph[v]:
            if visited[i] == False:
                self.topologicalSortUtil(i, visited, stack)

        stack.insert(0, v)


    def topologicalSort(self):
        visited = [False] * self.V
        stack = []

        for i in range(self.V):
            if visited[i] == False:
                self.topologicalSortUtil(i, visited, stack)

        return stack


def reorder(graph, search_policy: str, debug: bool = False):
    """
    First reorders structs, then functions, so that only previously declared structs/functions are used/called.
    Then reorders the CodeGraph to meet a BFS/DFS across the CFG edges. In case of ambiguities,
    a alphabetic order is applied.
    """

    struct_dict = dict()
    for struct in graph.structs:
        struct_dict.update({struct.name : (struct, [])})
    for struct in graph.structs:
        if not struct.types:
            continue
        for dependend_struct in struct_dict:
            for sub_type in struct.types:
                pattern = "%[-a-zA-Z$._0-9]+"
                dependend_structs = re.findall(pattern, sub_type)
                if dependend_struct in dependend_structs:
                    struct_dict[struct.name][1].append(dependend_struct)

    order_changed = True
    while order_changed:
        order_changed = False
        for struct in struct_dict:
            if len(struct_dict[struct][1]) == 0:
                continue
            highest_index = -1
            for dependency in struct_dict[struct][1]:
                dependency_index = graph.structs.index(struct_dict[dependency][0])
                if dependency_index > highest_index:
                    highest_index = dependency_index
            if graph.structs.index(struct_dict[struct][0]) < highest_index:
                order_changed = True
                graph.structs.remove(struct_dict[struct][0])
                graph.structs.insert(highest_index, struct_dict[struct][0])
                break

    declared_func_dict = {}
    for function in graph.functions:
        declared_func_dict.update({function.name : (function, [])})
    for function in graph.functions:
        called_funcs = set()
        for bb in function.basic_blocks:
            for instr in bb.instructions:
                if instr.opcode == "call":
                    called_funcs.add(get_called_function(instr))
        for called_func in called_funcs:
            if called_func in declared_func_dict:
                declared_func_dict[called_func][1].append(function)
    for declared_function_name in declared_func_dict:
        declared_func = declared_func_dict[declared_function_name][0]
        dependencies = declared_func_dict[declared_function_name][1]
        graph.functions.remove(declared_func)
        first_dependency = len(graph.functions)
        for dependency in dependencies:
            index = graph.functions.index(dependency)
            if index < first_dependency:
                first_dependency = index
        graph.functions.insert(first_dependency, declared_func)

    for function in graph.functions:
        tg = TopologicalGraph()
        for bb in function.basic_blocks:
            for edge in bb.instructions[len(bb.instructions) - 1].edges:
                if edge.type != 'cfg':
                    continue
                tg.addEdge(function.basic_blocks.index(edge.src.bb), function.basic_blocks.index(edge.dest.bb))

        topological_sort = tg.topologicalSort()
        if len(topological_sort) > 0:
            for bb in function.basic_blocks:
                if len(bb.instructions) > 0:
                    bb.instructions[0].order_idx = topological_sort.index(function.basic_blocks.index(bb))
        # Sort graph structure
        bbs = function.basic_blocks
        for i in range(len(bbs)):
            for j in range(len(bbs) - 1 - i):
                if bbs[j].instructions[0].order_idx > bbs[j + 1].instructions[0].order_idx:
                    len_first_bb = len(bbs[j].instructions)
                    len_second_bb = len(bbs[j + 1].instructions)
                    voids_in_first_bb = 0
                    voids_in_second_bb = 0
                    for instruction in bbs[j].instructions:
                        instruction.id += len_second_bb
                        if instruction.operands[0].value == "void":
                            voids_in_first_bb += 1

                    for instruction in bbs[j+1].instructions:
                        instruction.id -= len_first_bb
                        if instruction.operands[0].value == "void":
                            voids_in_second_bb += 1
                    for instruction in bbs[j].instructions:
                        instruction.void_instructions += voids_in_second_bb
                        instruction.previous_bbs += 1
                    for instruction in bbs[j + 1].instructions:
                        instruction.void_instructions -= voids_in_first_bb
                        instruction.previous_bbs -= 1
                    bbs[j].create_label(bbs[j].instructions[0].get_name_number() - 1)
                    bbs[j + 1].create_label(bbs[j + 1].instructions[0].get_name_number() - 1)
                    bbs[j], bbs[j + 1] = bbs[j + 1], bbs[j]

    return graph

def codegraph_to_action_sequence(graph, node_types, edge_types, debug: bool = False):
    """
    Generates a graph-generating sequence, taking a CodeGraph and a mapping of node and
    edge types to IDs as input
    """
    # Create node ids
    node_id_vstr = NodeIdCreateVisitor(debug)
    graph.accept(node_id_vstr)

    # Create opcode ids
    opcode_id_vstr = OpcodeIdCreateVisitor(node_types, debug)
    graph.accept(opcode_id_vstr)

    # Create basic block ids
    bb_id_vstr = CurrentBBStartIdCreateVisitor(debug)
    graph.accept(bb_id_vstr)

    # Actionize
    # TODO
    #action_debug = ActionSequenceVisitorExperimental(node_types, edge_types, debug)
    #action_debug.createActions(graph)
    # TODO
    print(node_types)
    action_vstr = ActionSequenceVisitor(node_types, edge_types, debug)
    graph.accept(action_vstr)
    actions = action_vstr.get_actions_sequence()

    print(graph.name)
    print('Total length of action sequence: %i' % len(actions))

    return actions
