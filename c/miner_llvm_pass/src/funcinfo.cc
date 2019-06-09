#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic push

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Format.h"
#include "json.hh"
#include <iterator>
#include <vector>
#include <iostream>


#pragma GCC diagnostic pop

#include "funcinfo.hh"

#include <iostream>
#include <sstream>

using namespace llvm;
using namespace std;

//set<string> FunctionInfoPass::opCodes;
static vector<string> currentFuncLocalIdentifiers;
FunctionInfoPtr *currentFunc;
static multimap<string, vector<int>> currentFuncUnresolvedIdentifiers;
static int unnamedCounter = 0;
static int compositeCounter = 0;
static int argCounter = 0;
static string currentOpcode = "";
void convertToExactRepresentation(Constant *CV, raw_string_ostream &Out);



/**
 * Get a unique Name for an LLVM value.
 *
 * This function should always be used instead of the values getName()
 * function. If the object has no name yet, a new unique name is generated
 * based on the default name.
 */

string FunctionInfoPass::preserveAlphabeticOrder(int number){

    string result = "";
    string zeroString = "0";
    string numberString = to_string(number);
    int diff = 5 - numberString.size();
    for(int i = 0; i < diff; i++){
        result += zeroString;
    }
    result += numberString;
    return result;

}
std::string FunctionInfoPass::getUniqueName(const Value &v) {
  if (v.hasName())
    return v.getName();

  auto iter = valueNames.find(&v);
  if (iter != valueNames.end())
    return iter->second;

  stringstream ss;
  if (isa<Argument>(v))
    ss << "arg";
  else if (isa<BasicBlock>(v))
    ss << "bb";
  else if (isa<Function>(v))
    ss << "func";
  else
    ss << "v";

  ss << FunctionInfoPass::preserveAlphabeticOrder(valueCounter++);

  valueNames[&v] = ss.str();
  return ss.str();
}

unsigned FunctionInfoPass::getUniqueID(const Instruction &inst) {
  auto iter = instructionIDs.find(&inst);
  if (iter != instructionIDs.end())
    return iter->second;
  // else
  unsigned id = instructionCounter++;
  instructionIDs[&inst] = id;
  return id;
}

unsigned FunctionInfoPass::getUniqueID(const MemoryAccess &acc) {
  auto iter = memoryAccessIDs.find(&acc);
  if (iter != memoryAccessIDs.end())
    return iter->second;
  // else
  unsigned id = memoryAccessCounter++;
  memoryAccessIDs[&acc] = id;
  return id;
}

void FunctionInfoPass::init() {
    FunctionInfoPass::notSupported = false;
    argCounter = 0;
  valueCounter = 0;
  valueNames.clear();
  memoryAccessCounter = 0;
  memoryAccessIDs.clear();
  instructionCounter = 0;
  instructionIDs.clear();
}

ArgInfoPtr FunctionInfoPass::getArgInfo(const Argument &arg) {
  ArgInfoPtr info(new ArgInfo());

  info->name = "arg" + FunctionInfoPass::preserveAlphabeticOrder(argCounter);
  argCounter++;
  if(FunctionInfoPass::outputAttributes){
      if(arg.hasZExtAttr()){
          info->attributes.push_back("zeroext");
      }
      if(arg.hasSExtAttr()){
          info->attributes.push_back("signext");
      }
      if(arg.hasByValAttr()){
          info->attributes.push_back("byval");
      }
      if(arg.hasInAllocaAttr()){
          info->attributes.push_back("inalloca");
      }
      if(arg.hasStructRetAttr()){
          info->attributes.push_back("sret");
      }
      if(arg.hasNoAliasAttr()){
          info->attributes.push_back("noalias");
      }
      if(arg.hasNoCaptureAttr()){
          info->attributes.push_back("nocapture");
      }
      if(arg.hasNestAttr()){
          info->attributes.push_back("nest");
      }
      if(arg.hasReturnedAttr()){
          info->attributes.push_back("returned");
      }
      if(arg.hasNonNullAttr()){
          info->attributes.push_back("nonull");
      }
      if(arg.hasSwiftSelfAttr()){
          info->attributes.push_back("swiftself");
      }
      if(arg.hasSwiftErrorAttr()){
          info->attributes.push_back("swifterror");
      }
      if(arg.onlyReadsMemory()){
          info->attributes.push_back("readonly");
      }
  }

  // collect the type
  string typeName;
  raw_string_ostream rso(typeName);
  arg.getType()->print(rso);
  info->type = rso.str();

  return info;
}

template <typename T>
int FunctionInfoPass::getIndexOfElement(multimap<string, T> &mmultimap, string element){
    auto pos = mmultimap.find(element);
    if(pos != mmultimap.end()){
        int result = distance(mmultimap.begin(), pos);
        return result;
    }
    return -1;
}

