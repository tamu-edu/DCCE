#include <stdlib.h>

int sum(int n) {
    if (n == 0) return 0;
    return n + sum(n-1);
}

void not_reachable_func() {}

int main (int argc, char *argv[])
{
    sum(10);
    return 0;
}
