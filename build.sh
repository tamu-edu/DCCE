#!/bin/bash

cd ${SVF_ROOT}
./build.sh

cd ${BASE2_RTLIB_BUILD_DIR}
cmake ..
make -j4

cd ${DCCE_RTLIB_BUILD_DIR}
cmake ..
make -j4

cd ${TEST_ROOT}
make

cd ${DCCE_ROOT}
