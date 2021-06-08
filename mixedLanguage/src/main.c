#include <stdlib.h>
#include <stdio.h>


#if defined(__INTEL_COMPILER) || defined(__INTEL_LLVM_COMPILER)
#define F90NAME(MODULE, FUNCNAME) MODULE ## _mp_ ## FUNCNAME
#else
#ifdef GCC
#define F90NAME(MODULE, FUNCNAME) __ ## MODULE ## _MOD_ ## FUNCNAME
#else
#define F90NAME(MODULE, FUNCNAME) MODULE ## _ ## FUNCNAME ## _
#endif
#endif

extern void F90NAME(benchmarks, printanswer)(void);

int main (int argc, char** argv)
{
    printf("Hello world\n");

    F90NAME(benchmarks, printanswer)();

    return EXIT_SUCCESS;
}
