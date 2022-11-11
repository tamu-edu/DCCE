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

//void PTACallGraph::instrument(const std::string& ccinput,
//                              const unsigned int bench_code,
//                              const unsigned int scheme)
//{
//
//    std::unordered_map<uint64_t, uint64_t> cs2w;
//    SVFUtil::parse_static_ccfile(ccinput, cs2w);
//
//    Module*       mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
//    LLVMContext&  ctx = LLVMModuleSet::getLLVMModuleSet()->getContext();
//
//    // using rtlib
//    std::vector<Type*>  paramTypes    = {Type::getInt64Ty(ctx)};
//    Type*               retType       = Type::getVoidTy(ctx);
//    FunctionType*       funcType      = FunctionType::get(retType, paramTypes, false);
//    FunctionCallee      addWeight     = mod->getOrInsertFunction("addWeight", funcType);
//    FunctionCallee      removeWeight  = mod->getOrInsertFunction("removeWeight", funcType);
//    FunctionCallee      initCallgraph = mod->getOrInsertFunction("initCallgraph", funcType);
//    FunctionCallee      getCCID       = mod->getOrInsertFunction("getCCID", funcType);
//
//    bool insert_init = false;
//    std::string str;
//    raw_string_ostream rawstr(str);
//
//    for (auto& F : *mod) {
//        rawstr << "Function " << F.getName().str() << "\n";
//        bool insert_getccid = false;
//        for (auto &B : F) {
//            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
//                auto &I = *bbit;
//
//                if (scheme == 3/*pcce_ccid_overhead*/ && F.getName() == "main" && !insert_init) {
//                    IRBuilder builder(&I);
//                    builder.SetInsertPoint(&I);
//
//                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
//                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, bench_code, true);
//                    Value* args[] = {i64_val};
//                    builder.CreateCall(initCallgraph, args);
//                    insert_init = true;
//                }
//
//                if ((scheme == 1 || scheme == 3) &&!insert_getccid) {
//                    rawstr << "Inserting getCCID\n";
//                    PTACallGraphNode* node = getCallGraphNode(&F);
//                    IRBuilder builder(&I);
//                    builder.SetInsertPoint(&I);
//
//                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
//                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, node->getId(), true);
//                    Value* args[] = {i64_val};
//                    builder.CreateCall(getCCID, args);
//                    insert_getccid = true;
//                }
//
//
//                if (SVFUtil::isCallSite(&I)) {
//                    auto *CB = llvm::dyn_cast<llvm::CallBase>(&I);
//                    Function *func = CB->getCalledFunction();
//  
//                    // Check if the CallBase does not have to have CCWeight
//                    bool IsIntrinsic = false;
//                    bool IsInstrumentedFunc = false;
//                    if (func != NULL) {
//                        IsIntrinsic = func->isIntrinsic();
//                        IsInstrumentedFunc = (func->getName() == "addWeight"
//                            || func->getName() == "removeWeight"
//                            || func->getName() == "initCallgraph"
//                            || func->getName() == "getCCID");
//                    }
//
//                    if (IsIntrinsic || IsInstrumentedFunc) {
//                        rawstr << "  Skipping instruction" << *CB
//                            << " due to IsIntrinsic: " << IsIntrinsic
//                            << ", IsInstrumentedFunc: " << IsInstrumentedFunc << "\n";
//                        continue;
//                    }
//
//                    CSInstToID::const_iterator it = csInstToID.find(&I);
//                    if (it == csInstToID.end()) {
//                        rawstr << "Can't find csid of call " << I << "\n";
//                        //printf("%s\n", rawstr.str().c_str());
//                        continue;
//                        //assert(it != csInstToID.end());
//                    }
//                    if ((it->second).size() > 1) {
//                        rawstr << "  Indirect call " << I
//                            << " has more than one call targets ("
//                            << (it->second).size() << "). Instrumentation is skipped because we don't know the call target at runtime\n";
//                        continue;
//                    }
//
//                    // Instrument direct call or indirect call with a single call target.
//                    for (auto csid : it->second) {
//                        //const SVFFunction* callerFunc = getCallerOfCallSite(csid);
//                        //PTACallGraphNode* callerNode = getCallGraphNode(callerFunc);
//                        //if (callerFunc == NULL || callerNode == NULL) { rawstr << "Caller of CSID " << csid << " is null\n"; continue; }
//                        //std::string callerName = std::string(callerNode->getFunction()->getName());
//
//                        assert (cs2w.find(csid) != cs2w.end());
//                        unsigned long long int weight = cs2w[csid];
//                        if (weight == 0) {
//                            continue;
//                        }
//
//                        rawstr << "  Inserting add/removeWeight with CCWeight " << weight
//                            << " before/after CB " << *CB << "\n";
//
//                        // using rtlib
//                        IRBuilder builder(&I);
//                        builder.SetInsertPoint(&I);
//
//                        llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
//                        llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, weight, true);
//                        Value* args[] = {i64_val};
//                        builder.CreateCall(addWeight, args);
//
//                        for (auto* SI : SVF::SVFUtil::get_succ_insts(&I)) {
//                            builder.SetInsertPoint(SI);
//                            builder.CreateCall(removeWeight, args);
//                        }
//                    }
//
//                }
//            }
//        }
//    }
//    printf("%s\n", rawstr.str().c_str());
//}

