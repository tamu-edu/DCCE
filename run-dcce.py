import sys
import os
import os.path
import argparse
import shlex
import threading
from subprocess import Popen, PIPE

benches = [
    '100.test-pcce-fig-4',
    '101.test-pcce-fig-5a',
    '102.test-indirect-call',
    '103.test-libc-nostatic-nodebug',
    '103.test-libc-static-nodebug',
    '103.test-libc-static-debug',
    '104.test-backedge',
    '105.test-functionname',
    '106.test-machinecode',
    #'107.test-memset',
    '108.test-mleak',
    '109.test-matadd',
    '110.test-tail-call',
    #'500.perlbench_r', # MAXID Overflow
    #'502.gcc_r',
    '505.mcf_r',
    '508.namd_r',
    '510.parest_r',
    #'511.povray_r', # Function.h:781: llvm::Argument* llvm::Function::getArg(unsigned int) const: Assertion `i < NumArgs && "getArg() out of range!"' failed.
    '519.lbm_r',
    #'520.omnetpp_r', # Function.h:781: llvm::Argument* llvm::Function::getArg(unsigned int) const: Assertion `i < NumArgs && "getArg() out of range!"' failed.
    '523.xalancbmk_r',
    '525.x264_r',
    #'526.blender_r',
    '531.deepsjeng_r',
    #'538.imagick_r', # MAXID Overflow
    '541.leela_r',
    #'544.nab_r',  # never finished
    '557.xz_r',
    #'600.perlbench_s', # MAXID Overflow
    #'602.gcc_s',
    '605.mcf_s',
    '619.lbm_s',
    #'620.omnetpp_s', # Function.h:781: llvm::Argument* llvm::Function::getArg(unsigned int) const: Assertion `i < NumArgs && "getArg() out of range!"' failed.
    '623.xalancbmk_s',
    '625.x264_s',
    '631.deepsjeng_s',
    #'638.imagick_s', # MAXID Overflow
    '641.leela_s',
    #'644.nab_s', # never finished
    '657.xz_s',
]

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
        '108.test-mleak': '1073741823',
        '109.test-matadd': '',
        '110.test-tail-call': '',
    }

def run_cmd_foreach_bench(cmd_log, parallel=True):
    if parallel:
        threads = []
        for cmd, log in cmd_log:
            th = threading.Thread(target=run_cmd, args=(cmd, log))
            threads.append(th)
            th.start()

        for th in threads:
            th.join()
    else:
        for cmd, log in cmd_log:
            command = f'{cmd} > {log} 2>&1'
            print(command)
            os.system(command)

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
    cmd = f'cd {os.getenv("LLVM_ROOT")} && build compile.sh; cd -'
    run_cmd(cmd)

    cmd = f'cd {os.getenv("SVF_ROOT")} && bash build.sh; cd -'
    run_cmd(cmd)

    cmd = f'cd {os.getenv("DCCE_RTLIB_BUILD_DIR")} && cmake .. && make -j4; cd -'
    run_cmd(cmd)

    cmd = f'cd {os.getenv("PCCE_RTLIB_BUILD_DIR")} && cmake .. && make -j4; cd -'
    run_cmd(cmd)

def run_extract_bitcode():
    cmd_log = []
    for bench in benches:
        # extract bitcode from the executable
        cmd = f'objcopy {os.getenv("BIN_ROOT")}/{bench} --dump-section .llvmbc={os.getenv("BC_ROOT")}/{bench}.bc'
        log = f'{os.getenv("BC_ROOT")}/{bench}.bc.log'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)

    cmd_log = []
    for bench in benches:
        # disassmble the bitcode
        cmd = f'llvm-dis {os.getenv("BC_ROOT")}/{bench}.bc -o {os.getenv("BC_ROOT")}/{bench}.ll'
        log = f'{os.getenv("BC_ROOT")}/{bench}.ll.log'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)

    cmd_log = []
    for bench in benches:
        # disassemble the executable
        cmd = f'llvm-objdump -DS {os.getenv("BIN_ROOT")}/{bench}'
        log = f'{os.getenv("BIN_ROOT")}/{bench}.asm'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)


