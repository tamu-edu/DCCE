

.PHONY: all
CFLAGS = -g -flto -mavx
CPPFLAGS = -g -flto -mavx
LTO_OPTION = -fuse-ld=lld -Wl,--plugin-opt=-lto-embed-bitcode

OBJDUMP_FLAGS = -DS
OPENMP_LIB_DIR      = /usr/lib/llvm-10/lib
OPENMP_INCLUDE_DIR  = /usr/lib/llvm-10/include/openmp
#OPENMP_LIB_DIR      = /home/sungkeun/git/spack/var/spack/environments/base/.spack-env/._view/dec54r6zjqn3jmn5hxa5l5z6bsyw22pw/lib
#OPENMP_INCLUDE_DIR  = /home/sungkeun/git/spack/opt/spack/linux-centos7-piledriver/gcc-12.1.0/llvm-openmp-12.0.1-e5sxuwhroyvhg4tiarzwyohmavipiw42/include
OBJ_DIR = ${TEST_ROOT}/obj
TEST_BIN_ROOT = ${OUTPUT_BIN}/test
dir_guard=@mkdir -p ${OBJ_DIR}

all: 100.test-pcce-fig-4 \
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
	109.test-matadd \
	110.test-tail-call \
	111.test-barrier-elision

${OBJ_DIR}/100.test-pcce-fig-4.o: ${TEST_ROOT}/100.test-pcce-fig-4.c 
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/101.test-pcce-fig-5a.o: ${TEST_ROOT}/101.test-pcce-fig-5a.c 
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/102.test-indirect-call.o: ${TEST_ROOT}/102.test-indirect-call.c 
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/103.test-libc-nostatic-nodebug.o: ${TEST_ROOT}/103.test-libc.c
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/103.test-libc-static-nodebug.o: ${TEST_ROOT}/103.test-libc.c
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/103.test-libc-static-debug.o: ${TEST_ROOT}/103.test-libc.c
	${dir_guard}
	clang ${CFLAGS} -g -c $^ -o $@

${OBJ_DIR}/104.test-backedge.o: ${TEST_ROOT}/104.test-backedge.c
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/105.test-functionname.o: ${TEST_ROOT}/105.test-functionname.cpp
	${dir_guard}
	clang++ ${CPPFLAGS} -c $^ -o $@

${OBJ_DIR}/106.test-machinecode.o: ${TEST_ROOT}/106.test-machinecode.c
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/107.test-memset.o: ${TEST_ROOT}/107.test-memset.c
	${dir_guard}
	clang  ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/108.test-mleak.o: ${TEST_ROOT}/108.test-mleak.c
	${dir_guard}
	clang  ${CFLAGS} -c $^ -o $@

${OBJ_DIR}/109.test-matadd.o: ${TEST_ROOT}/109.test-matadd.c
	${dir_guard}
	clang  ${CFLAGS} -I${OPENMP_INCLUDE_DIR} -fopenmp=libomp -c $^ -o $@

${OBJ_DIR}/110.test-tail-call-main.o: ${TEST_ROOT}/110.test-tail-call-main.c
	${dir_guard}
	clang  ${CFLAGS} -I${OPENMP_INCLUDE_DIR} -fopenmp=libomp -c $^ -o $@ -O3

${OBJ_DIR}/110.test-tail-call-foo.o: ${TEST_ROOT}/110.test-tail-call-foo.c
	${dir_guard}
	clang  ${CFLAGS} -I${OPENMP_INCLUDE_DIR} -fopenmp=libomp -c $^ -o $@ -O3

${OBJ_DIR}/111.test-barrier-elision.o: ${TEST_ROOT}/111.test-barrier-elision.c
	${dir_guard}
	clang ${CFLAGS} -c $^ -o $@ -g

100.test-pcce-fig-4: ${OBJ_DIR}/100.test-pcce-fig-4.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

101.test-pcce-fig-5a: ${OBJ_DIR}/101.test-pcce-fig-5a.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

102.test-indirect-call: ${OBJ_DIR}/102.test-indirect-call.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

103.test-libc-nostatic-nodebug: ${OBJ_DIR}/103.test-libc-nostatic-nodebug.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

103.test-libc-static-nodebug: ${OBJ_DIR}/103.test-libc-static-nodebug.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

103.test-libc-static-debug: ${OBJ_DIR}/103.test-libc-static-debug.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

104.test-backedge: ${OBJ_DIR}/104.test-backedge.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

105.test-functionname: ${OBJ_DIR}/105.test-functionname.o
	clang++ ${CPPFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

106.test-machinecode: ${OBJ_DIR}/106.test-machinecode.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

107.test-memset: ${OBJ_DIR}/107.test-memset.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

108.test-mleak: ${OBJ_DIR}/108.test-mleak.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@

109.test-matadd: ${OBJ_DIR}/109.test-matadd.o
	clang++ ${CFLAGS} ${LTO_OPTION} $^ -L${OPENMP_LIB_DIR} -fopenmp=libomp -o ${TEST_BIN_ROOT}/$@

110.test-tail-call: ${OBJ_DIR}/110.test-tail-call-main.o ${OBJ_DIR}/110.test-tail-call-foo.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -o ${TEST_BIN_ROOT}/$@ -O3

111.test-barrier-elision: ${OBJ_DIR}/111.test-barrier-elision.o
	clang ${CFLAGS} ${LTO_OPTION} $^ -lpthread -o ${TEST_BIN_ROOT}/$@ -g

.PHONY: clean
	
clean:
	rm -rf ${OBJ_DIR}
	rm ${TEST_BIN_ROOT}/*
