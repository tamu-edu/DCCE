int add(int a, int b) { return a + b; }
int sub(int a, int b) { return a - b; }
int mul(int a, int b) { return a * b; }

void foo()
{
    int x = add(1,2);
    x = add(1,2);
    int y = sub(2,3);
    int z = mul(3,4);
}

int main (int argc, char *argv[])
{
    foo();
    return 0;
}