def run_clean():
    run_cmd('rm -rf %s' % os.getenv('DCCE_RTLIB_BUILD_DIR'))
    run_cmd('bash %s/clean.sh' % (os.getenv('SVF_ROOT')))
    run_cmd('rm -rf %s/test.bc' % (os.getenv('BC_ROOT')))

def run_callgraph():
    makedirs(os.getenv('CG_DIR'))
    cmd_log = []
    for bench in benches:
        cmd = f'wpa -ander -dump-callgraph {os.getenv("CG_DIR")}/{bench} {os.getenv("BC_ROOT")}/{bench}.bc'
        log = '%s/%s.callgraph.log' % (os.getenv('CG_DIR'), bench)
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    cmd_log = []
    for bench in benches:
        cmd = f'python ccencoder/callgraph-stats.py {os.getenv("CG_DIR")}/{bench}-final.cg {bench} main {os.getenv("CG_DIR")}'
        log = '%s/%s.stats.log' % (os.getenv('CG_DIR'), bench)
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    print('Callgraphs are generated in {}'.format(os.getenv('CG_DIR')))

def run_ccenc(ccenc_dir, args):
    makedirs(ccenc_dir)
    cmd_log = []
    for bench in benches:
        cmd = f'python ccencoder/gen_calling_context.py ' \
            f'{os.getenv("CG_DIR")}/{bench}-final.cg {bench} main {args.ccenc} {ccenc_dir}'
        log = f'{ccenc_dir}/{bench}.ccenc.log'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)
    print('Calling context encoding is done and outputs are stored in {}'.format(ccenc_dir))

def run_instrument(bc_dir, ccenc_dir, instr_method):
    makedirs(bc_dir)
    cmd_log = []
    for bench in benches:
        bench_code = int(bench[:3])
        cmd = 'wpa -ander -ccinput %s/%s.cc -instr-method %s -bench-code %d -dump-modules %s %s/%s.bc' \
                % (ccenc_dir, bench, instr_method, bench_code,
                   bc_dir,
                   os.getenv('BC_ROOT'), bench)
        log = '%s/%s.instr.log' % (bc_dir, bench)
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)

    cmd_log = []
    for bench in benches:
      cmd = f'llvm-dis {bc_dir}/{bench}.bc'
      cmd_log.append((cmd, None))
    run_cmd_foreach_bench(cmd_log)

    print('Instrumentation is done')

def run_ccweight(cw_dir, ccenc_dir, bin_dir):
    makedirs(cw_dir)

    # Add ccweight attributes to CallInst in bitcode 
    cmd_log = []
    for bench in benches:
        bench_code = int(bench[:3])
        #cmd = f'ccw -ccinput {ccenc_dir}/{bench}.cg -dump-modules {cw_dir} {os.getenv("BC_ROOT")}/{bench}.bc'
        cmd = f'wpa -ander -ccinput {ccenc_dir}/{bench}.cg -ccweight -bench-code {bench_code} -dump-modules {cw_dir} {os.getenv("BC_ROOT")}/{bench}.bc'
        log = '%s/%s.addccweight.log' % (cw_dir, bench)
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)
   
    # Build CCWeight attributed bitcode
    cmd_log = []
    for bench in benches:
        cmd = f"bash {os.getenv('CPU2017_MAKE_DIR')}/ccw.clang++.make.out {cw_dir} {bench}"
        cmd = f'clang++ {cw_dir}/{bench}.bc \
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
                -o {cw_dir}/{bench}'
        log = '%s/%s.offset' % (cw_dir, bench)
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)
    #-L/home/sungkeun/git/spack/var/spack/environments/base/.spack-env/._view/dec54r6zjqn3jmn5hxa5l5z6bsyw22pw/lib \
    #-I/home/sungkeun/git/spack/opt/spack/linux-centos7-piledriver/gcc-12.1.0/llvm-openmp-12.0.1-e5sxuwhroyvhg4tiarzwyohmavipiw42/include \
   
    # Disassemble the executable
    cmd_log = []
    for bench in benches:
        # disassemble the executable
        cmd = f'llvm-objdump -DS {cw_dir}/{bench}'
        log = f'{cw_dir}/{bench}.asm'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    # generate the final ccw file
    cmd_log = []
    for bench in benches:
        bench_code = int(bench[:3])
        cmd = f"python ccencoder/gen_ccw.py -ccw {cw_dir}/{bench}.offset -bin {cw_dir}/{bench}.asm -output {cw_dir}/{bench}.ccw"
        log =  f'{cw_dir}/{bench}.gen_ccw.log'
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log, False)

    print('CCW file is created.')

