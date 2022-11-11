# **********************************************************
# Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
# Licensed under the MIT License.
# See LICENSE file for more information.
#  **********************************************************

cmake_minimum_required(VERSION 3.7)

include(../../make/policies.cmake NO_POLICY_SCOPE)

if (UNIX)
  if (DEBUG)
    add_compile_options(-g)
  endif (DEBUG)
endif (UNIX)


add_definitions(-DDCCE_STATS)

set(DynamoRIO_USE_LIBC OFF)

set(srcs
  dccelib.cpp
  )
set(srcs_static ${srcs})

include_directories("${PROJECT_SOURCE_DIR}/ext/drsyms/libelftc/include")

set(PREFERRED_BASE 0x79000000)

add_library(dccelib SHARED ${srcs})
configure_extension(dccelib OFF)
use_DynamoRIO_extension(dccelib drcontainers)
use_DynamoRIO_extension(dccelib drmgr)
use_DynamoRIO_extension(dccelib drutil)
use_DynamoRIO_extension(dccelib drsyms)
use_DynamoRIO_extension(dccelib drwrap)
use_DynamoRIO_extension(dccelib drreg)

add_library(dccelib_static STATIC ${srcs_static})
configure_extension(dccelib_static ON)
use_DynamoRIO_extension(dccelib_static drcontainers)
use_DynamoRIO_extension(dccelib_static drmgr_static)
use_DynamoRIO_extension(dccelib_static drutil_static)
use_DynamoRIO_extension(dccelib_static drsyms_static)
use_DynamoRIO_extension(dccelib_static drwrap_static)
use_DynamoRIO_extension(dccelib_static drreg_static)

install_ext_header(dccelib.h)
