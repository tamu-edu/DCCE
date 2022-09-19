#include <stdio.h>

int bar(int x)
{
    int y = x + 1;
    return y;
}

int foo();

int main ()
{
    //int x = bar(1);
    //printf("x = %d\n", x);

    int y = foo();
    return 0;
}
