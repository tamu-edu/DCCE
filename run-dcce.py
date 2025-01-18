import sys
import os
import os.path
import argparse
import shlex
import threading
from subprocess import Popen, PIPE
import time


static_schemes = ['pcce', 'dcce']
static_schemes_instr_only = ['pcc']


benchmark_suites = {
    'Splash-3' : [
        '701.BARNES',
        '702.CHOLESKY',
        '703.FFT',
        '704.FMM',
        '705.LU-CB',
        '706.LU-NCB',
        '707.OCEAN-CP',
        '708.OCEAN-NCP',
        '709.RADIOSITY',
        '710.RADIX',
        '711.RAYTRACE',
        '713.WATER-NSQUARED',
        '714.WATER-SPATIAL',
    ],

    'SPEC2017' : [
        '505.mcf_r',
        '508.namd_r',
        '510.parest_r',
        '519.lbm_r',
        '520.omnetpp_r',
        '523.xalancbmk_r',
        '525.x264_r',
        '541.leela_r',
        '557.xz_r',
    ],

}

cmd_options = {
        '701.BARNES'         : f' < {os.getenv("SPLASH3_ROOT")}/apps/barnes/inputs/n2097152-p8',
        '702.CHOLESKY'       : f' -p2 < {os.getenv("SPLASH3_ROOT")}/kernels/cholesky/inputs/tk29.O',
        '703.FFT'            : f' -p2 -m28',
        '704.FMM'            : f' < {os.getenv("SPLASH3_ROOT")}/apps/fmm/inputs/input.8.2097152',
        '705.LU-CB'          : f' -p2 -n4096',
        '706.LU-NCB'         : f' -p2 -n4096',
        '707.OCEAN-CP'       : f' -p2 -n4098', 
        '708.OCEAN-NCP'      : f' -p2 -n4098',
        '709.RADIOSITY'      : f' -p 8 -tq 200 -ae 5000 -bf 0.0005 -en 0.05 -largeroom -batch',
        '710.RADIX'          : f' -p2 -n92048576',  #n1048576
        '711.RAYTRACE'       : f' -p2 -m64 {os.getenv("SPLASH3_ROOT")}/apps/raytrace/inputs/balls4.env',
        '712.VOLREND'        : f' 16 {os.getenv("SPLASH3_ROOT")}/apps/volrend/inputs/head 8',
        '713.WATER-NSQUARED' : f' < {os.getenv("SPLASH3_ROOT")}/apps/water-nsquared/inputs/n8000-p8',
        '714.WATER-SPATIAL'  : f' < {os.getenv("SPLASH3_ROOT")}/apps/water-spatial/inputs/n32768-p8',
 
        '505.mcf_r': '%s/505.mcf_r/data/refrate/input/inp.in' % (os.getenv('CPU2017_RUN_DIR')),
        '508.namd_r': '--input %s/508.namd_r/data/all/input/apoa1.input --iterations 65' % (os.getenv('CPU2017_RUN_DIR')),
        '510.parest_r': '%s/510.parest_r/data/refrate/input/ref.prm' % (os.getenv('CPU2017_RUN_DIR')),
        '519.lbm_r': '3000 reference.dat 0 0 %s/519.lbm_r/data/refrate/input/100_100_130_ldc.of' % (os.getenv('CPU2017_RUN_DIR')),
        '520.omnetpp_r': '-c General -r 0',
        '523.xalancbmk_r': '-v %s/523.xalancbmk_r/data/refrate/input/t5.xml %s/523.xalancbmk_r/data/refrate/input/xalanc.xsl' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '525.x264_r': '--seek 500 --dumpyuv 200 --frames 1250 -o %s/525.x264_r/BuckBunny_New.264 %s/525.x264_r/data/refrate/input/BuckBunny.yuv 1280x720' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '557.xz_r':  '%s/557.xz_r/data/all/input/cld.tar.xz 160 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 59796407 61004416 6' % (os.getenv('CPU2017_RUN_DIR')),
    }

def foreach_bench(only_this_suite=None):
    for suite_name, benches in benchmark_suites.items():
        if only_this_suite != None and only_this_suite != suite_name:
            continue
        for bench in benches:
            yield suite_name, bench

def run_cmd_foreach_bench(cmd_log, parallel=False, force_exit=True):
    if parallel:
        threads = []
        for cmd, log in cmd_log:
            th = threading.Thread(target=run_cmd, args=(cmd, log, force_exit))
            threads.append(th)
            th.start()

        for th in threads:
            th.join()
    else:
        for cmd, log in cmd_log:
            #command = f'{cmd} > {log} 2>&1'
            #print(command)
            run_cmd(cmd, log, force_exit)

