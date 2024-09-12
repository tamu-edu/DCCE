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
dynamic_schemes = ['dcce']


benchmark_suites = {
    #'test' : [
    #    '100.test-pcce-fig-4',
    #    '101.test-pcce-fig-5a',
    #    '102.test-indirect-call',
    #    '103.test-libc-nostatic-nodebug',
    #    #'103.test-libc-static-nodebug',
    #    #'103.test-libc-static-debug',
    #    '104.test-backedge',
    #    '105.test-functionname',
    #    '106.test-machinecode',
    #    #'107.test-memset',
    #    '108.test-mleak',
    #    '109.test-matadd',
    #    #'110.test-tail-call',
    #    '111.test-barrier-elision',
    #],

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
        #'712.VOLREND',
        '713.WATER-NSQUARED',
        '714.WATER-SPATIAL',
    ],

    'SPEC2017' : [
        #'500.perlbench_r', # MAXID Overflow
        #'502.gcc_r', # OOM
        '505.mcf_r',
        '508.namd_r',
        '510.parest_r',
        #'511.povray_r',  # MAXID Overflow
        '519.lbm_r',
        '520.omnetpp_r',
        '523.xalancbmk_r',
        '525.x264_r',
        #'526.blender_r',
        #'531.deepsjeng_r',  # OOM
        #'538.imagick_r', # MAXID Overflow
        '541.leela_r',
        #'544.nab_r',  # never finished
        '557.xz_r',
        ##'600.perlbench_s', # MAXID Overflow
        ##'602.gcc_s',
        ##'605.mcf_s',
        ##'619.lbm_s',
        ##'620.omnetpp_s',
        ##'623.xalancbmk_s',
        ##'625.x264_s',
        ##'631.deepsjeng_s', # OOM
        ##'638.imagick_s', # MAXID Overflow
        ##'641.leela_s',
        ##'644.nab_s', # never finished
        ##'657.xz_s',
    ],

    #'extra': [
    #    #'801.backprop',
    #    '802.lud',
    #    #'803.pagerank',
    #    #'804.sgemm',
    #    #'805.spmv',
    #],
}

