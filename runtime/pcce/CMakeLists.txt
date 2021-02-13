# add the excutable
set ( CMAKE_CXX_FLAGS "-pg")
set ( CMAKE_C_FLAGS "-pg")
add_library(rtlib rtlib.cc)
