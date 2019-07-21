#pragma once

#include "llvm/Analysis/MemorySSA.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "json.hh"

#include <unordered_map>
#include <vector>

// Forward Declarations
struct GlobalInfo;
struct ArgInfo;
struct BasicBlockInfo;
struct FunctionInfo;
struct InstructionInfo;
struct MemoryAccessInfo;
struct OperandInfo;
struct IcmpConstantExpression;
struct SelectConstantExpression;
struct GetElementPtrExpression;
struct CastExpression;
struct ConstantStructInfo;

using GlobalInfoPtr = std::unique_ptr<GlobalInfo>;
using ArgInfoPtr = std::unique_ptr<ArgInfo>;
using BasicBlockInfoPtr = std::unique_ptr<BasicBlockInfo>;
using FunctionInfoPtr = std::unique_ptr<FunctionInfo>;
using InstructionInfoPtr = std::unique_ptr<InstructionInfo>;
using MemoryAccessInfoPtr = std::unique_ptr<MemoryAccessInfo>;
using OperandInfoPtr = std::unique_ptr<OperandInfo>;
using IcmpConstantExpressionPtr = std::unique_ptr<IcmpConstantExpression>;
using SelectConstantExpressionPtr = std::unique_ptr<SelectConstantExpression>;
using GetElementPtrExpressionPtr = std::unique_ptr<GetElementPtrExpression>;
using CastExpressionPtr = std::unique_ptr<CastExpression>;
using ConstantStructInfoPtr = std::unique_ptr<ConstantStructInfo>;


struct GlobalInfo{
    int id;
    std::string type;
    int linkageType;
    bool isInternal;
    std::string value;
    std::string valueType;
    bool hasGlobalUnnamedAddr;
    bool isConstant;
    std::string name;
};

struct ArgInfo {
  std::string name;
  std::string type;
  std::vector<std::string> attributes;
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
  bool isDeclaration = false;
  std::string returnType;
  std::string entryBlock;
  std::vector<ArgInfoPtr> args;
  std::vector<BasicBlockInfoPtr> basicBlocks;
  std::vector<InstructionInfoPtr> instructions;
  std::vector<MemoryAccessInfoPtr> memoryAccesses;

  // Constructor for declared function
  /*FunctionInfo(std::string n, bool iVA, std::vector<ArgInfoPtr> a){
      name = n;
      numArgs = 0;
      isVarArg = iVA;
      isDeclaration = true;
      args = a;
  }*/

};

struct InstructionInfo {
  unsigned id;
  std::string type;
  std::string opcode;
  std::string basicBlock;
  std::string calls;
  std::string name;
  bool isLoadOrStore;
  std::vector<OperandInfoPtr> operands;
};


struct MemoryAccessInfo {
  unsigned id;
  std::string type;
  int inst;
  std::string block;
  std::vector<unsigned> dependencies;
};

struct OperandInfo {
  std::string type;
  std::string value;
  int id;
  int valueId;
  OperandInfo(){}
  OperandInfo(std::string t, std::string v, int vid){
      type = t;
      value = v;
      valueId = vid;
      id = -1;
  }

};

class FunctionInfoPass : public llvm::FunctionPass {
private:
  FunctionInfoPtr info;

public:
  static char ID;
    static ArgInfoPtr getArgInfo(const llvm::Argument &arg);
    static bool notSupported;
    static const bool outputAttributes = false;
    static std::string getValue(llvm::Value &value, int currentInstructionId = -1, int currentOperandId = -1);
    static std::multimap<std::string, GlobalInfo> globals;
    static std::vector<std::string> structs;
    static std::string preserveAlphabeticOrder(int number);
    static std::multimap<std::string, IcmpConstantExpression> icmps;
    static std::multimap<std::string, SelectConstantExpression> selects;
    static std::multimap<std::string, GetElementPtrExpression> getElementPtrs;
    static std::multimap<std::string, CastExpression> casts;
    static std::multimap<std::string, ConstantStructInfo> structInfos;
    static std::multimap<std::string, std::vector<std::string>> vectors;
    static void dumpValueToJson(nlohmann::json &j, std::string value);
    template <typename T>
    static int getIndexOfElement(std::multimap<std::string, T> &mmultimap, std::string element);
    static std::vector<int> getIndexOfElement(std::multimap<std::string, std::vector<int>> &mmultimap, std::string element);
    static std::vector<void*> compositePointers;
    static std::string getLLVMType(llvm::Value &value);
    static std::string getLLVMType(llvm::Type &value);
    template <typename T>
    static int getIndexOfElement(std::vector<T> vec, T element);


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

  BasicBlockInfoPtr getBasicBlockInfo(const llvm::BasicBlock &bb);
  InstructionInfoPtr getInstructionInfo(llvm::Instruction &inst);
  MemoryAccessInfoPtr getMemoryAccessInfo(llvm::MemoryAccess &acc);
};

struct IcmpConstantExpression {
    std::string opcode;
    std::string cond;
    std::string op0;
    std::string op0_type;
    std::string op1;
    std::string op1_type;
    void dumpToJson(nlohmann::json &j){
        j["opcode"] = this->opcode;
        j["cond"] = this->cond;
        FunctionInfoPass::dumpValueToJson(j["op0"], this->op0);
        FunctionInfoPass::dumpValueToJson(j["op1"], this->op1);
        j["op0_type"] = this->op0_type;
        j["op1_type"] = this->op1_type;
    }
};

struct SelectConstantExpression{
    std::string opcode;
    std::string selty;
    IcmpConstantExpression cond;
    std::string op0;
    std::string op0_type;
    std::string op1;
    std::string op1_type;
    void dumpToJson(nlohmann::json &j){
        j["opcode"] = this->opcode;
        j["selty"] = this->selty;
        this->cond.dumpToJson(j["cond"]);
        FunctionInfoPass::dumpValueToJson(j["op0"], this->op0);
        FunctionInfoPass::dumpValueToJson(j["op1"], this->op1);
        j["op0_type"] = this->op0_type;
        j["op1_type"] = this->op1_type;
    }
};

struct GetElementPtrExpression{
    std::string opcode;
    bool inbounds;
    std::string srcTy;
    std::vector<std::string> operands;
    std::vector<std::string> operandTypes;
    void dumpToJson(nlohmann::json &j){
        j["opcode"] = this->opcode;
        j["inbounds"] = std::to_string(this->inbounds);
        j["srcTy"] = this->srcTy;
        for(u_int index = 0; index < operands.size(); index++){
            FunctionInfoPass::dumpValueToJson(j["op" + std::to_string(index)], this->operands[index]);
            FunctionInfoPass::dumpValueToJson(j["op" + std::to_string(index) + "_type"], this->operandTypes[index]);
        }
    }
};

struct CastExpression{
    std::string srcTy;
    std::string destTy;
    std::string value;
    std::string opcode;
    void dumpToJson(nlohmann::json &j){
        j["srcTy"] = this->srcTy;
        j["destTy"] = this->destTy;
        FunctionInfoPass::dumpValueToJson(j["value"], this->value);
        j["opcode"] = this->opcode;
    }
};

struct ConstantStructInfo{
    std::string type;
    std::vector<std::string> operandTypes;
    std::vector<std::string> operands;
    void dumpToJson(nlohmann::json &j){
        j["type"] = this->type;
        for(u_int index = 0; index < operands.size(); index++){
            FunctionInfoPass::dumpValueToJson(j["op" + std::to_string(index)], this->operands[index]);
            FunctionInfoPass::dumpValueToJson(j["op" + std::to_string(index) + "_type"], this->operandTypes[index]);
        }
    }
};

