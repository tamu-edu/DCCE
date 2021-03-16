#!/bin/bash

cd ${SVF_ROOT}
./build.sh

cd ${DCCE_RTLIB_BUILD_DIR}
cmake ..
make -j4

cd ${PCCE_RTLIB_BUILD_DIR}
cmake ..
make -j4

cd ${TEST_ROOT}
make

cd ${DCCE_ROOT}
