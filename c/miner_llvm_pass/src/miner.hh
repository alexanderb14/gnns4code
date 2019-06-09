#pragma once

#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

void mine_module(llvm::Module &module);


struct MinerPass : public llvm::ModulePass {
  static char ID;

  MinerPass() : llvm::ModulePass(ID) {}

  bool runOnModule(llvm::Module &M) override;
  void getAnalysisUsage(llvm::AnalysisUsage &au) const override;
};
