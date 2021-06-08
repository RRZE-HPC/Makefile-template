Generic Makefile templates fulfilling the following requirements:
* **Generic**: No adaption necessary when adding source files
* **Flat directory structure** based on simple naming conventions
* **Configurable locations** of source and header files
* **Automatic dependency generation**
* **Clear output** with focus on warnings and errors
* **Separation of build configuration** and Makefile
* Support for **multiple tool chains** / build configurations
* Multiple **simultaneous builds** possible in same directory
* Support for **C, C++ and Fortran**
* Support for **mixed language** applications

Variants provided:
* **basic** - A simple generic Makefile template you can use for small projects.
* **extended** - A generic Makefile template that showcases support for build options.
* **mixedLanguage** - A generic Makefile template for a mixed language C/F90 application.

Other projects based on this template are:
* https://github.com/RRZE-HPC/TheBandwidthBenchmark
* https://github.com/RRZE-HPC/MD-Bench
* https://github.com/RRZE-HPC/likwid

**NOTICE for Fortran**

For Fortran90 the dependencies must be specified by hand. Add them in dep.mk and uncomment the line at the end of the Makefile.
You can find a real Fortran90 example [here](https://github.com/RRZE-HPC/HPCCG-F90). A discussion of Fortran90 build issues is for example [here](https://aoterodelaroza.github.io/devnotes/modern-fortran-makefiles/).
Flags must be set that specify that module files are located in `$(BUILD_DIR)`.

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
Clean intermediate build results.
```
make clean
```

Clean intermediate build results and binary.
```
make distclean
```

4. (Optional) Generate assembler:
The assembler files will also be located in the `<TAG>` directory.
```
make asm
```


5. (Optional) Toolchain infos:
Output the compiler version and currently set compiler flags.
```
make info
```

6. (Optional) Generate tags:
Creates tags with ctags.
```
make tags
```

