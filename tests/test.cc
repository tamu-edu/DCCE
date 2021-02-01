#include <stdlib.h>

void swap(int a, int b)
{
    int temp = a;
    a = b;
    b = temp;
    if (a == 1)
    {
        exit(1);
    }
}

void addToSwap(int a, int b)
{
    int temp = a;
    a = a + b;
    b = temp;
    if (a == 1)
    {
        exit(1);
    }
}

int main()
{
    int i = 0;
    
    for (int j = 100; j > 0; j--)
    {
        if ((i % 8) == 0)
        {
            addToSwap(i, j);
        }
        else
        {
            swap(i, j);
        }
    }
    return 0;
}
