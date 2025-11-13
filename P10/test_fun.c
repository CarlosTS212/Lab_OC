#include <stdio.h>
extern int suma(int a, int b);

int main()
{
    int a=3,x;
    int b=3;
    x = suma(a,b);
    printf("%d",x);

    char str[] = "Hola Mundo";
    x = strlen(str);
    printf("\n%d",x);
}