def run_cmd(cmd, log=None, force_exit=True):
    print(cmd)
    if log:
        output = open(log, 'w')
        process = Popen(shlex.split(cmd), stdout=output, stderr=output)
    else:
        #process = Popen(shlex.split(cmd), stdout=PIPE, stderr=PIPE)
        process = Popen(shlex.split(cmd))
    process.communicate()
    exit_code = process.wait()
    if (exit_code != 0):
        print('Execution Failed with error %d. See %s' % (exit_code, log))
        if force_exit:
            exit(1)

def build(debug=False):
    makedirs(os.getenv('DCCE_RTLIB_BUILD_DIR'))
    makedirs(os.getenv('PCCE_RTLIB_BUILD_DIR'))
    makedirs(os.getenv('PCC_RTLIB_BUILD_DIR'))

    # Build benchmarks
    cmd = f'cd {os.getenv("TEST_ROOT")} && make ; cd {os.getenv("DCCE_ROOT")}'
    os.system(cmd)

    makedirs(os.getenv('OUTPUT_SPLASH3_DIR'))

    cmd = f'cd {os.getenv("SPLASH3_ROOT")} && make ; cd {os.getenv("DCCE_ROOT")}'
    os.system(cmd)

    if debug:
        cmd = f'cd {os.getenv("DCCE_RTLIB_BUILD_DIR")} && cmake .. -DCMAKE_BUILD_TYPE=Debug && make -j4; cd {os.getenv("DCCE_ROOT")}'
    else:
        cmd = f'cd {os.getenv("DCCE_RTLIB_BUILD_DIR")} && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j4; cd {os.getenv("DCCE_ROOT")}'
    os.system(cmd)

    if debug:
        cmd = f'cd {os.getenv("PCCE_RTLIB_BUILD_DIR")} && cmake .. -DCMAKE_BUILD_TYPE=Debug && make -j4; cd {os.getenv("DCCE_ROOT")}'
    else:
        cmd = f'cd {os.getenv("PCCE_RTLIB_BUILD_DIR")} && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j4; cd {os.getenv("DCCE_ROOT")}'
    os.system(cmd)

    if debug:
        cmd = f'cd {os.getenv("PCC_RTLIB_BUILD_DIR")} && cmake .. -DCMAKE_BUILD_TYPE=Debug && make -j4; cd {os.getenv("DCCE_ROOT")}'
    else:
        cmd = f'cd {os.getenv("PCC_RTLIB_BUILD_DIR")} && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j4; cd {os.getenv("DCCE_ROOT")}'
    os.system(cmd)

    cmd = f'cd {os.getenv("SVF_ROOT")} && bash build.sh; cd {os.getenv("DCCE_ROOT")}'
    os.system(cmd)


def clean():
    run_cmd('rm -rf %s' % os.getenv('DCCE_RTLIB_BUILD_DIR'))
    run_cmd('bash %s/clean.sh' % (os.getenv('SVF_ROOT')))
    run_cmd('rm -rf %s/test.bc' % (os.getenv('BC_ROOT')))

def extract_bitcode():
    output_bin = os.getenv("OUTPUT_BIN")
    output_bitcode = os.getenv("OUTPUT_BITCODE")
    for suite_name, _ in benchmark_suites.items():
        makedirs(f'{output_bitcode}/{suite_name}')

    cmd_log = []
    for suite_name, bench in foreach_bench():
        # extract bitcode from the executable
        cmd = f'objcopy {output_bin}/{suite_name}/{bench} --dump-section .llvmbc={output_bitcode}/{suite_name}/{bench}.bc'
        log = f'{output_bitcode}/{suite_name}/{bench}.bc.log'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)

    cmd_log = []
    for suite_name, bench in foreach_bench():
        # disassmble the bitcode
        cmd = f'llvm-dis {output_bitcode}/{suite_name}/{bench}.bc -o {output_bitcode}/{suite_name}/{bench}.ll'
        log = f'{output_bitcode}/{suite_name}/{bench}.ll.log'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)

    # TODO: move it to run_bin
    cmd_log = []
    for suite_name, bench in foreach_bench():
        # disassemble the executable
        cmd = f'llvm-objdump -DS {output_bin}/{suite_name}/{bench}'
        log = f'{output_bin}/{suite_name}/{bench}.asm'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)

