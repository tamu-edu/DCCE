#!/bin/bash
function usage {
	cat <<EOM
Usage: $(basename "$0") [cpu2107 install path]
EOM
	exit 2
}

if [ $# -eq 0 ]
then
  usage
fi

if [[ -z $DCCE_ENV_SETUP ]]; then
  echo "Please souce setup-env.sh first."
  exit 2
fi

CPU2017_INSTALL_PATH=$1
cd ${CPU2017_INSTALL_PATH}

source shrc
cp ${DCCE_ROOT}/benchmark-suites/cpu2017/bitcode-clang-llvm-linux-x86.cfg ./config/
cp ${DCCE_ROOT}/benchmark-suites/cpu2017/Makefile.defaults ./benchspec/

for bench in 500.perlbench_r \
  502.gcc_r \
  505.mcf_r \
  520.omnetpp_r \
  523.xalancbmk_r \
  525.x264_r \
  531.deepsjeng_r \
  541.leela_r \
  557.xz_r \
  508.namd_r \
  510.parest_r \
  511.povray_r \
  519.lbm_r \
  526.blender_r \
  538.imagick_r \
  544.nab_r \
  600.perlbench_s \
  602.gcc_s \
  605.mcf_s \
  620.omnetpp_s \
  623.xalancbmk_s \
  625.x264_s \
  631.deepsjeng_s \
  641.leela_s \
  657.xz_s \
  619.lbm_s \
  638.imagick_s \
  644.nab_s
do
  runcpu --config=bitcode-clang-llvm-linux-x86.cfg --action build ${bench}
done
