mkdir build
cd build
cmake -G "Unix Makefiles" ../llvm -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;libcxx;libcxxabi;lld"
cmake --build . -j32

