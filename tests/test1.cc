#include <iostream>
void B();
void D();
void E();
void F();
void G();
void H();
void I();
void J();
void rec(int counter);

void rec(int counter)
{
    if (counter == 0) return;
    counter--;
    rec(counter);
}

void B()
{
    D();
    E();
}

void D()
{
    F();
    F();
    G();
}

void E()
{
}

void F()
{
    H();
    I();
}

void G()
{
    I();
}

void H()
{
}

void I()
{
}

void J()
{
    D();
    G();
    I();
}

int main()
{
    B();
    J();
    return 0;
}
