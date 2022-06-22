
bench_root=/data/share/SPEC2017_BINS
input_root=/data/share/SPEC2017_INPUTS

$drrun -t functionname_test -- ./test-functionname
#$drrun -t instr_statistics_clean_call -- ./test_libc
#$drrun -t max_ccid -- ./test_libc
#$drrun -t max_ccid -- ./test_ctx_hndls_in_same_func
#$drrun -t max_ccid -- ./test_simple
#$drrun -t max_ccid -- ./test_call_in_a_func
#$drrun -t max_ccid -- ./test_recursive_sum
#$drrun -t max_ccid -- ./test_same_path_same_ccid
#$drrun -t max_ccid -- ./test_same_path_same_ccid 1
#$drrun -t max_ccid -- ./test_same_call_diff_callsite
#$drrun -t max_ccid -- ${bench_root}/600.perlbench_s -I${input_root}/600.perlbench_s/data//all/input/lib ${input_root}/600.perlbench_s/data/refrate/input/checkspam.pl 2500 5 25 11 150 1 1 1 1 > test.log 2>&1 &
