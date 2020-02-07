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

using namespace llvm;
using namespace nlohmann;
using namespace ::std;

static cl::opt<string> jsonPath{cl::Positional, cl::desc{"<output JSON file>"},
                                cl::value_desc{"filename"}, cl::init(""),
                                cl::Optional};

void dumpToJson(json &j, const ArgInfo &info) {
  j["name"] = info.name;
  j["type"] = info.type;
}
void dumpToJson(json &j, const InstructionInfo &info) {
  j["id"] = info.id;
  j["type"] = info.type;
  j["opcode"] = info.opcode;
  j["operands"] = info.operands;
  j["calls"] = info.calls;
  j["basic block"] = info.basicBlock;
  j["load or store"] = info.isLoadOrStore;
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

bool MinerPass::runOnModule(llvm::Module &module) {
  json jRoot;

  // collect and dump all the function information
  for (auto &func : module.functions()) {
    // Skip functions without definition (fwd declarations)
    if(func.isDeclaration()) {
      continue;
    }

    auto &pass = getAnalysis<FunctionInfoPass>(func);
    auto info = std::move(pass.getInfo());
    dumpToJson(jRoot["functions"][info->name], *info);
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
  if(jsonPath.empty()) {
    cout << setw(2) << jRoot << endl;
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
