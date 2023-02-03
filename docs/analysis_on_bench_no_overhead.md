# 1. Problem description
There are some benchmarks that their execution times are not increased yet all. It's runtime almost the same with the baseline. It happens with any type of encoding schemes (PCCE, DCCE Static and Dynamic). In this page, I'm going to make some hypothesis and prove it by collecting the supportive statistics.

# 2. Target benchmarks for analysis.
Figure 1 and Figure 2 are the runtime overhead of DrCCTProf and DCCE-Dynamic relative to Native. As you can see, *lbm_s, OCEAN-CP, and OCEAN-NCP* have the same runtime for six cases (from Native to DrCCTProf). I select them  as target benchmarks to figure out the reason why. As of writing, benchmarks of SPEC2017 including lbm are running, I'll update when they are completed.

<figure>
<img src="https://user-images.githubusercontent.com/1031755/211677265-dd888ed0-1780-4d63-9415-1d732812f1f6.png" style="width:100%">
<figcaption align = "center"><b> Fig 1. Runtime overhead of dynamic instrumentation on SPEC CPU 2017 using Dynamic DCCE. lbm_r and lbm_s are target to analyze. </b></figcaption>
</figure>

<figure>
<img src="https://user-images.githubusercontent.com/1031755/211677273-b4d67082-4dda-4758-ac51-147a793e9438.png" style="width:100%">
<figcaption align = "center"><b> Fig 2. Runtime overhead of dynamic instrumentation on Splash-3 using Dynamic DCCE. OCEAN-CP and OCEAN-NCP are target to analyze. </b></figcaption>
</figure>

# 3. Reproduction Info
1. Version: [9211ac466862ce31b21147348e623a26117a0473](https://github.com/ksungkeun84/DCCE/commit/9211ac466862ce31b21147348e623a26117a0473)

This is the version that we used for PLDI-23 submission.

2. Binary, CCW, and intermediate files.
Use the `output-pldi-23.tar.gz` in the google drive here.
3. Run Commands
```sh
python3 run-dcce.py -run-native-exp
python3 run-dcce.py -run-static-exp
python3 run-dcce.py -run-dynamic-exp
```

# 4. Analysis
Idea is to focus on DCCE-Dynamic and find out the most significant factor of no runtime overhead. Then I'll apply to other schemes for justification. In high level perspective, there are three factors that affect runtime overhead due to calling context encodings as follows:
## 1. CCW file loading
In DCCE-Dynamic, CCWs are computed statically (offline) and they are used dynamically by Dynamic Instrumentation Tool. If its size is huge, the loading time would affect the runtime. However, we already checked this during PLDI-23 submission and Both benchmarks with high overhead and no overhead take up small portion of the runtime (less than 1%) except CHOLESKY, RADIOSITY, and WATER-SPATIAL. I think CCW file loading is not the reason of no runtime overhead.
Note:  benchmarks with high CCW loading time is mainly because the running time of them are not long enough.

![Screenshot 2023-01-11 at 9 38 56 AM](https://user-images.githubusercontent.com/1031755/211849181-f96183fb-75ae-4730-bc15-cbd74ecadaa0.png)

## 2. CCW lookup and CCID Update
For every function call, DCCELib search the corresponding CCW. We manage ccw of direct and indirect calls in separated data structure:
```cpp
// callsite -> ccw
typedef std::unordered_map<uint64_t, uint64_t> ccw_direct_t;
// callsite -> callee -> ccw
typedef std::unordered_map<uint64_t, std::unordered_map<uint64_t, uint64_t>> ccw_indirect_t ;
```
## 3. CCID Query
For simplicity and generality, we instrumented benchmark to query CCID for every function entry.

***The more number of function calls at runtime, the more runtime overhead would increase.*** Therefore, I initially thought that the number of function calls for lbm_s, OCEAN-CP, and OCEAN-NCP would be very less. However, OCEAN-CP and lbm_s have many function calls compared to OCEAN-NCP and others:

![Screenshot 2023-01-11 at 10 05 11 AM](https://user-images.githubusercontent.com/1031755/211855917-4a4e8144-e7b4-4ceb-9483-86e1ed8b2308.png)

Also, I thought that benchmarks with high runtime overhead would have high average CCW lookup time but it wasn't true.
![Screenshot 2023-01-11 at 10 22 01 AM](https://user-images.githubusercontent.com/1031755/211859958-f1be6174-4dea-4f35-b8a3-57c60d571ca1.png)

I notice that this is not reasonable because comparing the number of calls from different benchmarks with different runtime does not make sense. We need to see how much portion of runtime the CCW lookup and CCID update take up.

Finally, I collected accumulated CCW lookup and calculated the percentage of CCW lookup in the runtime. 
As you can see table below, OCEAN-CP, OCAN-NCP take up less than 1 percentage of CCW lookup in runtime and we can see that trend of performance overhead follows the % of CCW lookup. That is, % of CCW lookup in runtime is the main factor of the performance overhead.

![Screenshot 2023-01-11 at 10 17 07 AM](https://user-images.githubusercontent.com/1031755/211858837-fa01ede7-13a4-4af2-a1f4-d6615c72a0dc.png)

And the table below shows the trend that the more calls executed at runtime, the higher latency of lookup we have.
![Screenshot 2023-01-11 at 10 17 38 AM](https://user-images.githubusercontent.com/1031755/211858955-e1dff09f-9164-4c78-9436-b042f527ebfd.png)

***Can we apply this fact to other encoding schemes?***
*It is fact that the more number of function calls at runtime, the more runtime overhead would increase.* As long as encoding scheme operate something for every function call, we can tell that the target benchmarks have no runtime overhead with the same reason - they have small number of function calls and their overhead due to encodings during the function call is not significantly large compared to the entire runtime.


# Log file used for analysis
[logs.zip](https://github.com/ksungkeun84/DCCE/files/10394284/logs.zip)

