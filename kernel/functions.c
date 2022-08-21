int 
function_1()
{
    return 0x1234abcd;
}

int 
function_2()
{
    int x = 2;
    return 0x1234abcd;
}

int 
function_3()
{
    int x = 2;
    int y = x;
    return 0x1234abcd;
}

int 
add(int a, int b)
{
    return a + b;
}


void 
caller()
{
    int result = add(2, 3);
}



int
add2(int* a, int* b)
{
    return *a + *b;
}



int
caller2()
{
    int a = 1;
    int b = 2;
    return add2(&a, &b);
}

















