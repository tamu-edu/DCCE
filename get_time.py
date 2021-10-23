import sys
import os
import os.path
import argparse
import shlex
import pandas
from subprocess import Popen, PIPE

benches = [
    '600.perlbench_s', # cannot run instrument because of integer overflow
    #'602.gcc_s',      # compile issue
    '605.mcf_s',
    #'607.cactuBSSN_s',# compile issue
    '619.lbm_s',
    '620.omnetpp_s',  # assertion during dump-callgraph lineno: 356
    '623.xalancbmk_s',# assertion during dump-callgraph lineno: 356
    '625.x264_s',
    '631.deepsjeng_s',
    '638.imagick_s',
    '641.leela_s',   # assertion during dump-callgraph lineno: 356
    #'644.nab_s',
    '657.xz_s',
    '998.specrand_is',
    '100.test',
    ]

def parse(line):
    # base/stats/619.lbm_s.log:real	6m23.276s
    bench = line.split(':')[0].split('/')[-1][:-4]
    min_sec = line.split('\t')[1].split('/')[-1]
    min = min_sec.split('m')[0]
    sec = (min_sec.split('m')[1]).strip()[:-1]
    sec = int(min) * 60 + float(sec)
    print ("%s: %f" % (bench, sec))
    return bench, sec

def main(args):
    # bench -> [ ]
    stats = {}
    with open(args.p, 'r') as f:
        for line in f:
            bench, secs = parse(line)
            if bench not in stats:
                stats[bench] = []
            stats[bench].append(secs)

    print(stats)
    headers = ['0',]
    idx = []
    data = []
    for bench in benches:
        idx.append(bench)
        if bench not in stats:
            data.append([])
        else:
            data.append(stats[bench])

    df = pandas.DataFrame(data, columns = headers, index = idx)
    print(df)



if __name__== "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('p')

    args = parser.parse_args()
    main(args)
