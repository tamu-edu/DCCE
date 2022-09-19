
void A() {}
void B() {}


int main (int argc, char *argv[])
{
    void (*pfun)() = 0;
    A();
    B();

    if (argc == 1) {
        pfun = A;
    } else {
        pfun = B;
    }

    pfun();
    
    return 0;
}
