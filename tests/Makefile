

.PHONY: all

all: test.bc

test.bc: test.cc
	clang++ -emit-llvm -pg -c $^ -o ${ORG_BC_ROOT}/$@

.PHONY: clean
	
clean:
	rm -rf ${ORG_BC_DIR}/test.bc
