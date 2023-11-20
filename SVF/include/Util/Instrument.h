#ifndef INCLUDE_UTIL_INSTRUMENT_H_
#define INCLUDE_UTIL_INSTRUMENT_H_

#endif //INCLUDE_UTIL_INSTRUMENT_H_

#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/IR/LegacyPassManager.h"
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <unordered_map>

namespace SVF
{
namespace SVFUtil
{
    typedef std::unordered_map<std::string, std::unordered_map<uint64_t, std::string>> ccw_t;
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

    template <class Container>
    void
    Split(const std::string& str, Container& cont, char delim = ' ')
    {
        std::stringstream ss(str);
        std::string token;
        while (std::getline(ss, token, delim)) {
            cont.push_back(token);
        }
    }
    void parseCCWFile(const std::string& ccinput, ccw_t& ccw)
    {
        // main:2-i:3-A-3,4-B-4,
        std::string str;
        raw_string_ostream rawstr(str);

        std::ifstream inf(ccinput);
        if (!inf.is_open()) {
            std::cout << "unable to open file " << ccinput << std::endl;
            exit(1);
        }

        rawstr << "--------------------------------------------\n";
        rawstr << "Parsing cc file " << ccinput << "\n";
        printf("--------------------------------------------\n");
        printf("Parsing cc file %s\n", ccinput.c_str());
        std::string line;

        while (std::getline(inf, line)) {
            rawstr << "Processing line: " << line << "\n";
            std::vector<std::string> caller_cs_callees;
            Split(line, caller_cs_callees, ':');

            // caller
            std::string caller(caller_cs_callees[0]);

            // csid-calltype
            std::vector<std::string> csid_calltype;
            Split(caller_cs_callees[1], csid_calltype, '-');
            uint64_t csid = std::stoul(csid_calltype[0], NULL, 10);
            assert(ccw[caller].find(csid) == ccw[caller].end());

            ccw[caller][csid] = caller_cs_callees[2];
            rawstr << "Adding caller: " << caller << ", csid: " << csid << ", ccwstring: " << caller_cs_callees[2] << "\n";

            // cs-callee-ccw,...,
            //std::vector<std::string> set_cs_callee_ccw;
            //Split(caller_cs_callees[2], set_cs_callee_ccw, ',');

            //for (auto cs_callee_ccw : set_cs_callee_ccw) {
            //  std::vector<std::string> ccc;
            //  Split(cs_callee_ccw, ccc, '-');
            //  if (ccc.size() == 0) break; // for last comma
            //  ccw[caller][csid] = cs_callee_ccw;
            //  rawstr << "Adding caller: " << caller << ", csid: " << csid << ", ccwstring: " << cs_callee_ccw << "\n";
            //}
        }
        inf.close();
        rawstr << "Parsing cc file done.\n";
        rawstr << "--------------------------------------------\n";
        printf("%s", rawstr.str().c_str());
    }
    
    //void parse_static_ccfile(const std::string& ccinput, std::unordered_map<int64_t,int64_t>& cs2w)
    void parse_static_ccfile(const std::string& ccinput,
        std::unordered_map<int64_t,int64_t>& cs2w,
        std::unordered_map<int64_t,int64_t>& cs2type)
    {
        std::string str;
        raw_string_ostream rawstr(str);

        std::ifstream inf(ccinput);
        if (!inf.is_open()) {
            std::cout << "unable to open file " << ccinput << std::endl;
            exit(1);
        }

        rawstr << "--------------------------------------------\n";
        rawstr << "Parsing cc file " << ccinput << "\n";
        printf("--------------------------------------------\n");
        printf("Parsing cc file %s\n", ccinput.c_str());
        std::string line;

        while (std::getline(inf, line)) {
            std::vector<std::string> list;
            Split(line, list, ':');

            //int64_t cs = std::stol(list[2], NULL, 10);
            std::vector<std::string> cs_type;
            Split(list[2], cs_type, '-');

            int64_t cs = std::stol(cs_type[0], NULL, 10);
            int64_t edgeType = -1;
            if (cs_type[1] == "R") {
              edgeType = 1;
            } else if (cs_type[1] == "B") {
              edgeType = 2;
            } else if (cs_type[1] == "E") {
              edgeType = 3;
            } else if (cs_type[1] == "EB") {
              edgeType = 4;
            }
            assert(edgeType != -1);

            int64_t w = std::stol(list[3], NULL, 10);

            //assert(cs2w.find(cs) == cs2w.end());
            cs2w[cs] = w;
            cs2type[cs] = edgeType;
            //std::cout << "cs: " << cs << ", w: " << w << std::endl;
        }
        inf.close();

        printf("%s", rawstr.str().c_str());
    }

    void parse_ccfile(const std::string& ccinput, std::unordered_map<uint64_t,uint64_t>& cs2w)
    {
        std::string str;
        raw_string_ostream rawstr(str);

        std::ifstream inf(ccinput);
        if (!inf.is_open()) {
            std::cout << "unable to open file " << ccinput << std::endl;
            exit(1);
        }

        rawstr << "--------------------------------------------\n";
        rawstr << "Parsing cc file " << ccinput << "\n";
        printf("--------------------------------------------\n");
        printf("Parsing cc file %s\n", ccinput.c_str());
        std::string line;

        while (std::getline(inf, line)) {
            rawstr << "Processing line: " << line << "\n";
        
            std::vector<std::string> caller_cs_callees;
            Split(line, caller_cs_callees, ':');

            std::vector<std::string> set_cs_callee_ccw;
            Split(caller_cs_callees[2], set_cs_callee_ccw, ',');

            for (auto cs_callee_ccw : set_cs_callee_ccw) {
                std::vector<std::string> ccc;
                Split(cs_callee_ccw, ccc, '-');
                if (ccc.size() == 0) break; // for last comma

                uint64_t cs = std::stoul(ccc[0], NULL, 10);
                uint64_t w = 0;
                // Max value of 64bit unsigned integer needs 19 decimal digits
                if (strlen(ccc[2].c_str()) < 20) {
                    w = std::stoul(ccc[2], NULL, 10);
                }
                assert(cs2w.find(cs) == cs2w.end());
                cs2w[cs] = w;
                rawstr << "    Adding cs -> w : " << cs << " -> " << w << "\n";
                //std::cout << "cs: " << cs << ", w: " << w << std::endl;
            }
        }
        inf.close();
        rawstr << "Parsing cc file done.\n";
        rawstr << "--------------------------------------------\n";
        printf("%s", rawstr.str().c_str());
    }

} // End namespace SVFUtil
} // End namespace SVF
