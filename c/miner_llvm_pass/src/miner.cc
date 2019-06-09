#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic push

#include "llvm/Analysis/CallGraph.h"
#include "llvm/Support/raw_ostream.h"

#pragma GCC diagnostic pop

#include <iostream>
#include <fstream>

#include "funcinfo.hh"
#include "json.hh"
#include "miner.hh"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/IR/Module.h"



using namespace llvm;
using namespace nlohmann;
using namespace ::std;

multimap<string, GlobalInfo> FunctionInfoPass::globals;
vector<string> FunctionInfoPass::structs;
multimap<string, IcmpConstantExpression> FunctionInfoPass::icmps;
multimap<string, GetElementPtrExpression> FunctionInfoPass::getElementPtrs;
multimap<string, SelectConstantExpression> FunctionInfoPass::selects;
multimap<string, CastExpression> FunctionInfoPass::casts;
multimap<string, ConstantStructInfo> FunctionInfoPass::structInfos;
multimap<string, vector<string>> FunctionInfoPass::vectors;
bool FunctionInfoPass::notSupported;
//string FunctionInfoPass::preserveAlphabeticOrder(int number);

bool notSupported = false;

static cl::opt<string> jsonPath{cl::Positional, cl::desc{"<output JSON file>"},
                                cl::value_desc{"filename"}, cl::init(""),
                                cl::Optional};


void dumpToJson(json &j, const ArgInfo &info) {
  j["name"] = info.name;
  j["type"] = info.type;
  int index = 0;
  for(string attribute : info.attributes){
      j["attributes"][index] = attribute;
      index++;
  }
}
//temporary fix for the standalone bug (const InstructionInfo& instructionInfo, j)
void dumpToJson(json &j, const OperandInfo &info, const InstructionInfo& instructionInfo) {
    FunctionInfoPass::dumpValueToJson(j["value"], info.value);

  j["id"] = info.valueId;
  j["type"] = info.type;
}
void dumpToJson(json &j, const InstructionInfo &info) {
  j["id"] = info.id;
  j["type"] = info.type;
  j["opcode"] = info.opcode;
  j["calls"] = info.calls;
  j["basic block"] = info.basicBlock;
  j["load or store"] = info.isLoadOrStore;
  j["name"] = info.name;

  int i = 0;
  for (auto &op : info.operands) {
    //temporary fix for the standalone bug (info)
    dumpToJson(j["operands"][i], *op, info);
    i++;
  }
}



void dumpToJson(json &j, const BasicBlockInfo &info) {
  j["name"] = info.name;
  j["entry instruction"] = info.entryInst;
  j["terminator instruction"] = info.termInst;
  j["successors"] = info.successors;
}

void dumpToJson(json &j, const MemoryAccessInfo &info) {
  j["id"] = info.id;
  j["type"] = info.type;
  j["inst"] = info.inst;
  j["basic block"] = info.block;
  j["dependencies"] = info.dependencies;
}

void dumpToJson(json &j, const FunctionInfo &info) {
  j["name"] = info.name;
  j["num args"] = info.numArgs;
  j["var arg"] = info.isVarArg;
  j["return type"] = info.returnType;
  j["entry block"] = info.entryBlock;
  j["isDeclaration"] = info.isDeclaration;


  for (auto &arg : info.args) {
    dumpToJson(j["args"][arg->name], *arg);
  }

  for (auto &bb : info.basicBlocks) {
    dumpToJson(j["basic blocks"][bb->name], *bb);
  }

  for (auto &inst : info.instructions) {
    dumpToJson(j["instructions"][inst->id], *inst);
  }

  for (auto &acc : info.memoryAccesses) {
    dumpToJson(j["memory accesses"][acc->id], *acc);
  }
}
void dumpToJson(json &j, const GlobalInfo &info){
    j["name"] = info.name;
    FunctionInfoPass::dumpValueToJson(j["value"], info.value);
    j["valueType"] = info.valueType;
    j["isConstant"] = info.isConstant;
    j["isInternal"] = info.isInternal;
    j["hasGlobalUnnamedAddr"] = info.hasGlobalUnnamedAddr;
    j["type"] = info.type;
    j["linkageType"] = info.linkageType;
}

