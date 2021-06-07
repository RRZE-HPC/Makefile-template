CC  = gcc
CXX = g++
FC  = gfortran
LINKER = $(CC)

ANSI_CFLAGS  = -ansi
ANSI_CFLAGS += -std=c99
ANSI_CFLAGS += -pedantic
ANSI_CFLAGS += -Wextra

CFLAGS   = -O2 -g -Wno-format  -Wall $(ANSI_CFLAGS)
CXXFLAGS = $(CFLAGS)
FCFLAGS  =
VERSION  = -v
LFLAGS   =
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     =
