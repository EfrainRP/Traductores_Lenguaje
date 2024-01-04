#include <iostream>
#include <stdio.h>
#include <stdlib.h>
int suma( int $a, int $b ) {
    int $result;
    __asm__ __volatile__(
        "movl %1, %%eax;"
        "movl %2, %%ebx;"
        "addl %%ebx,%%eax;"
        "movl %%eax, %0;" : "=g" ( $result ) : "g" ( $a ), "g" ( $b )
    );
    return $result ;
}
int resta( int $a, int $b ) {
    int $result;
    __asm__ __volatile__(
        "movl %1, %%eax;"
        "movl %2, %%ebx;"
        "subl %%ebx,%%eax;"
        "movl %%eax, %0;" : "=g" ( $result ) : "g" ( $a ), "g" ( $b )
    );
    return $result ;
}
int main(int argc, char** argv) {
    int numero_1, numero_2;
    printf( "\n\n" );
    printf( " =======================================================================\n" );
    printf( " Este programa realiza operaciones con enteros\n");
    printf( " =======================================================================\n" );
    printf( "\n\n\t\t Dar el primer numero entero : " );
    scanf( "%d", &numero_1 );
    printf( "\n\n\t\t Dar el segundo numero entero : " );
    scanf( "%d", &numero_2 );
    printf( "\n\n" );
    printf( "\t\t %d + %d = %d\n", numero_1, numero_2, suma(numero_1,numero_2) );
    printf( "\t\t %d - %d = %d\n", numero_1, numero_2, resta(numero_1,numero_2) );
    printf( "\n\n\t\t " );
    return 0;
}