def run_ccwtest(cw_dir, bin_dir):
    ccwtest_dir = cw_dir + '/drclient_empty'
    makedirs(ccwtest_dir)
    for bench in benches:
        cmd = f'$drrun -t drclient_empty -ccw {cw_dir}/{bench}.ccw -ccwdir {ccwtest_dir} -bench {bench} -- {bin_dir}/{bench} {cmd_options[bench]} > {ccwtest_dir}/{bench}.out 2>&1'
        print(cmd)
        os.system(cmd)

    ccwtest_dir = cw_dir + '/drclient_callret_overhead_test'
    makedirs(ccwtest_dir)
    for bench in benches:
        cmd = f'$drrun -t drclient_callret_overhead_test -ccw {cw_dir}/{bench}.ccw -ccwdir {ccwtest_dir} -bench {bench} -- {bin_dir}/{bench} {cmd_options[bench]} > {ccwtest_dir}/{bench}.out 2>&1'
        print(cmd)
        os.system(cmd)

    ccwtest_dir = cw_dir + '/drcctlib_callret_overhead_test'
    makedirs(ccwtest_dir)
    for bench in benches:
        cmd = f'$drrun -t drcctlib_callret_overhead_test -ccw {cw_dir}/{bench}.ccw -ccwdir {ccwtest_dir} -bench {bench} -- {bin_dir}/{bench} {cmd_options[bench]} > {ccwtest_dir}/{bench}.out 2>&1'
        print(cmd)
        os.system(cmd)

    ccwtest_dir = cw_dir + '/drclient_ccw_test'
    makedirs(ccwtest_dir)
    for bench in benches:
        cmd = f'$drrun -t drclient_ccw_test -ccw {cw_dir}/{bench}.ccw -ccwdir {ccwtest_dir} -bench {bench} -- {bin_dir}/{bench} {cmd_options[bench]} > {ccwtest_dir}/{bench}.out 2>&1'
        print(cmd)
        os.system(cmd)

    print(f'CCW Tests are launched. See log files in {cw_dir}')

def run_bench_runtime():
    bench_runtime_dir = os.getenv('RUNTIME_WITHOUT_CLIENT')
    bin_root = os.getenv('BIN_ROOT')
    makedirs(bench_runtime_dir)
    for bench in benches:
        cmd = f'{{ bash -c "time {bin_root}/{bench} {cmd_options[bench]}" ;}} > {bench_runtime_dir}/{bench}.out 2>&1'
        print(cmd)
        os.system(cmd)

    print(f'CCW Tests are launched. See log files in {bench_runtime_dir}')

def run_ccupdate_drcctlib(cw_dir, outdir):
    ccwtest_dir = cw_dir + '/ccwtest'
    makedirs(ccwtest_dir)
    makedirs(outdir)
    for bench in benches:
        cmd = f'$drrun -t ccupdate_drcctlib -outdir {outdir} -bench {bench} -- {cw_dir}/{bench} {cmd_options[bench]} > {outdir}/{bench}.out 2>&1 &'
        print(cmd)
        #os.system(cmd)