def callgraph():
    start_time = time.time()

    output_cg = os.getenv("OUTPUT_CG")
    output_bitcode = os.getenv("OUTPUT_BITCODE")
    for suite_name, _ in benchmark_suites.items():
        print(f'{output_cg}/{suite_name}')
        makedirs(f'{output_cg}/{suite_name}')

    cmd_log = []
    for suite_name, bench in foreach_bench():
        cmd = f'/usr/bin/time -v wpa -ander -dump-callgraph {output_cg}/{suite_name}/{bench} {output_bitcode}/{suite_name}/{bench}.bc'
        log = f'{output_cg}/{suite_name}/{bench}.callgraph.log'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False, False)

    cmd_log = []
    for suite_name, bench in foreach_bench():
        cmd = f'python3 ccencoder/callgraph-stats.py {output_cg}/{suite_name}/{bench}-final.cg {bench} main {output_cg}/{suite_name}'
        log = f'{output_cg}/{suite_name}/{bench}.stats.log'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    end_time = time.time()
    execution_time = end_time - start_time
    print(f'Callgraphs are generated in {output_cg}, execution time: {execution_time}')

def ccenc(args):
    start_time = time.time()
    ccenc_root = os.getenv("OUTPUT_CCENC")
    for scheme in static_schemes:
        for suite_name, _ in benchmark_suites.items():
            makedirs(f'{ccenc_root}/{scheme}/{suite_name}')

    cmd_log = []
    for scheme in static_schemes:
        for suite_name, bench in foreach_bench():
            cmd = f'/usr/bin/time -v python3 ccencoder/gen_calling_context.py ' \
                f'{os.getenv("OUTPUT_CG")}/{suite_name}/{bench}-final.cg {bench} main {scheme} {ccenc_root}/{scheme}/{suite_name}'
            log = f'{ccenc_root}/{scheme}/{suite_name}/{bench}.ccenc.log'
            cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    end_time = time.time()
    execution_time = end_time - start_time
    print(f'Calling context encoding is done and outputs are stored in {ccenc_root}, execution time: {execution_time}')

def static_instr():
    start_time = time.time()
    output_ccenc = os.getenv("OUTPUT_CCENC")
    output_bitcode = os.getenv("OUTPUT_BITCODE")
    output_static_bin = os.getenv("OUTPUT_STATIC_BIN")

    clients = ['ccid_update_only', 'whistle', 'barrier_elider', 'profile']
    for scheme in static_schemes + static_schemes_instr_only:
        for client in clients:
            for suite_name, _ in benchmark_suites.items():
                makedirs(f'{output_static_bin}/{scheme}/{client}/{suite_name}')

    cmd_log = []
    for scheme in static_schemes + static_schemes_instr_only:
        for client in clients:
            for suite_name, bench in foreach_bench():
                bench_code = int(bench[:3])
                if scheme in static_schemes:
                    cmd = f'/usr/bin/time -v wpa -ander -ccinput {output_ccenc}/{scheme}/{suite_name}/{bench}.cc -instr-scheme {scheme} -instr-client {client} -bench-code {bench_code} -dump-modules {output_static_bin}/{scheme}/{client}/{suite_name} {output_bitcode}/{suite_name}/{bench}.bc'
                else:
                    cmd = f'/usr/bin/time -v wpa -ander -instr-scheme {scheme} -instr-client {client} -bench-code {bench_code} -dump-modules {output_static_bin}/{scheme}/{client}/{suite_name} {output_bitcode}/{suite_name}/{bench}.bc'
                log = f'{output_static_bin}/{scheme}/{client}/{suite_name}/{bench}.instr.log'
                cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    # Build instrumented bitcode
    cmd_log = []
    for scheme in static_schemes + static_schemes_instr_only:
        rtlib_path = f'{os.getenv("RTLIB_ROOT")}/{scheme}/build/'
        for client in clients:
            for suite_name, bench in foreach_bench():
                if suite_name == "Splash-3":
                    cmd = f'/usr/bin/time -v clang++ {output_static_bin}/{scheme}/{client}/{suite_name}/{bench}.bc \
                            -lpthread \
                            -D_XOPEN_SOURCE=500 \
                            -D_POSIX_C_SOURCE=200112 \
                            -std=c++11 \
                            -fno-strict-aliasing \
                            -fuse-ld=lld \
                            -lm \
                            -lrtlib_{scheme} \
                            -L{rtlib_path} \
                            -o {output_static_bin}/{scheme}/{client}/{suite_name}/{bench}'
                else:
                    cmd = f'/usr/bin/time -v clang++ {output_static_bin}/{scheme}/{client}/{suite_name}/{bench}.bc \
                            -m64 \
                            -z muldefs \
                            -mavx \
                            -DSPEC_LINUX_X64 \
                            -DSPEC_OPENMP \
                            -Wno-return-type \
                            -DUSE_OPENMP \
                            -lm \
                            -lrtlib_{scheme} \
                            -L/usr/lib/llvm-10/lib \
                            -L{rtlib_path} \
                            -I/usr/lib/llvm-10/include/openmp \
                            -fopenmp=libomp \
                            -lpthread \
                            -o {output_static_bin}/{scheme}/{client}/{suite_name}/{bench}'

                cmd = ' '.join(cmd.split())
                log = f'{output_static_bin}/{scheme}/{client}/{suite_name}/{bench}.build.log'
                cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)
   
    # Disassemble the executable
    cmd_log = []
    for scheme in static_schemes:
        for client in clients:
            for suite_name, bench in foreach_bench():
                # disassemble the executable
                cmd = f'llvm-objdump -DS {output_static_bin}/{scheme}/{client}/{suite_name}/{bench}'
                log = f'{output_static_bin}/{scheme}/{client}/{suite_name}/{bench}.asm'
                cmd_log.append((cmd, log))
                cmd = f'llvm-dis {output_static_bin}/{scheme}/{client}/{suite_name}/{bench}.bc'
                log = f'{output_static_bin}/{scheme}/{client}/{suite_name}/{bench}.dis'
                cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    end_time = time.time()
    execution_time = end_time - start_time
    print(f'Instrumentation is done, execution time: {execution_time:.3f}s')

