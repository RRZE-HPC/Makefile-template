CC  = armclang
CXX = armclang++
FC  = armflang
LINKER = $(CC)

ANSI_CFLAGS =

CFLAGS   =  -O2 -std=c99 -Wno-format -fPIC $(ANSI_CFLAGS)
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -J ./$(TAG)
VERSION  = -v
LFLAGS   =
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     =
