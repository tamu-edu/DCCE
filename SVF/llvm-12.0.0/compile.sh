mkdir build
cd build

# For building fortran compiler
CC=gcc CXX=g++ cmake -G "Unix Makefiles" ../llvm -DLLVM_ENABLE_PROJECTS="flang" -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_PARALLEL_LINK_JOBS=1 -DLLVM_USE_LINKER=gold
#CC=gcc CXX=g++ cmake -G "Unix Makefiles" ../llvm -DLLVM_ENABLE_PROJECTS="lld" -DLLVM_TARGETS_TO_BUILD=X86
#CC=gcc CXX=g++ cmake -G "Unix Makefiles" ../llvm -DLLVM_ENABLE_PROJECTS="clang" -DLLVM_TARGETS_TO_BUILD=X86
cmake --build . -j1

