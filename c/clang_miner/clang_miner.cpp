#include <iostream>
#include <sstream>
#include <string>
#include <fstream>

#include "clang/StaticAnalyzer/Frontend/AnalysisConsumer.h"
#include "clang/StaticAnalyzer/Core/CheckerRegistry.h"
#include "clang/StaticAnalyzer/Core/Checker.h"
#include "clang/StaticAnalyzer/Core/PathSensitive/AnalysisManager.h"
#include "clang/Frontend/MultiplexConsumer.h"
#include "clang/Analysis/Analyses/LiveVariables.h"

#include "clang/Basic/LangOptions.h"
#include "clang/AST/AST.h"
#include "clang/AST/Decl.h"
#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Frontend/ASTConsumers.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendActions.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"
#include "clang/Analysis/CFG.h"
#include "llvm/Support/raw_ostream.h"

#include "json.hh"

using namespace clang;
using namespace clang::driver;
using namespace clang::ento;
using namespace clang::tooling;
using namespace nlohmann;

static llvm::cl::OptionCategory ToolingSampleCategory("Tooling Sample");
static llvm::cl::opt<std::string> outFileName("o", llvm::cl::desc("Filename to write the graph as json"),
                                              llvm::cl::cat(ToolingSampleCategory));

struct StmtInfo {
    Stmt* clangStmt = nullptr;

    // Data
    std::string name;
    std::string operatorStr;
    std::string valueStr;
};
using StmtInfoPtr = std::shared_ptr<StmtInfo>;

struct DeclInfo {
    ValueDecl* clangDecl = nullptr;

    // Data
    int scalarType;
    std::string functionNameStr;

};
using DeclInfoPtr = std::shared_ptr<DeclInfo>;

struct NodeContainer {
    int nodeId = -1;
    bool isRoot = false;

    StmtInfoPtr stmtInfo = nullptr;
    DeclInfoPtr declInfo = nullptr;

    std::vector<std::shared_ptr<NodeContainer>> livenessRelations;
    std::vector<std::shared_ptr<NodeContainer>> astRelations;
};
using NodeContainerPtr = std::shared_ptr<NodeContainer>;


class ClangCodeGraph {
public:
    static ClangCodeGraph &getInstance() {
        static ClangCodeGraph instance;
        return instance;
    }

    ClangCodeGraph(ClangCodeGraph const &) = delete;

    void operator=(ClangCodeGraph const &) = delete;

public:
    std::vector<NodeContainerPtr> GetAllStatements() {
        std::vector<NodeContainerPtr> allStatements;

        std::stack<NodeContainerPtr> stmtStack;
        stmtStack.push(_bodyRootStmt);

        while (stmtStack.empty() == false) {
            // Get and remove top element
            NodeContainerPtr currentContainer = stmtStack.top();
            stmtStack.pop();

            allStatements.push_back(currentContainer);

            // Add element's children to stack
            for (std::vector<NodeContainerPtr>::iterator it = currentContainer->astRelations.begin();
                 it != currentContainer->astRelations.end(); ++it) {
                stmtStack.push(*it);
            }
        }

        return allStatements;
    }

    NodeContainerPtr GetNodeContainerByClangStmt(const Stmt *clangStmt) {
        std::vector<NodeContainerPtr> allStatements = GetAllStatements();

        for (std::vector<NodeContainerPtr>::iterator it = allStatements.begin(); it != allStatements.end(); ++it) {
            if ((*it)->stmtInfo->clangStmt == clangStmt) {
                return *it;
            }
        }

        assert(false && "No NodeContainer has been found for clangStmt.");
        return nullptr;
    }

    NodeContainerPtr GetNodeContainerByClangDecl(const ValueDecl *clangDecl) {
        std::vector<NodeContainerPtr> allStatements = GetAllStatements();

        for (std::vector<NodeContainerPtr>::iterator it = allStatements.begin(); it != allStatements.end(); ++it) {
            if ((*it)->declInfo && (*it)->declInfo->clangDecl == clangDecl) {
                return *it;
            }
        }

        for (std::vector<NodeContainerPtr>::iterator it = _functionArguments.begin();
             it != _functionArguments.end(); ++it) {
            if ((*it)->declInfo->clangDecl == clangDecl) {
                return *it;
            }
        }

        std::cerr << "No NodeContainer has been found for clangDecl: " << clangDecl->getDeclName().getAsString() << std::endl;
        return nullptr;
    }

