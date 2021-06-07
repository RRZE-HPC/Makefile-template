CC  = icc
CXX = icpc
FC  = ifort
LINKER = $(CC)

CFLAGS   = -O3 -std=c99
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -O3 -module ./$(TAG)
VERSION  = -v 
LFLAGS   =
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     = -lifcore
