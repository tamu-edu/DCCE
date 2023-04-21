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

# add third-party libraries

add_library(dcce_ccid_overhead SHARED
dcce_ccid_overhead.cpp
  )

if (STATS)
  message(WARNING "building with DCCE_STATS")
  add_definitions(-DDCCE_STATS)
endif (STATS)

configure_DynamoRIO_client(dcce_ccid_overhead)
use_DynamoRIO_extension(dcce_ccid_overhead dccelib)
place_shared_lib_in_lib_dir(dcce_ccid_overhead)
add_dependencies(dcce_ccid_overhead api_headers)

# Provide a hint for how to use the client
if (NOT DynamoRIO_INTERNAL OR NOT "${CMAKE_GENERATOR}" MATCHES "Ninja")
  add_custom_command(TARGET dcce_ccid_overhead
    POST_BUILD
    COMMAND ${CMAKE_COMMAND}
    ARGS -E echo "Usage: pass to drconfig or drrun: -t dcce_ccid_overhead"
    VERBATIM)
endif ()

install_target(dcce_ccid_overhead ${INSTALL_CLIENTS_LIB})

set(INSTALL_DCCELIB_CLIENTS_LIB ${INSTALL_CLIENTS_BASE})

function (write_config_file dst bindir libdir)
  file(WRITE  ${dst} "# dcce_ccid_overhead tool config file\n")
  file(APPEND ${dst} "CLIENT_REL=${libdir}/${LIB_PFX}dcce_ccid_overhead${LIB_EXT}\n")
endfunction ()

if (X64)
  set(CONFIG_INSTALL ${PROJECT_BINARY_DIR}/dcce_ccid_overhead.drrun64)
  set(CONFIG_BUILD ${PROJECT_BINARY_DIR}/tools/dcce_ccid_overhead.drrun64)
else (X64)
  set(CONFIG_INSTALL ${PROJECT_BINARY_DIR}/dcce_ccid_overhead.drrun32)
  set(CONFIG_BUILD ${PROJECT_BINARY_DIR}/tools/dcce_ccid_overhead.drrun32)
endif (X64)

set(BUILD_CLIENTS_BIN clients/${INSTALL_BIN})
set(BUILD_CLIENTS_LIB clients/${INSTALL_LIB})

write_config_file(${CONFIG_INSTALL} ${INSTALL_CLIENTS_BIN} ${INSTALL_CLIENTS_LIB})
write_config_file(${CONFIG_BUILD} ${BUILD_CLIENTS_BIN} ${BUILD_CLIENTS_LIB})

DR_install(FILES "${CONFIG_INSTALL}" DESTINATION ${INSTALL_DCCELIB_CLIENTS_LIB})
register_tool_file("dcce_ccid_overhead")

##################################################
# Documentation