    json ToJson() {
        json jRoot;

        AssignNodeIds();

        // 1. Arguments
        json jArguments;
        for (std::vector<NodeContainerPtr>::iterator it = _functionArguments.begin();
             it != _functionArguments.end(); ++it) {
            NodeContainerPtr currentContainer = (*it);

            json jArgument;
            jArgument["name"] = "FunctionArgument";

            // Specific statement information
            // Declarations
            if (currentContainer->declInfo->clangDecl) {
                jArgument["type"] = currentContainer->declInfo->scalarType;
            }

            // Liveness relations
            json jLivenessRelations;
            if (currentContainer->livenessRelations.empty() == false) {
                for (std::vector<NodeContainerPtr>::iterator it = currentContainer->livenessRelations.begin();
                     it != currentContainer->livenessRelations.end(); ++it) {
                    jLivenessRelations.push_back((*it)->nodeId);
                }
                jArgument["liveness_relations"] = jLivenessRelations;
            }

            jArguments.push_back(jArgument);
        }

        // 2. Body
        json jBody;
        std::stack<NodeContainerPtr> stmtStack;
        stmtStack.push(_bodyRootStmt);

        while (stmtStack.empty() == false) {
            // Get and remove top element
            NodeContainerPtr currentContainer = stmtStack.top();
            stmtStack.pop();

            // Build JSON
            json jNode;

            jNode["name"] = currentContainer->stmtInfo->name;
            jNode["is_root"] = currentContainer->isRoot;

            // Specific declaration information
            // Declarations
            if (currentContainer->declInfo) {
                // Type
                jNode["type"] = currentContainer->declInfo->scalarType;

                // CalleeName
                if (!currentContainer->declInfo->functionNameStr.empty()) {
                    jNode["function_name"] = currentContainer->declInfo->functionNameStr;
                }
            }

            // Specific statement information
            // IntegerLiteral
            if (!currentContainer->stmtInfo->valueStr.empty()) {
                jNode["value"] = currentContainer->stmtInfo->valueStr;
            }

            // Unary operator
            // Binary operator
            if (!currentContainer->stmtInfo->operatorStr.empty()) {
                jNode["operator"] = currentContainer->stmtInfo->operatorStr;
            }

            // AST relations
            json jAstRelations;
            if (currentContainer->astRelations.empty() == false) {
                for (std::vector<NodeContainerPtr>::iterator it = currentContainer->astRelations.begin();
                     it != currentContainer->astRelations.end(); ++it) {
                    jAstRelations.push_back((*it)->nodeId);

                    // Also add to DFS traversal stack
                    stmtStack.push(*it);
                }
                jNode["ast_relations"] = jAstRelations;
            }

            // Liveness relations
            json jLivenessRelations;
            if (currentContainer->livenessRelations.empty() == false) {
                for (std::vector<NodeContainerPtr>::iterator it = currentContainer->livenessRelations.begin();
                     it != currentContainer->livenessRelations.end(); ++it) {
                    jLivenessRelations.push_back((*it)->nodeId);
                }
                jNode["liveness_relations"] = jLivenessRelations;
            }

            jBody.push_back(jNode);
        }

        jRoot["type"] = _scalarReturnType;
        jRoot["arguments"] = jArguments;
        jRoot["body"] = jBody;

        jRoot["num_functions"] = _numFunctions;

        return jRoot;
    }

    std::string ToString() {
        std::stringstream retString;

        std::stack<NodeContainerPtr> stmtStack;
        stmtStack.push(_bodyRootStmt);

        while (stmtStack.empty() == false) {
            // Get and remove top element
            NodeContainerPtr currentContainer = stmtStack.top();
            stmtStack.pop();

            retString << "Statement: " << currentContainer->stmtInfo->name << std::endl;
            if (currentContainer->declInfo) {
                retString << "Declaration: " << currentContainer->declInfo->clangDecl->getDeclName().getAsString() << std::endl;
            }

            // Add element's children to stack
            for (std::vector<NodeContainerPtr>::iterator it = currentContainer->astRelations.begin();
                 it != currentContainer->astRelations.end(); ++it) {
                stmtStack.push(*it);
            }
        }

        return retString.str();
    }

private:
    void AssignNodeIds() {
        int currentNodeId = 0;

        std::stack<NodeContainerPtr> stmtStack;
        stmtStack.push(_bodyRootStmt);

        while (stmtStack.empty() == false) {
            // Get and remove top element
            NodeContainerPtr currentContainer = stmtStack.top();
            stmtStack.pop();

            currentContainer->nodeId = currentNodeId;
            currentNodeId++;

            // Add element's children to stack
            for (std::vector<NodeContainerPtr>::iterator it = currentContainer->astRelations.begin();
                 it != currentContainer->astRelations.end(); ++it) {
                stmtStack.push(*it);
            }
        }

    }

public:
    int _scalarReturnType;
    std::vector<NodeContainerPtr> _functionArguments;
    NodeContainerPtr _bodyRootStmt;

    int _numFunctions = 0;

private:
    ClangCodeGraph() {}
};


