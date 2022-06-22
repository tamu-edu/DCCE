#include <stdio.h>
#include <stdlib.h>

int sum(int n) {
    if (n == 0) return 0;
    return n + sum(n-1);
}

void not_reachable_func() { printf("This never be printed\n"); }

int main (int argc, char *argv[])
{
    if (argc != 2) {
        fprintf(stderr, "Usage: %s number n to sum up from zero to n\n", argv[0]);
        exit(1);
    }

    int n = atoi(argv[1]);
    printf("Sum(%d) is %d\n", n, sum(n));
    
    return 0;
}
