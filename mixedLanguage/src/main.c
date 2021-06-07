#include <stdlib.h>
#include <stdio.h>

extern void benchmarks_mp_printanswer_(void);

int main (int argc, char** argv)
{
    printf("Hello world\n");
    benchmarks_mp_printanswer_();

    return EXIT_SUCCESS;
}