cmd_options = {
        '500.perlbench_r': '-I%s/500.perlbench_r/data/all/input/lib %s/500.perlbench_r/data/refrate/input/checkspam.pl 2500 5 25 11 150 1 1 1 1' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '502.gcc_r': '%s/502.gcc_r/data/refrate/input/gcc-pp.c -O3 -finline-limit=0 -fif-conversion -fif-conversion2 -o gcc-pp.opts-O3_-finline-limit_0_-fif-conversion_-fif-conversion2.s' % (os.getenv('CPU2017_RUN_DIR')),
        '505.mcf_r': '%s/505.mcf_r/data/refrate/input/inp.in' % (os.getenv('CPU2017_RUN_DIR')),
        '520.omnetpp_r': '-c General -r 0',
        '523.xalancbmk_r': '-v %s/523.xalancbmk_r/data/refrate/input/t5.xml %s/523.xalancbmk_r/data/refrate/input/xalanc.xsl' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '525.x264_r': '--seek 500 --dumpyuv 200 --frames 1250 -o %s/525.x264_r/BuckBunny_New.264 %s/525.x264_r/data/refrate/input/BuckBunny.yuv 1280x720' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '531.deepsjeng_r': '%s/531.deepsjeng_r/data/refrate/input/ref.txt' % (os.getenv('CPU2017_RUN_DIR')),
        '541.leela_r': '%s/541.leela_r/data/refrate/input/ref.sgf' % (os.getenv('CPU2017_RUN_DIR')),
        '548.exchange2_r': '6',
        '557.xz_r':  '%s/557.xz_r/data/all/input/cld.tar.xz 160 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 59796407 61004416 6' % (os.getenv('CPU2017_RUN_DIR')),
        '503.bwaves_r': 'bwaves_1 < %s/503.bwaves_r/data/refrate/input/bwaves_1.in' % (os.getenv('CPU2017_RUN_DIR')),
        '507.cactuBSSN_r'   : '%s/507.cactuBSSN_r/data/refrate/input/spec_ref.par'  % (os.getenv('CPU2017_RUN_DIR')),
        '508.namd_r': '--input %s/508.namd_r/data/all/input/apoa1.input --iterations 65' % (os.getenv('CPU2017_RUN_DIR')),
        '510.parest_r': '%s/510.parest_r/data/refrate/input/ref.prm' % (os.getenv('CPU2017_RUN_DIR')),
        '511.povray_r': '%s/511.povray_r/data/refrate/input/SPEC-benchmark-ref.ini' % (os.getenv('CPU2017_RUN_DIR')),
        '519.lbm_r': '3000 reference.dat 0 0 %s/519.lbm_r/data/refrate/input/100_100_130_ldc.of' % (os.getenv('CPU2017_RUN_DIR')),
        '521.wrf_r': '',
        '526.blender_r': '%s/526.blender_r/data/refrate/input/sh3_no_char.blend --render-output sh3_no_char_ --threads 1 -b -F RAWTGA -s 849 -e 849 -a' % (os.getenv('CPU2017_RUN_DIR')),
        '527.cam4_r': '',
        '538.imagick_r': '-limit disk 0 %s/538.imagick_r/data/refrate/input/refrate_input.tga -edge 41 -resample 181%% -emboss 31 - colorspace YUV -mean-shift 19x19+15%% -resize 30%% refrate_output.tga' % (os.getenv('CPU2017_RUN_DIR')),
        '544.nab_r': '%s/544.nab_r/data/refrate/input/1am0 1122214447 122' % (os.getenv('CPU2017_RUN_DIR')),
        '549.fotonik3d_r': '',
        '554.roms_r': '%s/554.roms_r/data/refrate/input/ocean_benchmark0.in.x' % (os.getenv('CPU2017_RUN_DIR')),

        '600.perlbench_s': '-I%s/600.perlbench_s/data/all/input/lib %s/600.perlbench_s/data/refrate/input/checkspam.pl 2500 5 25 11 150 1 1 1 1' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '602.gcc_s': '%s/602.gcc_s/data/refspeed/input/gcc-pp.c -O5 -fipa-pta -o %s/602.gcc_s/gcc-pp.opts-O5_-fipa-pta.s' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '605.mcf_s': '%s/605.mcf_s/data/refspeed/input/inp.in' % (os.getenv('CPU2017_RUN_DIR')),
        '607.cactuBSSN_s': '%s/607.cactuBSSN_s/spec_ref.par'  % (os.getenv('CPU2017_RUN_DIR')),
        '619.lbm_s': '2000 reference.dat 0 0 %s/619.lbm_s/data/refspeed/input/200_200_260_ldc.of' % (os.getenv('CPU2017_RUN_DIR')),
        '620.omnetpp_s': '-c General -r 0',
        '623.xalancbmk_s': '-v %s/623.xalancbmk_s/data/refrate/input/t5.xml %s/623.xalancbmk_s/data/refrate/input/xalanc.xsl' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '625.x264_s': '--seek 500 --dumpyuv 200 --frames 1250 -o %s/625.x264_s/BuckBunny_New.264 %s/625.x264_s/data/refrate/input/BuckBunny.yuv 1280x720' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '631.deepsjeng_s': '%s/631.deepsjeng_s/data/refspeed/input/ref.txt' % (os.getenv('CPU2017_RUN_DIR')),
        '638.imagick_s': '-limit disk 0 %s/638.imagick_s/data/refspeed/input/refspeed_input.tga -resize 817%% -rotate -2.76 -shave 540x375 -alpha remove -auto-level -contrast-stretch 1x1%% -colorspace Lab -channel R -equalize +channel -colorspace sRGB -define histogram:unique-colors=false -adaptive-blur 0x5 -despeckle -auto-gamma -adaptive-sharpen 55 -enhance -brightness-contrast 10x10 -resize 30%% %s/638.imagick_s/refspeed_output.tga' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '641.leela_s': '%s/641.leela_s/data/refrate/input/ref.sgf' % (os.getenv('CPU2017_RUN_DIR')),
        '644.nab_s': '%s/644.nab_s/data/refspeed/input/3j1n 20140317 220' % (os.getenv('CPU2017_RUN_DIR')),
        '657.xz_s': '%s/657.xz_s/data/all/input/cpu2006docs.tar.xz 6643 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1036078272 1111795472 4' % (os.getenv('CPU2017_RUN_DIR')),
        '100.test-pcce-fig-4' : '',
        '101.test-pcce-fig-5a' : '',
        '102.test-indirect-call' : '',
        '103.test-libc-nostatic-nodebug' : '',
        '103.test-libc-static-nodebug' : '',
        '103.test-libc-static-debug' : '',
        '104.test-backedge' : '',
        '105.test-functionname' : '',
        '106.test-machinecode' : '',
        #'107.test-memset' : '',
        '108.test-mleak': '57374182', #'1073741823', 
        '109.test-matadd': '',
        '110.test-tail-call': '',
        '111.test-barrier-elision': '',

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
        
        #'701.BARNES'         : f' < {os.getenv("SPLASH3_ROOT")}/apps/barnes/inputs/n8k-p8',
        #'702.CHOLESKY'       : f' -p8 < {os.getenv("SPLASH3_ROOT")}/kernels/cholesky/inputs/tk29.O',
        #'703.FFT'            : f' -p8 -m28',
        #'704.FMM'            : f' < {os.getenv("SPLASH3_ROOT")}/apps/fmm/inputs/input.8.16384',
        #'705.LU-CB'          : f' -p8 -n4096',
        #'706.LU-NCB'         : f' -p8 -n4096',
        #'707.OCEAN-CP'       : f' -p8 -n4098', 
        #'708.OCEAN-NCP'      : f' -p8 -n4098',
        #'709.RADIOSITY'      : f' -p 8 -tq 200 -ae 5000 -bf 0.1 -en 0.05 -room -batch',
        #'710.RADIX'          : f' -p8 -n92048576',  #n1048576
        #'711.RAYTRACE'       : f' -p8 -m64 {os.getenv("SPLASH3_ROOT")}/apps/raytrace/inputs/balls4.env',
        #'712.VOLREND'        : f' 16 {os.getenv("SPLASH3_ROOT")}/apps/volrend/inputs/head 8',
        #'713.WATER-NSQUARED' : f' < {os.getenv("SPLASH3_ROOT")}/apps/water-nsquared/inputs/n512-p8',
        #'714.WATER-SPATIAL'  : f' < {os.getenv("SPLASH3_ROOT")}/apps/water-spatial/inputs/n512-p8',

        #'801.backprop': '2097152 8',        # 8 is num_thread
        '802.lud':     '-s4096 -n8 -f 0.75 -t 1000', # -n8 is num_thread
        '803.pagerank': '1 8 ./sample.txt', # 8 is num_thread
        #'804.sgemm':   '-i 4096,4096,4096 -n 8 -s 1 -t', # 8 is num_thread
        '805.spmv': '4096 8 0.3', # 8 is num_thread
    }

