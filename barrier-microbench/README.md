# Barrier Elision Microbench
> in progress microbench for DCCE


## Parsec Benchmark Suite
> The basis for barrier elision microbench.
> We are looking to replace the default pthread library uses by these benchamrk programs with our own version that has additional logic to check and label redundandant barrier function calls.

Main Directory:
    
    DCCE/barrier-microbench

## Pthread Library
Pthread Library source code can be found at:

    DCCE/barrier-microbench/glibc-2.31/nptl

## Multi-thread programs
> One for computing the value of pi and the other for calculating the minimum in a random list.

Compilation and Execution example:

    $ gcc -o [list_minimum.exe] [list_minimum.c] -lpthread
  
    $ ./list_minimum.exe [p] [n]
    
>> p : any integer value
>> 
>> n : $2^k$, where k = 0,..., 13

By default, the compiler will look for the pthread library that is built in (usually in usr/lib/...)
