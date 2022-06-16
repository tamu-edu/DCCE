import sys
import os
import os.path
import argparse
import shlex
import threading
from subprocess import Popen, PIPE

benches = [
    '600.perlbench_s',
    '605.mcf_s',
    '619.lbm_s',
    '620.omnetpp_s',
    '623.xalancbmk_s',
    '625.x264_s',
    '631.deepsjeng_s',
    '638.imagick_s',
    '641.leela_s',
    '644.nab_s',
    '657.xz_s',
    '100.test-pcce-fig-4',
    '101.test-pcce-fig-5a',
    '102.test-indirect-call',
    #'500.perlbench_r',
    ##'502.gcc_r',        # Link error
    #'505.mcf_r',
    #'520.omnetpp_r',
    #'523.xalancbmk_r',
    #'525.x264_r',
    #'531.deepsjeng_r',
    #'541.leela_r',
    ##'548.exchange2_r'  # Fortran
    #'557.xz_r',
    ##'503.bwaves_r',     # Fortran
    ##'507.cactuBSSN_r',  # Link error
    '508.namd_r',
    ##'510.parest_r',     # Compile error
    '511.povray_r',
    #'519.lbm_r',
    ##'521.wrf_r',        # Fortran
    ##'526.blender_r',
    ##'527.cam4_r',       # Fortran
    #'538.imagick_r',
    #'544.nab_r',
    ##'549.fotonik3d_r',  # Fortran
    ##'554.roms_r',       # Fortran
    ]

