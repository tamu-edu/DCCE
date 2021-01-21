# Distinguishable Calling Context Encoding (DCCE)

## Set Environment Variables
Before setting, open `setup_env.sh` and modify _CPU2017_ROOT_ and _CPU2017_BUILD_PATH_ if you are going to copy your own bitcode to this setup. Then, run following command.

    $ source setup_env.sh

## Copy your bitcode to the project folder
This project is set to read bit code files from ${DCCE_ROOT}/cpu2017/dcce/bitcode. If you want to use your own bitcode of cpu2017, copy to there. cp_bc.sh is example script to copy them all.

## Make call graph
We use SVF (WPA) to generate call graph and SVF is modified to output call graph with our own format (.cg). Run following command to make all the call graphs.

    $ ${DCCE_ROOT}/make_cg.sh

## Run calling context encoder
Output of WPA tool (.cg) is input to the CCEncoder. CCEcoder calculates weights for all the edges and append them to the call graph file (.cc).

    cd ${DCCE_ROOT}/ccencoder
    ${DCCE_ROOT}/runall

To encode individual call graph, see help message of gen_calling_context

    $ ./gen_calling_context

### Get statistics

    $ ./plot_stats


Ignore below lines for now.

Build llvm-pass and runtime library:

    $ mkdir build
    $ cd build
    $ cmake ..
    $ make

Build spec2017 benchmarks

Modify config file to update correct libary and include paths. Make a diff ${DCCE_ROOT}/cpu2017-config/dcce/dcce-clang-llvm-linux-x86.cfg and ${DCCE_ROOT}/cpu2017-config/Example-clang-llvm-linux-x86.cfg to see the difference.

Link config file and makefile

    $ ln -s ${DCCE_ROOT}/cpu2017-config/dcce/dcce-clang-llvm-linux-x86.cfg ${SPEC2017_ROOT}/config/dcce-clang-llvm-linux-x86.cfg
    $ mv ${SPEC2017_ROOT}/benchspec/Makefile.defaults ${SPEC2017_ROOT}/benchspec/Makefile.defaults.org
    $ ln -s ${DCCE_ROOT}/cpu2017-config/dcce/Makefile.defaults ${SPEC2017_ROOT}/benchspec/Makefile.defaults

Run runcpu to start building process

    $ cd ${SPEC2017_ROOT} ; source shrc
    $ runcpu --config=dcce-clang-llvm-linux-x86.cfg --action=build intspeed

