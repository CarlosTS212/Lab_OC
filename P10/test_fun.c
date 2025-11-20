#include <stdio.h>
extern int suma(int a, int b);
extern int aStrlen(char str[] );
extern int getBit(int value, int numbit);

int main()
{
    int a=3,x;
    int b=3;
    x = suma(a,b);
    printf("%d",x);

    char str[] = "Hola Mundo";
    x = aStrlen(str);
    printf("\n%d\n",x);


    x = getBit(13, 2); 
    printf("%d\n", x);
}


    
