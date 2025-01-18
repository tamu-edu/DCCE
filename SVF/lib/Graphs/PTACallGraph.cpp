//===- PTACallGraph.cpp -- Call graph used internally in SVF------------------//
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
//===----------------------------------------------------------------------===//


/*
 * PTACallGraph.cpp
 *
 *  Created on: Nov 7, 2013
 *      Author: Yulei Sui
 */
#include <stdio.h>
#include <iostream>
#include <fstream>
#include "Util/SVFModule.h"
#include "Util/Instrument.h"
#include "SVF-FE/LLVMUtil.h"
#include "Graphs/PTACallGraph.h"

#include <sstream>
#include <unordered_map>
#include <vector>
using namespace SVF;
using namespace SVFUtil;

PTACallGraph::CallSiteToIdMap PTACallGraph::csToIdMap;
PTACallGraph::IdToCallSiteMap PTACallGraph::idToCSMap;
PTACallGraph::CSInstToID PTACallGraph::csInstToID;
CallSiteID PTACallGraph::totalCallSiteNum = 1;


/// Add direct and indirect callsite
//@{
void PTACallGraphEdge::addDirectCallSite(const CallBlockNode* call)
{
    assert(SVFUtil::getCallee(call->getCallSite()) && "not a direct callsite??");
    directCalls.insert(call);
}

void PTACallGraphEdge::addInDirectCallSite(const CallBlockNode* call)
{
    assert((nullptr == SVFUtil::getCallee(call->getCallSite()) || nullptr == SVFUtil::dyn_cast<Function> (SVFUtil::getForkedFun(call->getCallSite()))) && "not an indirect callsite??");
    indirectCalls.insert(call);
}
//@}

const std::string PTACallGraphEdge::toString() const {
    std::string str;
    raw_string_ostream rawstr(str);
    rawstr << "CallSite ID: " << getCallSiteID();
    if(isDirectCallEdge())
        rawstr << "direct call";
    else
        rawstr << "indirect call";
    rawstr << "[" << getDstID() << "<--" << getSrcID() << "]\t";
    return rawstr.str();
}

const std::string PTACallGraphNode::toString() const {
    std::string str;
    raw_string_ostream rawstr(str);
    rawstr << "CallGraphNode ID: " << getId() << " {fun: " << fun->getName() << "}";
    return rawstr.str();
}

bool PTACallGraphNode::isReachableFromProgEntry() const
{
    std::stack<const PTACallGraphNode*> nodeStack;
    NodeBS visitedNodes;
    nodeStack.push(this);
    visitedNodes.set(getId());

    while (nodeStack.empty() == false)
    {
        PTACallGraphNode* node = const_cast<PTACallGraphNode*>(nodeStack.top());
        nodeStack.pop();

        if (SVFUtil::isProgEntryFunction(node->getFunction()))
            return true;

        for (const_iterator it = node->InEdgeBegin(), eit = node->InEdgeEnd(); it != eit; ++it)
        {
            PTACallGraphEdge* edge = *it;
            if (visitedNodes.test_and_set(edge->getSrcID()))
                nodeStack.push(edge->getSrcNode());
        }
    }

    return false;
}


/// Constructor
PTACallGraph::PTACallGraph(CGEK k): kind(k)
{
    callGraphNodeNum = 0;
    numOfResolvedIndCallEdge = 0;
}

/*!
 *  Memory has been cleaned up at GenericGraph
 */
void PTACallGraph::destroy()
{
}

/*!
 * Add call graph node
 */
void PTACallGraph::addCallGraphNode(const SVFFunction* fun)
{
    NodeID id = callGraphNodeNum;
    PTACallGraphNode* callGraphNode = new PTACallGraphNode(id, fun);
    addGNode(id,callGraphNode);
    funToCallGraphNodeMap[fun] = callGraphNode;
    ffunToCallGraphNodeMap[fun->getLLVMFun()] = callGraphNode;
    callGraphNodeNum++;
}

/*!
 *  Whether we have already created this call graph edge
 */
PTACallGraphEdge* PTACallGraph::hasGraphEdge(PTACallGraphNode* src, PTACallGraphNode* dst,PTACallGraphEdge::CEDGEK kind, CallSiteID csId) const
{
    PTACallGraphEdge edge(src,dst,kind,csId);
    PTACallGraphEdge* outEdge = src->hasOutgoingEdge(&edge);
    PTACallGraphEdge* inEdge = dst->hasIncomingEdge(&edge);
    if (outEdge && inEdge)
    {
        assert(outEdge == inEdge && "edges not match");
        return outEdge;
    }
    else
        return nullptr;
}

