

.PHONY: all

all: 100.test.bc

100.test.bc: test.c
	clang -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

.PHONY: clean
	
clean:
	rm -rf ${ORG_BC_DIR}/100.test.bc