cmd_options = {
        '500.perlbench_r': '-I%s/500.perlbench_r/data//all/input/lib %s/500.perlbench_r/data/refrate/input/checkspam.pl 2500 5 25 11 150 1 1 1 1' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        #'502.gcc_r': '%s/data/ref/input/gcc-pp.c -O3 -finline-limit=0 -fif-conversion -fif-conversion2 -o gcc-pp.opts-O3_-finline-limit_0_-fif-conversion_-fif-conversion2.s' % (os.getenv('CPU2017_RUN_DIR')),
        '505.mcf_r': '%s/505.mcf_r/data/refrate/input/inp.in' % (os.getenv('CPU2017_RUN_DIR')),
        '520.omnetpp_r': '%s/520.omnetpp_r/data/refrate/input/omnetpp.ini -c General -r 0' % (os.getenv('CPU2017_RUN_DIR')),
        '523.xalancbmk_r': '-v %s/523.xalancbmk_r/data/refrate/input/t5.xml %s/523.xalancbmk_r/data/refrate/input/xalanc.xsl' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '525.x264_r': '--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New_refspeed3.264 %s/525.x264_r/data/refrate/input/BuckBunny.yuv 1280x720' % (os.getenv('CPU2017_RUN_DIR')),
        '531.deepsjeng_r': '%s/531.deepsjeng_r/data/refrate/input/ref.txt' % (os.getenv('CPU2017_RUN_DIR')),
        '541.leela_r': '%s/541.leela_r/data/refrate/input/ref.sgf' % (os.getenv('CPU2017_RUN_DIR')),
        #'548.exchange2_r': '6',
        '557.xz_r':  '%s/557.xz_r/data/all/input/cld.tar.xz 160 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 59796407 61004416 6' % (os.getenv('CPU2017_RUN_DIR')),
        #'503.bwaves_r': 'bwaves_1 < %s/503.bwaves_r/data/refrate/input/bwaves_1.in', (os.getenv('CPU2017_RUN_DIR')),
        #'507.cactuBSSN_r'   : '%s/507.cactuBSSN_r/data/refrate/input/spec_ref.par'  % (os.getenv('CPU2017_RUN_DIR')),
        '508.namd_r': '--input %s/508.namd_r/data/all/input/apoa1.input --iterations 65' % (os.getenv('CPU2017_RUN_DIR')),
        #'510.parest_r': '%s/510.parest_r/data/refrate/input/ref.prm', (os.getenv('CPU2017_RUN_DIR')),
        '511.povray_r': '%s/511.provray_r/data/refrate/input/SPEC-benchmark-ref.ini' % (os.getenv('CPU2017_RUN_DIR')),
        '519.lbm_r': '3000 reference.dat 0 0 %s/519.lbm_r/data/refrate/input/100_100_130_ldc.of' % (os.getenv('CPU2017_RUN_DIR')),
        #'521.wrf_r': '',
        #'526.blender_r': '%s/526.blender_r/data/refrate/input/sh3_no_char.blend --render-output sh3_no_char_ --threads 1 -b -F RAWTGA -s 849 -e 849 -a' % (os.getenv('CPU2017_RUN_DIR')),
        #'527.cam4_r': '',
        '538.imagick_r': '-limit disk 0 %s/538.imagick_r/data/refrate/input/refrate_input.tga -edge 41 -resample 181%% -emboss 31 - colorspace YUV -mean-shift 19x19+15%% -resize 30%% refrate_output.tga' % (os.getenv('CPU2017_RUN_DIR')),
        '544.nab_r': '/data/share/whistle/cpu2017_run/544.nab_r/3j1n 20140317 220',
        #'549.fotonik3d_r': '',
        #'554.roms_r': '%s/554.roms_r/data/refrate/input/ocean_benchmark0.in.x' % (os.getenv('CPU2017_RUN_DIR')),

        '600.perlbench_s':
        '-I%s/600.perlbench_s/lib %s/600.perlbench_s/checkspam.pl 2500 5 25 11 150 1 1 1 1' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '602.gcc_s':
        '%s/602.gcc_s/gcc-pp.c -O5 -fipa-pta -o %s/602.gcc_s/gcc-pp.opts-O5_-fipa-pta.s' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '605.mcf_s':
        '%s/605.mcf_s/inp.in' % (os.getenv('CPU2017_RUN_DIR')),
        '607.cactuBSSN_s':
        '%s/607.cactuBSSN_s/spec_ref.par'  % (os.getenv('CPU2017_RUN_DIR')),
        '619.lbm_s':
        '2000 %s/619.lbm_s/reference.dat 0 0 %s/619.lbm_s/200_200_260_ldc.of' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '620.omnetpp_s':
        '-c General -r 0',
        '623.xalancbmk_s':
        '-v %s/623.xalancbmk_s/t5.xml %s/623.xalancbmk_s/xalanc.xsl' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '625.x264_s':
        '--seek 500 --dumpyuv 200 --frames 1250 -o %s/625.x264_s/BuckBunny_New.264 %s/625.x264_s/BuckBunny.yuv 1280x720' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '631.deepsjeng_s':
        '%s/631.deepsjeng_s/ref.txt' % (os.getenv('CPU2017_RUN_DIR')),
        '638.imagick_s':
        '-limit disk 0 %s/638.imagick_s/refspeed_input.tga -resize 817%% -rotate -2.76 -shave 540x375 -alpha remove -auto-level -contrast-stretch 1x1%% -colorspace Lab -channel R -equalize +channel -colorspace sRGB -define histogram:unique-colors=false -adaptive-blur 0x5 -despeckle -auto-gamma -adaptive-sharpen 55 -enhance -brightness-contrast 10x10 -resize 30%% %s/638.imagick_s/refspeed_output.tga' % (os.getenv('CPU2017_RUN_DIR'), os.getenv('CPU2017_RUN_DIR')),
        '641.leela_s':
        '%s/641.leela_s/ref.sgf' % (os.getenv('CPU2017_RUN_DIR')),
        '644.nab_s':
        '%s/644.nab_s/3j1n 20140317 220' % (os.getenv('CPU2017_RUN_DIR')),
        '657.xz_s': '%s/657.xz_s/cpu2006docs.tar.xz 6643 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1036078272 1111795472 4' % (os.getenv('CPU2017_RUN_DIR')),
        '998.specrand_is': '%s/998.specrans_is/1255432124 234923' % (os.getenv('CPU2017_RUN_DIR')),
        '100.test-pcce-fig-4': '',
        '101.test-pcce-fig-5a': '',
        '102.test-indirect-call': '',
    }

def run_cmd(cmd, log=None):
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
        #exit(1)

def run_build():
    makedirs(os.getenv('DCCE_RTLIB_BUILD_DIR'))
    makedirs(os.getenv('PCCE_RTLIB_BUILD_DIR'))
    run_cmd('%s/build.sh' % (os.getenv('DCCE_ROOT')))

def run_clean():
    run_cmd('rm -rf %s' % os.getenv('DCCE_RTLIB_BUILD_DIR'))
    run_cmd('bash %s/clean.sh' % (os.getenv('SVF_ROOT')))
    run_cmd('rm -rf %s/test.bc' % (os.getenv('ORG_BC_ROOT')))