/*!
 * get CallGraph edge via nodes
 */
PTACallGraphEdge* PTACallGraph::getGraphEdge(PTACallGraphNode* src, PTACallGraphNode* dst,PTACallGraphEdge::CEDGEK kind, CallSiteID)
{
    for (PTACallGraphEdge::CallGraphEdgeSet::iterator iter = src->OutEdgeBegin();
            iter != src->OutEdgeEnd(); ++iter)
    {
        PTACallGraphEdge* edge = (*iter);
        if (edge->getEdgeKind() == kind && edge->getDstID() == dst->getId())
            return edge;
    }
    return nullptr;
}

/*!
 * Add direct call edges
 */
void PTACallGraph::addDirectCallGraphEdge(const CallBlockNode* cs,const SVFFunction* callerFun, const SVFFunction* calleeFun)
{

    PTACallGraphNode* caller = getCallGraphNode(callerFun);
    PTACallGraphNode* callee = getCallGraphNode(calleeFun);

    CallSiteID csId = addCallSite(cs, callee->getFunction());

    if(!hasGraphEdge(caller,callee, PTACallGraphEdge::CallRetEdge,csId))
    {
        PTACallGraphEdge* edge = new PTACallGraphEdge(caller,callee,PTACallGraphEdge::CallRetEdge,csId);
        edge->addDirectCallSite(cs);
        addEdge(edge);
        callinstToCallGraphEdgesMap[cs].insert(edge);
    }
}

/*!
 * Add indirect call edge to update call graph
 */
void PTACallGraph::addIndirectCallGraphEdge(const CallBlockNode* cs,const SVFFunction* callerFun, const SVFFunction* calleeFun)
{

    PTACallGraphNode* caller = getCallGraphNode(callerFun);
    PTACallGraphNode* callee = getCallGraphNode(calleeFun);

    numOfResolvedIndCallEdge++;

    CallSiteID csId = addCallSite(cs, callee->getFunction());

    if(!hasGraphEdge(caller,callee, PTACallGraphEdge::CallRetEdge,csId))
    {
        PTACallGraphEdge* edge = new PTACallGraphEdge(caller,callee,PTACallGraphEdge::CallRetEdge, csId);
        edge->addInDirectCallSite(cs);
        addEdge(edge);
        callinstToCallGraphEdgesMap[cs].insert(edge);
    }
}

/*!
 * Get all callsite invoking this callee
 */
void PTACallGraph::getAllCallSitesInvokingCallee(const SVFFunction* callee, PTACallGraphEdge::CallInstSet& csSet)
{
    PTACallGraphNode* callGraphNode = getCallGraphNode(callee);
    for(PTACallGraphNode::iterator it = callGraphNode->InEdgeBegin(), eit = callGraphNode->InEdgeEnd();
            it!=eit; ++it)
    {
        for(PTACallGraphEdge::CallInstSet::const_iterator cit = (*it)->directCallsBegin(),
                ecit = (*it)->directCallsEnd(); cit!=ecit; ++cit)
        {
            csSet.insert((*cit));
        }
        for(PTACallGraphEdge::CallInstSet::const_iterator cit = (*it)->indirectCallsBegin(),
                ecit = (*it)->indirectCallsEnd(); cit!=ecit; ++cit)
        {
            csSet.insert((*cit));
        }
    }
}

/*!
 * Get direct callsite invoking this callee
 */
void PTACallGraph::getDirCallSitesInvokingCallee(const SVFFunction* callee, PTACallGraphEdge::CallInstSet& csSet)
{
    PTACallGraphNode* callGraphNode = getCallGraphNode(callee);
    for(PTACallGraphNode::iterator it = callGraphNode->InEdgeBegin(), eit = callGraphNode->InEdgeEnd();
            it!=eit; ++it)
    {
        for(PTACallGraphEdge::CallInstSet::const_iterator cit = (*it)->directCallsBegin(),
                ecit = (*it)->directCallsEnd(); cit!=ecit; ++cit)
        {
            csSet.insert((*cit));
        }
    }
}

/*!
 * Get indirect callsite invoking this callee
 */
void PTACallGraph::getIndCallSitesInvokingCallee(const SVFFunction* callee, PTACallGraphEdge::CallInstSet& csSet)
{
    PTACallGraphNode* callGraphNode = getCallGraphNode(callee);
    for(PTACallGraphNode::iterator it = callGraphNode->InEdgeBegin(), eit = callGraphNode->InEdgeEnd();
            it!=eit; ++it)
    {
        for(PTACallGraphEdge::CallInstSet::const_iterator cit = (*it)->indirectCallsBegin(),
                ecit = (*it)->indirectCallsEnd(); cit!=ecit; ++cit)
        {
            csSet.insert((*cit));
        }
    }
}

