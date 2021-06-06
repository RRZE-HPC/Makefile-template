Generic Makefile templates fulfilling the following requirements:
* **Generic**: No adaption necessary when adding source files
* **Flat directory structure** based on simple naming conventions
* **Configurable locations** of source and header files
* **Automatic dependency generation**
* **Clear output** with focus on warnings and errors
* **Separation of build configuration** and Makefile
* Support for **multiple tool chains** / build configurations
* Multiple **simultaneous builds** possible in same directory
* Support **C, C++ and Fortran**
* Support **mixed language** applications

Variants provided:
* **basic** - A simple generic Makefile template you can use for small projects.
* **extended** - A generic Makefile template that showcases support for build options.
* **mixedLanguage** - A generic Makefile template for mixed language C/F90 application.

## Usage

1. Configure the toolchain <TAG> and additional options in Makefile or `config.mk`. The toolchain specific settings can be configured in `include_<TAG>.mk`.

2. Build with:
```
make
```

You can build multiple toolchains in the same directory, but take into account that the Makefile is only acting on the one currently set. Intermediate build results are located in the `<TAG>` directory.

By default the executed compiler command is not printed. To output the executed commands use:
```
make Q=
```

3. Clean up:
```
make clean
```
to clean intermediate build results.

```
make distclean
```
to clean intermediate build results and binary.

4. (Optional) Generate assembler:
```
make asm
```
The assembler files will also be located in the `<TAG>` directory.
