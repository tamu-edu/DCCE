# Distinguishable Calling Context Encoding (DCCE)

## Set Environment Variables
In the root directory of DCCE, run following command.

    $ source setup_env.sh
    
By default, llvm in ${DCCE_ROOT}/SVF/llvm-10.0.0.obj is used. However, if you have issue with llvm, you need to modify LLVM_DIR in ${DCCE_ROOT}/SVF/setup.sh with llvm installed in your system. After sourcing the environments, you are going to use `run-dcce` program to use DCCE project.

## Build SVF, runtime, and test program
    $ run-dcce -build


## Target benchmarks
This project requires the bitcode of target benchmarks. By running `run-dcce -build`, the test program (${DCCE_ROOT}/tests/test.cc} is compiled and the bit code is stored in ${DCCE_ROOT}/bitcode/test.bc. You can play with it first and use realistic benchmarks like SPEC later. After you prepare other bitcodes, you need to update `benches` variable in `run-dcce` which is the main program to use DCCE.

## Run wpa to genrate call graphes.
    $ run-dcce -callgraph
    
Output files will be stored in ${DCCE_ROOT/output/callgraph.

    $ ls output/callgraph
    $ test-initial.dot
    $ test-initial.cg
    $ test-final.dot
    $ test-final.cg
    
## Run Calling Context Encoder to generate weights to update Context ID.
    $ run-dcce -ccenc dcce

## Run wpa to instrument bit code.
    $ run-dcce -instrument dcce
    
## Build executable with instrumented bit code and runtime.
    $ run-dcce -make-exe dcce
Executables are stored in ${DCCE_ROOT}/output/dcce/bin

## Ignore below lines for now.

## Build spec2017 benchmarks

Modify config file to update correct libary and include paths. Make a diff ${DCCE_ROOT}/cpu2017-config/dcce/dcce-clang-llvm-linux-x86.cfg and ${DCCE_ROOT}/cpu2017-config/Example-clang-llvm-linux-x86.cfg to see the difference.

Link config file and makefile

    $ ln -s ${DCCE_ROOT}/cpu2017-config/dcce/dcce-clang-llvm-linux-x86.cfg ${SPEC2017_ROOT}/config/dcce-clang-llvm-linux-x86.cfg
    $ mv ${SPEC2017_ROOT}/benchspec/Makefile.defaults ${SPEC2017_ROOT}/benchspec/Makefile.defaults.org
    $ ln -s ${DCCE_ROOT}/cpu2017-config/dcce/Makefile.defaults ${SPEC2017_ROOT}/benchspec/Makefile.defaults

Run runcpu to start building process

    $ cd ${SPEC2017_ROOT} ; source shrc
    $ runcpu --config=dcce-clang-llvm-linux-x86.cfg --action=build intspeed

