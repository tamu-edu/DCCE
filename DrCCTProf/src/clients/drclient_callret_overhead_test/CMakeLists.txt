# **********************************************************
# Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
# Licensed under the MIT License.
# See LICENSE file for more information.
#  **********************************************************

cmake_minimum_required(VERSION 3.7)

include(../../make/policies.cmake NO_POLICY_SCOPE)

if (UNIX)
  add_compile_options(-Wno-deprecated)
  add_compile_options(-Wno-unused-result)
  add_compile_options(-Wno-unused-variable)
  add_compile_options(-Wno-unused-local-typedefs)
  add_compile_options(-Wno-unused-function)
  add_compile_options(-Werror=sign-compare)
  add_compile_options(-Werror=narrowing)
  

  if (DEBUG)
    add_compile_options(-g)
  endif (DEBUG)
endif (UNIX)

include_directories("${PROJECT_SOURCE_DIR}/ext/drsyms/libelftc/include")
# add third-party libraries

add_library(drclient_callret_overhead_test SHARED
drclient_callret_overhead_test.cpp
  )

configure_DynamoRIO_client(drclient_callret_overhead_test)
#use_DynamoRIO_extension(drclient_callret_overhead_test drcctlib)
use_DynamoRIO_extension(drclient_callret_overhead_test drcontainers)
use_DynamoRIO_extension(drclient_callret_overhead_test drmgr)
use_DynamoRIO_extension(drclient_callret_overhead_test droption)
use_DynamoRIO_extension(drclient_callret_overhead_test drutil)
use_DynamoRIO_extension(drclient_callret_overhead_test drsyms)
use_DynamoRIO_extension(drclient_callret_overhead_test drwrap)
use_DynamoRIO_extension(drclient_callret_overhead_test drreg)
place_shared_lib_in_lib_dir(drclient_callret_overhead_test)

add_dependencies(drclient_callret_overhead_test api_headers)

# Provide a hint for how to use the client
if (NOT DynamoRIO_INTERNAL OR NOT "${CMAKE_GENERATOR}" MATCHES "Ninja")
  add_custom_command(TARGET drclient_callret_overhead_test
    POST_BUILD
    COMMAND ${CMAKE_COMMAND}
    ARGS -E echo "Usage: pass to drconfig or drrun: -t drclient_callret_overhead_test"
    VERBATIM)
endif ()

install_target(drclient_callret_overhead_test ${INSTALL_CLIENTS_LIB})

set(INSTALL_DRCCTLIB_CLIENTS_LIB ${INSTALL_CLIENTS_BASE})

function (write_config_file dst bindir libdir)
  file(WRITE  ${dst} "# drclient_callret_overhead_test tool config file\n")
  file(APPEND ${dst} "CLIENT_REL=${libdir}/${LIB_PFX}drclient_callret_overhead_test${LIB_EXT}\n")
endfunction ()

if (X64)
  set(CONFIG_INSTALL ${PROJECT_BINARY_DIR}/drclient_callret_overhead_test.drrun64)
  set(CONFIG_BUILD ${PROJECT_BINARY_DIR}/tools/drclient_callret_overhead_test.drrun64)
else (X64)
  set(CONFIG_INSTALL ${PROJECT_BINARY_DIR}/drclient_callret_overhead_test.drrun32)
  set(CONFIG_BUILD ${PROJECT_BINARY_DIR}/tools/drclient_callret_overhead_test.drrun32)
endif (X64)

set(BUILD_CLIENTS_BIN clients/${INSTALL_BIN})
set(BUILD_CLIENTS_LIB clients/${INSTALL_LIB})

write_config_file(${CONFIG_INSTALL} ${INSTALL_CLIENTS_BIN} ${INSTALL_CLIENTS_LIB})
write_config_file(${CONFIG_BUILD} ${BUILD_CLIENTS_BIN} ${BUILD_CLIENTS_LIB})

DR_install(FILES "${CONFIG_INSTALL}" DESTINATION ${INSTALL_DRCCTLIB_CLIENTS_LIB})
register_tool_file("drclient_callret_overhead_test")

##################################################
# Documentation