def run_callgraph():
    makedirs(os.getenv('ORG_CG_DIR'))
    threads = []
    for bench in benches:
        cmd = f'wpa -ander -dump-callgraph {os.getenv("ORG_CG_DIR")}/{bench} {os.getenv("ORG_BC_ROOT")}/{bench}.bc'
        log = '%s/%s.log' % (os.getenv('ORG_CG_DIR'), bench)

        th = threading.Thread(target=run_cmd, args=(cmd, log))
        threads.append(th)
        th.start()

    for th in threads:
        th.join()

    threads = []
    for bench in benches:
        cmd = f'python ccencoder/callgraph-stats.py {os.getenv("ORG_CG_DIR")}/{bench}-final.cg {bench} main {os.getenv("ORG_CG_DIR")}'
        log = '%s/%s.log' % (os.getenv('ORG_CG_DIR'), bench)

        th = threading.Thread(target=run_cmd, args=(cmd, log))
        threads.append(th)
        th.start()

    for th in threads:
        th.join()
    print('Callgraphs are generated in {}'.format(os.getenv('ORG_CG_DIR')))

def run_ccenc(ccenc_dir, args):
    makedirs(ccenc_dir)
    threads = []
    for bench in benches:
        cmd = f'python ccencoder/gen_calling_context.py ' \
            f'{os.getenv("ORG_CG_DIR")}/{bench}-final.cg {bench} main {args.ccenc} {ccenc_dir}'
        log = f'{ccenc_dir}/{bench}.log'
        th = threading.Thread(target=run_cmd, args=(cmd, log))
        threads.append(th)
        th.start()

    for th in threads:
        th.join()
    print('Calling context encoding is done and outputs are stored in {}'.format(ccenc_dir))

def run_instrument(bc_dir, ccenc_dir, instr_method):
    makedirs(bc_dir)
    threads = []
    for bench in benches:
        bench_code = int(bench[:3])
        cmd = 'wpa -ander -ccinput %s/%s.cc -instr-method %s -bench-code %d -dump-modules %s %s/%s.bc' \
                % (ccenc_dir, bench, instr_method, bench_code,
                   bc_dir,
                   os.getenv('ORG_BC_ROOT'), bench)
        log = '%s/%s.log' % (bc_dir, bench)
        th = threading.Thread(target=run_cmd, args=(cmd, log))
        threads.append(th)
        th.start()

    for th in threads:
        th.join()
    print('Instrumentation is done')

def run_make_exe(bin_dir, bc_dir, rtlib_dir):
    makedirs(bin_dir)
    threads = []
    for bench in benches:
        #cmd = 'bash %s/common.clang++.make.out %s %s %s %s' % \
        #        (os.getenv('CPU2017_MAKE_DIR'),
        #        bc_dir,
        #        bin_dir,
        #        rtlib_dir,
        #        bench)
        #log = '%s/%s.log' % (bin_dir, bench)
        if bench in ['100.test-pcce-fig-4', '101.test-pcce-fig-5a', '102.test-indirect-call',]:
            cmd = 'bash %s/test.make.out %s %s %s %s' % \
                    (os.getenv('CPU2017_MAKE_DIR'),
                    bc_dir,
                    bin_dir,
                    rtlib_dir,
                    bench)
            log = '%s/%s.log' % (bin_dir, bench)
        else:
            cmd = 'bash %s/common.clang++.make.out %s %s %s %s' % \
                    (os.getenv('CPU2017_MAKE_DIR'),
                    bc_dir,
                    bin_dir,
                    rtlib_dir,
                    bench)
            log = '%s/%s.log' % (bin_dir, bench)
        th = threading.Thread(target=run_cmd, args=(cmd, log))
        threads.append(th)
        th.start()

    for th in threads:
        th.join()
    print('Making executables is done')

def run_bench(stats_dir, bin_dir, num_tests):
    for run in range(num_tests):
        base_stats_dir = '%s/%s' % (stats_dir, run)
        makedirs(base_stats_dir)
        for bench in benches:
            cmd = '(time %s/%s %s) > %s/%s.log 2>&1' % \
                    (bin_dir, bench, cmd_options[bench],
                     base_stats_dir, bench)
            print(cmd)
            cmd = 'mv gmon.out %s/%s.gmon' % \
                    (base_stats_dir, bench)
            print(cmd)
            #os.system(cmd)

def run_gprof(stats_dir, bin_dir, num_tests):
    threads = []
    for run in range(num_tests):
        base_stats_dir = '%s/%s' % (stats_dir, run)
        for bench in benches:
            cmd = 'gprof %s/%s %s/%s.gmon' % \
                    (bin_dir, bench,
                    base_stats_dir, bench)
            log = '%s/%s.gprof' % (base_stats_dir, bench)
            th = threading.Thread(target=run_cmd, args=(cmd, log))
            threads.append(th)
            th.start()

    for th in threads:
        th.join()
    print('Running gprof is done')

