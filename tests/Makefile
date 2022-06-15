

.PHONY: all

all: 100.test-pcce-fig-4.bc 101.test-pcce-fig-5a.bc 102.test-indirect-call.bc

100.test-pcce-fig-4.bc: 100.test-pcce-fig-4.c 
	clang -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

101.test-pcce-fig-5a.bc: 101.test-pcce-fig-5a.c 
	clang -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

102.test-indirect-call.bc: 102.test-indirect-call.c 
	clang -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

.PHONY: clean
	
clean:
	rm ${ORG_BC_ROOT}/100.test-pcce-fig-4.bc 
	rm ${ORG_BC_ROOT}/101.test-pcce-fig-5a.bc
	rm ${ORG_BC_ROOT}/102.test-indirect-call.bc
