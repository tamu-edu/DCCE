# Objective

- [x] List out all benchmarks not included in PLDI-23
- [x] Make Optimized IR step reproducible.
- [x] Figure out the reason why they are not included
- [x] Fix issues 
- [ ] Reflect the results to the paper. (WIP)

# List out all benchmarks not include in PLDI-23

First, we exclude the benchmarks written with Fortran in SPEC CPU2017. Except them, there are 28 benchmarks in total. In Splash-3, there are 14 benchmarks in total.

### Benchmarks not included in PLDI-23.

|Benchmarks|Status in PLDI-23| Included now? |
|-|-|-|
|500.perlbench_r|CCID Overflow|X|
|502.gcc_r|OOM during callgraph-gen|X|
|520.omnetpp_r|[CGGen - Asserion failure in LLVM](#issue_1)|O|
|511.povray_r|[CGGen - Asserion failure in LLVM](#issue_1)|X (CCID Overflow)|
|526.blender_r|OOM during callgraph-gen|X|
|538.imagick_r|CCID Overflow|X|
|544.nab_r|Never finish|WIP|
|600.perlbench_s|CCID Overflow|X|
|602.gcc_s|OOM during callgraph-gen|X|
|620.omnetpp_s|[CGGen - Asserion failure in LLVM](#issue_1)|O|
|638.imagick_s|[CGGen - Assertion failure in SVF](#issue_3)|X (CCID Overflow)|
|644.nab_s|Never finish|?|
|711.RAYTRACE|[Link time error - many duplicate symbols](#issue_2)|O|

<h1 id="issue_1"> Issue 1: Assertion Failure in llvm::Function::getArg(unsigned int) </h1>

WPA with callgraph crashes with the following error while generating calligraph with `511.povray_r`, `520.omnetpp_r`, and `620.omnetpp_s`.

wpa: /home/sungkeun/git/DCCE/SVF/llvm-12.0.0.obj/include/llvm/IR/Function.h:781: llvm::Argument* llvm::Function::getArg(unsigned int) const: Assertion `i < NumArgs && "getArg() out of range!"' failed.
```c++
// /home/sungkeun/git/DCCE/SVF/llvm-12.0.0.obj/include/llvm/IR/Function.h:781
Argument* getArg(unsigned i) const {
    assert (i < NumArgs && "getArg() out of range!");
    CheckLazyArguments();
    return Arguments + i;
}
```

#### `getArg` is called by lib/SVF-FE/CHG.cpp

```c++
static bool checkArgTypes(CallSite cs, const Function *fn) {

    // here we skip the first argument (i.e., this pointer)
    for (unsigned i = 1; i < cs.arg_size(); i++) {
        auto cs_arg = cs.getArgOperand(i);
        auto fn_arg = fn->getArg(i);
        if (cs_arg->getType() != fn_arg->getType()) {
            return false;
        }
    }

    return true;
}
```

```txt
fn->arg_size(): 2
cs.arg_size(): 4
For Function ; Function Attrs: uwtable mustprogress
define internal i32 @_ZN6cEnvir6printfEPKcz(%class.cEnvir* nocapture nonnull readonly dereferenceable(288) %0, i8* nocapture readonly %1, ...) unnamed_addr #4 align 2 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = getelementptr inbounds %class.cEnvir, %class.cEnvir* %0, i64 0, i32 1
  %5 = load i8, i8* %4, align 8, !tbaa !12487, !range !12299
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %31

7:                                                ; preds = %2
  %8 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #67
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %8)
  %10 = getelementptr [1024 x i8], [1024 x i8]* @_ZL9staticbuf, i64 0, i64 0
  %11 = call i32 @vsnprintf(i8* %10, i64 1024, i8* %1, %struct.__va_list_tag* nonnull %9) #67
  %12 = getelementptr [1024 x i8], [1024 x i8]* @_ZL9staticbuf, i64 0, i64 1023
  store i8 0, i8* %12, align 1, !tbaa !12272
  call void @llvm.va_end(i8* nonnull %8)
  %13 = getelementptr inbounds %class.cEnvir, %class.cEnvir* %0, i64 0, i32 4
  %14 = bitcast %"class.std::basic_ostream"* %13 to i8**
  %15 = load i8*, i8** %14, align 8, !tbaa !12265
  %16 = getelementptr i8, i8* %15, i64 -24
  %17 = bitcast i8* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = bitcast %"class.std::basic_ostream"* %13 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 %18
  %21 = getelementptr inbounds i8, i8* %20, i64 232
  %22 = bitcast i8* %21 to %"class.std::basic_streambuf"**
  %23 = load %"class.std::basic_streambuf"*, %"class.std::basic_streambuf"** %22, align 8, !tbaa !12490
  %24 = sext i32 %11 to i64
  %25 = bitcast %"class.std::basic_streambuf"* %23 to i64 (%"class.std::basic_streambuf"*, i8*, i64)***
  %26 = load i64 (%"class.std::basic_streambuf"*, i8*, i64)**, i64 (%"class.std::basic_streambuf"*, i8*, i64)*** %25, align 8, !tbaa !12265
  %27 = getelementptr inbounds i64 (%"class.std::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::basic_streambuf"*, i8*, i64)** %26, i64 12
  %28 = load i64 (%"class.std::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::basic_streambuf"*, i8*, i64)** %27, align 8
  %29 = getelementptr [1024 x i8], [1024 x i8]* @_ZL9staticbuf, i64 0, i64 0
  %30 = call i64 %28(%"class.std::basic_streambuf"* nonnull dereferenceable(64) %23, i8* %29, i64 %24)
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #67
  br label %31

31:                                               ; preds = %7, %2
  %32 = phi i32 [ %11, %7 ], [ 0, %2 ]
  ret i32 %32
}

For Callsite   %47 = tail call i32 (%class.cEnvir*, i8*, ...) %45(%class.cEnvir* nonnull dereferenceable(288) %24, i8* %46, i8* %37, i8* %41)

wpa: /home/ksungkeun84/git/DCCE/SVF/llvm-12.0.0/llvm/include/llvm/IR/Function.h:781: llvm::Argument* llvm::Function::getArg(unsigned int) const: Assertion `i < NumArgs && "getArg() out of range!"' failed.
```


## Analysis
Return values of arg_size() function from fn and cs could be different. If arg_size of cs is greater than arg_size of fn, Assertion could happened. 
I checked the SVF git repo to see if there is a bug fix and there is a bug fix as follow:

```c++
static bool checkArgTypes(CallSite cs, const SVFFunction* fn)
{

    // here we skip the first argument (i.e., this pointer)
    u32_t arg_size = (fn->arg_size() > cs.arg_size()) ? cs.arg_size(): fn->arg_size();
    if(arg_size > 1)
    {
        for (unsigned i = 1; i < arg_size; i++)
        {
            auto cs_arg = cs.getArgOperand(i);
            auto fn_arg = fn->getArg(i);
            if (cs_arg->getType() != fn_arg->getType())
            {
                return false;
            }
        }
    }

    return true;
}
```

The version we are using is [4b5406c8](https://github.com/SVF-tools/SVF/search?q=4b5406c8&type=commits) released in Oct 22 2021.


<h1 id="issue_2"> Issue 2: Assertion failure during callgraph generation (imagick_s/imagick_r) </h1>

```txt
Node 4203169 not found
wpa: /home/ksungkeun84/git/DCCE/SVF/include/Graphs/GenericGraph.h:398: SVF::GenericGraph<NodeTy, EdgeTy>::NodeType* SVF::GenericGraph<NodeTy, EdgeTy>::getGNode(SVF::NodeID) const [with NodeTy = SVF::PAGNode; EdgeTy = SVF::PAGEdge; SVF::GenericGraph<NodeTy, EdgeTy>::NodeType = SVF::PAGNode; SVF::NodeID = unsigned int]: Assertion `it != IDToNodeMap.end() && "Node not found!"' failed.

Program received signal SIGABRT, Aborted.
__GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50	../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
(gdb) bt
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1  0x00007ffff7a19859 in __GI_abort () at abort.c:79
#2  0x00007ffff7a19729 in __assert_fail_base (fmt=0x7ffff7baf588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x555556450dc0 "it != IDToNodeMap.end() && \"Node not found!\"",
    file=0x555556450d80 "/home/ksungkeun84/git/DCCE/SVF/include/Graphs/GenericGraph.h", line=398, function=<optimized out>) at assert.c:92
#3  0x00007ffff7a2afd6 in __GI___assert_fail (assertion=0x555556450dc0 "it != IDToNodeMap.end() && \"Node not found!\"", file=0x555556450d80 "/home/ksungkeun84/git/DCCE/SVF/include/Graphs/GenericGraph.h", line=398,
    function=0x555556451468 "SVF::GenericGraph<NodeTy, EdgeTy>::NodeType* SVF::GenericGraph<NodeTy, EdgeTy>::getGNode(SVF::NodeID) const [with NodeTy = SVF::PAGNode; EdgeTy = SVF::PAGEdge; SVF::GenericGraph<NodeTy, EdgeTy>::NodeT"...)
    at assert.c:101
#4  0x00005555556f1f62 in SVF::AndersenStat::collectCycleInfo(SVF::ConstraintGraph*) ()
#5  0x00005555556f2b96 in SVF::AndersenStat::performStat() ()
#6  0x00005555556752ea in SVF::PointerAnalysis::finalize() ()
#7  0x00005555556db90b in SVF::AndersenBase::finalize() ()
#8  0x00005555556dbb12 in SVF::AndersenBase::analyze() ()
#9  0x000055555562fa7b in SVF::WPAPass::runPointerAnalysis(SVF::SVFModule*, unsigned int) ()
#10 0x0000555555630feb in SVF::WPAPass::runOnModule(SVF::SVFModule*) ()
#11 0x000055555560ef65 in main ()
```

## Is It Reproduced in the Latest SVF?
### Latest version: [SVF-2.6](https://github.com/SVF-tools/SVF/releases/tag/SVF-2.6)
***It does not produce the same issue***

## Is It Reproduced in the baseline SVF used for DCCE?
### Version used in DCCE: [4b5406c8](https://github.com/SVF-tools/SVF/search?q=4b5406c8&type=commits)
***It reproduce the same issue!!***

## CCID Overflow occurred.

<h1 id="issue_3"> Issue 3: many duplicate symbols in lld - Raytrace </h1>

```txt
ld.lld: error: duplicate symbol: DataType
... so many duplicate symbols
```

* Originally `raytrace` was compile with `gcc` and compilation was successful. The problem happened with `clang` only. It means that there is something different between `clang` and `gcc` regarding compilation process.

After reviewing the source code with `raytrace`, I made a simple test program that reproduce the same compile error:

```c
// main.c
#include <stdio.h>
#include "test.h"

int g_var = 1;

int main()
{
  printf("[main] g_var = %d\n", g_var);
  return 0;
}
```


```c
// test.c
#include <stdio.h>
#include "test.h"

int foo()
{
  printf("[foo] g_var = %d\n", g_var);
  return 0;
}
```

```c
// test.h
int g_var;
```

```sh
clang test.c main.c
/usr/bin/ld: /tmp/main-7b6191.o:(.data+0x0): multiple definition of `g_var'; /tmp/test-856281.o:(.bss+0x0): first defined here
clang-12: error: linker command failed with exit code 1 (use -v to see invocation)
```

```sh
gcc test.c main.c
./a.out
[main] g_var = 1
```

I think `gcc` is generous on redefinition of global variable but not `clang`. We know the rule of thumb for global variable shared across different file.


## Background about Tentative Definition
Please refer to the discussions in stackoverflow - [discussion1](https://stackoverflow.com/questions/68115899/clang-behaves-differently-with-global-variables), [discussion2](https://stackoverflow.com/questions/66055165/advantage-of-using-extern-in-a-header-file/66056029#66056029
), [disscussion3](https://stackoverflow.com/questions/63888830/why-am-i-getting-an-undefined-reference-to-another-file-even-though-i-define-th
)

## Bug Fix
You can find the code changes in commit [8e75bcc4e663dfa6b996fb8f1c72583a02fc1807](https://github.com/ksungkeun84/DCCE/commit/8e75bcc4e663dfa6b996fb8f1c72583a02fc1807)