void FunctionInfoPass::dumpValueToJson(nlohmann::json &j, string value){
    if(FunctionInfoPass::getIndexOfElement(FunctionInfoPass::vectors, value) != -1){
        vector<string> valueVector = vectors.find(value)->second;
        for(u_int i = 0; i < valueVector.size(); i++){
            dumpValueToJson(j[i], valueVector[i]);
        }
    }
    else if(FunctionInfoPass::getIndexOfElement(FunctionInfoPass::icmps, value ) != -1){
        IcmpConstantExpression &composite = FunctionInfoPass::icmps.find(value)->second;
        composite.dumpToJson(j);
    }
    else if(getIndexOfElement(FunctionInfoPass::selects, value ) != -1){
        SelectConstantExpression &composite = FunctionInfoPass::selects.find(value)->second;
        composite.dumpToJson(j);
    }
    else if(getIndexOfElement(FunctionInfoPass::getElementPtrs, value ) != -1){
        GetElementPtrExpression &composite = FunctionInfoPass::getElementPtrs.find(value)->second;
        composite.dumpToJson(j);
    }
    else if(getIndexOfElement(FunctionInfoPass::casts, value ) != -1){
        CastExpression &composite = FunctionInfoPass::casts.find(value)->second;
        composite.dumpToJson(j);
    }
    else if(getIndexOfElement(FunctionInfoPass::structInfos, value ) != -1){
        ConstantStructInfo &composite = FunctionInfoPass::structInfos.find(value)->second;
        composite.dumpToJson(j);
    } else{
        j = value;

    }
}

template <typename T>
int FunctionInfoPass::getIndexOfElement(vector<T> vec, T element){
    auto pos = find(vec.begin(), vec.end(), element);
    if(pos != vec.end()){
        return pos - vec.begin();
    }
    return -1;
}
vector<int> FunctionInfoPass::getIndexOfElement(multimap<string, vector<int>> &mmultimap, string element){
    auto pos = mmultimap.find(element);
    if(pos != mmultimap.end()){
        vector<int> result = pos->second;
        mmultimap.erase(pos);
        return result;
    }
    vector<int> defaultVec;
    defaultVec.push_back(-1);
    defaultVec.push_back(-1);
    return defaultVec;
}

static string createInstructionName(){
    string instructionName = to_string(unnamedCounter++);
    currentFuncLocalIdentifiers.push_back(instructionName);
    return instructionName;
}

template <typename T>
static string getValueString(T &collection){
    std::vector<string> valueVector;
    string vectorString = "[";
    if(isa<ConstantDataArray>(collection)){
        auto &constantDataArray = cast<ConstantDataArray>(collection);
        for(u_int i = 0; i < constantDataArray.getNumElements(); i++){
            vectorString+= FunctionInfoPass::getValue(*constantDataArray.getElementAsConstant(i)) + ",";
            valueVector.push_back(FunctionInfoPass::getValue(*constantDataArray.getElementAsConstant(i)));
        }
    }
    else if(isa<ConstantVector>(collection)){
        auto &constantVector = cast<ConstantVector>(collection);
        for (unsigned i = 0, e = constantVector.getType()->getVectorNumElements(); i != e;++i){
            vectorString += FunctionInfoPass::getValue(*constantVector.getAggregateElement(i)) + ",";
            valueVector.push_back(FunctionInfoPass::getValue(*constantVector.getAggregateElement(i)));
        }
        /*for(auto &operand : constantVector.operands()){
            vectorString += FunctionInfoPass::getValue(*operand) + ",";
            valueVector.push_back(FunctionInfoPass::getValue(*operand));
        }*/
    }
    else {
        auto &constantArray = cast<ConstantArray>(collection);
        for( auto &operand : constantArray.operands()){
            vectorString += FunctionInfoPass::getValue(*operand) + ",";
            valueVector.push_back(FunctionInfoPass::getValue(*operand));
        }
    }
    if(vectorString.size() > 1){
        vectorString[vectorString.size() - 1] = ']';
    } else{
        vectorString = "[]";
    }
    string name = "%%%" + to_string(compositeCounter++);
    FunctionInfoPass::vectors.insert(pair<string, std::vector<string>>(name, valueVector));

    return name;
}
string getPredecateString(CmpInst::Predicate pred){
    string result = "";
    switch (pred){
        case CmpInst::Predicate::ICMP_EQ:
            result = "eq";
            break;
        case CmpInst::Predicate::ICMP_NE:
            result = "ne";
            break;
        case CmpInst::Predicate::ICMP_UGT:
            result = "ugt";
            break;
        case CmpInst::Predicate::ICMP_UGE:
            result = "uge";
            break;
        case CmpInst::Predicate::ICMP_ULT:
            result = "ult";
            break;
        case CmpInst::Predicate::ICMP_ULE:
            result = "ule";
            break;
        case CmpInst::Predicate ::ICMP_SGT:
            result = "sgt";
            break;
        case CmpInst::Predicate::ICMP_SGE:
            result = "sge";
            break;
        case CmpInst::Predicate::ICMP_SLT:
            result = "slt";
            break;
        case CmpInst::Predicate::ICMP_SLE:
            result = "sle";
            break;
        default:
            cout << "Predicate problem" << endl;
            result = "";
            break;
    }
    string cmpr = CmpInst::getPredicateName(pred).str();
    if(cmpr != result)
        cout << "aa" << endl;
    return result;
}

string FunctionInfoPass::getLLVMType(Value &value){
    return getLLVMType(*value.getType());
}
string FunctionInfoPass::getLLVMType(Type &value){
    string typeName;
    raw_string_ostream rsoo(typeName);
    (value).print(rsoo);
    string result = rsoo.str();
    int index = getIndexOfElement(structs, result);
    if(index >= 0){
        result= result.substr(0, result.find(" "));
    }
    return result;
}

