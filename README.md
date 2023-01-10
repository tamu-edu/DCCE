# Distinguishable Calling Context Encoding (DCCE)

# Important Dates

|Conference|Paper Registration(Abstract Submission)|Full paper submission|Authors' response|Initial Notification|
|-|-|-|-|-|
|[PLDI](https://pldi23.sigplan.org/track/pldi-2023-pldi)|N/A|Nov 10, 2022|Feb 6 - 8, 2023|Feb 24, 2023|
|[USENIX ATC](https://www.usenix.org/conference/atc23/call-for-papers)|Jan 5, 2023|Jan 12, 2023|Apr 13, 2023|Apr 28, 2023|
|[ESEC/FSE](https://2023.esec-fse.org/track/fse-2023-research-papers)|Jan 26, 2023|Feb 2, 2023|May 4- Jun 29, 2023|Jul 27, 2023|
|[ISSTA](https://conf.researchr.org/track/issta-2023/issta-2023-technical-papers)|N/A|Jan 16,2023|Feb 16, 2023(dual submission)|May 3, 2023|
|[ASE](https://conf.researchr.org/track/ase-2023/ase-2023-papers)|Apr 28, 2023|May 5, 2023|N/A|17 Jul 17, 2023|
|[ICSE](https://conf.researchr.org/track/icse-2023/icse-2023-technical-track)|TBD (Near Sep)|TBD|TBD|TBD|
|[CGO](https://conf.researchr.org/track/cgo-2023/cgo-2023-main-conference)|TBD(Near Sep)|TBD|TBD|TBD|
|[OOPSLA](https://2023.splashcon.org/track/splash-2023-oopsla)|TBD(Near Oct)|TBD|TBD|TBD|
|[CC](https://conf.researchr.org/home/CC-2023)|TBD(Near Nov)|TBD|TBD|TBD|

## Development Environment
Every experiment in DCCE is done on top of the [spack](https://spack.readthedocs.io/en/latest/) based development environment. Followins are my spec information.
<img width="1447" alt="Screen Shot 2022-06-27 at 4 45 13 PM" src="https://user-images.githubusercontent.com/1031755/176041944-00c37bb5-212e-427e-aa87-d7522ac7af95.png">



Once you log in the dev-env docker container, activate conda with the following command
    $ conda activate dcce

## Set Environment Variables
In the root directory of DCCE, run following command.

    $ source setup_env.sh

After sourcing the environments, you are going to use `run-dcce.py` program to use DCCE project.

## Build SVF, runtime, and test program
    $ python run-dcce.py -build


## Target benchmarks
This project requires the bitcode of target benchmarks. By running `python run-dcce.py -build`, the test program (${DCCE_ROOT}/tests/test.cc} is compiled and the bit code is stored in ${DCCE_ROOT}/bitcode/test.bc. You can play with it first and use realistic benchmarks like SPEC later. After you prepare other bitcodes, you need to update `benches` variable in `run-dcce.py` which is the main program to use DCCE.

## Run wpa to genrate call graphes.
    $ python run-dcce.py -callgraph

Output files will be stored in ${DCCE_ROOT/output/callgraph.

    $ ls output/callgraph
    $ test-initial.dot
    $ test-initial.cg
    $ test-final.dot
    $ test-final.cg

## Run Calling Context Encoder to generate weights to update Context ID.
    $ python run-dcce.py -ccenc dcce

## Run wpa to instrument bit code.
    $ python run-dcce.py -instrument dcce

## Build executable with instrumented bit code and runtime.
    $ python run-dcce.py -make-exe dcce
Executables are stored in ${DCCE_ROOT}/output/dcce/bin

## Ignore below lines for now.

## Build spec2017 benchmarks

Modify config file to update correct libary and include paths. Make a diff ${DCCE_ROOT}/cpu2017-config/dcce/dcce-clang-llvm-linux-x86.cfg and ${DCCE_ROOT}/cpu2017-config/Example-clang-llvm-linux-x86.cfg to see the difference.

Link config file and makefile

    $ ln -s ${DCCE_ROOT}/cpu2017-config/dcce/dcce-clang-llvm-linux-x86.cfg ${SPEC2017_ROOT}/config/dcce-clang-llvm-linux-x86.cfg
    $ mv ${SPEC2017_ROOT}/benchspec/Makefile.defaults ${SPEC2017_ROOT}/benchspec/Makefile.defaults.org
    $ ln -s ${DCCE_ROOT}/cpu2017-config/dcce/Makefile.defaults ${SPEC2017_ROOT}/benchspec/Makefile.defaults

Run runcpu to start building process

    $ cd ${SPEC2017_ROOT} ; source shrc
    $ runcpu --config=dcce-clang-llvm-linux-x86.cfg --action=build intspeed


## Output directory structure
```bash
output
├── bin
│   ├── SPEC2017
│   ├── Splash-3
│   └── test
├── bitcode
│   ├── SPEC2017
│   ├── Splash-3
│   └── test
├── callgraph
│   ├── SPEC2017
│   ├── Splash-3
│   └── test
├── ccenc
│   ├── dcce
│   │   ├── SPEC2017
│   │   ├── Splash-3
│   │   └── test
│   └── pcce
│       ├── SPEC2017
│       ├── Splash-3
│       └── test
├── native
│   └── experiment
│       ├── SPEC2017
│       ├── Splash-3
│       └── test
├── dynamic_instrument
│   ├── bin
│   │   ├── SPEC2017
│   │   ├── Splash-3
│   │   └── test
│   ├── bitcode
│   │   │   ├── SPEC2017
│   │   │   ├── Splash-3
│   │   │   └── test
│   └── experiment
│       ├── drclient_empty
│       │   ├── SPEC2017
│       │   ├── Splash-3
│       │   └── test
│       ├── dcce_ccid_overhead
│       │   ├── SPEC2017
│       │   ├── Splash-3
│       │   └── test
│       ├── dcce_ccid_overhead_only_update
│       │   ├── SPEC2017
│       │   ├── Splash-3
│       │   └── test
│       ├── drcctlib_ccid_overhead_only_update
│       │   ├── SPEC2017
│       │   ├── Splash-3
│       │   └── test
│       └── drcctlib_ccid_overhead
│           ├── SPEC2017
│           ├── Splash-3
│           └── test
├── dynamic_instrument
│   └── dcce
│   └── drcctprof

```

