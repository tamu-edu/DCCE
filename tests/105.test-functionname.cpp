
/*extern "C++"*/ void foo_mangled(int a) {}
extern "C" void foo_not_mangled(int a) {}


class Test {
public:
    Test() {}

    void foo(int a) {
    }

    void foo(int a, int b) {
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