IcmpConstantExpressionPtr getIcmpInstructionValue(ICmpInst &instr){
    IcmpConstantExpressionPtr info(new IcmpConstantExpression());
    info->cond = CmpInst::getPredicateName(instr.getPredicate()).str();
    info->opcode = instr.getOpcodeName();
    info->op0 = FunctionInfoPass::getValue(*instr.getOperand(0));
    info->op1 = FunctionInfoPass::getValue(*instr.getOperand(1));
    info->op0_type = FunctionInfoPass::getLLVMType(*instr.getOperand(0));
    info->op1_type = FunctionInfoPass::getLLVMType(*instr.getOperand(1));
    return info;
}

SelectConstantExpressionPtr getSelectInstructionValue(SelectInst &instr){
    SelectConstantExpressionPtr  info(new SelectConstantExpression());
    info->opcode = instr.getOpcodeName();
    info->cond = *getIcmpInstructionValue(cast<ICmpInst>(*cast<ConstantExpr>(*instr.getOperand(0)).getAsInstruction()));
    info->op0 = FunctionInfoPass::getValue(*instr.getOperand(1));
    info->op0_type = FunctionInfoPass::getLLVMType(*instr.getOperand(1));
    info->op1 = FunctionInfoPass::getValue(*instr.getOperand(2));
    info->op1_type = FunctionInfoPass::getLLVMType(*instr.getOperand(2));
    info->selty = FunctionInfoPass::getLLVMType(*instr.getOperand(0)->getType());
    return  info;
}

GetElementPtrExpressionPtr getElementPtrInstructionValue(GetElementPtrInst &instr){
    GetElementPtrExpressionPtr info(new GetElementPtrExpression());
    info->opcode = instr.getOpcodeName();
    info->inbounds = instr.isInBounds();
    info->srcTy = FunctionInfoPass::getLLVMType(*instr.getSourceElementType());
    for(auto &operand : instr.operands()){
        info->operandTypes.push_back(FunctionInfoPass::getLLVMType(*operand));
        info->operands.push_back(FunctionInfoPass::getValue(*operand));
    }
    return info;
}

CastExpressionPtr getCastInstructionValue(CastInst &instr){
    CastExpressionPtr info(new CastExpression());
    info->opcode = instr.getOpcodeName();
    info->srcTy = FunctionInfoPass::getLLVMType(*instr.getSrcTy());
    info->destTy = FunctionInfoPass::getLLVMType(*instr.getDestTy());
    info->value = FunctionInfoPass::getValue(*instr.getOperand(0));
    return info;
}

ConstantStructInfoPtr getStructInfo(ConstantStruct &constantStruct){
    ConstantStructInfoPtr info(new ConstantStructInfo());
    info->type = "todo";
    for(auto & operand : constantStruct.operands()){
        info->operandTypes.push_back(FunctionInfoPass::getLLVMType(*operand));
        info->operands.push_back(FunctionInfoPass::getValue(*operand));
    }
    return info;
}


vector<string> splitString(const string& str, const string& delim)
{
    vector<string> cont;
    size_t current, previous = 0;
    current = str.find_first_of(delim);
    while (current != string::npos) {
        cont.push_back(str.substr(previous, current - previous));
        previous = current + 1;
        current = str.find_first_of(delim, previous);
    }
    cont.push_back(str.substr(previous, current - previous));
    return cont;
}


void convertToExactRepresentation(Constant *CV, raw_string_ostream &Out){
    if (const ConstantInt *CI = dyn_cast<ConstantInt>(CV)) {
        if (CI->getType()->isIntegerTy(1)) {
            Out << (CI->getZExtValue() ? "true" : "false");
            return;
        }
        Out << CI->getValue();
        return;
    }

    if (const ConstantFP *CFP = dyn_cast<ConstantFP>(CV)) {
        const APFloat &APF = CFP->getValueAPF();
        if (&APF.getSemantics() == &APFloat::IEEEsingle() ||
            &APF.getSemantics() == &APFloat::IEEEdouble()) {
            // We would like to output the FP constant value in exponential notation,
            // but we cannot do this if doing so will lose precision.  Check here to
            // make sure that we only output it in exponential format if we can parse
            // the value back and get the same value.
            //
            bool ignored;
            bool isDouble = &APF.getSemantics() == &APFloat::IEEEdouble();
            bool isInf = APF.isInfinity();
            bool isNaN = APF.isNaN();
            if (!isInf && !isNaN) {
                double Val = isDouble ? APF.convertToDouble() : APF.convertToFloat();
                SmallString<128> StrVal;
                APF.toString(StrVal, 6, 0, false);
                // Check to make sure that the stringized number is not some string like
                // "Inf" or NaN, that atof will accept, but the lexer will not.  Check
                // that the string matches the "[-+]?[0-9]" regex.
                //
                assert(((StrVal[0] >= '0' && StrVal[0] <= '9') ||
                        ((StrVal[0] == '-' || StrVal[0] == '+') &&
                         (StrVal[1] >= '0' && StrVal[1] <= '9'))) &&
                       "[-+]?[0-9] regex does not match!");
                // Reparse stringized version!
                if (APFloat(APFloat::IEEEdouble(), StrVal).convertToDouble() == Val) {
                    Out << StrVal;
                    std::string a;
                    raw_string_ostream o(a);
                    o << StrVal;
                    a = o.str();
                    return;
                }
            }
            // Otherwise we could not reparse it to exactly the same value, so we must
            // output the string in hexadecimal format!  Note that loading and storing
            // floating point types changes the bits of NaNs on some hosts, notably
            // x86, so we must not use these types.
            static_assert(sizeof(double) == sizeof(uint64_t),
                          "assuming that double is 64 bits!");
            APFloat apf = APF;
            // Floats are represented in ASCII IR as double, convert.
            if (!isDouble)
                apf.convert(APFloat::IEEEdouble(), APFloat::rmNearestTiesToEven,
                            &ignored);
            Out << format_hex(apf.bitcastToAPInt().getZExtValue(), 0, /*Upper=*/true);
            return;
        }
    }
}