def run_make_exe(bin_dir, bc_dir, rtlib_dir):
    makedirs(bin_dir)
    cmd_log = []
    for bench in benches:
        #cmd = 'bash %s/common.clang++.make.out %s %s %s %s' % \
        #        (os.getenv('CPU2017_MAKE_DIR'),
        #        bc_dir,
        #        bin_dir,
        #        rtlib_dir,
        #        bench)
        #log = '%s/%s.log' % (bin_dir, bench)
        if bench in ['100.test-pcce-fig-4', '101.test-pcce-fig-5a', '102.test-indirect-call', '103.test-libc-nostatic-nodebug', '103.test-libc-static-debug', '103.test-libc-static-debug', '104.test-backedge', '106.test-machinecode']:
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
        cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)
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
    cmd_log = []
    for run in range(num_tests):
        base_stats_dir = '%s/%s' % (stats_dir, run)
        for bench in benches:
            cmd = 'gprof %s/%s %s/%s.gmon' % \
                    (bin_dir, bench,
                    base_stats_dir, bench)
            log = '%s/%s.gprof' % (base_stats_dir, bench)
            cmd_log.append((cmd, log))
    run_cmd_foreach_bench(cmd_log)

    print('Running gprof is done')

def main(args):

    if (args.build == False and \
            args.extract_bitcode == False and \
            args.clean == False and \
            args.callgraph == False \
            and args.ccenc == None and \
            args.instrument == None and \
            args.ccweight == None and \
            args.run_ccwtest == None and \
            args.run_bench_runtime== None and \
            args.make_exe == None and \
            args.run_bench == None and \
            args.run_gprof == None):
        print("Nothing to do ...\nrun 'run_dcce -h' to see how to use.")
        exit(1)

    if (args.build):
        run_build()
    if (args.extract_bitcode):
        run_extract_bitcode()
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

    if (args.ccweight != None):
        if args.ccweight == 'dcce':
            run_ccweight(os.getenv('DCCE_CCWEIGHT_DIR'), os.getenv('DCCE_CCENC_DIR'), os.getenv('BIN_ROOT'))
        elif args.ccweight == 'pcce':
            run_ccweight(os.getenv('PCCE_CCWEIGHT_DIR'), os.getenv('PCCE_CCENC_DIR'), os.getenv('BIN_ROOT'))
    
    if (args.run_ccwtest != None):
        if args.run_ccwtest == 'dcce':
            run_ccwtest(os.getenv('DCCE_CCWEIGHT_DIR'), os.getenv('BIN_ROOT'))
        elif args.run_ccwtest == 'pcce':
            run_ccwtest(os.getenv('PCCE_CCWEIGHT_DIR'), os.getenv('BIN_ROOT'))
    
    if (args.run_bench_runtime):
        run_bench_runtime()

    #if (args.run_ccupdate_drcctlib != None):
    #    run_ccupdate_drcctlib(os.getenv('DCCE_CCWEIGHT_DIR'), os.getenv('DRCCTLIB_CCUPDATE_TEST'))

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
    parser.add_argument('-extract-bitcode', action='store_true',
            help='extract bitcode from the binary.')
    parser.add_argument('-clean', action='store_true',
            help='clean all the output files.')
    parser.add_argument('-callgraph', action='store_true',
            help='run wpa to genrate callgph(.cg) file')
    parser.add_argument('-ccenc', choices=['dcce', 'pcce'],
            help='run calling context encoding with given method.')
    parser.add_argument('-instrument', choices=['base2', 'dcce', 'pcce', 'valence'],
            help='run wpa to instrument benchmarks.')
    parser.add_argument('-ccweight', choices=['dcce', 'pcce', 'valence'],
            help='run wpa to add ccweight to callsite.')
    parser.add_argument('-run-ccwtest', choices=['dcce', 'pcce', 'valence'],
            help='run ccw test.')
    parser.add_argument('-run-bench-runtime', action='store_true',
            help='run benchmarks to measure execution times of benchmarks without anything (static or dynamic instrumentation)')
    parser.add_argument('-make-exe', choices=['base2', 'dcce', 'pcce', 'valence'],
            help='make executable.')
    parser.add_argument('-run-bench', choices=['base', 'base2', 'dcce', 'pcce', 'valence'],
            help='run instrumented benchmarks.')
    parser.add_argument('-run-gprof', choices=['base', 'base2', 'dcce', 'pcce', 'valence'],
            help='run gprof.')
    args = parser.parse_args()

    main(args)
