CC  = icc
#CC  = icx # New LLVM-based C compiler
CXX = icpc
#CXX  = icpx # New LLVM-based C++ compiler
FC  = ifort
#FC  = ifx # New LLVM-based Fortran compiler
LINKER = $(CC)

ifeq ($(strip $(ENABLE_OPENMP)),true)
OPENMP   = -qopenmp
endif

CFLAGS   = -O3 -std=c99 $(OPENMP)
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -O3 -module ./$(TAG)
VERSION  = --version
LFLAGS   = $(OPENMP)
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     =