string FunctionInfoPass::getValue(Value &value, int currentInstructionId, int currentOperandId){
    string result = "";
    if(isa<ConstantFP>(value)){
        string buf;
        raw_string_ostream out(buf);
        convertToExactRepresentation(&cast<Constant>(value), out);
        result = out.str();
    }
    else if(isa<ConstantInt>(value)){
        auto &constantInt = cast<ConstantInt>(value);
        if(constantInt.getBitWidth() > 64){
            FunctionInfoPass::notSupported = true;
            result = "not supported";
        } else {
            long constantIntValue = constantInt.getSExtValue();
            result = to_string(constantIntValue);
        }
    }
    else if (isa<ConstantVector>(value)){
        auto &constantVector = cast<ConstantVector>(value);
        result = getValueString(constantVector);
    }
    else if(isa<ConstantDataVector>(value)){
        auto &vector = cast<ConstantDataVector>(value);
        Type &type = *(vector.getElementType());
        std::vector<string> valueVector;
        string vectorString = "[";
        for (u_int j = 0; j < vector.getNumElements(); j++) {
            string buf;
            raw_string_ostream out(buf);
            convertToExactRepresentation(vector.getElementAsConstant(j), out);
            buf = out.str();
            valueVector.push_back(buf);
        }
        string name = "%%%" + to_string(compositeCounter++);
        vectors.insert(pair<string, std::vector<string>>(name, valueVector));
        result = name;
        if(vectorString.size() > 1){
            vectorString[vectorString.size() - 1] = ']';
        } else{
            vectorString = "[]";
        }
    }
    else if(isa<ConstantDataArray>(value)){
        result = getValueString(value);
    }
    else if(isa<ConstantAggregateZero>(value)){
        result = "zeroinitializer";
        if(!value.getType()->isVectorTy() && !value.getType()->isArrayTy() && !value.getType()->isStructTy()){
            cout << "ConstantAggregateZero that is not a vector found" << endl;
        }
    }
    else if(isa<UndefValue>(value)){
        result = "undef";
    }
    else if(isa<Function>(value)){
        auto &function = cast<Function>(value);
        result = function.getName();
    }
    else if(isa<GlobalVariable>(value)){
        auto &globalVariable = cast<GlobalVariable>(value);
        string name = globalVariable.getName();
        std::map<std::string, GlobalInfo>::iterator it = globals.begin();
        while(it != globals.end()){
            if(it->first == name){
                result = "@" + to_string(it->second.id);
            }
            it++;
        }
        if(result.empty())
            cout << "could not find global." << endl;
    }
    else if(isa<Instruction>(value) || isa<BasicBlock>(value)){
        Instruction *ptr = nullptr;
        if(isa<BasicBlock>(value)){
            auto &bb = cast<BasicBlock>(value);
            Instruction &inst = bb.front();
            string bbName = bb.getName().str();
            string name = inst.getName().str();
            string opcode = inst.getOpcodeName();
            ptr = &inst;
        } else{
            ptr = &(cast<Instruction>(value));
        }
        Instruction& instruction = cast<Instruction>(*ptr);

        string name = instruction.getName().str();
        bool previouslyEmpty = false;
        if(name.empty()){
            instruction.setName(createInstructionName());
            name = instruction.getName().str();
            previouslyEmpty = true;
        }
        int pos = getIndexOfElement(currentFuncLocalIdentifiers, name);
        result = "%" + to_string(pos);
        if(pos < 0 || previouslyEmpty){
            if(currentInstructionId == -1 || currentOperandId == -1){
                cout << "Problem with identifier name" << endl;
            }
            else{
                vector<int> identifierPosition;
                identifierPosition.push_back(currentInstructionId);
                identifierPosition.push_back(currentOperandId);
                currentFuncUnresolvedIdentifiers.insert(pair<string, vector<int>>(name, identifierPosition));
                result = "not resolved";
            }
        }
    }
    else if(isa<Argument>(value)){
        auto &argument = cast<Argument>(value);
        result = "%" + to_string(argument.getArgNo());
    }
    else if(isa<ConstantExpr>(value)){
        auto &constantExpr = cast<ConstantExpr>(value);
        if(strncmp(constantExpr.getOpcodeName(), "getelementptr", 13) == 0){
            auto &gepi = cast<GetElementPtrInst>(*constantExpr.getAsInstruction());
            string valueString = constantExpr.getOpcodeName();
            valueString += " ";
            if(gepi.isInBounds()){
                valueString += "inbounds ";
            }
            valueString += "(";
            string sourceElementType = getLLVMType(*gepi.getSourceElementType());
            valueString += sourceElementType + ", ";
            for(auto &operand : constantExpr.operands()){
                string opt = getLLVMType(*operand);
                valueString += opt + " " + getValue(*operand) + ", ";
            }
            valueString = valueString.substr(0, valueString.length() - 2);
            valueString += ")";
            result = valueString;
            GetElementPtrExpressionPtr ptr = getElementPtrInstructionValue(gepi);
            string name = "%%%" + to_string(compositeCounter++);
            getElementPtrs.insert(pair<string, GetElementPtrExpression>(name, *ptr));
            result = name;
        }
        else if (strncmp(constantExpr.getOpcodeName(), "bitcast", 7) == 0 || strncmp(constantExpr.getOpcodeName(), "addrspacecast", 13) == 0
        || strncmp(constantExpr.getOpcodeName(), "ptrtoint", 8) == 0 || strncmp(constantExpr.getOpcodeName(), "inttoptr", 8) == 0){
            auto &bci = cast<CastInst>(*constantExpr.getAsInstruction());
            string srcType = getLLVMType(*bci.getSrcTy());
            string destType = getLLVMType(*bci.getDestTy());
            string opValue = getValue(*bci.getOperand(0));
            result = constantExpr.getOpcodeName();
            result += " (" + srcType + " " + opValue + " to " + destType + ")";
            CastExpressionPtr ptr = getCastInstructionValue(bci);
            string name = "%%%" + to_string(compositeCounter++);
            casts.insert(pair<string, CastExpression>(name, *ptr));
            result = name;
        }
        else if(strncmp(constantExpr.getOpcodeName(), "select", 6) == 0){
            auto &si = cast<SelectInst>(*constantExpr.getAsInstruction());
            result = constantExpr.getOpcodeName();
            result += " (";
            for (auto &operand : si.operands()){
                result += getLLVMType(*operand) + " " + getValue(*operand) + ", ";
            }
            result = result.substr(0, result.length() - 2);
            result +=")";
            SelectConstantExpressionPtr ptr = getSelectInstructionValue(si);
            string name = "%%%" + to_string(compositeCounter++);
            selects.insert(pair<string, SelectConstantExpression>(name, *ptr));
            result = name;
        }
        else if(strncmp(constantExpr.getOpcodeName(), "icmp", 4) == 0){
            auto &icmpi = cast<ICmpInst>(*constantExpr.getAsInstruction());
            string cond = CmpInst::getPredicateName(icmpi.getPredicate()).str();
            result = constantExpr.getOpcodeName();
            result += " " + cond + " (";
            for(auto &operand : icmpi.operands()){
                result += getLLVMType(*operand) + " " + getValue(*operand) + ", ";
            }
            result = result.substr(0, result.length() - 2);
            result +=")";
            IcmpConstantExpressionPtr ptr = getIcmpInstructionValue(icmpi);
            string name = "%%%" + to_string(compositeCounter++);
            icmps.insert(pair<string, IcmpConstantExpression>(name, *ptr));
            result = name;

        } else{
             string a = constantExpr.getOpcodeName();
            cout << "new constant expr." << endl;
            result = "constantExpr";
        }
    }
    else if(isa<ConstantPointerNull>(value)){
        result = "null";
    }
    else if(isa<ConstantArray>(value)){
        result = getValueString(value);
    }
    else if(isa<ConstantStruct>(value)){
        FunctionInfoPass::notSupported = true;
        auto &ca = cast<ConstantStruct>(value);
        result = "{ ";
        for(auto &operand : ca.operands()){
            result += getLLVMType(*operand) + " " + getValue(*operand) + ", ";
        }
        result = result.substr(0, result.length() - 2);
        result += " }";
        ConstantStructInfoPtr ptr = getStructInfo(ca);
        string name = "%%%" + to_string(compositeCounter++);
        structInfos.insert(pair<string, ConstantStructInfo>(name, *ptr));
        result = name;

    } else{
        result = "unidentified";
        cout << "unidentified value found" << endl;
    }
    return result;
}

