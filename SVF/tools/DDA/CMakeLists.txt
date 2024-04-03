cmake_minimum_required (VERSION 2.6) 
find_package (Threads)

if(DEFINED IN_SOURCE_BUILD)
    set(LLVM_LINK_COMPONENTS BitWriter Core IPO IrReader InstCombine Instrumentation Target Linker Analysis ScalarOpts Support Svf Cudd)
    add_llvm_tool( dvf dda.cpp )
else()
    add_executable( dvf dda.cpp )

    target_link_libraries( dvf Svf Cudd ${llvm_libs} ${CMAKE_THREAD_LIBS_INIT} )

    set_target_properties( dvf PROPERTIES
                           RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )
endif()