void PTACallGraph::instrument(const std::string& ccinput,
                              const unsigned int bench_code,
                              const unsigned int scheme)
{
    std::unordered_map<int64_t, int64_t> cs2w;
    SVFUtil::parse_static_ccfile(ccinput, cs2w);

    Module*       mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
    LLVMContext&  ctx = LLVMModuleSet::getLLVMModuleSet()->getContext();

    // using rtlib
    std::vector<Type*>  initCallgraph_paramTypes    = {Type::getInt64Ty(ctx)};
    Type*               initCallgraph_retType       = Type::getVoidTy(ctx);
    FunctionType*       initCallgraph_funcType      = FunctionType::get(initCallgraph_retType,
                                                                        initCallgraph_paramTypes, false);
    FunctionCallee      initCallgraph = mod->getOrInsertFunction("initCallgraph", initCallgraph_funcType);

    std::vector<Type*>  getCCID_paramTypes    = {Type::getInt64Ty(ctx)};
    Type*               getCCID_retType       = Type::getInt64Ty(ctx);
    FunctionType*       getCCID_funcType      = FunctionType::get(getCCID_retType, getCCID_paramTypes, false);
    FunctionCallee      getCCID       = mod->getOrInsertFunction("getCCID", getCCID_funcType);


    std::vector<Type*>  paramTypes    = {Type::getInt64Ty(ctx),Type::getInt64Ty(ctx)};
    Type*               retType       = Type::getVoidTy(ctx);
    FunctionType*       funcType      = FunctionType::get(retType, paramTypes, false);
    FunctionCallee      addWeight     = mod->getOrInsertFunction("addWeight", funcType);
    FunctionCallee      removeWeight  = mod->getOrInsertFunction("removeWeight", funcType);
    FunctionCallee      addWeightRec     = mod->getOrInsertFunction("addWeightRec", funcType);
    FunctionCallee      removeWeightRec  = mod->getOrInsertFunction("removeWeightRec", funcType);

    bool insert_init = false;
    std::string str;
    raw_string_ostream rawstr(str);

    for (auto& F : *mod) {
        rawstr << "In Function " << F.getName() << "\n";
        bool insert_getccid = false;
        for (auto &B : F) {
            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
                auto &I = *bbit;

                //-----------------------------
                // Instrument initCallgraph call
                //-----------------------------
                if (scheme == 3/*pcce_ccid_overhead*/ && F.getName() == "main" && !insert_init) {
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, bench_code, true);
                    Value* args[] = {i64_val};
                    builder.CreateCall(initCallgraph, args);
                    insert_init = true;
                }

                //-----------------------------
                // Instrument getCCID call
                //-----------------------------
                if ((scheme == 1 || scheme == 3) &&!insert_getccid) {
                    rawstr << "Inserting getCCID\n";
                    PTACallGraphNode* node = getCallGraphNode(&F);
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, node->getId(), true);
                    Value* args[] = {i64_val};
                    builder.CreateCall(getCCID, args);
                    insert_getccid = true;
                }


                if (!SVFUtil::isCallSite(&I)) continue;
                const llvm::Instruction* csInst = llvm::dyn_cast<llvm::Instruction>(&I);
                if (csInstToID.find(csInst) == csInstToID.end()) {
                    rawstr << "CS Instruction not in csInstToID, skipping ... " << *csInst << "\n";
                    continue;
                }

                bool isIndirect = csInstToID.find(csInst)->second.size() > 1;
                if (isIndirect) {
                    rawstr << "Skip Instruction " << *csInst << " due to indirect call\n";
                    continue;
                }
                for (auto csID : csInstToID.find(csInst)->second) {
                    const SVFFunction* callerFunc = getCallerOfCallSite(csID);
                    PTACallGraphNode* callerNode = getCallGraphNode(callerFunc);
                    const SVFFunction* calleeFunc = getCalleeOfCallSite(csID);
                    PTACallGraphNode* calleeNode = getCallGraphNode(calleeFunc);

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

                    if (callerName == "addWeight" || callerName == "removeWeight" || callerName == "addWeightRec" || callerName == "removeWeightRec"
                        || calleeName == "addWeight" || calleeName == "removeWeight" || calleeName == "addWeightRec" || calleeName == "removeWeightRec") {
                        rawstr << "Skip addWeight or removeWeight\n";
                        continue;
                    }

                    //-----------------------------
                    // Found the target call-site to instrument
                    // Instrument getCCID call
                    //-----------------------------
                    assert (cs2w.find(csID) != cs2w.end());
                    int64_t weight = cs2w[csID];
                    bool recursive = false;
                    if (weight == 0) {
                        continue;
                    }
                    if (weight == -1) {
                        recursive = true;
                    }
                    rawstr << "  Inserting add/removeWeight with CCWeight " << weight
                        << " before/after CB " << I << "\n";
                    // using rtlib
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    PTACallGraphNode* node = getCallGraphNode(&F);
                    assert(node!=NULL);
                    llvm::Type *i64_type_w = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Type *i64_type_nid = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val_w = llvm::ConstantInt::get(i64_type_w, weight, true);
                    llvm::Constant *i64_val_nid = llvm::ConstantInt::get(i64_type_nid, node->getId(), true);
                    Value* args[] = {i64_val_w,i64_val_nid};
                    if (recursive) {
                        builder.CreateCall(addWeightRec, args);
                    } else {
                        builder.CreateCall(addWeight, args);
                    }

                    for (auto* SI : SVF::SVFUtil::get_succ_insts(&I)) {
                        builder.SetInsertPoint(SI);
                        if (recursive) {
                            builder.CreateCall(removeWeightRec, args);
                        } else {
                            builder.CreateCall(removeWeight, args);
                        }
                    }
                }
            }
        }
    }
    printf("%s", rawstr.str().c_str());
}

