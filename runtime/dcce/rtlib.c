#include <stdio.h>

unsigned long long int ccid = 0;

void addWeight(unsigned long long weight)
{
    //printf("%llu + %llu = %llu\n", ccid, weight, ccid + weight);
    ccid += weight;
}

void removeWeight(unsigned long long weight)
{
    //printf("%llu - %llu = %llu\n", ccid, weight, ccid - weight);
    ccid -= weight;
}