def foreach_bench(only_this_suite=None):
    for suite_name, benches in benchmark_suites.items():
        if only_this_suite != None and only_this_suite != suite_name:
            continue
        for bench in benches:
            yield suite_name, bench

# FIXME: make parall run available
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


    cmd = f'cd {os.getenv("LLVM_ROOT")} && build compile.sh; cd {os.getenv("DCCE_ROOT")}'
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

    clients = ['ccid_overhead_only_update', 'ccid_overhead', 'profile_ecc', 'barrier_elider', 'profile_func_acc']
    for scheme in static_schemes + static_schemes_instr_only:
        for client in clients:
            for suite_name, _ in benchmark_suites.items():
                makedirs(f'{output_static_bin}/{scheme}/{client}/{suite_name}')

    # Insert CCID update 
    cmd_log = []
    for scheme in static_schemes + static_schemes_instr_only:
        for client in clients:
            for suite_name, bench in foreach_bench():
                bench_code = int(bench[:3])
                if scheme in static_schemes:
                    cmd = f'/usr/bin/time -v wpa -ander -ccinput {output_ccenc}/{scheme}/{suite_name}/{bench}.cc -instr-method {scheme}_{client} -bench-code {bench_code} -dump-modules {output_static_bin}/{scheme}/{client}/{suite_name} {output_bitcode}/{suite_name}/{bench}.bc'
                else:
                    cmd = f'/usr/bin/time -v wpa -ander -instr-method {scheme}_{client} -bench-code {bench_code} -dump-modules {output_static_bin}/{scheme}/{client}/{suite_name} {output_bitcode}/{suite_name}/{bench}.bc'
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

