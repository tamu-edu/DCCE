//===- CCWPass.cpp -- Whole program analysis pass------------------------------//
//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013-2017>  <Yulei Sui>
//

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//===-----------------------------------------------------------------------===//

/*
* @file: CCWPass.cpp
* @author: ksungkeun84
* @date: 8/17/2022
* @version: 1.0
*
* @section LICENSE
*
* @section DESCRIPTION
*
*/


#include "Util/Options.h"
#include "Util/SVFModule.h"
#include "CCW/CCWPass.h"

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Metadata.h"

#include <iostream>
#include <string>
#include <fstream>
#include <sstream>

using namespace SVF;

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

char CCWPass::ID = 0;

/*!
* Destructor
*/
CCWPass::~CCWPass()
{
}

void CCWPass::parseCCWFile(const std::string& ccinput, ccw_t& ccw)
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

/*!
* We start from here
*/
void CCWPass::runOnModule(SVFModule* svfModule)
{
  // format: caller -> csid -> ccwstring
  // ex) main -> 1 -> "foo-2,bar-3"
  ccw_t f2cs2ccw;
  parseCCWFile(Options::CCInput.getValue(), f2cs2ccw);

  std::string str;
  raw_string_ostream rawstr(str);

  Module*  mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
  for (auto& F : *mod) {

    // Skip if the caller is isIntrinsic
    if (F.isIntrinsic()) continue;

    // Skip if the caller is the instrumented function by DCCE.
    std::string CallerName = std::string(F.getName());
    if (CallerName == "dcceAddWeight" || CallerName == "dcceRemoveWeight") continue;

    rawstr << "In Function " << F.getName() << "\n";
    LLVMContext& C = F.getContext();
    uint64_t InstID = 0;

    for (auto &B : F) {
      for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
        llvm::Instruction* Inst = llvm::dyn_cast<llvm::Instruction>(bbit);

        // Skip if it's a callsite
        if (!SVFUtil::isCallSite(Inst)) continue;

        // Skip if it's intrinsic call
        llvm::CallBase* CallInst = llvm::dyn_cast<llvm::CallBase>(Inst);
        assert(CallInst != NULL);
        if (SVFUtil::isIntrinsicInst(CallInst)) {rawstr << "Skip inst: " << *Inst << "due to intrinsic\n"; continue; }

        // Skip if callee is the instrumented function by DCCE. 
        llvm::Function* Callee = CallInst->getCalledFunction();
        if (Callee != NULL) {
          if (Callee->isIntrinsic()) { rawstr << "Skip inst: " << *Inst << "due to callee is intrinsic (" << Callee << "\n"; continue; }
          std::string CalleeName = std::string(Callee->getName());
          if (CalleeName == "dcceAddWeight" || CalleeName == "dcceRemoveWeight") continue;
        } else {
          rawstr << "No callee for Callsite: " << *Inst << "\n";
        }
        
        rawstr << "Callsite: " << *Inst << "\n";
        rawstr << "Lookup ccw with caller: " << CallerName << ", csid: " << InstID << "\n";

        if (!(f2cs2ccw.find(CallerName) != f2cs2ccw.end()
          && f2cs2ccw[CallerName].find(InstID) != f2cs2ccw[CallerName].end())) {
          printf("%s", rawstr.str().c_str());
        }
        assert(f2cs2ccw.find(CallerName) != f2cs2ccw.end());
        assert(f2cs2ccw[CallerName].find(InstID) != f2cs2ccw[CallerName].end());
        std::string ccwstring = f2cs2ccw[CallerName][InstID];
        //CB->addCallingContextWeight(llvm::AttributeList::ReturnIndex, weight);
        MDNode* N = MDNode::get(C, MDString::get(C, ccwstring));
        Inst->setMetadata("ccwstring", N);
        InstID++;
      }
    }
  }
  printf("%s", rawstr.str().c_str());
  if (!Options::dumpModules.getValue().empty()) {
    LLVMModuleSet::getLLVMModuleSet()->dumpModulesToFile(Options::dumpModules.getValue());
  }
}

/*!
* We start from here
*/
bool CCWPass::runOnModule(Module& module)
{
  return false;
}
