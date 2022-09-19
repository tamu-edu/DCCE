#include <stdio.h>
#include  <stdlib.h>
void foo() {}

int main (int argc, char *argv[])
{
    if (argc != 2) {
        printf("Usage: %s num_iteration\n", argv[0]);
        return 1;
    }

    unsigned long long int num_iter = atoi(argv[1]);
    for (unsigned long long int i = 0 ; i < num_iter; i++) foo();
    return 0;
}
