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
SRC_ROOT=${CPU2017_INSTALL_PATH}/benchspec/CPU
COPY_TO=${OUTPUT_BIN}/SPEC2017

if [[ -d "${COPY_TO}" ]]; then
  while true; do
    read -p "Directoy ${COPY_TO} exists. You may overwrite files in the directory. Do you want to continue? (y/n)?" yn
    case $yn in
      [Yy]* ) break;;
      [Nn]* ) echo "Stop copy."; exit;;
      * ) echo "Please answer yes or no.";;
    esac
  done
else
  echo "Directoy ${COPY_TO} does not exists. Creating it..."
  mkdir -p ${COPY_TO}
fi


cp ${SRC_ROOT}/500.perlbench_r/exe/perlbench_r_base.dcce-bitcode-m64 ${COPY_TO}/500.perlbench_r
cp ${SRC_ROOT}/502.gcc_r/exe/cpugcc_r_base.dcce-bitcode-m64 ${COPY_TO}/502.gcc_r
cp ${SRC_ROOT}/505.mcf_r/exe/mcf_r_base.dcce-bitcode-m64 ${COPY_TO}/505.mcf_r
cp ${SRC_ROOT}/520.omnetpp_r/exe/omnetpp_r_base.dcce-bitcode-m64 ${COPY_TO}/520.omnetpp_r
cp ${SRC_ROOT}/523.xalancbmk_r/exe/cpuxalan_r_base.dcce-bitcode-m64 ${COPY_TO}/523.xalancbmk_r
cp ${SRC_ROOT}/525.x264_r/exe/x264_r_base.dcce-bitcode-m64 ${COPY_TO}/525.x264_r
cp ${SRC_ROOT}/531.deepsjeng_r/exe/deepsjeng_r_base.dcce-bitcode-m64 ${COPY_TO}/531.deepsjeng_r
cp ${SRC_ROOT}/541.leela_r/exe/leela_r_base.dcce-bitcode-m64 ${COPY_TO}/541.leela_r
cp ${SRC_ROOT}/557.xz_r/exe/xz_r_base.dcce-bitcode-m64 ${COPY_TO}/557.xz_r
cp ${SRC_ROOT}/508.namd_r/exe/namd_r_base.dcce-bitcode-m64 ${COPY_TO}/508.namd_r
cp ${SRC_ROOT}/510.parest_r/exe/parest_r_base.dcce-bitcode-m64 ${COPY_TO}/510.parest_r
cp ${SRC_ROOT}/511.povray_r/exe/povray_r_base.dcce-bitcode-m64 ${COPY_TO}/511.povray_r
cp ${SRC_ROOT}/519.lbm_r/exe/lbm_r_base.dcce-bitcode-m64 ${COPY_TO}/519.lbm_r
cp ${SRC_ROOT}/526.blender_r/exe/blender_r_base.dcce-bitcode-m64 ${COPY_TO}/526.blender_r
cp ${SRC_ROOT}/538.imagick_r/exe/imagick_r_base.dcce-bitcode-m64 ${COPY_TO}/538.imagick_r
cp ${SRC_ROOT}/544.nab_r/exe/nab_r_base.dcce-bitcode-m64 ${COPY_TO}/544.nab_r
cp ${SRC_ROOT}/600.perlbench_s/exe/perlbench_s_base.dcce-bitcode-m64 ${COPY_TO}/600.perlbench_s
cp ${SRC_ROOT}/602.gcc_s/exe/sgcc_base.dcce-bitcode-m64 ${COPY_TO}/602.gcc_s
cp ${SRC_ROOT}/605.mcf_s/exe/mcf_s_base.dcce-bitcode-m64 ${COPY_TO}/605.mcf_s
cp ${SRC_ROOT}/620.omnetpp_s/exe/omnetpp_s_base.dcce-bitcode-m64 ${COPY_TO}/620.omnetpp_s
cp ${SRC_ROOT}/623.xalancbmk_s/exe/xalancbmk_s_base.dcce-bitcode-m64 ${COPY_TO}/623.xalancbmk_s
cp ${SRC_ROOT}/625.x264_s/exe/x264_s_base.dcce-bitcode-m64 ${COPY_TO}/625.x264_s
cp ${SRC_ROOT}/631.deepsjeng_s/exe/deepsjeng_s_base.dcce-bitcode-m64 ${COPY_TO}/631.deepsjeng_s
cp ${SRC_ROOT}/641.leela_s/exe/leela_s_base.dcce-bitcode-m64 ${COPY_TO}/641.leela_s
cp ${SRC_ROOT}/657.xz_s/exe/xz_s_base.dcce-bitcode-m64 ${COPY_TO}/657.xz_s
cp ${SRC_ROOT}/619.lbm_s/exe/lbm_s_base.dcce-bitcode-m64 ${COPY_TO}/619.lbm_s
cp ${SRC_ROOT}/638.imagick_s/exe/imagick_s_base.dcce-bitcode-m64 ${COPY_TO}/638.imagick_s
cp ${SRC_ROOT}/644.nab_s/exe/nab_s_base.dcce-bitcode-m64 ${COPY_TO}/644.nab_s

