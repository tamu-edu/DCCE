cmake_minimum_required(VERSION 3.1)
project(DCCE)

# support C++14 features used by LLVM 10.0.0
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_C_COMPILER /home/sungkeun/.bin/gcc-10.1.0/bin/gcc)
set(CMAKE_CXX_COMPILER /home/sungkeun/.bin/gcc-10.1.0/bin/g++)

find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_subdirectory(llvm-pass/dcce)
add_subdirectory(runtime/dcce)

message("include ${LLVM_INCLUDE_DIRS}")
message("lib ${LLVM_LIBRARY_DIRS}")
message("def ${LLVM_DEFINITIONS}")