// AST
class CustomASTVisitor : public RecursiveASTVisitor<CustomASTVisitor> {
public:
    CustomASTVisitor(ASTContext &context) : _context(context) {}

    bool VisitStmt(Stmt *s) {

        return true;
    }

    bool VisitFunctionDecl(FunctionDecl *f) {
        // Only function definitions (with bodies), not declarations.
        if (f->hasBody() && strcmp(f->getName().data(), "__sputc") != 0) {
            // Number of functions
            ClangCodeGraph::getInstance()._numFunctions++;

            // Extract return type
            if(f->getReturnType()->isVoidType()) {
              ClangCodeGraph::getInstance()._scalarReturnType = -1;
            } else {
              ClangCodeGraph::getInstance()._scalarReturnType = f->getReturnType()->getScalarTypeKind();
            }

            // 1. Extract arguments
            for (ParmVarDecl *arg : f->parameters()) {
                NodeContainerPtr sInfo(new NodeContainer);
                sInfo->declInfo.reset(new DeclInfo);
                sInfo->declInfo->clangDecl = dyn_cast<ValueDecl>(arg);
                sInfo->declInfo->scalarType = sInfo->declInfo->clangDecl->getType()->getScalarTypeKind();

                ClangCodeGraph::getInstance()._functionArguments.push_back(sInfo);
            }

            // 2. Extract body
            Stmt *funcBody = f->getBody();

            // Do DFS on Statements
            std::stack<NodeContainerPtr> stmtStack;

            // Create Statement object and add to CodeGraph
            NodeContainerPtr sInfo(new NodeContainer);

            sInfo->isRoot = true;

            sInfo->stmtInfo.reset(new StmtInfo);
            sInfo->stmtInfo->clangStmt = funcBody;
            sInfo->stmtInfo->name = sInfo->stmtInfo->clangStmt->getStmtClassName();

            ClangCodeGraph::getInstance()._bodyRootStmt = sInfo;
            stmtStack.push(sInfo);

            while (stmtStack.empty() == false) {
                // Get and remove top element
                NodeContainerPtr currentContainer = stmtStack.top();
                stmtStack.pop();

                // Add element's children to stack
                for (StmtIterator it = currentContainer->stmtInfo->clangStmt->child_begin();
                     it != currentContainer->stmtInfo->clangStmt->child_end(); ++it) {
                    if (*it) { // Catch Literals which are children but a nullptr
                        (*it)->dump();

                        NodeContainerPtr sInfo(new NodeContainer);
                        sInfo->stmtInfo.reset(new StmtInfo);
                        sInfo->stmtInfo->clangStmt = (*it);
                        sInfo->stmtInfo->name = sInfo->stmtInfo->clangStmt->getStmtClassName();

                        // IntegerLiteral
                        if (const IntegerLiteral *ds = dyn_cast<IntegerLiteral>(sInfo->stmtInfo->clangStmt)) {
                            sInfo->stmtInfo->valueStr = std::to_string((int) ds->getValue().roundToDouble());
                        }

                        // Unary operator
                        if (const UnaryOperator *ds = dyn_cast<UnaryOperator>(sInfo->stmtInfo->clangStmt)) {
                            sInfo->stmtInfo->operatorStr = ds->getOpcodeStr(ds->getOpcode());
                        }

                        // Binary operator
                        if (const BinaryOperator *ds = dyn_cast<BinaryOperator>(sInfo->stmtInfo->clangStmt)) {
                            sInfo->stmtInfo->operatorStr = ds->getOpcodeStr();
                        }


                        // DeclRefExpr
                        if (const DeclRefExpr *ds = dyn_cast<DeclRefExpr>(sInfo->stmtInfo->clangStmt)) {
                            if(!ClangCodeGraph::getInstance().GetNodeContainerByClangDecl(ds->getDecl())) {
                                sInfo->declInfo.reset(new DeclInfo);
                                sInfo->declInfo->clangDecl = (ValueDecl *) ds->getDecl();
                                if (ds->getType()->isScalarType()) {
                                    sInfo->declInfo->scalarType = ds->getType()->getScalarTypeKind();
                                }
                                sInfo->declInfo->functionNameStr = ds->getDecl()->getName();
                            }
                        }

                        // Decls
                        if (const auto *ds = dyn_cast<DeclStmt>(*it)) {
                            for (auto it_ds = ds->decl_begin(); it_ds != ds->decl_end(); ++it_ds) {
                                auto *nd = dyn_cast<ValueDecl>(*it_ds);

                                if(!ClangCodeGraph::getInstance().GetNodeContainerByClangDecl(nd)) {
                                    sInfo->declInfo.reset(new DeclInfo);
                                    sInfo->declInfo->clangDecl = nd;
                                    if(nd->getType()->isScalarType()) {
                                        sInfo->declInfo->scalarType = nd->getType()->getScalarTypeKind();
                                    } else {
                                        sInfo->declInfo->scalarType = -1;
                                    }
                                }
                            }
                        }

                        stmtStack.push(sInfo);
                        currentContainer->astRelations.push_back(sInfo);
                    }
                }
            }

            //CFG
            std::unique_ptr<CFG> sourceCFG = CFG::buildCFG(f, funcBody, &_context, CFG::BuildOptions());

            sourceCFG->print(llvm::errs(), LangOptions(), true);
        }

        return true;
    }

private:
    ASTContext &_context;
};

