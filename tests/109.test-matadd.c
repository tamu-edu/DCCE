#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main (int argc, char *argv[])
{
    int i, k, N;
    N = 1000;

    double A[N], B[N], C[N];

    #pragma omp parallel
    {
        printf("Hello world from thread %d\n", omp_get_thread_num());
        for (i = 0; i < N; i++) {
            A[i] = B[i] + k*C[i];
        }
    }
    
    return 0;
}
