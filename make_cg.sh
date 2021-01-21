#!/bin/bash

PATH_BC=${DCCE_ROOT}/cpu2017/dcce/bitcode
PATH_DOT=${DCCE_ROOT}/cpu2017/dcce/dots

    #600.perlbench_s \
    #602.gcc_s \
    #605.mcf_s \
    #620.omnetpp_s \
    #623.xalancbmk_s \
    #625.x264_s \
    #631.deepsjeng_s \
    #641.leela_s \
    #657.xz_s \
    #998.specrand_is \
for bench in \
    619.lbm_s \
    638.imagick_s \
    644.nab_s
do
    wpa -ander -dump-callgraph ${PATH_BC}/${bench}.bc | tee ${PATH_DOT}/${bench}.log
    cp callgraph_initial.dot ${PATH_DOT}/${bench}.initial.dot
    cp callgraph_final.dot ${PATH_DOT}/${bench}.final.dot
    cp callgraph_final.output ${PATH_DOT}/${bench}.final.input
    rm callgraph_initial.dot callgraph_final.dot callgraph_final.output

done
