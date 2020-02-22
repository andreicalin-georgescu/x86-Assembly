#include <stdio.h>
 
int main(void)
{
    unsigned int a = 4127;
    int b = -27714;
    unsigned long c = 0x12345678;
    char d[] = {'I', 'O', 'C', 'L', 'A'};
 
    // TODO
    size_t i;
    unsigned char* p;
    
    p = &a;
    printf("a: %d", a);
    for (i = 0; i < sizeof(a); i++)
        printf(" 0x%02x", p[i]);
    printf("\n");

    
    p = &b;
    printf("b: %d", b);
    for (i = 0; i < sizeof(a); i++)
        printf(" 0x%02x", p[i]);
    printf("\n");
 

    p = &c;
    printf("c: %ul \n0x %x\n", c, c);
    for (i = 0; i < sizeof(a); i++)
        printf(" 0x%02x", p[i]);
    printf("\n");


    p = &d;
    printf("d: %s", d);
    for (i = 0; i < sizeof(a); i++)
        printf(" 0x%02x", p[i]);
    printf("\n");

    return 0;
}
