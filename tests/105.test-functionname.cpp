#include <stdio.h>

/*extern "C++"*/ void foo_mangled(int a) { printf("foo mangled\n"); }
extern "C" void foo_not_mangled(int a) { printf("foo not mangled\n"); }


class Test {
public:
    Test() {}

    void foo(int a) {
        printf("foo1\n");
    }

    void foo(int a, int b) {
        printf("foo2\n");
    }
};

int main (int argc, char *argv[])
{
    foo_mangled(1);
    foo_not_mangled(1);

    Test t;
    t.foo(1);
    t.foo(1, 2);
    return 0;
}
