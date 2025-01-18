#!/bin/bash

export DCCE_ENV_SETUP=YES

export DCCE_ROOT=${PWD}
export CPU2017_RUN_DIR=${DCCE_ROOT}/SPEC2017_INPUTS

export SVF_ROOT=${DCCE_ROOT}/SVF
export CCENC_ROOT=${DCCE_ROOT}/ccencoder
export RTLIB_ROOT=${DCCE_ROOT}/runtime
export BENCH_ROOT=${DCCE_ROOT}/benchmark-suites

##############
# SVF and LLVM
##############
export SVF_BIN_DIR=${SVF_ROOT}/Release-build/bin
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
export OUTPUT_SPLASH3_DIR=${OUTPUT_ROOT}/bin/Splash-3

export OUTPUT_NATIVE=${OUTPUT_ROOT}/native
export OUTPUT_NATIVE_EXP=${OUTPUT_NATIVE}/experiment

export OUTPUT_STATIC=${OUTPUT_ROOT}/static_instrument
export OUTPUT_STATIC_BIN=${OUTPUT_STATIC}/bin
export OUTPUT_STATIC_EXP=${OUTPUT_STATIC}/experiment

export OUTPUT_DYN=${OUTPUT_ROOT}/dynamic_instrument
export OUTPUT_DYN_BIN=${OUTPUT_DYN}/bin
export OUTPUT_DYN_EXP=${OUTPUT_DYN}/experiment

##############
# runtime
##############
export DCCE_RTLIB_DIR=${RTLIB_ROOT}/dcce
export DCCE_RTLIB_BUILD_DIR=${DCCE_RTLIB_DIR}/build

export PCCE_RTLIB_DIR=${RTLIB_ROOT}/pcce
export PCCE_RTLIB_BUILD_DIR=${PCCE_RTLIB_DIR}/build

export PCC_RTLIB_DIR=${RTLIB_ROOT}/pcc
export PCC_RTLIB_BUILD_DIR=${PCC_RTLIB_DIR}/build

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

add_to_path ()
{
	path_list=`echo $PATH | tr ':' ' '`
	new_dir=$1
	for d in $path_list
	do
		if [ $d == $new_dir ]
		then
	            return 0
		fi
	done
	echo "Adding $new_dir to PATH..."
	export PATH=$PATH:$new_dir
}

add_to_path ${DCCE_ROOT}

add_to_ld_library_path ()
{
	path_list=`echo $LD_LIBRARY_PATH | tr ':' ' '`
	new_dir=$1
	for d in $path_list
	do
		if [ $d == $new_dir ]
		then
	            return 0
		fi
	done
	echo "Adding $new_dir to LD_LIBRARY_PATH..."
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$new_dir
}

add_to_ld_library_path ${DCCE_RTLIB_BUILD_DIR}
add_to_ld_library_path ${PCCE_RTLIB_BUILD_DIR}
add_to_ld_library_path ${PCC_RTLIB_BUILD_DIR}