InstructionInfoPtr
FunctionInfoPass::getInstructionInfo(Instruction &inst) {
  InstructionInfoPtr info(new InstructionInfo());

  string opcodeName = inst.getOpcodeName();
  currentOpcode = opcodeName;
  //FunctionInfoPass::opCodes.emplace(opcodeName);
  string instructionName = inst.getName().str();
  if(instructionName.empty()){
      inst.setName(createInstructionName());
      instructionName = inst.getName().str();
  }

  if(!instructionName.empty()){

      if(getIndexOfElement(currentFuncLocalIdentifiers, instructionName) == -1){
          currentFuncLocalIdentifiers.push_back(instructionName);
      }
      vector<int> unresolvedIndex = getIndexOfElement(currentFuncUnresolvedIdentifiers, instructionName);
      while (unresolvedIndex[0] != -1){
          OperandInfoPtr & ptr = (*currentFunc)->instructions[unresolvedIndex[0]]->operands[unresolvedIndex[1]];
          if(ptr->value == "not resolved"){
              ptr->value = "%" + to_string(getIndexOfElement(currentFuncLocalIdentifiers, instructionName));
          }
          else{
              cout << "problem" << endl;
          }
          unresolvedIndex = getIndexOfElement(currentFuncUnresolvedIdentifiers, instructionName);
      }
  }

  string typeName;
  raw_string_ostream rso(typeName);
  inst.getType()->print(rso);
  info->id = getUniqueID(inst);
  info->opcode = inst.getOpcodeName();
  info->type = rso.str();
  info->basicBlock = getUniqueName(*inst.getParent());
  int nameInt = getIndexOfElement(currentFuncLocalIdentifiers, inst.getName().str());
  if(nameInt == -1){
      info->name ="not named";
  }
  else{
      info->name = "%" + to_string(getIndexOfElement(currentFuncLocalIdentifiers, inst.getName().str()));
  }
  int operandId = 0;
  // collect data dependencies
    for (auto &use : inst.operands()) {
        OperandInfoPtr operandInfo(new OperandInfo());
        operandInfo->type = getLLVMType(*use->getType());
        operandInfo->id = operandId++;
        operandInfo->value = getValue(*use.get(), info->id, operandInfo->id);
        info->operands.push_back(std::move(operandInfo));
    }

  // collect called function (if this instruction is a call)
  if (isa<CallInst>(inst)) {
    auto &call = cast<CallInst>(inst);
    if(call.getCalledFunction() != nullptr)
        info->calls = getUniqueName(*call.getCalledFunction());
    else
        info->calls = "";
  }

  // load or store?
  info->isLoadOrStore = false;
  if (isa<LoadInst>(inst))
    info->isLoadOrStore=true;
  if (isa<StoreInst>(inst))
    info->isLoadOrStore=true;

  return info;
}

