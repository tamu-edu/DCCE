#include <stdio.h>

unsigned long sum(unsigned long n)
{
    if (n == 0) return 0;
    return sum(n-1) + n;
}

int main()
{
    unsigned int n = 200000;
    unsigned int ret = sum(n);
    printf("sum of %u is %u\n", n, ret);
    return 0;
}
