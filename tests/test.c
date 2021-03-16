void B();
void C(int n);
void D(int n);
void E();
void F(int n);
void G(int n);
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
    rec(3);
    D();
    E();
}

void C(int n)
{
    if (n == 0) return;
    D(n);
    G(n);
}

void D(int n)
{
    E();
    F(n);
}

void E()
{
}

void F(int n)
{
    C(n - 1);
    H();
}

void G(int n)
{
    F(n);
}

void H() {}

int main()
{
    B();
    C(2);
    return 0;
}
