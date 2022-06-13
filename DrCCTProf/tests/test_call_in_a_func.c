#include <stdio.h>

int foo(int x) {
    return x+1;
}
int main (int argc, char *argv[])
{
    for (int i = 0; i < 100; i++) {
        foo(i);
    }
    return 0;
}
