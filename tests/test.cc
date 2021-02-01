#include <iostream>
void B();
void C();
void D();
void E();
void F();
void G();
void H();

bool called_back_edge = false;

void B()
{
    std::cout << "B" << std::endl;
    E();
}

void C()
{
    std::cout << "C" << std::endl;
    D();
    G();
}

void D()
{
    std::cout << "D" << std::endl;
    E();
    F();
}

void E()
{
    std::cout << "E" << std::endl;
}

void F()
{
    std::cout << "F" << std::endl;
    if (!called_back_edge) {
        called_back_edge = true;
        C();  // back edge
    }
    H();
}

void G()
{
    std::cout << "G" << std::endl;
    F();
}

void H()
{
    std::cout << "H" << std::endl;
}

int main()
{
    std::cout << "main" << std::endl;
    try {
        B();
        C();
    } catch (int e) {
        std::cout << "exception!!" << std::endl;
    }
    return 0;
}
