# add the excutable
project(libpcce)
#set ( CMAKE_CXX_FLAGS "-pg")
#set ( CMAKE_C_FLAGS "-pg")
if (CMAKE_BUILD_TYPE MATCHES Debug)
add_definitions(-DDEBUG)
endif()

if (CMAKE_BUILD_TYPE MATCHES Verbose)
  add_definitions(-DVERBOSE)
endif()

include_directories(../utils)
add_library(rtlib_pcce SHARED rtlib.cc ../utils/utils.cc)
