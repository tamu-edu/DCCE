#ifndef INCLUDE_UTIL_INSTRUMENT_H_
#define INCLUDE_UTIL_INSTRUMENT_H_

#endif //INCLUDE_UTIL_INSTRUMENT_H_

#include <llvm/IR/CallSite.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Constant.h>
#include <llvm/IR/Constants.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/IR/LegacyPassManager.h>
#include <string>

namespace SVF
{
namespace SVFUtil
{
    // Not used for now.
    void createGlobalString(Module* mod, const std::string var_name, const std::string initial_value)
    {
        using namespace llvm;

        ArrayType* arrayTy = ArrayType::get(IntegerType::getInt8Ty(mod->getContext()), initial_value.size()+1);
        mod->getOrInsertGlobal(StringRef(var_name.c_str()), arrayTy);

        //GlobalVariable* gvar_array__str = new GlobalVariable(/*Module=*/*mod,
        //        /*Type=*/arrayTy,
        //        /*isConstant=*/true,
        //        /*Linkage=*/GlobalValue::PrivateLinkage,
        //        /*Initializer=*/0, // has initializer, specified below
        //        /*Name=*/var_name.c_str());
        ////gvar_array__str->setAlignment(1);

        //// Constant Definitions
        //Constant *const_array_4 = ConstantDataArray::getString(mod->getContext(), initial_value.c_str(), true);
        //std::vector<Constant*> const_ptr_5_indices;
        //ConstantInt* const_int64_6 = ConstantInt::get(mod->getContext(), APInt(64, StringRef("0"), 10));
        //const_ptr_5_indices.push_back(const_int64_6);
        //const_ptr_5_indices.push_back(const_int64_6);
        //Constant* const_ptr_5 = ConstantExpr::getGetElementPtr(gvar_array__str, const_ptr_5_indices);
    }

    void replacePhiUseInNormalDest(InvokeInst* I, BasicBlock* New) {
        //I->getParent()->replaceSuccessorsPhiUsesWith(Block);
        BasicBlock* Succ = I->getNormalDest();

        // N.B. Succ might not be a complete BasicBlock, so don't assume
        // that it ends with a non-phi instruction.
        for (auto& II: *Succ) {
            PHINode *PN = llvm::dyn_cast<PHINode>(&II);
            if (!PN)
                break;
            int i;
            while ((i = PN->getBasicBlockIndex(I->getParent())) >= 0)
                PN->setIncomingBlock(i, New);
        }

    }

    BranchInst* insertNewNormalDest(InvokeInst* I) {
        BasicBlock* old_suc = I->getNormalDest();
        BasicBlock* new_suc = BasicBlock::Create(
                I->getContext(), "", I->getParent()->getParent(), old_suc);
        new_suc->setName(I->getParent()->getName() + ".newNormalDest");

        //
        // outs() << "this block: " << I->getParent()->getName() << "\n";
        // outs() << "dest name: " << normalDest->getName() << "\n";


        if (llvm::dyn_cast<PHINode>(old_suc->begin())) {
            //I->getParent()->replaceSuccessorsPhiUsesWith(Block);
            SVF::SVFUtil::replacePhiUseInNormalDest(I, new_suc);
        }

        BranchInst* branchInst = BranchInst::Create(old_suc, new_suc);
        I->setNormalDest(new_suc);
        return branchInst;
    }

    std::set<Instruction*> get_succ_insts(Instruction* I) {
        std::set<Instruction*> nodes;
        if (auto i = llvm::dyn_cast<InvokeInst>(I)) {
            nodes.insert(insertNewNormalDest(i));
            LandingPadInst* lpad = i->getLandingPadInst();
            //BasicBlock::iterator bbit = i->getNormalDest()->begin();
            //auto& first_inst1 = *bbit;
            //nodes.insert(&first_inst1);
            //bbit = i->getUnwindDest()->begin();
            //auto& first_inst2 = *bbit;
            //nodes.insert(&first_inst2);
        }
        else {
            assert(I->getNextNode());
            nodes.insert(I->getNextNode());
        }
        return nodes;
    }

} // End namespace SVFUtil
} // End namespace SVF
