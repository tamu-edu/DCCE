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

    for (auto it : idToCSMap) {
        CallSiteID csID = it.first;
        const CallSitePair csPair = it.second;
        const CallBlockNode* cbnode = csPair.first;

        const SVFFunction* callerFunc = getCallerOfCallSite(csID);
        const SVFFunction* calleeFunc = getCalleeOfCallSite(csID);

        PTACallGraphNode* callerNode = getCallGraphNode(callerFunc);
        PTACallGraphNode* calleeNode = getCallGraphNode(calleeFunc);

        //if (cbnode->isIndirectCall()) { continue; }  // indirect call
        if (callerFunc == NULL) { printf("Caller of CSID:%d is null\n", csID); continue; }
        if (calleeFunc == NULL) { printf("Callee of CSID:%d is null\n", csID); continue; }
        if (callerFunc->isIntrinsic()) { continue; }
        if (calleeFunc->isIntrinsic()) { continue; }

        std::string str;
        raw_string_ostream rawstr(str);
        rawstr << callerNode->getId() << "-" << callerNode->getFunction()->getName()
            << ":" << calleeNode->getId() << "-" << calleeNode->getFunction()->getName()
            << ":" << csID;
        if (cbnode->isIndirectCall()) {
            rawstr << "-i";
        } else {
            rawstr << "-d";
        }
        fout << rawstr.str() << "\n";
    }
    fout.close();
    //-----------------------------------------------------
    // Indirect Call
    //-----------------------------------------------------
    fout.open(filename + ".indcall");
    std::string str;
    raw_string_ostream rawstr(str);

    unsigned long max_callees = 0;
    rawstr << "callsite --> {Set of possible callees} #of callees\n";
    for (auto it : indirectCallMap) {
        const CallBlockNode* cbnode = it.first;
        CSInstToID::const_iterator itcs = csInstToID.find(cbnode->getCallSite());
        assert(itcs != csInstToID.end());
        unsigned long long int csid = itcs->second;

        rawstr << csid << " --> {";
        const FunctionSet& callees = getIndCSCallees(cbnode);
        for (auto it_callees : callees) {
            const SVFFunction* callee = it_callees;
            PTACallGraphNode* calleeNode = getCallGraphNode(callee);
            rawstr << calleeNode->getId() << '-' << calleeNode->getFunction()->getName() << ",";
        }
        unsigned long num_callees = callees.size();
        rawstr << "} " << num_callees << "\n";
        if (max_callees < num_callees) {
            max_callees = num_callees;
        }
    }
    rawstr << "max_num_callees: " << max_callees << "\n";
    fout << rawstr.str();
    fout.close();
    GraphPrinter::WriteGraphToFile(outs(), filename, this);
}

void PTACallGraph::instrument_dcce(const std::string& ccinput)
{

    std::unordered_map<uint64_t, uint64_t> cs2w;
    SVFUtil::parse_ccfile(ccinput, cs2w);

    Module*       mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
    LLVMContext&  ctx = LLVMModuleSet::getLLVMModuleSet()->getContext();

    // using rtlib
    std::vector<Type*>  paramTypes    = {Type::getInt64Ty(ctx)};
    Type*               retType       = Type::getVoidTy(ctx);
    FunctionType*       funcType      = FunctionType::get(retType, paramTypes, false);
    FunctionCallee      addWeight     = mod->getOrInsertFunction("addWeight", funcType);
    FunctionCallee      removeWeight  = mod->getOrInsertFunction("removeWeight", funcType);
    // using load/store
    //IntegerType* int64ty = Type::getInt64Ty(ctx);

    for (auto& F : *mod) {
        printf("Function %s\n", F.getName().str().c_str());
        for (auto &B : F) {
            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
                auto &I = *bbit;
                if (SVFUtil::isCallSite(&I)) {
                    auto *op = llvm::dyn_cast<llvm::CallBase>(&I);
                    Function *func = op->getCalledFunction();

                    if (func == NULL) {
                        continue; // indirect call
                    } else if (func->isIntrinsic()) {
                        continue;
                    } else if (func->getName() == "addWeight" || func->getName() == "removeWeight") {
                        continue;
                    }
                    //} else if (func->empty()) {
                    //    continue;  // skip external functions such as DLL, addWeight/removeWeight/decode...
                    //}

                    CSInstToID::const_iterator it = csInstToID.find(&I);
                    assert(it != csInstToID.end());
                    unsigned long long int csid = it->second;
                    assert(cs2w.find(csid) != cs2w.end());
                    unsigned long long int weight = cs2w[csid];

                    // using load/store
                    //auto ccid = mod->getGlobalVariable("ccid");
                    //auto load = new llvm::LoadInst(ccid, "", &I);
                    //auto v = llvm::ConstantInt::get(int64ty, weight);
                    //auto add = llvm::BinaryOperator::Create(Instruction::Add,
                    //        load, v, "", &I);
                    //auto store = new llvm::StoreInst(add, ccid, &I);


                    //auto &II = *(++bbit);
                    //ccid = mod->getGlobalVariable("ccid");
                    //load = new LoadInst(ccid, "", &II);
                    //v = ConstantInt::get(int64ty, weight);
                    //auto sub = BinaryOperator::Create(Instruction::Sub,
                    //        load, v, "", &II);
                    //store = new StoreInst(sub, ccid, &II);
                    //bbit--;

                    printf("Inserting addWeight before %s\n", func->getName().str().c_str());
                    // using rtlib
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, weight, true);
                    Value* args[] = {i64_val};
                    builder.CreateCall(addWeight, args);

                    for (auto* SI : SVF::SVFUtil::get_succ_insts(&I)) {
                        builder.SetInsertPoint(SI);
                        builder.CreateCall(removeWeight, args);
                    }
                }
            }
        }
    }
}

