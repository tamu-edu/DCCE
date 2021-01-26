#!/bin/bash

export DCCE_ENV_SETUP=YES

export DCCE_ROOT=${PWD}
export CPU2017_RUN_DIR=/data/share/whistle/cpu2017_run

export SVF_ROOT=${DCCE_ROOT}/SVF
export CPU2017_ROOT=${DCCE_ROOT}/cpu2017
export CCENC_ROOT=${DCCE_ROOT}/ccencoder
export RTLIB_ROOT=${DCCE_ROOT}/runtime
export ORG_BC_ROOT=${DCCE_ROOT}/bitcode
export TEST_ROOT=${DCCE_ROOT}/tests

##############
# SVF
##############
export SVF_BIN_DIR=${SVF_ROOT}/Release-build/bin
cd ${SVF_ROOT}
source ${SVF_ROOT}/setup.sh
cd ${DCCE_ROOT}

##############
# cpu2017
##############
export CPU2017_MAKE_DIR=${CPU2017_ROOT}/makeouts
export CPU2017_BIN_DIR=${CPU2017_ROOT}/bin

##############
# output
##############
export OUTPUT_ROOT=${DCCE_ROOT}/output
export ORG_CG_DIR=${OUTPUT_ROOT}/callgraph
export BASE_OUT_DIR=${OUTPUT_ROOT}/base
export DCCE_OUT_DIR=${OUTPUT_ROOT}/dcce
export PCCE_OUT_DIR=${OUTPUT_ROOT}/pcce
export VALENCE_OUT_DIR=${OUTPUT_ROOT}/valence

export DCCE_CCENC_DIR=${DCCE_OUT_DIR}/ccenc
export PCCE_CCENC_DIR=${PCCE_OUT_DIR}/ccenc
export VALENCE_CCENC_DIR=${VALENCE_OUT_DIR}/ccenc

export DCCE_BC_DIR=${DCCE_OUT_DIR}/bitcode
export PCCE_BC_DIR=${PCCE_OUT_DIR}/bitcode
export VALENCE_BC_DIR=${VALENCE_OUT_DIR}/bitcode

export DCCE_BIN_DIR=${DCCE_OUT_DIR}/bin
export PCCE_BIN_DIR=${PCCE_OUT_DIR}/bin
export VALENCE_BIN_DIR=${VALENCE_OUT_DIR}/bin

export DCCE_RTLIB_DIR=${RTLIB_ROOT}/dcce
export PCCE_RTLIB_DIR=${RTLIB_ROOT}/pcce
export VALENCE_RTLIB_DIR=${RTLIB_ROOT}/valence

export BASE_STATS_DIR=${BASE_OUT_DIR}/stats
export DCCE_STATS_DIR=${DCCE_OUT_DIR}/stats
export PCCE_STATS_DIR=${PCCE_OUT_DIR}/stats
export VALENCE_STATS_DIR=${VALENCE_OUT_DIR}/stats



##############
# runtime
##############
export DCCE_RTLIB_BUILD_DIR=${DCCE_RTLIB_DIR}/build
export PCCE_RTLIB_BUILD_DIR=${PCCE_RTLIB_DIR}/build
export VALENCE_RTLIB_BUILD_DIR=${VALENCE_RTLIB_DIR}/build

##############
# test
##############
export TEST_BUILD_DIR=${TEST_BUILD_DIR}/build

#export CPU2017_BUILD_PATH=benchspec/CPU/${bench}/build/build_base_dcce-bitcode-m64.0000/