/*!
 * Issue a warning if the function which has indirect call sites can not be reached from program entry.
 */
void PTACallGraph::verifyCallGraph()
{
    CallEdgeMap::const_iterator it = indirectCallMap.begin();
    CallEdgeMap::const_iterator eit = indirectCallMap.end();
    for (; it != eit; ++it)
    {
        const FunctionSet& targets = it->second;
        if (targets.empty() == false)
        {
            const CallBlockNode* cs = it->first;
            const SVFFunction* func = cs->getCaller();
            if (getCallGraphNode(func)->isReachableFromProgEntry() == false)
                writeWrnMsg(func->getName().str() + " has indirect call site but not reachable from main");
        }
    }
}

/*!
 * Whether its reachable between two functions
 */
bool PTACallGraph::isReachableBetweenFunctions(const SVFFunction* srcFn, const SVFFunction* dstFn) const
{
    PTACallGraphNode* dstNode = getCallGraphNode(dstFn);

    std::stack<const PTACallGraphNode*> nodeStack;
    NodeBS visitedNodes;
    nodeStack.push(dstNode);
    visitedNodes.set(dstNode->getId());

    while (nodeStack.empty() == false)
    {
        PTACallGraphNode* node = const_cast<PTACallGraphNode*>(nodeStack.top());
        nodeStack.pop();

        if (node->getFunction() == srcFn)
            return true;

        for (CallGraphEdgeConstIter it = node->InEdgeBegin(), eit = node->InEdgeEnd(); it != eit; ++it)
        {
            PTACallGraphEdge* edge = *it;
            if (visitedNodes.test_and_set(edge->getSrcID()))
                nodeStack.push(edge->getSrcNode());
        }
    }

    return false;
}

/*!
 * Dump call graph into dot file
 */
void PTACallGraph::dump(const std::string& filename)
{
    //-----------------------------------------------------
    // Call graph
    //-----------------------------------------------------
    std::ofstream fout;
    fout.open(filename + ".cg");
    std::string str;
    raw_string_ostream rawstr(str);

    Module* mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
    for (auto& F : *mod) {
        NodeID callSiteID = 0;
        rawstr << "In Function " << F.getName() << "\n";
        for (auto &B : F) {
            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
                auto &I = *bbit;
                if (!SVFUtil::isCallSite(&I)) continue;
                const llvm::Instruction* csInst = llvm::dyn_cast<llvm::Instruction>(&I);
                if (csInstToID.find(csInst) == csInstToID.end()) {
                    rawstr << "CS Instruction not in csInstToID, skipping ... " << *csInst << "\n";
                    continue;
                }

                const SVFFunction* firstCallerFunc = NULL;
                PTACallGraphNode* firstCallerNode = NULL;
                bool first = true;
                bool needLineBreak = false;
                bool isIndirect = csInstToID.find(csInst)->second.size() > 1;
                for (auto csID : csInstToID.find(csInst)->second) {
                    const SVFFunction* callerFunc = getCallerOfCallSite(csID);
                    PTACallGraphNode* callerNode = getCallGraphNode(callerFunc);
                    const SVFFunction* calleeFunc = getCalleeOfCallSite(csID);
                    PTACallGraphNode* calleeNode = getCallGraphNode(calleeFunc);

                    if (first) {
                        firstCallerFunc = callerFunc;
                        firstCallerNode = callerNode;
                    }
                    assert(firstCallerFunc == callerFunc);
                    assert(firstCallerNode == callerNode);

                    if (callerFunc == NULL) { rawstr << "Caller of CSID: " << csID << " is null\n"; continue; }
                    if (calleeFunc == NULL) { rawstr << "Callee of CSID: " << csID << " is null\n"; continue; }
                    if (callerFunc->isIntrinsic()) { rawstr << "skip inst - " << *csInst << " due to caller is intrinssic" << callerFunc << "\n"; continue; }
                    if (calleeFunc->isIntrinsic()) { rawstr << "skip inst - " << *csInst << " due to callee is intrinssic" << calleeFunc << "\n"; continue; }

                    std::string callerName = std::string(callerNode->getFunction()->getName());
                    std::string calleeName = std::string(calleeNode->getFunction()->getName());
                    NodeID callerID = callerNode->getId();
                    NodeID calleeID = calleeNode->getId();
                    assert(idToCSMap.find(csID) != idToCSMap.end());
                    const CallBlockNode* cbnode = idToCSMap.find(csID)->second.first;

                    if (callerName == "addWeight" || callerName == "removeWeight"
                        || calleeName == "addWeight" || calleeName == "removeWeight") {
                        rawstr << "Skip addWeight or removeWeight caller and callee\n";
                        continue;
                    }

                    if (first) {
                        std::string csStr;
                        raw_string_ostream rawcsStr(csStr);
                        if (cbnode->isIndirectCall()) rawcsStr << callSiteID << "-i";
                        else            rawcsStr << callSiteID << "-d";
                        fout << callerName << "-" << callerID << ":" << rawcsStr.str() << ":";
                        first = false;
                    }

                    fout << csID << "-" << calleeName << "-" << calleeID << ",";
                    needLineBreak = true;
                }
                if (needLineBreak) {
                    fout << "\n";
                    callSiteID += 1;
                }
            }
        }
    }
    printf("%s", rawstr.str().c_str());
    fout.close();

    //-----------------------------------------------------
    // Indirect Call
    //-----------------------------------------------------
    fout.open(filename + ".indcall");
    std::string str2;
    raw_string_ostream rawstr2(str2);

    unsigned long max_callees = 0;
    rawstr2 << "callsite --> {Set of possible callees} #of callees\n";
    for (auto it : indirectCallMap) {
        const CallBlockNode* cbnode = it.first;
        rawstr2 << cbnode->toString() << " --> {";
        for (auto function : it.second) {
            rawstr2 << function->getName() << ", ";
        }

        unsigned long num_callees = it.second.size();
        if (num_callees > max_callees) {
            max_callees = num_callees;
        }
        rawstr2 << "} " << num_callees << "\n";
    }
    rawstr2 << "max_num_callees: " << max_callees << "\n";
    fout << rawstr2.str();
    fout.close();
    GraphPrinter::WriteGraphToFile(outs(), filename, this);
}

