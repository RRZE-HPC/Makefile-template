#include <stdlib.h>
#include <stdio.h>

#ifdef _OPENMP
#include <omp.h>
#endif

#include <timing.h>
#include <allocate.h>
#include <likwid-marker.h>

#define LIKWID_PROFILE(tag,call) \
    _Pragma ("omp parallel") \
   {LIKWID_MARKER_START(#tag);} \
   time = call; \
   _Pragma ("omp parallel") \
   {LIKWID_MARKER_STOP(#tag);}

double triad(
        double * restrict a,
        double * restrict b,
        double * restrict c,
        double scalar,
        int N
        )
{
    double S, E;

    S = getTimeStamp();
    _Pragma("omp parallel for schedule(static)")
    for (int i=0; i<N; i++) {
        a[i] = b[i] + scalar * c[i];
    }
    E = getTimeStamp();

    return E-S;
}

int main (int argc, char** argv)
{
    double *a, *b, *c;
    double S, E, time;
    size_t N = SIZE;

    LIKWID_MARKER_INIT;
    _Pragma("omp parallel")
    {
        LIKWID_MARKER_REGISTER("TRIAD");
    }

    a = (double*) allocate( ARRAY_ALIGNMENT, N * sizeof(double) );
    b = (double*) allocate( ARRAY_ALIGNMENT, N * sizeof(double) );
    c = (double*) allocate( ARRAY_ALIGNMENT, N * sizeof(double) );
#ifdef VERBOSE_DATASIZE
    printf ("Total allocated datasize: %8.2f MB\n", 3.0 * sizeof(double) * N * 1.0E-06);
#endif

#ifdef _OPENMP
    printf(HLINE);
    _Pragma("omp parallel")
    {
        int k = omp_get_num_threads();
        int i = omp_get_thread_num();

        _Pragma("omp single")
        {
            printf ("OpenMP enabled, running with %d threads\n", k);
        }
    }
#endif


    S = getTimeStamp();
    _Pragma("omp parallel for schedule(static)")
    for (int i=0; i<N; i++) {
        a[i] = 2.0;
        b[i] = 2.0;
        c[i] = 0.5;
    }
    E = getTimeStamp();
#ifdef VERBOSE_TIMER
    printf ("Timer resolution %.2e ", getTimeResolution());
    printf ("Ticks used %.0e\n", (E-S) / getTimeResolution());
#endif


    LIKWID_PROFILE(TRIAD,triad(a, b, c, 1.1, N));
    printf("Time: %11.4fs\n", time);

    return EXIT_SUCCESS;
}
