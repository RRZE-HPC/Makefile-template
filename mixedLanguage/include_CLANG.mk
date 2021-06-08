CC   = clang
CXX  = $(CC)
FC   = flang
LINKER = $(CC)

CFLAGS   = -O3 -std=c99
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -J ./$(TAG)
VERSION  = -v
LFLAGS   =
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     = -lflang
