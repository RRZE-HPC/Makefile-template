CC  = icc
#CC  = icx # New LLVM-based C compiler
CXX = icpc
#CXX  = icpx # New LLVM-based C++ compiler
FC  = ifort
#FC  = ifx # New LLVM-based Fortran compiler
LINKER = $(CC)

CFLAGS   = -mmic -O3 -std=c99
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -O3 -module ./$(TAG)
VERSION  = -v
LFLAGS   = -mmic
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     =

