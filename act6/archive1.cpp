#include <iostream>
using namespace std;
int suma( int $a, int $b ) {
    int $result;
    __asm__ __volatile__(
        "movl %1, %%eax;"
        "movl %2, %%ebx;"
        "addl %%ebx,%%eax;"
        "movl %%eax, %0;" : "=g" ( $result ) : "g" ( $a ), "g" ( $b ));
    return $result ;
}
int resta( int $a, int $b) {
    int $result;
    __asm__ __volatile__(
        "movl %1, %%eax;"
        "movl %2, %%ebx;"
        "subl %%ebx,%%eax;"
        "movl %%eax, %0;" : "=g" ( $result ) : "g" ( $a ), "g" ( $b ));
    return $result ;
}

int volumen(int $lon, int $anc, int $alt) {
    int $result;
    __asm__ __volatile__(
        "movl %1, %%eax;"
        "movl %2, %%ebx;"
        "mull %%ebx;"
        "movl %3, %%ebx;"
        "mull %%ebx;"
        "movl %%eax, %0;"
        : "=g" ( $result ) : "g" ( $lon ), "g" ( $anc ), "g" ( $alt ));
    return $result ;
}

int gcd( int $a, int $b ) {
    int $result;
    __asm__ __volatile__(
        "movl %1, %%eax;"
        "movl %2, %%ebx;"
        "CONTD: cmpl $0, %%ebx;"
        "je DONE;"
        "xorl %%edx, %%edx;"
        "idivl %%ebx;"
        "movl %%ebx, %%eax;"
        "movl %%edx, %%ebx;"
        "jmp CONTD;"
        "DONE:	movl %%eax, %0;" : "=g" ( $result ) : "g" ( $a ), "g" ( $b ));
    return $result ;
}

int main(int argc, char** argv) {
    int a,b,c;
    cout<<"\nDigite el numero a: ";
    cin>>a;
    cout<<"\nDigite el numero b: ";
    cin>>b;
    c=suma(a,b);
    cout<<"\nEl resultado de la suma de "<<a<<"+"<<b<<"="<<c<<"\n";
    c=resta(a,b);
    cout<<"\nEl resultado de la resta de "<<a<<"-"<<b<<"="<<c<<"\n";
    c=gcd(a,b);
    cout<<"\nEl resultado GCD("<<a<<","<<b<<")="<<c<<"\n";

    asm("subl %%ebx, %%eax;"
        "movl %%eax, %%ecx;"
        : "=c"  (c)
        : "a"   (a), "b" (b)
        :                   /* lista clobber vacia */
       );

    printf("a = %d\nb = %d\nc = %d\n", a, b, c);

    asm("addl %%ebx, %%eax;"
        "movl %%eax, %%ecx;"
        : "=c"  (c)
        : "a"   (a), "b" (b)
        :                   /* lista clobber vacia */
       );

    printf("a = %d\nb = %d\nc = %d\n", a, b, c);
    /*La lista clobber es una lista de cadenas separadas por comas.
    Cada cadena es el nombre de un registro que el código ensamblador
    modifica potencialmente, pero para el cual el valor
    final no es importante. */

    int lon,anc,alt,res;
    cout<<"\nDigite la longitud: ";
    cin>>lon;
    cout<<"\nDigite el ancho: ";
    cin>>anc;
    cout<<"\nDigite la altura: ";
    cin>>alt;
    res=volumen(lon,anc,alt);
    cout<<"\nEl resultado del volumen de un prisma de longitud: "<<lon
        <<" ancho: "<<anc<<" y altura: "<<alt<<" es de : " <<res<<"\n";

    return 0;
}