void PTACallGraph::instrument(const std::string& ccinput,
                              const unsigned int bench_code,
                              const unsigned int scheme,
                              const unsigned int client)
{
    std::unordered_map<int64_t, int64_t> cs2w;
    std::unordered_map<int64_t, int64_t> cs2type;

    // Instrumtation for PCC does not need CC files
    if (scheme != PTACallGraph::pcc)
        SVFUtil::parse_static_ccfile(ccinput, cs2w, cs2type);

    Module*       mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
    LLVMContext&  ctx = LLVMModuleSet::getLLVMModuleSet()->getContext();

    // using rtlib
    std::vector<Type*>  initCallgraph_paramTypes    = {Type::getInt64Ty(ctx)};
    Type*               initCallgraph_retType       = Type::getVoidTy(ctx);
    FunctionType*       initCallgraph_funcType      = FunctionType::get(initCallgraph_retType,
                                                                        initCallgraph_paramTypes, false);
    FunctionCallee      initCallgraph = mod->getOrInsertFunction("initCallgraph", initCallgraph_funcType);
    FunctionCallee      initRuntime = mod->getOrInsertFunction("initRuntime", initCallgraph_funcType);
    FunctionCallee      printStats = mod->getOrInsertFunction("printStats", initCallgraph_funcType);
    FunctionCallee      saveProfile = mod->getOrInsertFunction("saveProfile", initCallgraph_funcType);

    std::vector<Type*>  getCCID_paramTypes    = {Type::getInt64Ty(ctx)};
    Type*               getCCID_retType       = Type::getInt64Ty(ctx);
    FunctionType*       getCCID_funcType      = FunctionType::get(getCCID_retType, getCCID_paramTypes, false);
    FunctionCallee      getCCID       = mod->getOrInsertFunction("getCCID", getCCID_funcType);

    std::vector<Type*>  profile_paramTypes    = {Type::getInt64Ty(ctx)};
    Type*               profile_retType       = Type::getInt64Ty(ctx);
    FunctionType*       profile_funcType      = FunctionType::get(profile_retType, profile_paramTypes, false);
    FunctionCallee      profile       = mod->getOrInsertFunction("profile", profile_funcType);
    
    std::vector<Type*>  paramTypes    = {Type::getInt64Ty(ctx),Type::getInt64Ty(ctx)};
    Type*               retType       = Type::getVoidTy(ctx);
    FunctionType*       funcType      = FunctionType::get(retType, paramTypes, false);
    FunctionCallee      addWeight     = mod->getOrInsertFunction("addWeight", funcType);
    FunctionCallee      removeWeight  = mod->getOrInsertFunction("removeWeight", funcType);
    FunctionCallee      addWeightRec     = mod->getOrInsertFunction("addWeightRec", funcType);
    FunctionCallee      removeWeightRec  = mod->getOrInsertFunction("removeWeightRec", funcType);
    FunctionCallee      addWeightEntry  = mod->getOrInsertFunction("addWeightEntry", funcType);
    FunctionCallee      removeWeightEntry = mod->getOrInsertFunction("removeWeightEntry", funcType);
    FunctionCallee      addWeightEB = mod->getOrInsertFunction("addWeightEB", funcType);
    FunctionCallee      removeWeightEB = mod->getOrInsertFunction("removeWeightEB", funcType);
    FunctionCallee      setCCID = mod->getOrInsertFunction("setCCID", funcType);
	//4-D:6-F:5-EB:1
	//4-D:1-E:4-R:3
	//8-main:2-C:10-E:1
	//8-main:0-B:9-R:9
	//6-F:7-H:8-R:1
	//6-F:2-C:7-B:-1
	//0-B:1-E:1-R:1
	//5-G:6-F:6-EB:1
	//2-C:5-G:3-R:1
	//2-C:4-D:2-R:4

    bool insert_init_runtime = false;
    std::string str;
    raw_string_ostream rawstr(str);

    rawstr << "Instrumenting " << ccinput << " scheme :" << scheme << "\n";

    for (auto& F : *mod) {
        rawstr << "In Function " << F.getName() << "\n";
        llvm::AllocaInst *cur_ccid;
        bool insert_getccid = false;
        bool insert_profile = false;
        bool store_ccid = false;
        for (auto &B : F) {
          rawstr << "Found Basic Block \n";
            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
                auto &I = *bbit;
                rawstr << "Instruction " << I << "\n";

                //-----------------------------
                // Instrument initRuntime call
                //-----------------------------
                if (F.getName() == "main" && !insert_init_runtime) {
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, bench_code, true);
                    Value* args[] = {i64_val};
                    builder.CreateCall(initRuntime, args);
                    insert_init_runtime = true;
                }

                //-----------------------------
                // Instrument getCCID call for Whistle in every function
                //-----------------------------
                if (client == PTACallGraph::whistle) {
		    if (!insert_getccid) {
                        rawstr << "Inserting getCCID\n";
                        PTACallGraphNode* node = getCallGraphNode(&F);
                        IRBuilder builder(&I);
                        builder.SetInsertPoint(&I);

                        llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);

                        if (scheme == PTACallGraph::pcc)
                            cur_ccid = builder.CreateAlloca(i64_type, nullptr, "__cur_ccid");
                        llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, node->getId(), true);
                        Value* args[] = {i64_val};
			llvm::CallInst *call = builder.CreateCall(getCCID, args);
                        if (scheme == PTACallGraph::pcc) {
                            builder.CreateStore(call, cur_ccid);
                            store_ccid = true;
                        }
                        insert_getccid = true;
		    }
                } else if (client == PTACallGraph::profile) {
                    if (!insert_profile) {
                        rawstr << "Inserting profile\n";
                        PTACallGraphNode* node = getCallGraphNode(&F);
                        IRBuilder builder(&I);
                        builder.SetInsertPoint(&I);

                        llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                        if (scheme == PTACallGraph::pcc)
                            cur_ccid = builder.CreateAlloca(i64_type, nullptr, "__cur_ccid");
                        llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, node->getId(), true);
                        Value* args[] = {i64_val};
			llvm::CallInst *call = builder.CreateCall(profile, args);
                        if (scheme == PTACallGraph::pcc) {
                            builder.CreateStore(call, cur_ccid);
                            store_ccid = true;
                        }
                        insert_profile = true;
		    }
                }

                // Check is the current instruction is return or exit call in main
                if (F.getName() == "main") {
                  bool isExitCall = false;
                  bool isReturn = false;

                  if (SVFUtil::isReturn(&I)) isReturn = true;
                  if (SVFUtil::isCallSite(&I)) {
                    const llvm::Instruction* csInst = llvm::dyn_cast<llvm::Instruction>(&I);
                    if (csInstToID.find(csInst) != csInstToID.end()) {
                      // "exit" must be direct call
                      if (csInstToID.find(csInst)->second.size() == 1) {
                        for (auto csID : csInstToID.find(csInst)->second) {
                          const SVFFunction* calleeFunc = getCalleeOfCallSite(csID);
                          PTACallGraphNode* calleeNode = getCallGraphNode(calleeFunc);
                          std::string calleeName = std::string(calleeNode->getFunction()->getName());
                          if (calleeName == "exit") isExitCall = true;
                        }
                      }
                    }
                  }

                  if (isReturn || isExitCall) {
                    if (client == PTACallGraph::profile) {
                      rawstr << "Inserting saveProfile for " << I << "\n";
                      IRBuilder builder(&I);
                      builder.SetInsertPoint(&I);
                      llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                      llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, bench_code, true);
                      Value* args[] = {i64_val};
                      builder.CreateCall(saveProfile, args);
                    }

                    rawstr << "Inserting printStats for " << I << "\n";
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);
                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, bench_code, true);
                    Value* args[] = {i64_val};
                    builder.CreateCall(printStats, args);
                  }
                }

                if (!SVFUtil::isCallSite(&I)) continue;
                const llvm::Instruction* csInst = llvm::dyn_cast<llvm::Instruction>(&I);
                if (csInstToID.find(csInst) == csInstToID.end()) {
                    rawstr << "CS Instruction not in csInstToID, skipping ... " << *csInst << "\n";
                    continue;
                }

                //bool isIndirect = csInstToID.find(csInst)->second.size() > 1;
                //if (isIndirect && scheme != PTACallGraph::pcc) {
                //    rawstr << "Skip Instruction " << *csInst << " due to indirect call\n";
                //    continue;
                //}
	
                for (auto csID : csInstToID.find(csInst)->second) {
                    const SVFFunction* callerFunc = getCallerOfCallSite(csID);
                    PTACallGraphNode* callerNode = getCallGraphNode(callerFunc);
                    const SVFFunction* calleeFunc = getCalleeOfCallSite(csID);
                    PTACallGraphNode* calleeNode = getCallGraphNode(calleeFunc);

                    if (!callerFunc) {
                        rawstr << "Caller of CSID: " << csID << " is null\n";
                        continue;
                    }
                    if (!calleeFunc) {
                        rawstr << "Callee of CSID: " << csID << " is null\n";
                        continue;
                    }
                    if (callerFunc->isIntrinsic()) {
                        rawstr << "skip inst - " << *csInst << " due to caller is intrinssic" << callerFunc << "\n";
                        continue;
                    }
                    if (calleeFunc->isIntrinsic()) {
                        rawstr << "skip inst - " << *csInst << " due to callee is intrinssic" << calleeFunc << "\n";
                        continue;
                    }

                    std::string callerName = std::string(callerNode->getFunction()->getName());
                    std::string calleeName = std::string(calleeNode->getFunction()->getName());
                    NodeID callerID = callerNode->getId();
                    NodeID calleeID = calleeNode->getId();
                    assert(idToCSMap.find(csID) != idToCSMap.end());
                    const CallBlockNode* cbnode = idToCSMap.find(csID)->second.first;

                    if (callerName == "addWeight" || calleeName == "addWeight"
                        || callerName == "removeWeight" || calleeName == "removeWeight"
                        || callerName == "addWeightRec" || calleeName == "addWeightRec"
                        || callerName == "removeWeightRec" || calleeName == "removeWeightRec"
                        || callerName == "addWeightEB" || calleeName == "addWeightEB") {
                        // FIXME: check both calleeName and callerName
                        rawstr << "Skip addWeight or removeWeight related calls\n";
                        continue;
                    }

                    int64_t weight;
                    //-----------------------------
                    // Found the target call-site to instrument
                    // Instrument getCCID call
                    //-----------------------------
                    if (scheme == PTACallGraph::pcc) {
                        weight = rand() % 1000000000;
                    } else {
                        if (cs2w.find(csID) == cs2w.end()) {
                            continue;
                        }
                        weight = cs2w[csID];
                        //edgeType = cs2type[csID];
                    }

                    bool recursive = false;
                    if (weight == 0) {
                        continue;
                    }
                    if (weight == -1) {
                        recursive = true;
                        weight = 0; // Without Recursive
                    }

                    // using rtlib
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    PTACallGraphNode* node = getCallGraphNode(&F);
                    assert(node);

                    llvm::Type *i64_type_w      = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Type *i64_type_nid    = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val_w   = llvm::ConstantInt::get(i64_type_w, weight, true);
                    llvm::Constant *i64_val_nid = llvm::ConstantInt::get(i64_type_nid, node->getId(), true);
                    Value* args[] = { i64_val_w, i64_val_nid };

                    // With Recursive
                    //switch (edgeType) {
                    //  case 1 /*Regular Edge (R)*/:
                    //    builder.CreateCall(addWeight, args);
                    //    break;
                    //  case 2 /*Back Edge (B)*/:
                    //    builder.CreateCall(addWeightRec, args);
                    //    break;
                    //  case 3 /*Entry Edge (E)*/:
                    //    builder.CreateCall(addWeightEntry, args);
                    //    break;
                    //  case 4 /*Entry or Back Edge (EB)*/:
                    //    builder.CreateCall(addWeightEB, args);
                    //    break;
                    //  default:
                    //    assert(false && "Unknown edgeType");
                    //}

                    // Without Recursive
                    if (store_ccid) {
                        rawstr << "Inserting setCCID(__cur_ccid, " << node->getId() << ") before " << I << "\n";
                        args[0] = builder.CreateLoad(cur_ccid);
                        builder.CreateCall(setCCID, args);

                    } else if (recursive && scheme != PTACallGraph::pcc) {
                      rawstr << "Inserting addWeightRec(" << weight << ", " << node->getId() << ") before " << I << "\n";
                      builder.CreateCall(addWeightRec, args);
                    } else {
                      rawstr << "Inserting addWeight(" << weight << ", " << node->getId() << ") before " << I << "\n";
                      builder.CreateCall(addWeight, args);
                    }

                    for (auto* SI : SVF::SVFUtil::get_succ_insts(&I)) {
                      IRBuilder builder(SI);
                      builder.SetInsertPoint(SI);

                      // With Recursive
                      //switch (edgeType) {
                      //  case 1 /*Regular Edge (R)*/:
                      //    builder.CreateCall(removeWeight, args);
                      //    break;
                      //  case 2 /*Back Edge (B)*/:
                      //    builder.CreateCall(removeWeightRec, args);
                      //    break;
                      //  case 3 /*Entry Edge (E)*/:
                      //    builder.CreateCall(removeWeightEntry, args);
                      //    break;
                      //  case 4 /*Entry or Back Edge (EB)*/:
                      //    builder.CreateCall(removeWeightEB, args);
                      //    break;
                      //  default:
                      //    assert(false && "Unknown edgeType");
                      //}

                      // Without Recursive
                      if (store_ccid) {
                        rawstr << "Inserting setCCID(__cur_ccid, " << node->getId() << ") before " << *SI << "\n";
                        args[0] = builder.CreateLoad(cur_ccid);
                        builder.CreateCall(setCCID, args);

                      } else if (recursive && scheme != PTACallGraph::pcc) {
                        rawstr << "Inserting removeWeightRec(" << weight << ", " << node->getId() << ") before " << *SI << "\n";
                        builder.CreateCall(removeWeightRec, args);
                      } else {
                        rawstr << "Inserting removeWeight(" << weight << ", " << node->getId() << ") before " << *SI << "\n";
                        builder.CreateCall(removeWeight, args);
                      }
                    }

                    // Inserting Callback function for Barrier Elision
                    if (client == PTACallGraph::barrier_elider) {
                      if (F.getName() == "pthread_create"
                          || calleeName == "pthread_cond_broadcast"
			  || calleeName == "pthread_barrier_wait"
                          || calleeName == "pthread_cond_wait") {
                        rawstr << "Inserting barrierElider to " << calleeName << "\n";
                        PTACallGraphNode* node = getCallGraphNode(&F);
                        IRBuilder builder(&I);
                        builder.SetInsertPoint(&I);

                        llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                        llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, node->getId(), true);
                        Value* args[] = {i64_val};
                        builder.CreateCall(getCCID, args);
                      }
                    }

		    break; // Break after inserting one call
                }
            }
        }
    }
    printf("%s", rawstr.str().c_str());
}

