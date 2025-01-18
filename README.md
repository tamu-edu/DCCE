# Distinguishable Calling Context Encoding (DCCE)

## Install Dependencies
Need to install llvm-12 and clang-12

    $ sudo apt install llvm-12 clang-12


## Set Environment Variables
In the root directory of DCCE, run following command.

    $ source setup-env.sh

After sourcing the environments, you are going to use `run-dcce.py` program to use DCCE project.

## Build SVF, runtime, and test program
    $ python run-dcce.py -build-runtime

## Target benchmarks

Install CPU 2017
------------------
```sh
cd benchmark_suites/cpu2017
./install_cpu2017.sh [iso path]
cd ../..
```

Build Executable of Benchmarks
-------------------------------

```sh
cd benchmark_suites/cpu2017
./build_cpu2017_bin.sh [cpu2017 install path]
cd ../..
```

## Fix build error
For `510.parest_r`, it causes compile error with a line in `510.parest_r/src/source/base/parameter_handler.cc:752`. To fix it, you can simple comment out that line.

Copy executable to output directory
------------------------------------
```sh
cd benchmark_suites/cpu2017
./copy_cpu2017_bin.sh [cpu2017 install path]
cd ../..
```

## Run wpa to genrate call graphes.
    $ python run-dcce.py -callgraph

Output files will be stored in `${DCCE_ROOT}/output/callgraph`.
    $ ls output/callgraph

## Run Calling Context Encoder to generate weights to update Context ID.
    $ python run-dcce.py -ccenc

## Run wpa to instrument bit code.
    $ python run-dcce.py -static-instr

## Run native experiment without instrumentation
    $ python run-dcce.py -run-native-exp

## Run instrumented experiment
    $ python run-dcce.py -run-static-exp

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

