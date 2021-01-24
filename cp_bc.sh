#!/bin/bash
for bench in \
    600.perlbench_s \
    602.gcc_s \
    605.mcf_s \
    620.omnetpp_s \
    623.xalancbmk_s \
    625.x264_s \
    631.deepsjeng_s \
    641.leela_s \
    657.xz_s \
    998.specrand_is \
    619.lbm_s \
    638.imagick_s \
    644.nab_s
do
    #cp /data/sungkeun/benchmarks/cpu2017_dcce/benchspec/CPU/${bench}/build/build_base_dcce-bitcode-m64.0000/${bench:4} ./cpu2017/dcce/bitcode/${bench}.bc
    cp /data/sungkeun/benchmarks/cpu2017_dcce/benchspec/CPU/${bench}/build/build_base_dcce-bin-m64.0000/make.out ./makeouts/${bench}.make.out
done