def dyn_instr(args):
    start_time = time.time()
    output_ccenc = os.getenv("OUTPUT_CCENC")
    output_bitcode = os.getenv("OUTPUT_BITCODE")
    output_dyn_bin = os.getenv("OUTPUT_DYN_BIN")

    for scheme in dynamic_schemes:
        for suite_name, _ in benchmark_suites.items():
            makedirs(f'{output_dyn_bin}/{scheme}/{suite_name}')

    # Add ccweight attributes to CallInst in bitcode 
    cmd_log = []

    for scheme in dynamic_schemes:
        for suite_name, bench in foreach_bench():
            bench_code = int(bench[:3])
            cmd = f'wpa -ander -ccinput {output_ccenc}/{scheme}/{suite_name}/{bench}.cg -ccweight -bench-code {bench_code} -dump-modules {output_dyn_bin}/{scheme}/{suite_name} {output_bitcode}/{suite_name}/{bench}.bc'
            log = f'{output_dyn_bin}/{scheme}/{suite_name}/{bench}.addccweight.log'
            cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    # Build CCWeight attributed bitcode
    cmd_log = []
    for scheme in dynamic_schemes:
        for suite_name, bench in foreach_bench():
            cmd = f'clang++ {output_dyn_bin}/{scheme}/{suite_name}/{bench}.bc \
                    -m64 \
                    -z muldefs \
                    -mavx \
                    -DSPEC_LINUX_X64 \
                    -DSPEC_OPENMP \
                    -Wno-return-type \
                    -DUSE_OPENMP \
                    -lm \
                    -L/usr/lib/llvm-10/lib \
                    -I/usr/lib/llvm-10/include/openmp \
                    -fopenmp=libomp \
                    -o {output_dyn_bin}/{scheme}/{suite_name}/{bench}'
            cmd = ' '.join(cmd.split())
            log = f'{output_dyn_bin}/{scheme}/{suite_name}/{bench}.offset'
            cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    # Disassemble the executable
    cmd_log = []
    for scheme in dynamic_schemes:
        for suite_name, bench in foreach_bench():
            # disassemble the executable
            cmd = f'llvm-objdump -DS {output_dyn_bin}/{scheme}/{suite_name}/{bench}'
            log = f'{output_dyn_bin}/{scheme}/{suite_name}/{bench}.asm'
            cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    # generate the final ccw file
    cmd_log = []
    for scheme in dynamic_schemes:
        for suite_name, bench in foreach_bench():
            bench_code = int(bench[:3])
            cmd = f"python3 ccencoder/gen_ccw.py -ccw {output_dyn_bin}/{scheme}/{suite_name}/{bench}.offset -bin {output_dyn_bin}/{scheme}/{suite_name}/{bench}.asm -output {output_dyn_bin}/{scheme}/{suite_name}/{bench}.ccw"
            log =  f'{output_dyn_bin}/{scheme}/{suite_name}/{bench}.gen_ccw.log'
            cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    end_time = time.time()
    execution_time = end_time - start_time
    print('CCW file is created. execution time: {execution_time}')

