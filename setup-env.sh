#!/bin/bash

spack env activate dcce

hpcserver="hpcserver.cse.tamu.edu"
host_name=`uname -a`
if [[ "$host_name" == *"$hpcserver"* ]]; then
    echo "Activating spack environment dcce..."
    module load gcc-12.1.0-gcc-4.8.5-rw6672f
    module load llvm-openmp-12.0.1-gcc-12.1.0-e5sxuwh
fi
export DCCE_ENV_SETUP=YES

export DCCE_ROOT=${PWD}

export SVF_ROOT=${DCCE_ROOT}/SVF
export CCENC_ROOT=${DCCE_ROOT}/ccencoder
export RTLIB_ROOT=${DCCE_ROOT}/runtime
export BENCH_ROOT=${DCCE_ROOT}/benchmark-suites

##############
# SVF and LLVM
##############
export SVF_BIN_DIR=${SVF_ROOT}/Release-build/bin
export LLVM_ROOT=${SVF_ROOT}/llvm-12.0.0
cd ${SVF_ROOT}
source ${SVF_ROOT}/setup.sh
cd ${DCCE_ROOT}

##############
# output
##############
export OUTPUT_ROOT=${DCCE_ROOT}/output
export OUTPUT_BIN=${OUTPUT_ROOT}/bin
export OUTPUT_BITCODE=${OUTPUT_ROOT}/bitcode
export OUTPUT_CG=${OUTPUT_ROOT}/callgraph
export OUTPUT_CCENC=${OUTPUT_ROOT}/ccenc

export OUTPUT_NATIVE=${OUTPUT_ROOT}/native
export OUTPUT_NATIVE_EXP=${OUTPUT_NATIVE}/experiment

export OUTPUT_STATIC=${OUTPUT_ROOT}/static_instrument
export OUTPUT_STATIC_BIN=${OUTPUT_STATIC}/bin
export OUTPUT_STATIC_EXP=${OUTPUT_STATIC}/experiment

export OUTPUT_DYN=${OUTPUT_ROOT}/dynamic_instrument
export OUTPUT_DYN_BIN=${OUTPUT_DYN}/bin
export OUTPUT_DYN_EXP=${OUTPUT_DYN}/experiment


#export RUNTIME_WITHOUT_CLIENT=${OUTPUT_ROOT}/runtime_without_client
#export BASE_OUT_DIR=${OUTPUT_ROOT}/base
#export BASE2_OUT_DIR=${OUTPUT_ROOT}/base2
#export DCCE_OUT_DIR=${OUTPUT_ROOT}/dcce
#export PCCE_OUT_DIR=${OUTPUT_ROOT}/pcce
#export VALENCE_OUT_DIR=${OUTPUT_ROOT}/valence
#export DRCCTLIB_OUT_DIR=${OUTPUT_ROOT}/drcctlib
#export DRCCTLIB_CCUPDATE_TEST=${DRCCTLIB_OUT_DIR}/ccupdate_test

#export DCCE_CCENC_DIR=${DCCE_OUT_DIR}/ccenc
#export PCCE_CCENC_DIR=${PCCE_OUT_DIR}/ccenc
#export VALENCE_CCENC_DIR=${VALENCE_OUT_DIR}/ccenc
#
#export BASE2_BC_DIR=${BASE2_OUT_DIR}/bitcode
#export DCCE_BC_DIR=${DCCE_OUT_DIR}/bitcode
#export PCCE_BC_DIR=${PCCE_OUT_DIR}/bitcode
#export VALENCE_BC_DIR=${VALENCE_OUT_DIR}/bitcode
#
#export BASE2_BIN_DIR=${BASE2_OUT_DIR}/bin
#export DCCE_BIN_DIR=${DCCE_OUT_DIR}/bin
#export PCCE_BIN_DIR=${PCCE_OUT_DIR}/bin
#export VALENCE_BIN_DIR=${VALENCE_OUT_DIR}/bin
#
#export BASE2_RTLIB_DIR=${RTLIB_ROOT}/base2
#
#export BASE_STATS_DIR=${BASE_OUT_DIR}/stats
#export BASE2_STATS_DIR=${BASE2_OUT_DIR}/stats
#export DCCE_STATS_DIR=${DCCE_OUT_DIR}/stats
#export PCCE_STATS_DIR=${PCCE_OUT_DIR}/stats
#export VALENCE_STATS_DIR=${VALENCE_OUT_DIR}/stats
#
#export DCCE_CCWEIGHT_DIR=${DCCE_OUT_DIR}/ccweight
#export PCCE_CCWEIGHT_DIR=${PCCE_OUT_DIR}/ccweight
#export VALENCE_CCWEIGHT_DIR=${VALENCE_OUT_DIR}/ccweight



##############
# runtime
##############
#export BASE2_RTLIB_BUILD_DIR=${BASE2_RTLIB_DIR}/build
export DCCE_RTLIB_DIR=${RTLIB_ROOT}/dcce
export DCCE_RTLIB_BUILD_DIR=${DCCE_RTLIB_DIR}/build

export PCCE_RTLIB_DIR=${RTLIB_ROOT}/pcce
export PCCE_RTLIB_BUILD_DIR=${PCCE_RTLIB_DIR}/build

export VALENCE_RTLIB_DIR=${RTLIB_ROOT}/valence
export VALENCE_RTLIB_BUILD_DIR=${VALENCE_RTLIB_DIR}/build

##############
# test
##############
export TEST_ROOT=${DCCE_ROOT}/tests

##############
# DrCCTLibProf
#############
export drrun=$PWD/DrCCTProf/build/bin64/drrun

##############
# Benchmarks
#############
export BENCH_ROOT=${DCCE_ROOT}/benchmark-suites
export CPU2017_ROOT=${BENCH_ROOT}/cpu2017
export SPLASH3_ROOT=${BENCH_ROOT}/Splash-3-3.0X/codes
#export SPLASH3_BARRIER_ELISION_ROOT=${DCCE_ROOT}/benchmark-suites/Splash-3-3.0X-barrier-elision/codes


export PATH=${PATH}:${DCCE_ROOT}

export LD_LIBRARY_PATH=${DCCE_RTLIB_BUILD_DIR}:${PCCE_RTLIB_BUILD_DIR}:${LD_LIBRARY_PATH}
