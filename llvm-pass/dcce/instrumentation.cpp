#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/IR/Module.h"
using namespace llvm;

namespace {
  struct DCCEPass : public FunctionPass {
    static char ID;
    DCCEPass() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F) {
      //errs() << "In a function called " << F.getName() << "!\n";
      // Get the function to call from our runtime library.
      LLVMContext &Ctx = F.getContext();
      std::vector<Type*> paramTypes = {Type::getInt32Ty(Ctx)};
      Type *retType = Type::getVoidTy(Ctx);
      FunctionType *logFuncType = FunctionType::get(retType, paramTypes, false);
      FunctionCallee logFunc =
       F.getParent()->getOrInsertFunction("addWeight", logFuncType);

      FunctionCallee logFunc2 =
       F.getParent()->getOrInsertFunction("removeWeight", logFuncType);

      bool modified = false;
      for (auto &B : F) {
        //for (auto &I : B) {
        for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
            auto &I = *bbit;
            //I.print(llvm::errs());
            //errs() << "\n";
          if (auto *op = dyn_cast<CallInst>(&I)) {
              Function *func = op->getCalledFunction();
              if (func && func->isIntrinsic()) {
                  //errs() << "ignore intrinsic calls\n";
                  break;
              } else {
                  // indirect call
              }
              //errs() << "catched\n";

            // Insert *after* `op`.
            IRBuilder<> builder(op);
            //builder.SetInsertPoint(&B, ++builder.GetInsertPoint());
            builder.SetInsertPoint(&I);

            // Insert a call to our function.
            llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(Ctx);
            llvm::Constant *i32_val = llvm::ConstantInt::get(i32_type, -1/*value*/, true);
            //Value* args[] = {op};
            Value* args[] = {i32_val};
            builder.CreateCall(logFunc, args);

            builder.SetInsertPoint(I.getNextNode());
            builder.CreateCall(logFunc2, args);

            bbit++;
            modified = true;
          }
        }
      }

      return modified;
    }
  };
}

char DCCEPass::ID = 0;

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerDCCEPass(const PassManagerBuilder &,
                         legacy::PassManagerBase &PM) {
  PM.add(new DCCEPass());
}
static RegisterStandardPasses
  RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
                 registerDCCEPass);
