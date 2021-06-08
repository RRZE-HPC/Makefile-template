#include <stdlib.h>
#include <stdio.h>

#include <timing.h>
#include <allocate.h>

#define SIZE 4000000
#define ARRAY_ALIGNMENT 64

int main (int argc, char** argv)
{
    double *a, *b, *c;
    double E, S;
    size_t N = SIZE;

    a = (double*) allocate( ARRAY_ALIGNMENT, N * sizeof(double) );
    b = (double*) allocate( ARRAY_ALIGNMENT, N * sizeof(double) );
    c = (double*) allocate( ARRAY_ALIGNMENT, N * sizeof(double) );
    printf ("Total allocated datasize: %8.2f MB\n", 3.0 * sizeof(double) * N * 1.0E-06);

    S = getTimeStamp();
    for (int i=0; i<N; i++) {
        a[i] = 2.0;
        b[i] = 2.0;
        c[i] = 0.5;
    }
    E = getTimeStamp();
    printf ("Timer resolution %.2e ", getTimeResolution());
    printf ("Ticks used %.0e\n", (E-S) / getTimeResolution());


    S = getTimeStamp();
    for (int i=0; i<N; i++) {
        a[i] = b[i] + 1.1 * c[i];
    }
    E = getTimeStamp();
    printf("Time: %11.4fs\n", E-S);

    return EXIT_SUCCESS;
}