//void PTACallGraph::instrument_dcce(const std::string& ccinput)
//{
//
//    std::unordered_map<uint64_t, uint64_t> cs2w;
//    SVFUtil::parse_ccfile(ccinput, cs2w);
//
//    Module*       mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
//    LLVMContext&  ctx = LLVMModuleSet::getLLVMModuleSet()->getContext();
//
//    // using rtlib
//    std::vector<Type*>  paramTypes    = {Type::getInt64Ty(ctx)};
//    Type*               retType       = Type::getVoidTy(ctx);
//    FunctionType*       funcType      = FunctionType::get(retType, paramTypes, false);
//    FunctionCallee      addWeight     = mod->getOrInsertFunction("addWeight", funcType);
//    FunctionCallee      removeWeight  = mod->getOrInsertFunction("removeWeight", funcType);
//
//    std::string str;
//    raw_string_ostream rawstr(str);
//
//    for (auto& F : *mod) {
//        rawstr << "Function " << F.getName().str() << "\n";
//        for (auto &B : F) {
//            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
//                auto &I = *bbit;
//                if (SVFUtil::isCallSite(&I)) {
//                    auto *CB = llvm::dyn_cast<llvm::CallBase>(&I);
//                    Function *func = CB->getCalledFunction();
//  
//                    // Check if the CallBase does not have to have CCWeight
//                    bool IsIntrinsic = false;
//                    bool IsInstrumentedFunc = false;
//                    if (func != NULL) {
//                        IsIntrinsic = func->isIntrinsic();
//                        IsInstrumentedFunc = func->getName() == "addWeight" || func->getName() == "removeWeight";
//                    }
//
//                    if (IsIntrinsic || IsInstrumentedFunc) {
//                        rawstr << "  Skipping instruction" << *CB
//                            << " due to IsIntrinsic: " << IsIntrinsic
//                            << ", IsInstrumentedFunc: " << IsInstrumentedFunc << "\n";
//                        continue;
//                    }
//
//                    CSInstToID::const_iterator it = csInstToID.find(&I);
//                    assert(it != csInstToID.end());
//                    if ((it->second).size() > 1) {
//                        rawstr << "  Indirect call " << I
//                            << " has more than one call targets ("
//                            << (it->second).size() << "). Instrumentation is skipped because we don't know the call target at runtime\n";
//                        continue;
//                    }
//
//                    // Instrument direct call or indirect call with a single call target.
//                    for (auto csid : it->second) {
//                        assert (cs2w.find(csid) != cs2w.end());
//                        unsigned long long int weight = cs2w[csid];
//
//                        rawstr << "  Inserting add/removeWeight with CCWeight " << weight
//                            << " before/after CB " << *CB << "\n";
//
//                        // using rtlib
//                        IRBuilder builder(&I);
//                        builder.SetInsertPoint(&I);
//
//                        llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
//                        llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, weight, true);
//                        Value* args[] = {i64_val};
//                        builder.CreateCall(addWeight, args);
//
//                        for (auto* SI : SVF::SVFUtil::get_succ_insts(&I)) {
//                            builder.SetInsertPoint(SI);
//                            builder.CreateCall(removeWeight, args);
//                        }
//                    }
//
//                }
//            }
//        }
//    }
//    printf("%s\n", rawstr.str().c_str());
//}

