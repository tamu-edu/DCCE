Before running scripts below, source `setup-env.sh` first.
----------------------------------------------------------
```sh
source ../setup-env.sh
```

Install CPU 2017
------------------
```sh
./install_cpu2017.sh [ios path]
```
Build Executable of Benchmarks
-------------------------------

```sh
./build_dcce_bin.sh [cpu2017 install path]
```

## Fix build error
For `510.parest_r`, it causes compile error with a line in `510.parest_r/src/source/base/parameter_handler.cc:752`. To fix it, you can simple comment out that line.

Copy executable to output directory
------------------------------------
```sh
./cp_bin.sh [cpu2017 install path]
```

```sh
./cpu_bin.sh /home/ksungkeun84/benchmarks/cpu2017-dcce
```