void PTACallGraph::instrument_pcce(const std::string& ccinput, unsigned int bench_code)
{
    std::unordered_map<uint64_t, uint64_t> cs2w;
    SVFUtil::parse_ccfile(ccinput, cs2w);

    Module*       mod = LLVMModuleSet::getLLVMModuleSet()->getMainLLVMModule();
    LLVMContext&  ctx = LLVMModuleSet::getLLVMModuleSet()->getContext();

    // create a global variable to store ccinput
    //SVFUtil::createGlobalString(mod, "ccinput", ccinput);

    // using rtlib
    std::vector<Type*>  paramTypes    = {Type::getInt64Ty(ctx)};
    Type*               retType       = Type::getVoidTy(ctx);
    FunctionType*       funcType      = FunctionType::get(retType, paramTypes, false);
    FunctionCallee      addWeight     = mod->getOrInsertFunction("addWeight", funcType);
    FunctionCallee      removeWeight  = mod->getOrInsertFunction("removeWeight", funcType);
    FunctionCallee      initCallgraph = mod->getOrInsertFunction("initCallgraph", funcType);
    FunctionCallee      decode = mod->getOrInsertFunction("decode", funcType);

    bool insert_init = false;

    for (auto& F : *mod) {
        printf("Function %s\n", F.getName().str().c_str());
        bool insert_decode = false;
        for (auto &B : F) {
            for (BasicBlock::iterator bbit = B.begin(), bbie = B.end(); bbit != bbie; ++bbit) {
                auto &I = *bbit;

                if (F.getName() == "main" && !insert_init) {
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, bench_code, true);
                    Value* args[] = {i64_val};
                    builder.CreateCall(initCallgraph, args);
                    insert_init = true;
                }

                if (!insert_decode) {
                    printf("Inserting decode\n");
                    PTACallGraphNode* node = getCallGraphNode(&F);
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, node->getId(), true);
                    Value* args[] = {i64_val};
                    builder.CreateCall(decode, args);
                    insert_decode = true;
                }

                if (SVFUtil::isCallSite(&I)) {
                    auto *op = llvm::dyn_cast<llvm::CallBase>(&I);
                    Function *func = op->getCalledFunction();

                    if (func == NULL) {
                        continue; // indirect call
                    } else if (func->isIntrinsic()) {
                        continue;
                    } else if (func->getName() == "addWeight" || func->getName() == "removeWeight") {
                        continue;
                    }
                    //} else if (func->empty()) {
                    //    continue;  // skip external functions such as DLL, addWeight/removeWeight/decode...
                    //}

                    CSInstToID::const_iterator it = csInstToID.find(&I);
                    assert(it != csInstToID.end());
                    unsigned long long int csid = it->second;
                    assert(cs2w.find(csid) != cs2w.end());
                    unsigned long long int weight = cs2w[csid];
                    
                    if (weight == 0) continue;
                    printf("Inserting addWeight before %s\n", func->getName().str().c_str());
  
                    // using rtlib
                    IRBuilder builder(&I);
                    builder.SetInsertPoint(&I);

                    llvm::Type *i64_type = llvm::IntegerType::getInt64Ty(ctx);
                    llvm::Constant *i64_val = llvm::ConstantInt::get(i64_type, weight, true);
                    Value* args[] = {i64_val};
                    builder.CreateCall(addWeight, args);

                    for (auto* SI : SVF::SVFUtil::get_succ_insts(&I)) {
                        builder.SetInsertPoint(SI);
                        builder.CreateCall(removeWeight, args);
                    }
                }
            }
        }
    }
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
