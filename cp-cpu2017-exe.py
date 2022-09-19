import sys
import os
import os.path
import argparse

bench_name = {
    '500.perlbench_r':  'perlbench_r',
    '502.gcc_r':        'cpugcc_r',
    '505.mcf_r':        'mcf_r',
    '508.namd_r':       'namd_r',
    '510.parest_r':     'parest_r',
    '511.povray_r':     'povray_r',
    '519.lbm_r':        'lbm_r',
    '520.omnetpp_r':    'omnetpp_r',
    '523.xalancbmk_r':  'cpuxalan_r',
    '525.x264_r':       'x264_r',
    '526.blender_r':    'blender_r',
    '531.deepsjeng_r':  'deepsjeng_r',
    '538.imagick_r':    'imagick_r',
    '541.leela_r':      'leela_r',
    '544.nab_r':        'nab_r',
    '557.xz_r':         'xz_r',
    '600.perlbench_s':  'perlbench_s',
    '602.gcc_s':        'sgcc',
    '605.mcf_s':        'mcf_s',
    '619.lbm_s':        'lbm_s',
    '620.omnetpp_s':    'omnetpp_s',
    '623.xalancbmk_s':  'xalancbmk_s',
    '625.x264_s':       'x264_s',
    '631.deepsjeng_s':  'deepsjeng_s',
    '638.imagick_s':    'imagick_s',
    '641.leela_s':      'leela_s',
    '644.nab_s':        'nab_s',
    '657.xz_s':         'xz_s',
}

def main(args):
    for bench, exe in bench_name.items():
        src = f'{args.root}/benchspec/CPU/{bench}/exe/{exe}_{args.config}.{args.label}-{args.model}'
        dst = f'{args.outdir}/{bench}'

        if not os.path.exists(src):
            print(f'Error: {src} does not exists.')
            exit(1)

        if not args.overwrite and os.path.exists(dst):
            print(f'Error: {dst} exists.')
        
        cmd = f'cp {src} {dst}'
        print(f'Executing {cmd}')
        os.system(cmd)


if __name__ == "__main__":

    parser = argparse.ArgumentParser(\
            description='Copy CPU2017 executables to designated location.')
    parser.add_argument('-root', required=True,
            help='A root directory of CPU2017 benchmark.')
    parser.add_argument('-outdir', required=True,
            help='A root directory to store executables.')
    parser.add_argument('-label', required=True,
            help='A label of the configuration used to build benchmarks.')
    parser.add_argument('-model', required=True, choices=['m64', 'm32'],
            help='An architecture of the current machine (m64/m32)')
    parser.add_argument('-config', choices=['base', 'peak'], required=True,
            help="A binary type either baseline or peak.")
    parser.add_argument('-overwrite', action='store_true', default=False,
            help="Allow to overwrite the existing files.")

    args = parser.parse_args()
    main(args)
