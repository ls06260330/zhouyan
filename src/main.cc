#include "../include/sum.h"
#include <iostream>

using std::endl;
using std::cout;

int main(int argc, char *argv[])
{
    int a = 100;
    int b = 200;
    int s = sum(a, b);
    
    cout << "s = " << s << endl;
    return 0;
}