void PTACallGraph::add_ccweights(const std::string& ccinput)
{
    ccw_t f2cs2ccw;
    //std::unordered_map<uint64_t, uint64_t> cs2w;
    SVFUtil::parseCCWFile(ccinput, f2cs2ccw);

    std::string str;
    raw_string_ostream rawstr(str);

    Module*  mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
    for (auto& F : *mod) {
        NodeID callSiteID = 0;
        rawstr << "In Function " << F.getName() << "\n";
        LLVMContext& C = F.getContext();
        for (auto &B : F) {
            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
                auto &I = *bbit;
                if (!SVFUtil::isCallSite(&I)) continue;
                const llvm::Instruction* csInst = llvm::dyn_cast<llvm::Instruction>(&I);
                if (csInstToID.find(csInst) == csInstToID.end()) {
                    //rawstr << "CS Instruction not in csInstToID, skipping ... " << *csInst << "\n";
                    continue;
                }

                const SVFFunction* firstCallerFunc = NULL;
                PTACallGraphNode* firstCallerNode = NULL;
                bool first = true;
                bool needLineBreak = false;
                bool isIndirect = csInstToID.find(csInst)->second.size() > 1;
                rawstr << "In callsite " << I << "\n";

                for (auto csID : csInstToID.find(csInst)->second) {
                    const SVFFunction* callerFunc = getCallerOfCallSite(csID);
                    PTACallGraphNode* callerNode = getCallGraphNode(callerFunc);
                    const SVFFunction* calleeFunc = getCalleeOfCallSite(csID);
                    PTACallGraphNode* calleeNode = getCallGraphNode(calleeFunc);
                    if (first) {
                        firstCallerFunc = callerFunc;
                        firstCallerNode = callerNode;
                    }
                    assert(firstCallerFunc == callerFunc);
                    assert(firstCallerNode == callerNode);

                    if (callerFunc == NULL) { rawstr << "Caller of CSID " << csID << " is null\n"; continue; }
                    if (calleeFunc == NULL) { rawstr << "Callee of CSID " << csID << " is null\n"; continue; }
                    if (callerFunc->isIntrinsic()) { continue; }
                    if (calleeFunc->isIntrinsic()) { continue; }

                    std::string callerName = std::string(callerNode->getFunction()->getName());
                    std::string calleeName = std::string(calleeNode->getFunction()->getName());

                    if (callerName == "addWeight" || calleeName == "addWeight"
                        || callerName == "removeWeight" || calleeName == "removeWeight") {
                        rawstr << "Skip addWeight or removeWeight caller and callee\n";
                        continue;
                    }

                    rawstr << "Finding callSiteID " << callSiteID << " in f2cs2ccw for " << I << "\n";
                    if (f2cs2ccw[callerName].find(callSiteID) == f2cs2ccw[callerName].end()) {
                        rawstr << "callSiteID " << callSiteID << " not found in cg file\n";
                        printf("%s", rawstr.str().c_str());
                    }
                    assert(f2cs2ccw[callerName].find(callSiteID) != f2cs2ccw[callerName].end());
                    std::string weight = f2cs2ccw[callerName][callSiteID];
                    //if (weight > 0) {
                    //    auto *CB = llvm::dyn_cast<llvm::CallBase>(&I);
                    //    assert(CB != NULL);
                    //    CB->addCallingContextWeight(llvm::AttributeList::ReturnIndex, weight);
                    //    rawstr << "Inserting CCWeiht "  << weight << " to " << I << "\n";
                    //}
                    MDNode* N = MDNode::get(C, MDString::get(C, weight));
                    I.setMetadata("ccwstring", N);
                    callSiteID += 1;
                    break;
                }
            }
        }
    }
    printf("%s", rawstr.str().c_str());
}

