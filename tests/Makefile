

.PHONY: all

all: 100.test-pcce-fig-4.bc \
	101.test-pcce-fig-5a.bc \
	102.test-indirect-call.bc \
	103.test-libc-nostatic-nodebug.bc \
	103.test-libc-static-nodebug.bc \
	103.test-libc-static-debug.bc \
	104.test-backedge.bc \
	105.test-functionname.bc

100.test-pcce-fig-4.bc: 100.test-pcce-fig-4.c 
	clang -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

101.test-pcce-fig-5a.bc: 101.test-pcce-fig-5a.c 
	clang -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

102.test-indirect-call.bc: 102.test-indirect-call.c 
	clang -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

103.test-libc-nostatic-nodebug.bc: 103.test-libc.c
	clang -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

103.test-libc-static-nodebug.bc: 103.test-libc.c
	clang -emit-llvm -pg -static -c $^ -o ${ORG_BC_ROOT}/$@

103.test-libc-static-debug.bc: 103.test-libc.c
	clang -emit-llvm -pg -static -g -c $^ -o ${ORG_BC_ROOT}/$@

104.test-backedge.bc: 104.test-backedge.c
	clang -emit-llvm -pg -g -c $^ -o ${ORG_BC_ROOT}/$@

105.test-functionname.bc: 105.test-functionname.cpp
	clang++ -emit-llvm -pg -g -c $^ -o ${ORG_BC_ROOT}/$@

.PHONY: clean
	
clean:
	rm ${ORG_BC_ROOT}/100.test-pcce-fig-4.bc 
	rm ${ORG_BC_ROOT}/101.test-pcce-fig-5a.bc
	rm ${ORG_BC_ROOT}/102.test-indirect-call.bc
	rm ${ORG_BC_ROOT}/103.test-libc-nostatic-nodebug.bc
	rm ${ORG_BC_ROOT}/103.test-libc-static-nodebug.bc
	rm ${ORG_BC_ROOT}/103.test-libc-static-debug.bc
	rm ${ORG_BC_ROOT}/104.test-backedge.bc
	rm ${ORG_BC_ROOT}/105.test-functionname.bc
