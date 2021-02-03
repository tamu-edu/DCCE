#include <stdlib.h>

void addToSwap(int a, int b)
{
    int temp = a;
    a = b + 10;
    b = temp;
    exit(1);
}

void swap(int a, int b)
{
    int temp = a;
    a = b;
    b = temp;
    exit(1);
}

int main()
{
    int a = 4;
    int b = 10;
    if ((a % 7) == 0)
    {
        swap(a, b);
    }
    else
    {
        addToSwap(a, b);
    }
    return 0;
}