def main(args):

    if (args.build == False and \
            args.clean == False and \
            args.callgraph == False \
            and args.ccenc == None and \
            args.instrument == None and \
            args.make_exe == None and \
            args.run_bench == None and \
            args.run_gprof == None):
        print("Nothing to do ...\nrun 'run_dcce -h' to see how to use.")
        exit(1)

    if (args.build):
        run_build()
    if (args.clean):
        run_clean()
    if (args.callgraph):
        run_callgraph()
    if (args.ccenc != None):
        if args.ccenc == 'dcce':
            run_ccenc(os.getenv('DCCE_CCENC_DIR'), args)
        elif args.ccenc == 'pcce':
            run_ccenc(os.getenv('PCCE_CCENC_DIR'), args)
    if (args.instrument != None):
        if args.instrument == 'base2':
            run_instrument(os.getenv('BASE2_BC_DIR'), os.getenv('DCCE_CCENC_DIR'), 'dcce')
        elif args.instrument == 'dcce':
            run_instrument(os.getenv('DCCE_BC_DIR'), os.getenv('DCCE_CCENC_DIR'), 'dcce')
        elif args.instrument == 'pcce':
            run_instrument(os.getenv('PCCE_BC_DIR'), os.getenv('PCCE_CCENC_DIR'), 'pcce')
    if (args.make_exe != None):
        if args.make_exe == 'base2':
            run_make_exe(os.getenv('BASE2_BIN_DIR'), os.getenv('BASE2_BC_DIR'), os.getenv('BASE2_RTLIB_DIR'))
        elif args.make_exe == 'dcce':
            run_make_exe(os.getenv('DCCE_BIN_DIR'), os.getenv('DCCE_BC_DIR'), os.getenv('DCCE_RTLIB_DIR'))
        elif args.make_exe == 'pcce':
            run_make_exe(os.getenv('PCCE_BIN_DIR'), os.getenv('PCCE_BC_DIR'), os.getenv('PCCE_RTLIB_DIR'))
    if (args.run_bench != None):
        if args.run_bench == 'base2':
            run_bench(os.getenv('BASE2_STATS_DIR'), os.getenv('BASE2_BIN_DIR'), 1)
        elif args.run_bench == 'dcce':
            run_bench(os.getenv('DCCE_STATS_DIR'), os.getenv('DCCE_BIN_DIR'), 1)
        elif args.run_bench == 'pcce':
            run_bench(os.getenv('PCCE_STATS_DIR'), os.getenv('PCCE_BIN_DIR'), 1)
    if (args.run_gprof != None):
        if args.run_gprof == 'base2':
            run_gprof(os.getenv('BASE2_STATS_DIR'), os.getenv('BASE2_BIN_DIR'), 1)
        elif args.run_gprof == 'dcce':
            run_gprof(os.getenv('DCCE_STATS_DIR'), os.getenv('DCCE_BIN_DIR'), 1)
        elif args.run_gprof == 'pcce':
            run_gprof(os.getenv('PCCE_STATS_DIR'), os.getenv('PCCE_BIN_DIR'), 1)


def makedirs(dir):
    if not os.path.exists(dir):
        os.makedirs(dir)

if __name__== "__main__":
    if os.getenv('DCCE_ENV_SETUP') != 'YES':
        print("Environment Variabls are not set. run 'source %s' first." % 'setup_env.sh')
        exit(1)

    parser = argparse.ArgumentParser(\
            description='Main program to run DCCE project.')
    parser.add_argument('-build', action='store_true',
            help='build SVF and runtime.')
    parser.add_argument('-clean', action='store_true',
            help='clean all the output files.')
    parser.add_argument('-callgraph', action='store_true',
            help='run wpa to genrate callgph(.cg) file')
    parser.add_argument('-ccenc', choices=['dcce', 'pcce'],
            help='run calling context encoding with given method.')
    parser.add_argument('-instrument', choices=['base2', 'dcce', 'pcce', 'valence'],
            help='run wpa to instrument benchmarks.')
    parser.add_argument('-make-exe', choices=['base2', 'dcce', 'pcce', 'valence'],
            help='make executable.')
    parser.add_argument('-run-bench', choices=['base', 'base2', 'dcce', 'pcce', 'valence'],
            help='run instrumented benchmarks.')
    parser.add_argument('-run-gprof', choices=['base', 'base2', 'dcce', 'pcce', 'valence'],
            help='run gprof.')
    args = parser.parse_args()

    main(args)