void PTACallGraph::view()
{
    llvm::ViewGraph(this, "Call Graph");
}

namespace llvm
{

/*!
 * Write value flow graph into dot file for debugging
 */
template<>
struct DOTGraphTraits<PTACallGraph*> : public DefaultDOTGraphTraits
{

    typedef PTACallGraphNode NodeType;
    typedef NodeType::iterator ChildIteratorType;
    DOTGraphTraits(bool isSimple = false) :
        DefaultDOTGraphTraits(isSimple)
    {
    }

    /// Return name of the graph
    static std::string getGraphName(PTACallGraph*)
    {
        return "Call Graph";
    }
    /// Return function name;
    static std::string getNodeLabel(PTACallGraphNode *node, PTACallGraph*)
    {
        return node->toString();
    }

    static std::string getNodeAttributes(PTACallGraphNode *node, PTACallGraph*)
    {
        const SVFFunction* fun = node->getFunction();
        if (!SVFUtil::isExtCall(fun))
        {
            return "shape=box";
        }
        else
            return "shape=Mrecord";
    }

    template<class EdgeIter>
    static std::string getEdgeAttributes(PTACallGraphNode*, EdgeIter EI, PTACallGraph*)
    {

        //TODO: mark indirect call of Fork with different color
        PTACallGraphEdge* edge = *(EI.getCurrent());
        assert(edge && "No edge found!!");

        std::string color;

        if (edge->getEdgeKind() == PTACallGraphEdge::TDJoinEdge)
        {
            color = "color=green";
        }
        else if (edge->getEdgeKind() == PTACallGraphEdge::TDForkEdge)
        {
            color = "color=blue";
        }
        else
        {
            color = "color=black";
        }
        if (0 != edge->getIndirectCalls().size())
        {
            color = "color=red";
        }
        return color;
    }

    template<class EdgeIter>
    static std::string getEdgeSourceLabel(NodeType*, EdgeIter EI)
    {
        PTACallGraphEdge* edge = *(EI.getCurrent());
        assert(edge && "No edge found!!");

        std::string str;
        raw_string_ostream rawstr(str);
        rawstr << edge->getCallSiteID();

        return rawstr.str();
    }
};
} // End namespace llvm