BasicBlockInfoPtr FunctionInfoPass::getBasicBlockInfo(const BasicBlock &bb) {
  BasicBlockInfoPtr info(new BasicBlockInfo());

  info->name = getUniqueName(bb);

  // collect entry and terminator instruction
  auto &entry = bb.front();
  auto term = bb.getTerminator();
  info->entryInst = getUniqueID(entry);
  info->termInst = getUniqueID(*term);

  // collect all successors
  for (auto *succ : term->successors()) {
    info->successors.push_back(getUniqueName(*succ));
  }

  return info;
}

MemoryAccessInfoPtr FunctionInfoPass::getMemoryAccessInfo(MemoryAccess &acc) {
  MemoryAccessInfoPtr info(new MemoryAccessInfo());

  info->id = getUniqueID(acc);
  info->block = getUniqueName(*acc.getBlock());

  if (isa<MemoryUseOrDef>(acc)) {
    if (isa<MemoryUse>(acc))
      info->type = "use";
    else
      info->type = "def";

    auto inst = cast<MemoryUseOrDef>(acc).getMemoryInst();
    if (inst != nullptr) {
      info->inst = getUniqueID(*inst);
    } else {
      info->inst = -1;
      assert(info->type == "def");
      info->type = "live on entry";
    }

    auto dep = cast<MemoryUseOrDef>(acc).getDefiningAccess();
    if (dep != nullptr) {
      info->dependencies.push_back(getUniqueID(*dep));
    }
  } else {
    info->type = "phi";
    info->inst = -1;
    auto &phi = cast<MemoryPhi>(acc);
    for (unsigned i = 0; i < phi.getNumIncomingValues(); i++) {
      auto dep = phi.getIncomingValue(i);
      info->dependencies.push_back(getUniqueID(*dep));
    }
  }

  return info;
}

