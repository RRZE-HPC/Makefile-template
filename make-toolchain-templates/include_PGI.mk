CC  = pgcc
CXX = pgcxx
FC  = pgf90
LINKER = $(CC)

ANSI_CFLAGS   =

CFLAGS   =  -O2 -fPIC
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -J ./  -fsyntax-only
VERSION  = -v
LFLAGS   =
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     =


