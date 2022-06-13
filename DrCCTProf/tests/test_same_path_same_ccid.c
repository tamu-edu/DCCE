#include <stdio.h>

void A() { printf("A\n"); }
void B() { printf("B\n"); }


int main (int argc, char *argv[])
{
    if (argc > 1) {
        printf("Creating another call paths...\n");
    }

    A();
    B();
    return 0;
}