def run_native_exp(args):
    output_bin = os.getenv("OUTPUT_BIN")
    output_native_exp = os.getenv("OUTPUT_NATIVE_EXP")

    for i in range(5):
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

    #clients = ['ccid_overhead_only_update', 'profile_ecc', 'barrier_elider', 'profile_func_acc']
    clients = ['profile_func_acc']
    for i in range(5):
        for scheme in static_schemes + static_schemes_instr_only:
            for client in clients:
                for suite_name, bench in foreach_bench():
                    makedirs(f'{output_static_exp}/{scheme}/{client}/{suite_name}')
                for suite_name, bench in foreach_bench():
                    cmd = f'/usr/bin/time -v {output_static_bin}/{scheme}/{client}/{suite_name}/{bench} {cmd_options[bench]} > {output_static_exp}/{scheme}/{client}/{suite_name}/{bench}_{i}.out 2>&1'
                    print(cmd)
                    os.system('sleep 10')
                    os.system(cmd)

#def run_static_barrier_elision(args):
#    output_static_bin = os.getenv("OUTPUT_STATIC_BIN")
#    output_static_exp = os.getenv("OUTPUT_STATIC_EXP")
#
#    clients = ['profile_ecc', 'barrier_elider']
#    for scheme in static_schemes:
#        for client in clients:
#            for suite_name, bench in foreach_bench():
#                makedirs(f'{output_static_exp}/{scheme}/{client}/{suite_name}')
#            for suite_name, bench in foreach_bench():
#                cmd = f'/usr/bin/time -v {output_static_bin}/{scheme}/{client}/{suite_name}/{bench} {cmd_options[bench]} > {output_static_exp}/{scheme}/{client}/{suite_name}/{bench}.out 2>&1'
#                print(cmd)
#                os.system(cmd)

def run_dyn_exp(args):
    output_ccenc = os.getenv("OUTPUT_CCENC")
    output_dyn_bin = os.getenv("OUTPUT_DYN_BIN")
    output_dyn_exp = os.getenv("OUTPUT_DYN_EXP")

    for scheme in dynamic_schemes:
        #for client in ['drclient_empty', 'dcce_ccid_overhead_only_update', 'dcce_ccid_overhead', 'drcctlib_ccid_overhead_only_update', 'drcctlib_ccid_overhead']:
                #'drcctlib_barrier_elision',
                #'dcce_barrier_elision',
        for i in range(1):
            #for client in ['drclient_empty', 'drcctlib_ccid_overhead', 'dcce_ccid_overhead', 'drcctlib_whistle', 'dcce_whistle']:
            #for client in ['drcctlib_whistle']:
            for client in ['drcctlib_barrier_elision']:
                for suite_name, bench in foreach_bench():
                    makedirs(f'{output_dyn_exp}/{scheme}/{client}/{suite_name}')
                    #makedirs(f'{output_dyn_exp}/{scheme}/{client}-stat/{suite_name}')
                for suite_name, bench in foreach_bench():
                    cmd = f'/usr/bin/time -v $drrun -t {client} -ccw {output_dyn_bin}/{scheme}/{suite_name}/{bench}.ccw -bench {bench} -- {output_dyn_bin}/{scheme}/{suite_name}/{bench} {cmd_options[bench]} > {output_dyn_exp}/{scheme}/{client}/{suite_name}/{bench}_{i}.out 2>&1'
                    #cmd = f'/usr/bin/time -v $drrun -t {client} -ccw {output_dyn_bin}/{scheme}/{suite_name}/{bench}.ccw -bench {bench} -- {output_dyn_bin}/{scheme}/{suite_name}/{bench} {cmd_options[bench]} > {output_dyn_exp}/{scheme}/{client}-stat/{suite_name}/{bench}.out 2>&1'
                    print(cmd)
                    os.system(cmd)
                    os.system('sleep 10')

