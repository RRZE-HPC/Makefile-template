CC   = clang
CXX  = $(CC)
FC   = flang
LINKER = $(CC)

ifeq ($(strip $(ENABLE_OPENMP)),true)
OPENMP   = -fopenmp
#OPENMP   = -Xpreprocessor -fopenmp #required on Macos with homebrew libomp
LIBS     = # -lomp
endif

VERSION  = --version
CFLAGS   = -Ofast -std=c99 $(OPENMP)
CXXFLAGS = $(CFLAGS)
FCFLAGS  = -J ./$(TAG)
VERSION  = -v
LFLAGS   = $(OPENMP)
DEFINES  = -D_GNU_SOURCE
INCLUDES =
