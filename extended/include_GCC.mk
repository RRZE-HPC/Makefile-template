CC   = gcc
CXX = g++
FC  = gfortran
LINKER = $(CC)

ifeq ($(strip $(ENABLE_OPENMP)),true)
OPENMP   = -fopenmp
endif

CFLAGS   = -Ofast -ffreestanding -std=c99 $(OPENMP)
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -J ./$(TAG)
VERSION  = -v
LFLAGS   = $(OPENMP)
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     =
