#pragma once

#include "llvm/Analysis/MemorySSA.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include <unordered_map>

// Forward Declarations
struct ArgInfo;
struct BasicBlockInfo;
struct FunctionInfo;
struct InstructionInfo;
struct MemoryAccessInfo;

using ArgInfoPtr = std::unique_ptr<ArgInfo>;
using BasicBlockInfoPtr = std::unique_ptr<BasicBlockInfo>;
using FunctionInfoPtr = std::unique_ptr<FunctionInfo>;
using InstructionInfoPtr = std::unique_ptr<InstructionInfo>;
using MemoryAccessInfoPtr = std::unique_ptr<MemoryAccessInfo>;

struct ArgInfo {
  std::string name;
  std::string type;
};

struct BasicBlockInfo {
  std::string name;
  unsigned entryInst;
  unsigned termInst;
  std::vector<std::string> successors;
};

struct FunctionInfo {
  std::string name;
  unsigned numArgs;
  bool isVarArg;
  std::string returnType;
  std::string entryBlock;
  std::vector<ArgInfoPtr> args;
  std::vector<BasicBlockInfoPtr> basicBlocks;
  std::vector<InstructionInfoPtr> instructions;
  std::vector<MemoryAccessInfoPtr> memoryAccesses;
};

struct InstructionInfo {
  unsigned id;
  std::string type;
  std::string opcode;
  std::string basicBlock;
  std::string calls;
  bool isLoadOrStore;
  std::vector<unsigned> operands;
};

struct MemoryAccessInfo {
  unsigned id;
  std::string type;
  int inst;
  std::string block;
  std::vector<unsigned> dependencies;
};

class FunctionInfoPass : public llvm::FunctionPass {
private:
  FunctionInfoPtr info;

public:
  static char ID;

  FunctionInfoPass() : llvm::FunctionPass(ID), info(nullptr) {}

  bool runOnFunction(llvm::Function &func) override;

  void getAnalysisUsage(llvm::AnalysisUsage &au) const override;

  const FunctionInfoPtr &getInfo() const { return info; }
  FunctionInfoPtr &getInfo() { return info; }

private:
  // keep track of ids and names
  unsigned instructionCounter;
  std::unordered_map<const llvm::Instruction *, unsigned> instructionIDs;
  unsigned memoryAccessCounter;
  std::unordered_map<const llvm::MemoryAccess *, unsigned> memoryAccessIDs;
  unsigned valueCounter;
  std::unordered_map<const llvm::Value *, std::string> valueNames;

  /// clear all data structures
  void init();

  // helper functions
  unsigned getUniqueID(const llvm::Instruction &inst);
  unsigned getUniqueID(const llvm::MemoryAccess &acc);
  std::string getUniqueName(const llvm::Value &v);

  ArgInfoPtr getArgInfo(const llvm::Argument &arg);
  BasicBlockInfoPtr getBasicBlockInfo(const llvm::BasicBlock &bb);
  InstructionInfoPtr getInstructionInfo(const llvm::Instruction &inst);
  MemoryAccessInfoPtr getMemoryAccessInfo(llvm::MemoryAccess &acc);
};
