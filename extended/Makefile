
#CONFIGURE BUILD SYSTEM
TARGET	   = bench-$(TAG)
BUILD_DIR  = ./$(TAG)
SRC_DIR    = ./src
MAKE_DIR   = ./
Q         ?= @

#DO NOT EDIT BELOW
include $(MAKE_DIR)/config.mk
include $(MAKE_DIR)/include_$(TAG).mk
include $(MAKE_DIR)/include_LIKWID.mk
INCLUDES  += -I$(SRC_DIR)/includes

VPATH     = $(SRC_DIR)
ASM       = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.s,$(wildcard $(SRC_DIR)/*.c))
ASM      += $(patsubst $(SRC_DIR)/%.f90, $(BUILD_DIR)/%.s,$(wildcard $(SRC_DIR)/*.f90))
OBJ       = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o,$(wildcard $(SRC_DIR)/*.c))
OBJ      += $(patsubst $(SRC_DIR)/%.cc, $(BUILD_DIR)/%.o,$(wildcard $(SRC_DIR)/*.cc))
OBJ      += $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o,$(wildcard $(SRC_DIR)/*.cpp))
OBJ      += $(patsubst $(SRC_DIR)/%.f90, $(BUILD_DIR)/%.o,$(wildcard $(SRC_DIR)/*.f90))
OBJ      += $(patsubst $(SRC_DIR)/%.F90, $(BUILD_DIR)/%.o,$(wildcard $(SRC_DIR)/*.F90))
CPPFLAGS := $(CPPFLAGS) $(DEFINES) $(INCLUDES) $(OPTIONS)

${TARGET}: $(BUILD_DIR) $(OBJ)
	$(info ===>  LINKING  $(TARGET))
	$(Q)${LINKER} ${LFLAGS} -o $(TARGET) $(OBJ) $(LIBS)

$(BUILD_DIR)/%.o:  %.c $(MAKE_DIR)/include_$(TAG).mk
	$(info ===>  COMPILE  $@)
	$(Q)$(CC) -c $(CPPFLAGS) $(CFLAGS) $< -o $@
	$(Q)$(CC) $(CPPFLAGS) -MT $(@:.d=.o) -MM  $< > $(BUILD_DIR)/$*.d

$(BUILD_DIR)/%.s:  %.c
	$(info ===>  GENERATE ASM  $@)
	$(Q)$(CC) -S $(CPPFLAGS) $(CFLAGS) $< -o $@

$(BUILD_DIR)/%.s:  %.f90
	$(info ===>  GENERATE ASM  $@)
	$(Q)$(FC) -S  $(FCFLAGS) $< -o $@

$(BUILD_DIR)/%.o:  %.cc
	$(info ===>  COMPILE  $@)
	$(Q)$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $< -o $@
	$(Q)$(CXX) $(CPPFLAGS) -MT $(@:.d=.o) -MM  $< > $(BUILD_DIR)/$*.d

$(BUILD_DIR)/%.o:  %.cpp
	$(info ===>  COMPILE  $@)
	$(Q)$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $< -o $@
	$(Q)$(CXX) $(CPPFLAGS) -MT $(@:.d=.o) -MM  $< > $(BUILD_DIR)/$*.d

$(BUILD_DIR)/%.o:  %.f90
	$(info ===>  COMPILE  $@)
	$(Q)$(FC) -c  $(FCFLAGS) $< -o $@

$(BUILD_DIR)/%.o:  %.F90
	$(info ===>  COMPILE  $@)
	$(Q)$(FC) -c  $(CPPFLAGS)  $(FCFLAGS) $< -o $@

.PHONY: clean distclean tags info asm

clean:
	$(info ===>  CLEAN)
	@rm -rf $(BUILD_DIR)
	@rm -f tags

distclean: clean
	$(info ===>  DIST CLEAN)
	@rm -f $(TARGET)

info:
	$(info $(CFLAGS))
	$(Q)$(CC) $(VERSION)

asm:  $(BUILD_DIR) $(ASM)

tags:
	$(info ===>  GENERATE TAGS)
	$(Q)ctags -R

$(BUILD_DIR):
	@mkdir $(BUILD_DIR)

-include $(OBJ:.o=.d)

# Add explicit dependencies for Fortran90 modules
#include $(MAKE_DIR)/dep.mk
