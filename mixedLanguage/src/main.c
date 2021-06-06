#include <stdlib.h>
#include <stdio.h>

extern void _printAnswer(void);

int main (int argc, char** argv)
{
    printf("Hello world\n");
    _printAnswer();

    return EXIT_SUCCESS;
}