//void PTACallGraph::instrument_pcce(const std::string& ccinput, unsigned int bench_code)
//{
//    std::unordered_map<uint64_t, uint64_t> cs2w;
//    SVFUtil::parse_ccfile(ccinput, cs2w);
//
//    Module*       mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
//    LLVMContext&  ctx = LLVMModuleSet::getLLVMModuleSet()->getContext();
//
//    // using rtlib
//    std::vector<Type*>  paramTypes    = {Type::getInt64Ty(ctx)};
//    Type*               retType       = Type::getVoidTy(ctx);
//    FunctionType*       funcType      = FunctionType::get(retType, paramTypes, false);
//    FunctionCallee      addWeight     = mod->getOrInsertFunction("addWeight", funcType);
//    FunctionCallee      removeWeight  = mod->getOrInsertFunction("removeWeight", funcType);
//    FunctionCallee      initCallgraph = mod->getOrInsertFunction("initCallgraph", funcType);
//    FunctionCallee      decode = mod->getOrInsertFunction("decode", funcType);
//
//    bool insert_init = false;
//    std::string str;
//    raw_string_ostream rawstr(str);
//
//    for (auto& F : *mod) {
//        rawstr << "Function " << F.getName().str() << "\n";
//        bool insert_decode = false;
//        for (auto &B : F) {
//            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
//                auto &I = *bbit;
//
//                if (F.getName() == "main" && !insert_init) {
//                    IRBuilder builder(&I);
//                    builder.SetInsertPoint(&I);
//
//                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
//                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, bench_code, true);
//                    Value* args[] = {i64_val};
//                    builder.CreateCall(initCallgraph, args);
//                    insert_init = true;
//                }
//
//                if (!insert_decode) {
//                    printf("Inserting decode\n");
//                    PTACallGraphNode* node = getCallGraphNode(&F);
//                    IRBuilder builder(&I);
//                    builder.SetInsertPoint(&I);
//
//                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
//                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, node->getId(), true);
//                    Value* args[] = {i64_val};
//                    builder.CreateCall(decode, args);
//                    insert_decode = true;
//                }
//
//                if (SVFUtil::isCallSite(&I)) {
//                    auto *CB = llvm::dyn_cast<llvm::CallBase>(&I);
//                    Function *func = CB->getCalledFunction();
//
//                    // Check if the CallBase does not have to have CCWeight
//                    bool IsIntrinsic = false;
//                    bool IsInstrumentedFunc = false;
//                    if (func != NULL) {
//                        IsIntrinsic = func->isIntrinsic();
//                        IsInstrumentedFunc = func->getName() == "addWeight" || func->getName() == "removeWeight";
//                    }
//
//                    if (IsIntrinsic || IsInstrumentedFunc) {
//                        rawstr << "  Skipping instruction" << *CB
//                            << " due to IsIntrinsic: " << IsIntrinsic
//                            << ", IsInstrumentedFunc: " << IsInstrumentedFunc << "\n";
//                        continue;
//                    }
//
//                    CSInstToID::const_iterator it = csInstToID.find(&I);
//                    assert(it != csInstToID.end());
//                    if ((it->second).size() > 1) {
//                        rawstr << "  Indirect call " << I
//                            << " has more than one call targets ("
//                            << (it->second).size() << "). Instrumentation is skipped because we don't know the call target at runtime\n";
//                        continue;
//                    }
//
//                    // Instrument direct call or indirect call with a single call target.
//                    for (auto csid : it->second) {
//                        assert(cs2w.find(csid) != cs2w.end());
//                        unsigned long long int weight = cs2w[csid];
//
//                        if (weight == 0) {
//                            rawstr << "  This call-site has zero CCWeight. Skipping instrumenting.\n";
//                            continue;
//                        }
//
//                        rawstr << "  Inserting add/removeWeight with CCWeight " << weight
//                            << " before/after CB " << *CB << "\n";
//
//                        // using rtlib
//                        IRBuilder builder(&I);
//                        builder.SetInsertPoint(&I);
//
//                        llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
//                        llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, weight, true);
//                        Value* args[] = {i64_val};
//                        builder.CreateCall(addWeight, args);
//
//                        for (auto* SI : SVF::SVFUtil::get_succ_insts(&I)) {
//                            builder.SetInsertPoint(SI);
//                            builder.CreateCall(removeWeight, args);
//                        }
//                    }
//                }
//            }
//        }
//    }
//    printf("%s\n", rawstr.str().c_str());
//}

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

                    if (callerName == "addWeight" || callerName == "removeWeight"
                        || calleeName == "addWeight" || calleeName == "removeWeight") {
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
