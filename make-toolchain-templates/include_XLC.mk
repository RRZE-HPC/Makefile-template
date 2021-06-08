CC  = xlc
CXX = xlc++
FC  = xlf
LINKER = $(CC)

ANSI_CFLAGS  = 

CFLAGS   = -O2 -g -Wno-format  -Wall $(ANSI_CFLAGS)
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -J ./$(TAG)
VERSION  = -v
LFLAGS   =
DEFINES  = -D_GNU_SOURCE
INCLUDES =
LIBS     =
