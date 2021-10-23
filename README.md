# Distinguishable Calling Context Encoding (DCCE)

## Development Environment
Every experiment in DCCE is done on top of the docker based development environment by Sungkeun. Please setup [dev-env](https://github.com/ksungkeun84/dev-env.git) first and clone this repository inside the docker container.

Once you log in the dev-env docker container, activate conda with the following command
    $ conda activate dcce

## Set Environment Variables
In the root directory of DCCE, run following command.

    $ source setup_env.sh

After sourcing the environments, you are going to use `run-dcce.py` program to use DCCE project.

## Build SVF, runtime, and test program
    $ python run-dcce.py -build


## Target benchmarks
This project requires the bitcode of target benchmarks. By running `python run-dcce.py -build`, the test program (${DCCE_ROOT}/tests/test.cc} is compiled and the bit code is stored in ${DCCE_ROOT}/bitcode/test.bc. You can play with it first and use realistic benchmarks like SPEC later. After you prepare other bitcodes, you need to update `benches` variable in `run-dcce.py` which is the main program to use DCCE.

## Run wpa to genrate call graphes.
    $ python run-dcce.py -callgraph

Output files will be stored in ${DCCE_ROOT/output/callgraph.

    $ ls output/callgraph
    $ test-initial.dot
    $ test-initial.cg
    $ test-final.dot
    $ test-final.cg

## Run Calling Context Encoder to generate weights to update Context ID.
    $ python run-dcce.py -ccenc dcce

## Run wpa to instrument bit code.
    $ python run-dcce.py -instrument dcce

## Build executable with instrumented bit code and runtime.
    $ python run-dcce.py -make-exe dcce
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