class MyASTConsumer : public ASTConsumer {
public:
    MyASTConsumer(ASTContext &context) : _visitor(context) {}

    bool HandleTopLevelDecl(DeclGroupRef DR) override {
//        llvm::errs() << "MyASTConsumer::HandleTopLevelDecl" << "\n";

        for (DeclGroupRef::iterator b = DR.begin(), e = DR.end(); b != e; ++b) {
            // Traverse the declaration using our AST visitor.
            _visitor.TraverseDecl(*b);
            //(*b)->dump();
        }
        return true;
    }

private:
    CustomASTVisitor _visitor;
};

// LiveVariables
class LiveVariablesObserver : public LiveVariables::Observer {
public:
    void observeStmt(const Stmt *S,
                     const CFGBlock *currentBlock,
                     const LiveVariables::LivenessValues &V) override {

        // Get NodeContainer structure from CodeGraph
        NodeContainerPtr toStmt = ClangCodeGraph::getInstance().GetNodeContainerByClangStmt(S);

        // In case it is a DeclRefExpr, add it to the NodeContainer in the CodeGraph structure
        if (const DeclRefExpr *dre = dyn_cast<DeclRefExpr>(S)) {
            const ValueDecl *d = dre->getDecl();

            NodeContainerPtr fromStmt = ClangCodeGraph::getInstance().GetNodeContainerByClangDecl(d);
            if (fromStmt) {
                fromStmt->livenessRelations.push_back(toStmt);
            }
        }
    }
};

class LiveVariablesChecker : public Checker<check::ASTCodeBody> {
public:
    void checkASTCodeBody(const Decl *D, AnalysisManager &Mgr,
                          BugReporter &BR) const {
        llvm::errs() << "LiveVariablesChecker::checkASTCodeBody" << "\n";

        if (LiveVariables *L = Mgr.getAnalysis<LiveVariables>(D)) {
            L->dumpBlockLiveness(Mgr.getSourceManager());

            LiveVariablesObserver obs;
            L->runOnAllBlocks(obs);
        }
    }
};

class CustomFrontendAction : public ASTFrontendAction {
public:
    std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance &CI, StringRef file) override {
        llvm::errs() << "CustomFrontendAction::CreateASTConsumer" << "\n";

        // Create consumers
        std::vector<std::unique_ptr<ASTConsumer>> consumers;

        // LiveVariables consumer
        std::unique_ptr<AnalysisASTConsumer> analysis_consumer = CreateAnalysisConsumer(CI);
        CI.getAnalyzerOpts()->CheckersControlList = {{"custom.LiveVariablesChecker", true}};
        analysis_consumer->AddCheckerRegistrationFn([](CheckerRegistry &Registry) {
            Registry.addChecker<LiveVariablesChecker>("custom.LiveVariablesChecker", "LiveVariablesChecker");
        });
        consumers.push_back(std::move(analysis_consumer));

        // AST consumer
        consumers.push_back(llvm::make_unique<MyASTConsumer>(CI.getASTContext()));

        return llvm::make_unique<MultiplexConsumer>(std::move(consumers));
    }
};

std::unique_ptr<FrontendActionFactory> CustomFrontendActionFactory() {
    class SimpleFrontendActionFactory : public FrontendActionFactory {
    public:
        FrontendAction *create() override {
            return new CustomFrontendAction();
        }
    };

    return std::unique_ptr<FrontendActionFactory>(
            new SimpleFrontendActionFactory());
}

int main(int argc, const char **argv) {

    // Run Clang tool for AST extraction and Clang checker for LiveVariables extraction
    CommonOptionsParser op(argc, argv, ToolingSampleCategory);
    ClangTool Tool(op.getCompilations(), op.getSourcePathList());

    if (Tool.run(CustomFrontendActionFactory().get()) != 0) {
        return 1;
    }

    // Dump information to console
    llvm::errs() << ClangCodeGraph::getInstance().ToJson().dump(4);

    // Dump information to file
    std::ofstream jsonOutFile(outFileName);
    jsonOutFile << ClangCodeGraph::getInstance().ToJson().dump(4);
    jsonOutFile.close();

    return 0;
}