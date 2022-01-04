import os
import sys
import argparse
import logging
import warnings
from typing import List

from rich.logging import RichHandler
from rich import traceback
from rich import print
import pyfiglet

from pyclibase import pyclibase

title = pyfiglet.figlet_format('DCCE CLI', font='slant')
print(f'[blue]{title}[/blue]')
FORMAT = "%(message)s"
logging.basicConfig(format=FORMAT, datefmt="[%X]", level="NOTSET", handlers=[RichHandler(rich_tracebacks=True, markup=True)])
traceback.install()



logging.getLogger('tensorflow').disabled = True
logging.getLogger('matplotlib').disabled = True
logging.getLogger('subprocess.Popen').disabled = True
logging.getLogger('matplotlib.pyplot').disabled = True
logging.getLogger('matplotlib.font_manager').disabled = True
log = logging.getLogger("rich")

# Filter out this warning about Rich TQDM progress bars
warnings.filterwarnings("ignore", message="rich is experimental/alpha")

def build(args):
    print('build')
    log.info('Autoencoder Summary:')


def clean(args):
    print('clean')

def callgraph(args):
    print('callgraph')

def ccenc(args):
    print('ccenc {}'.format(args.variant))

def instrument(args):
    print('instrument {}'.format(args.variant))

def make_exec(args):
    print('make_exec {}'.format(args.variant))

def run_bench(args):
    print('run_bench {}'.format(args.bench))

def main(argv: List[str] = None):
    """Main DCCE entrypoint, routes user commands to function calls."""
    parser = argparse.ArgumentParser(prog='dcce', description='...description...')
    parser.set_defaults(func=lambda x: parser.print_help())
    subparsers = parser.add_subparsers(title='commands')

    ##############################################################################
    # build command
    ##############################################################################
    parser_build = subparsers.add_parser(
        'build',
        help='Builds all the sub projects.',
        description="Builds all the sub projects."
    )
    parser_build.set_defaults(func=build)

    ##############################################################################
    # build command
    ##############################################################################
    parser_clean = subparsers.add_parser(
        'clean',
        help='Clean all the sub projects.',
        description="Clean all the sub projects."
    )
    parser_clean.set_defaults(func=clean)

    ##############################################################################
    # callgraph command
    ##############################################################################
    parser_callgraph = subparsers.add_parser(
        'callgraph',
        help='Generates the callgraphs.',
        description="Generates the callgraphs."
    )
    parser_callgraph.set_defaults(func=callgraph)

    ##############################################################################
    # ccenc command
    ##############################################################################
    parser_ccenc = subparsers.add_parser(
        'ccenc',
        help='Calling Context Encoding.',
        description="Calling Context Encoding."
    )
    parser_ccenc.set_defaults(func=ccenc)
    parser_ccenc.add_argument(
        'variant',
        type = str,
        default = 'dcce',
        choices = ['dcce', 'pcce', 'valence'],
        help = 'Methods to encode the calling context'
    )

    ##############################################################################
    # instrument command
    ##############################################################################
    parser_instrument = subparsers.add_parser(
        'instrument',
        help='Instrument bitcode with edge weights.',
        description="Instrument bitcode with edge weights."
    )
    parser_instrument.set_defaults(func=instrument)
    parser_instrument.add_argument(
        'variant',
        type = str,
        default = 'dcce',
        choices = ['base', 'dcce', 'pcce', 'valence'],
        help = 'Methods to instrument the bitcode'
    )

    ##############################################################################
    # make_exe command
    ##############################################################################
    parser_make_exec = subparsers.add_parser(
        'make-exec',
        help='Make an Executable.',
        description="Make an Executable."
    )
    parser_make_exec.set_defaults(func=make_exec)
    parser_make_exec.add_argument(
        'variant',
        type = str,
        default = 'dcce',
        choices = ['base', 'dcce', 'pcce', 'valence'],
        help = 'Variants to be built.'
    )

    ##############################################################################
    # run bench command
    ##############################################################################
    parser_run_bench = subparsers.add_parser(
        'run-bench',
        help='Run benchmarks.',
        description="Run benchmarks."
    )
    parser_run_bench.set_defaults(func=run_bench)
    parser_run_bench.add_argument(
        '-bench',
        type = str,
        default = 'all',
        help = 'Run benchmarks.'
    )

    # Execute the user command
    try:
        anyArgs = sys.argv[1:] != list()
        if anyArgs:
            args = parser.parse_args(argv)
            args.func(args)
        else:
            # What purpose?
            parser.print_help()
    # Handle Ctrl-C gracefully
    except KeyboardInterrupt:
        print(f"{argv}{os.linesep}")
        sys.exit(0)


if __name__ == "__main__":
  sys.exit(main())
