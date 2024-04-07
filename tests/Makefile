.PHONY: all
CFLAGS = -g -flto -mavx
CPPFLAGS = -g -flto -mavx
LTO_OPTION = -fuse-ld=lld -Wl,--plugin-opt=-lto-embed-bitcode

OBJDUMP_FLAGS = -DS
OPENMP_LIB_DIR      = /usr/lib/llvm-10/lib
OPENMP_INCLUDE_DIR  = /usr/lib/llvm-10/include/openmp
OBJ_DIR = ${TEST_ROOT}/obj
TEST_BIN_ROOT = ${OUTPUT_BIN}/test
dir_guard = @mkdir -p $(dir $@)

TESTS = 100.test-pcce-fig-4 \
	101.test-pcce-fig-5a \
	102.test-indirect-call \
	103.test-libc-nostatic-nodebug \
	103.test-libc-static-nodebug \
	103.test-libc-static-debug \
	104.test-backedge \
	105.test-functionname \
	106.test-machinecode \
	107.test-memset \
	108.test-mleak \
	111.test-barrier-elision \
#	109.test-matadd \
#	110.test-tail-call \

all: $(patsubst %,${TEST_BIN_ROOT}/%,${TESTS})

${OBJ_DIR}/%.o: ${TEST_ROOT}/%.c
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/%.o: ${TEST_ROOT}/%.cpp
	${dir_guard}
	clang++ ${CPPFLAGS} -c $^ -o $@

${OBJ_DIR}/109.test-matadd.o: ${TEST_ROOT}/109.test-matadd.c
	${dir_guard}
	clang  ${CFLAGS} -I${OPENMP_INCLUDE_DIR} -fopenmp=libomp -c $^ -o $@

${OBJ_DIR}/110.test-tail-call-main.o: ${TEST_ROOT}/110.test-tail-call-main.c
	${dir_guard}
	clang  ${CFLAGS} -I${OPENMP_INCLUDE_DIR} -fopenmp=libomp -c $^ -o $@ -O3

${OBJ_DIR}/110.test-tail-call-foo.o: ${TEST_ROOT}/110.test-tail-call-foo.c
	${dir_guard}
	clang  ${CFLAGS} -I${OPENMP_INCLUDE_DIR} -fopenmp=libomp -c $^ -o $@ -O3

${TEST_BIN_ROOT}/%: ${OBJ_DIR}/%.o
	${dir_guard}
	clang ${CFLAGS} ${LTO_OPTION} $^ -o $@

${TEST_BIN_ROOT}/109.test-matadd: ${OBJ_DIR}/109.test-matadd.o
	${dir_guard}
	clang++ ${CFLAGS} ${LTO_OPTION} $^ -L${OPENMP_LIB_DIR} -fopenmp=libomp -o $@

${TEST_BIN_ROOT}/110.test-tail-call: ${OBJ_DIR}/110.test-tail-call-main.o ${OBJ_DIR}/110.test-tail-call-foo.o
	${dir_guard}
	clang ${CFLAGS} ${LTO_OPTION} $^ -o $@ -O3

${TEST_BIN_ROOT}/111.test-barrier-elision: ${OBJ_DIR}/111.test-barrier-elision.o
	${dir_guard}
	clang ${CFLAGS} ${LTO_OPTION} $^ -lpthread -o $@ -g

.PHONY: clean
	
clean:
	${RM} -r ${OBJ_DIR} ${TEST_BIN_ROOT}