def run_native_exp(args):
    output_bin = os.getenv("OUTPUT_BIN")
    output_native_exp = os.getenv("OUTPUT_NATIVE_EXP")

    for i in range(10):
        for suite_name, bench in foreach_bench():
            makedirs(f'{output_native_exp}/{suite_name}')
        for suite_name, bench in foreach_bench():
            cmd = f'/usr/bin/time -v {output_bin}/{suite_name}/{bench} {cmd_options[bench]} > {output_native_exp}/{suite_name}/{bench}_{i}.out 2>&1'
            print(cmd)
            os.system(cmd)
            os.system('sleep 10')

def run_static_exp(args):
    output_static_bin = os.getenv("OUTPUT_STATIC_BIN")
    output_static_exp = os.getenv("OUTPUT_STATIC_EXP")

    clients = ['ccid_update_only', 'whistle', 'barrier_elider', 'profile']
    for i in range(10):
        for scheme in static_schemes + static_schemes_instr_only:
            for client in clients:
                for suite_name, bench in foreach_bench():
                    makedirs(f'{output_static_exp}/{scheme}/{client}/{suite_name}')
                for suite_name, bench in foreach_bench():
                    cmd = f'/usr/bin/time -v {output_static_bin}/{scheme}/{client}/{suite_name}/{bench} {cmd_options[bench]} > {output_static_exp}/{scheme}/{client}/{suite_name}/{bench}_{i}.out 2>&1'
                    print(cmd)
                    os.system('sleep 10')
                    os.system(cmd)

def main(args):
    if (not args.build_debug \
            and not args.build_runtime \
            and not args.clean \
            and not args.extract_bitcode \
            and not args.callgraph \
            and not args.ccenc \
            and not args.static_instr \
            and not args.run_native_exp \
            and not args.run_static_exp):
        print("Nothing to do ...\nrun 'run_dcce -h' to see how to use.")
        exit(1)

    if (args.build_debug):
        build(True)
    if (args.build_runtime):
        build(False)
    if (args.clean):
        clean()

    if (args.extract_bitcode):
        extract_bitcode()
    if (args.callgraph):
        callgraph()
    if (args.ccenc):
        ccenc(args)
    if (args.static_instr):
        static_instr()
    if (args.run_native_exp):
        run_native_exp(args)
    if (args.run_static_exp):
        run_static_exp(args)
    

def makedirs(dir):
    if not os.path.exists(dir):
        os.makedirs(dir)

if __name__== "__main__":
    if os.getenv('DCCE_ENV_SETUP') != 'YES':
        print("Environment Variabls are not set. run 'source %s' first." % 'setup-env.sh')
        exit(1)

    parser = argparse.ArgumentParser(\
            description='Main program to run DCCE project.')

    parser.add_argument('-build-debug', action='store_true',
            help='build benchmarks, LLVM, SVF, and runtime with debug and static flag')
    parser.add_argument('-build-runtime', action='store_true',
            help='build benchmarks, LLVM, SVF, and runtime without release and static flag')
    parser.add_argument('-clean', action='store_true',
            help='clean all the output files.')
   
    # Common commands
    parser.add_argument('-extract-bitcode', action='store_true',
            help='extract bitcode from the binary.')
    parser.add_argument('-callgraph', action='store_true',
            help='run wpa -ander to genrate callgph(.cg) file')
    parser.add_argument('-ccenc', action='store_true',
            help='run calling context encoding with given method.')

    # For static instrumentation
    parser.add_argument('-static-instr', action='store_true',
            help='Run static instrumentation.')


    # For exeriment
    parser.add_argument('-run-native-exp', action='store_true',
            help='run benchmarks without any instrumentations.')
    parser.add_argument('-run-static-exp', action='store_true',
            help='run static instrument experiments')
    
    args = parser.parse_args()

    main(args)