#def run_dyn_barrier_elision(args):
#    output_ccenc = os.getenv("OUTPUT_CCENC")
#    output_dyn_bin = os.getenv("OUTPUT_DYN_BIN")
#    output_dyn_exp = os.getenv("OUTPUT_DYN_EXP")
#
#    for scheme in dynamic_schemes:
#        #for client in ['drclient_empty']: #, 'dcce_barrier_elision', 'drcctlib_barrier_elision']:
#        for client in ['dcce_barrier_elision', 'drcctlib_barrier_elision']:
#            for suite_name, bench in foreach_bench():
#                makedirs(f'{output_dyn_exp}/{scheme}/{client}/{suite_name}')
#                #makedirs(f'{output_dyn_exp}/{scheme}/{client}-stat/{suite_name}')
#            for suite_name, bench in foreach_bench():
#                cmd = f'/usr/bin/time -v $drrun -t {client} -ccw {output_dyn_bin}/{scheme}/{suite_name}/{bench}.ccw -bench {bench} -- {output_dyn_bin}/{scheme}/{suite_name}/{bench} {cmd_options[bench]} > {output_dyn_exp}/{scheme}/{client}/{suite_name}/{bench}.out 2>&1'
#                #cmd = f'/usr/bin/time -v $drrun -t {client} -ccw {output_dyn_bin}/{scheme}/{suite_name}/{bench}.ccw -bench {bench} -- {output_dyn_bin}/{scheme}/{suite_name}/{bench} {cmd_options[bench]} > {output_dyn_exp}/{scheme}/{client}-stat/{suite_name}/{bench}.out 2>&1'
#                print(cmd)
#                os.system(cmd)
#                #os.system('sleep 10')

#def run_gprof(stats_dir, bin_dir, num_tests):
#    cmd_log = []
#    for run in range(num_tests):
#        base_stats_dir = '%s/%s' % (stats_dir, run)
#        for bench in benches:
#            cmd = 'gprof %s/%s %s/%s.gmon' % \
#                    (bin_dir, bench,
#                    base_stats_dir, bench)
#            log = '%s/%s.gprof' % (base_stats_dir, bench)
#            cmd_log.append((cmd, log))
#    run_cmd_foreach_bench(cmd_log)
#
#    print('Running gprof is done')

def main(args):
    if (not args.build_debug \
            and not args.build_runtime \
            and not args.clean \
            and not args.extract_bitcode \
            and not args.callgraph \
            and not args.ccenc \
            and not args.static_instr \
            and not args.dyn_instr \
            and not args.run_native_exp \
            and not args.run_static_exp \
            and not args.run_dyn_exp):
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
    if (args.dyn_instr):
        dyn_instr(args)
    if (args.run_native_exp):
        run_native_exp(args)
    if (args.run_static_exp):
        run_static_exp(args)
    if (args.run_dyn_exp):
        run_dyn_exp(args)
    

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
    # For dynamic instrumentation
    parser.add_argument('-dyn-instr', action='store_true',
            help='Run dynamic instrumentation.')


    # For exeriment
    parser.add_argument('-run-native-exp', action='store_true',
            help='run benchmarks without any instrumentations.')
    parser.add_argument('-run-static-exp', action='store_true',
            help='run static instrument experiments')
    parser.add_argument('-run-dyn-exp', action='store_true',
            help='run dynamic instrument experiments')
    
    #parser.add_argument('-run-dyn-barrier-elision', action='store_true',
    #        help='run barrier elision with dynamic instrument')
    #parser.add_argument('-run-static-barrier-elision', action='store_true',
    #        help='run barrier elision with static instrument')

    args = parser.parse_args()

    main(args)