bool FunctionInfoPass::runOnFunction(llvm::Function &func) {
  init(); // wipe all data from the previous run

  //set basic-block-names
  for(auto &bb :func.getBasicBlockList()){
      getUniqueName(bb);
  }

  // create a new info object and invalidate the old one
  info = FunctionInfoPtr(new FunctionInfo());
  currentFunc = &info;
  info->name = getUniqueName(func);
  info->isVarArg = func.isVarArg();
  info->numArgs = func.arg_size();
  info->entryBlock = getUniqueName(func.getEntryBlock());

  for(auto &arg : func.args()){
      string argName = "%" + to_string(arg.getArgNo());
      currentFuncLocalIdentifiers.push_back(argName);
  }

  string rtypeName;
  raw_string_ostream rso(rtypeName);
  func.getReturnType()->print(rso);
  info->returnType = rso.str();

  // collect all instructions and basic blocks
  for (auto &bb : func.getBasicBlockList()) {
    for (auto &inst : bb) {
        info->instructions.push_back(getInstructionInfo(inst));
    }
    map<string,int> namesIdMap;
    for(auto &inst : info->instructions){
        string name = inst->name;
        if(inst->name != "not named"){
            namesIdMap[name] = inst->id;
        }
    }
    for(auto &arg : func.args()){
        string argName = "%" + to_string(arg.getArgNo());
        namesIdMap[argName] = arg.getArgNo() + info->instructions.size();
    }
    for(auto &inst : info->instructions){
          for(auto &operand : inst->operands){
              operand->valueId = -1;
              if(namesIdMap.find(operand->value) != namesIdMap.end()){
                  operand->valueId = namesIdMap[operand->value];
              }
              else {
                  std::map<std::string, GlobalInfo>::iterator it = globals.begin();
                  while(it != globals.end()){
                      if("@" + to_string(it->second.id) == operand->value){
                          operand->valueId = -2 - it->second.id;
                          break;
                      }
                      it++;
                  }
              }
          }
    }
    info->basicBlocks.push_back(getBasicBlockInfo(bb));
  }
  const string typeType = "llvm_type";
  const string attributeType = "llvm_attribute";
  bool printAttribute = FunctionInfoPass::outputAttributes;
  int instrIndex = -1;
  // fetch additional operand infos
  for (auto &bb : func.getBasicBlockList()){
      for (auto &inst : bb){
          instrIndex++;
          InstructionInfoPtr &instInfo = info->instructions[instrIndex];

          string opcode = inst.getOpcodeName();
          if(opcode == "sext" || opcode == "fpext" || opcode == "fptrunc" || opcode == "inttoptr"){ // ty, value, ty2

          } else if(opcode == "xor" || opcode == "urem" || opcode == "udiv" || opcode == "shl" || opcode == "ashr" || opcode == "mul" || opcode == "fsub" || opcode == "sub"
          || opcode == "fadd" || opcode == "srem" || opcode == "and" || opcode == "add" || opcode == "fmul"|| opcode == "sdiv" || opcode == "or" || opcode == "fdiv" || opcode == "lshr") {  // ty, op1, op2
              auto & binOp = cast<BinaryOperator>(inst);
              OperandInfoPtr operandInfo2(new OperandInfo(attributeType, "exact", -1));
              OperandInfoPtr operandInfo3(new OperandInfo(attributeType, "nsw", -1));
              OperandInfoPtr operandInfo4(new OperandInfo(attributeType, "nuw", -1));
              if(printAttribute && binOp.isExact() && (opcode == "udiv" || opcode == "sdiv" || opcode == "lshr" || opcode == "ashr")){
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo2));
              }
              if(printAttribute && (opcode == "add" || opcode == "sub" || opcode == "mul" || opcode == "shl")){
                  if(binOp.hasNoSignedWrap()){
                      instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo3));
                  }

                  if(binOp.hasNoUnsignedWrap()){
                      instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo4));
                  }
              }
          } else if(opcode == "extractvalue"){
              auto & extractValue = cast<ExtractValueInst>(inst);
              string ty1 = "i32";
              OperandInfoPtr operandInfo2(new OperandInfo(typeType, ty1, -1));
              for(u_int index : extractValue.getIndices()){
                  OperandInfoPtr operandInfo2(new OperandInfo(ty1, to_string(index), -1));
                  instInfo->operands.push_back(std::move(operandInfo2));
              }
          } else if(opcode == "fptoui" || opcode == "trunc" || opcode == "zext" || opcode == "fptosi" || opcode == "ptrtoint" || opcode == "uitofp" || opcode =="bitcast" || opcode == "sitofp"){
              auto & unary = cast<UnaryInstruction>(inst);

          } else if(opcode == "extractelement"){
              auto & eei = cast<ExtractElementInst>(inst);

          } else if(opcode == "ret"){
              auto & ret = cast<ReturnInst>(inst);

          } else if(opcode == "store"){
              auto &store = cast<StoreInst>(inst);
              OperandInfoPtr operandInfo1(new OperandInfo(attributeType, "volatile", -1));
              OperandInfoPtr operandInfo2(new OperandInfo(attributeType, "atomic", -1));
              if(printAttribute && store.isVolatile()){
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo1));
              }
              if(printAttribute && store.isAtomic()){
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo2));
              }
          } else if(opcode == "switch"){
              auto &switchInst = cast<SwitchInst>(inst);

          } else if(opcode == "load"){
              auto &load = cast<LoadInst>(inst);
              OperandInfoPtr operandInfo2(new OperandInfo(attributeType, "volatile", -1));
              OperandInfoPtr operandInfo3(new OperandInfo(attributeType, "atomic", -1));
              if(printAttribute && load.isVolatile()){
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo2));
              }
              if(printAttribute &&  load.isAtomic()){
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo3));
              }
          } else if(opcode == "insertvalue"){
              auto &ivi = cast<InsertValueInst>(inst);
              string ty1 = "i32";
              OperandInfoPtr operandInfo2(new OperandInfo(typeType, ty1, -1));
              for(u_int index : ivi.getIndices()){
                  OperandInfoPtr operandInfo3(new OperandInfo(ty1, to_string(index), -1));
                  instInfo->operands.push_back(std::move(operandInfo3));
              }
          } else if(opcode == "fcmp" || opcode == "icmp"){
              auto &cmp = cast<CmpInst>(inst);
              string cond = CmpInst::getPredicateName(cmp.getPredicate()).str();
              OperandInfoPtr operandInfo1(new OperandInfo("predicate", cond, -1));
              instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo1));
          } else if(opcode == "alloca"){
              auto &alloca = cast<AllocaInst>(inst);
              OperandInfoPtr operandInfo1(new OperandInfo(typeType, getLLVMType(*alloca.getAllocatedType()), -1));
              instInfo->operands.clear();
              instInfo->operands.push_back(std::move(operandInfo1));
          } else if(opcode == "select"){
              auto &select = cast<SelectInst>(inst);

          } else if(opcode == "getelementptr"){
              auto &gepi = cast<GetElementPtrInst>(inst);
              string ty0 = getLLVMType(*gepi.getSourceElementType());
              OperandInfoPtr operandInfo1(new OperandInfo(attributeType, "inbounds", -1));
              OperandInfoPtr operandInfo2(new OperandInfo(typeType, ty0, -1));
              instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo2));
              if(printAttribute && gepi.isInBounds()){
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo1));
              }
          } else if(opcode == "shufflevector" || opcode == "insertelement"){
              /*for(int i = inst.getNumOperands() - 1; i >= 0; i--){
                  string ty0 = getLLVMType(*inst.getOperand(i)->getType());
                  OperandInfoPtr operandInfo1(new OperandInfo(typeType, ty0, -1));
                  instInfo->operands.insert(instInfo->operands.begin() + i, std::move(operandInfo1));
              }*/
          } else if(opcode == "phi"){
              auto &phi = cast<PHINode>(inst);
              for(int i = phi.getNumOperands() - 1; i >= 0; i--){
                  string srcInstName = "%" + to_string(getIndexOfElement(currentFuncLocalIdentifiers, phi.getIncomingBlock(i)->front().getName().str()));
                  string srcInstType = getLLVMType(*phi.getIncomingBlock(i)->front().getType());
                  int srcInstId = getUniqueID(phi.getIncomingBlock(i)->front());
                  OperandInfoPtr operandInfo1(new OperandInfo(srcInstType, srcInstName, srcInstId));
                  instInfo->operands.insert(instInfo->operands.begin() + i + 1, std::move(operandInfo1));
              }
          } else if(opcode == "call"){
              auto &call = cast<CallInst>(inst);
              /*string ty0 = getLLVMType(*call.getType());
              OperandInfoPtr operandInfo1(new OperandInfo(typeType, ty0, -1));
              instInfo->operands.push_back(std::move(operandInfo1));
              for(int i = call.getNumOperands() - 2; i >= 0; i--){
                  string ty1 = getLLVMType(*call.getOperand(i)->getType());
                  OperandInfoPtr operandInfo2(new OperandInfo(typeType, ty1, -1));
                  instInfo->operands.insert(instInfo->operands.begin() + i + 1, std::move(operandInfo2));
              }*/

              OperandInfoPtr operandInfo1(new OperandInfo(instInfo->operands[instInfo->operands.size() - 1]->type, instInfo->operands[instInfo->operands.size() - 1]->value, instInfo->operands[instInfo->operands.size() - 1]->valueId));
              instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo1));
              instInfo->operands.erase(instInfo->operands.begin() + instInfo->operands.size() - 1);
              if(printAttribute && call.isTailCall()){
                  OperandInfoPtr operandInfo3(new OperandInfo(attributeType, "tail", -1));
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo3));
              }
              else if(printAttribute && call.isMustTailCall()){
                  OperandInfoPtr operandInfo3(new OperandInfo(attributeType, "musttail", -1));
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo3));
              }
              else if(printAttribute && call.isNoTailCall()){
                  OperandInfoPtr operandInfo3(new OperandInfo(attributeType, "notail", -1));
                  instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfo3));
              }
          }
          else if (opcode == "br"){
              instInfo->operands.push_back(std::move(instInfo->operands[0]));
              instInfo->operands.erase(instInfo->operands.begin());
              reverse(instInfo->operands.begin(), instInfo->operands.end());
          } else {
              // TODO
          }
          OperandInfoPtr operandInfoType(new OperandInfo(typeType, getLLVMType(*inst.getType()), -1));
          instInfo->operands.insert(instInfo->operands.begin(), std::move(operandInfoType));
      }
  }

  // collect all arguments
  for (auto &arg : func.args()) {
    info->args.push_back(getArgInfo(arg));
  }

  // dump app memory accesses
  auto &mssaPass = getAnalysis<MemorySSAWrapperPass>();
  auto &mssa = mssaPass.getMSSA();
  for (auto &bb : func.getBasicBlockList()) {
    // live on entry
    auto entry = mssa.getLiveOnEntryDef();
    info->memoryAccesses.push_back(getMemoryAccessInfo(*entry));

    // memory phis
    auto phi = mssa.getMemoryAccess(&bb);
    if (phi != nullptr) {
      info->memoryAccesses.push_back(getMemoryAccessInfo(*phi));
    }

    // memory use or defs
    for (auto &inst : bb) {
      auto access = mssa.getMemoryAccess(&inst);
      if (access != nullptr) {
        info->memoryAccesses.push_back(getMemoryAccessInfo(*access));
      }
    }
  }
  currentFuncLocalIdentifiers.clear();
  currentFuncLocalIdentifiers.clear();
  if(!currentFuncUnresolvedIdentifiers.empty())
      cout << "Unresolved identifiers after processing func" << endl;
  unnamedCounter = 0;
  // indicate that nothing was changed
  return false;
}

void FunctionInfoPass::getAnalysisUsage(AnalysisUsage &au) const {
  au.addRequired<MemorySSAWrapperPass>();
  au.setPreservesAll();
}

char FunctionInfoPass::ID = 0;

static RegisterPass<FunctionInfoPass> X("funcinfo", "Function Info Extractor",
                                        true /* Only looks at CFG */,
                                        true /* Analysis Pass */);
