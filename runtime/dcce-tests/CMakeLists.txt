# add the excutable
project(libdcce)
#set ( CMAKE_C_FLAGS "-pg")

if (CMAKE_BUILD_TYPE MATCHES Debug)
add_definitions(-DDEBUG)
endif()

include_directories(../utils)
add_library(rtlib_dcce SHARED rtlib.cc ../utils/utils.cc)