bool MinerPass::runOnModule(llvm::Module &module) {
  json jRoot;

  int structIndex = 0;
  // srructs can reference each other. This loop instantiates all struct names, so no cross-reference can happen before the struct names are created
  for (auto &identifiedStruct : module.getIdentifiedStructTypes()){
      FunctionInfoPass::structs.push_back(FunctionInfoPass::getLLVMType(*identifiedStruct));
  }
  for (auto &identifiedStruct : module.getIdentifiedStructTypes()){
      vector<string> elementTypes;
      for(int i = 0; i < identifiedStruct->getNumElements(); i++){
          string elementType = FunctionInfoPass::getLLVMType(*identifiedStruct->getElementType(i));
          elementTypes.push_back(elementType);
      }
      FunctionInfoPass::structs.push_back(FunctionInfoPass::getLLVMType(*identifiedStruct));
      string name = FunctionInfoPass::getLLVMType(*identifiedStruct);
      jRoot["structs"][structIndex]["name"] = name;
      jRoot["structs"][structIndex]["isOpaque"] = identifiedStruct->isOpaque();
      for( int i = 0; i < elementTypes.size(); i++){
          jRoot["structs"][structIndex]["types"][i] = elementTypes[i];
      }
    structIndex++;
  }

  int index = 0;
  for (auto &Global : module.getGlobalList()){
      GlobalInfoPtr globalInfo(new GlobalInfo());
      globalInfo->type = FunctionInfoPass::getLLVMType(Global);
      globalInfo->linkageType = Global.getLinkage();
      globalInfo->isInternal = Global.isInternalLinkage(Global.getLinkage());
      globalInfo->name = Global.getName().str();
      globalInfo->hasGlobalUnnamedAddr = Global.hasGlobalUnnamedAddr();
      globalInfo->isConstant = Global.isConstant();
      globalInfo->id = index;
      Value *a = Global.getInitializer();
      globalInfo->value = FunctionInfoPass::getValue(*a);
      globalInfo->valueType = FunctionInfoPass::getLLVMType(*a);
      dumpToJson(jRoot["globalVariables"][FunctionInfoPass::preserveAlphabeticOrder(index)], *globalInfo);
      FunctionInfoPass::globals.insert(pair<string, GlobalInfo>(globalInfo->name, *globalInfo));
      index++;
      if(FunctionInfoPass::notSupported){
          notSupported = true;
      }
  }

    set<string> uniqueAttributes;


  int funcIndex = -1;
  // collect and dump all the function information
  for (auto &func : module.functions()) {
      funcIndex++;
    if(func.isDeclaration()) {
        FunctionInfoPtr declFunc(new FunctionInfo());
        declFunc->name = func.getName().str();
        declFunc->numArgs = 0;
        declFunc->isVarArg = func.isVarArg();
        declFunc->isDeclaration = true;
        declFunc->returnType = FunctionInfoPass::getLLVMType(*func.getReturnType());
        declFunc->entryBlock = "";
        for(auto & argument : func.args()){
            declFunc->args.push_back(FunctionInfoPass::getArgInfo(argument));
        }
        dumpToJson(jRoot["functions"][funcIndex], *declFunc);
      continue;
    }
    auto &pass = getAnalysis<FunctionInfoPass>(func);
    auto info = std::move(pass.getInfo());
    if(FunctionInfoPass::notSupported){
        notSupported = true;
    }
    dumpToJson(jRoot["functions"][funcIndex], *info);
  }

  // dump the call graph
  const auto &callGraph = getAnalysis<CallGraphWrapperPass>().getCallGraph();
  for (auto &kv : callGraph) {
    auto *func = kv.first;
    auto &node = kv.second;

    // skip the null entry
    if (func == nullptr)
      continue;

    json jNode;
    // -1, because the null entry references everything
    jNode["num references"] = node->getNumReferences() - 1;
    jNode["num calls"] = node->size();
    vector<string> calls;
    for (auto &kv : *node) {
      // Skip for functions without definition (fwd declarations)
      if(kv.second->getFunction()) {
        calls.push_back(kv.second->getFunction()->getName());
      }
    }
    jNode["calls"] = calls;

    jRoot["call graph"][func->getName()] = jNode;
  }

  // write json to stdout or to file if optional argument is supplied
  //TODO reenable
  if(jsonPath.empty()) {
      /*for (string opcode : FunctionInfoPass::opCodes){
          cout << "[opcode]" << opcode << endl;
      }*/
      if(notSupported){
          cout << "not supported" << endl;
      } else{
          cout << setw(2) << jRoot << endl;
      }
  } else {
    ofstream out(jsonPath);
    out << setw(2) << jRoot << endl;
    out.close();
  }

  return false;
}

void MinerPass::getAnalysisUsage(AnalysisUsage &au) const {
  au.addRequired<CallGraphWrapperPass>();
  au.addRequired<FunctionInfoPass>();
  au.setPreservesAll();
}

char MinerPass::ID = 0;
static llvm::RegisterPass<MinerPass> X("miner", "Level Graph Miner Pass",
                                       true /* Only looks at CFG */,
                                       true /* Analysis Pass */);
