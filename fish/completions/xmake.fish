# Subcommand group
set __ACTIONS_SUBCOMMAND install clean uninstall update service build global require config run package create
set __PLUGINS_SUBCOMMAND doxygen repo plugin format project lua check show watch macro


function __xmake_complete_no_subcommand
    # Check if current commandline contains the above subcommands
    for i in (commandline -opc)
        # XMake provides following subcommands for "Action" and "Plugin"
        # We have to seperate them
        if contains -- $i $__ACTIONS_SUBCOMMAND $__PLUGINS_SUBCOMMAND
            return 1
        end
    end
    return 0
end

function __xmake_is_in_project
    # Check if the current working directory is a XMake project
    if test (xmake show -l targets | grep "error")
        return 1
    else
        return 0
    end
end

### 全局通用参数
complete -c xmake -s q -l quiet -d 'Quiet operation.'
complete -c xmake -s y -l yes -d 'Input yes by default if need user confirm.'
complete -c xmake -l confirm -x -a yes -d 'Input yes by default if need user confirm.'
complete -c xmake -l confirm -x -a no -d 'Input no by default if need user confirm.'
complete -c xmake -l confirm -x -a def -d 'Input def by default if need user confirm.'
complete -c xmake -l confirm -x -d 'Input the given result if need user confirm.'
complete -c xmake -s v -l verbose -d 'Print lots of verbose information for users.'
complete -c xmake -l root -d 'Allow to run xmake as root.'
complete -c xmake -s D -l diagnosis -d 'Print lots of diagnosis information (backtrace, check info ..) only for developers.'
complete -c xmake -l version -d 'Print the version number and exit.'
complete -c xmake -s h -l help -d 'Print this help message and exit.'
complete -c xmake -s F -l file -r -F -d 'Read a given xmake.lua file.'
complete -c xmake -s P -l project -r -d 'Change to the given project directory.'

### 子命令（Task）
# 操作
complete -c xmake -f -n __xmake_complete_no_subcommand -a install -d 'Package and install the target binary files.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a clean -d 'Remove all binary and temporary files.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a uninstall -d 'Uninstall the project binary files.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a update -d 'Update and uninstall the xmake program.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a service -d 'Start service for remote or distributed compilation and etc.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a build -d 'Build targets if no given tasks.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a global -d 'Configure the global options for xmake.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a require -d 'Install and update required packages.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a config -d 'Configure the project.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a run -d 'Run the project target.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a package -d 'Package target.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a create -d 'Create a new project.'

# 插件
complete -c xmake -f -n __xmake_complete_no_subcommand -a doxygen -d 'Generate the doxygen document.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a repo -d 'Manage package repositories.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a plugin -d 'Manage plugins of xmake.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a format -d 'Format the current project.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a project -d 'Generate the project file.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a lua -d 'Run the lua script.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a check -d 'Check the project sourcecode and configuration.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a show -d 'Show the given project information.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a watch -d 'Watch the project directories and run command.'
complete -c xmake -f -n __xmake_complete_no_subcommand -a macro -d 'Run the given macro.'

### 子命令相关参数补全
# build
complete -c xmake -A -n '__fish_seen_subcommand_from build' -s b -l build -d 'Build target. This is default building mode and optional.'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -s r -l rebuild -d 'Rebuild the target.'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -s a -l all -d 'Build all targets.'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -s g -l group -r -d 'Build all targets of the given group. It support path pattern matching.'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -l dry-run -d 'Dry run to build target.'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -s j -l jobs -r -d 'Set the number of parallel compilation jobs. (default: 10)'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -l linkjobs -r -d 'Set the number of parallel link jobs.'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -s w -l warning -d 'Enable the warnings output.'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -l files -x -d 'Build the given source files.'
complete -c xmake -A -n '__fish_seen_subcommand_from build' -n __xmake_is_in_project -x -d Targets -a "(xmake show -l targets | string replace -ra '\e\[0m' '' | grep -P '\S+' -o)"

# check
complete -c xmake -A -n '__fish_seen_subcommand_from check' -s l -l list -d 'Show all supported checkers list.'
complete -c xmake -A -n '__fish_seen_subcommand_from check' -l info -x -d 'Show the given checker information.'

# clean
complete -c xmake -A -n '__fish_seen_subcommand_from clean' -s a -l all -d 'Clean all auto-generated files by xmake.'
complete -c xmake -A -n '__fish_seen_subcommand_from clean' -n __xmake_is_in_project -x -d Targets -a "(xmake show -l targets | string replace -ra '\e\[0m' '' | grep -P '\S+' -o)"

# config
complete -c xmake -A -n '__fish_seen_subcommand_from config' -s c -l clean -d 'Clean the cached user configs and detection cache.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l check -d 'Just ignore detection cache and force to check config, it will reserve the cached user configs.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l export -r -F -d 'Export the current configuration to the given file.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l import -r -F -d 'Import configs from the given file.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l menu -d 'Configure project with a menu-driven user interface.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n __xmake_is_in_project -s p -l plat -x -a '(xmake show -l platforms | string replace -ra "\e\[0m" "" | grep -P "\S+" -o)'
-complete -c xmake -A -n '__fish_seen_subcommand_from config' -s p -l plat -x -d 'Compile for the given platform. (default: auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from linux' -s a -l arch -x -a 'i386 x86_64 armv7 armv7s arm64-v8a mips mips64 mipsel mips64el'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from android' -s a -l arch -x -a 'armeabi armeabi-v7a arm64-v8a x86 x86_64 mips mip64'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from wasm' -s a -l arch -x -a wasm32
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from haiku msys bsd cygwin' -s a -l arch -x -a 'i386 x86_64'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from iphoneos macosx' -s a -l arch -x -a 'arm64 x86_64'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from cross' -s a -l arch -x -a 'i386 x86_64 arm arm64 mips mips64 riscv riscv64 s390x ppc ppc64 sh4'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from appletvos' -s a -l arch -x -a 'arm64 armv7 armv7s i386 x86_64'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from watchos' -s a -l arch -x -a 'armv7k i386'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from mingw' -s a -l arch -x -a 'i386 x86_64 arm arm64'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n '__fish_seen_subcommand_from windows' -s a -l arch -x -a 'x86 x64 arm64'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -s a -l arch -x -d 'Compile for the given architecture. (default: auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -s m -l mode -x -a 'debug release'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -s m -l mode -x -d 'Compile for the given mode. (default: auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -s k -l kind -x -a 'static shared binary'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -s k -l kind -x -d 'Compile for the given target kind. (default: static)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l host -x -d 'Set the current host environment. (default: linux)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l policies -x -d 'Set the project policies.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -n __xmake_is_in_project -x -d Targets -a "(xmake show -l targets | string replace -ra '\e\[0m' '' | grep -P '\S+' -o)"

# Package Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l require -x -a 'yes no'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l require -x -d 'Require all dependent packages?'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l pkg_searchdirs -r -F -d 'The search directories of the remote package.'

# Cross Complation Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cross -x -d 'Set cross toolchains prefix'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l target_os -x -d 'Set target os only for cross-complation'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l bin -r -F -d 'Set cross toolchains bin directory'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l sdk -r -F -d 'Set cross SDK directory'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a llvm -d 'A collection of modular and reusable compiler and toolchain technologies'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gnu-rm -d 'GNU Arm Embedded Toolchain'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a c51 -d 'Keil development tools for the 8051 Microcontroller Architecture'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a iverilog -d 'Icarus Verilog'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a xcode -d 'Xcode IDE'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a go -d 'Go Programming Language Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a rust -d 'Rust Programming Language Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gcc-12 -d 'GNU Compiler Collection (12)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a sdcc -d 'Small Device C Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a nasm -d 'NASM Assembler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a masm32 -d 'The MASM32 SDK'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a clang -d 'A C language family frontend for LLVM'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a emcc -d 'A toolchain for compiling to asm.js and WebAssembly'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a swift -d 'Swift Programming Language Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a dpcpp -d 'Intel LLVM C++ Compiler for data parallel programming model based on Khronos SYCL'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gcc-10 -d 'GNU Compiler Collection (10)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a yasm -d 'The Yasm Modular Assembler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a circle -d "A new C++20 compiler. It's written from scratch and designed for easy extension."
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a verilator -d 'Verilator open-source SystemVerilog simulator and lint system'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a icc -d 'Intel C/C++ Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gcc -d 'GNU Compiler Collection'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gcc-8 -d 'GNU Compiler Collection (8)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gcc-13 -d 'GNU Compiler Collection (13)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a fpc -d 'Free Pascal Programming Language Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a cross -d 'Common cross compilation toolchain'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a ifort -d 'Intel Fortran Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a icx -d 'Intel LLVM C/C++ Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a dmd -d 'D Programming Language Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a fasm -d 'Flat Assembler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a dlang -d 'D Programming Language Compiler (Auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a clang-cl -d 'LLVM Clang C/C++ Compiler compatible with msvc'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gcc-9 -d 'GNU Compiler Collection (9)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a muslcc -d 'The musl-based cross-compilation toolchains'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a envs -d 'Environment variables toolchain'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a wasi -d 'WASI-enabled WebAssembly C/C++ toolchain.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a armclang -d 'ARM Compiler Version 6 of Keil MDK'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a ldc -d 'The LLVM-based D Compiler.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a nim -d 'Nim Programming Language Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a clang-12 -d 'A C language family frontend for LLVM (12)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a tinycc -d 'Tiny C Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a clang-13 -d 'A C language family frontend for LLVM (13)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a cuda -d 'CUDA Toolkit (nvcc, nvc, nvc++, nvfortran)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gcc-4.8 -d 'GNU Compiler Collection (4.8)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a armcc -d 'ARM Compiler Version 5 of Keil MDK'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a mingw -d 'Minimalist GNU for Windows'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gcc-4.9 -d 'GNU Compiler Collection (4.9)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a clang-15 -d 'A C language family frontend for LLVM (15)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a msvc -d 'Microsoft Visual C/C++ Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a ndk -d 'Android NDK'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gdc -d 'The GNU D Compiler (GDC).'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a clang-14 -d 'A C language family frontend for LLVM (14)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a gfortran -d 'GNU Fortran Programming Language Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -a zig -d 'Zig Programming Language Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l toolchain -x -d 'Set toolchain name'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l dc -r -F -d 'The Dlang Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l dcld -r -F -d 'The Dlang Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l dcar -r -F -d 'The Dlang Static Library Archiver'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l dcsh -r -F -d 'The Dlang Shared Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l links -r -F -d 'The Link Libraries'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l syslinks -r -F -d 'The System Link Libraries'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l linkdirs -r -F -d 'The Link Search Directories'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l includedirs -r -F -d 'The Include Search Directories'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l as -r -F -d 'The Assembler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ar -r -F -d 'The Static Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ld -r -F -d 'The Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l sh -r -F -d 'The Shared Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l asflags -x -d 'The Assembler Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ldflag -x -d 'The Binary Linker Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l arflags -x -d 'The Static Library Linker Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l shflags -x -d 'The Shared Library Linker Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l mm -r -F -d 'The Objc Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l mxx -r -F -d 'The Objc++ Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l mflags -x -d 'The Objc Compiler Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l mxflags -x -d 'The Objc/c++ Compiler Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l mxxflags -x -d 'The Objc++ Compiler Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l frameworks -x -d 'The Frameworks'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l frameworkdir -r -F -d 'The Frameworks Search Directories'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l zc -r -F -d 'The Zig Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l zcld -r -F -d 'The Zig Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l zcar -r -F -d 'The Zig Static Library Archiver'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l zcsh -r -F -d 'The Zig Shared Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l go -r -F -d 'The Golang Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l gcld -r -F -d 'The Golang Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l go-ar -r -F -d 'The Golang Static Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cu -r -F -d 'The Cuda Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cu-ccbin -r -F -d 'The Cuda Host C++ Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l culd -r -F -d 'The Cuda Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cuflags -x -d 'The Cuda Compiler Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l culdflags -x -d 'The Cuda Linker Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l fc -r -F -d 'The Fortran Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l fcld -r -F -d 'The Fortran Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l fcsh -r -F -d 'The Fortran Shared Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cc -r -F -d 'The C Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cxx -r -F -d 'The C++ Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cpp -r -F -d 'The C Preprocessor'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ranlib -r -F -d 'The Static Library Index Generator'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cflags -x -d 'The C Compiler Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cxflags -x -d 'The C/C++ compiler Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cxxflags -x -d 'The C++ Compiler Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l rc -r -F -d 'The Rust Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l rcld -r -F -d 'The Rust Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l rcar -r -F -d 'The Rust Static Library Archiver'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l rcsh -r -F -d 'The Rust Shared Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l sc -r -F -d 'The Swift Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l scld -r -F -d 'The Swift Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l scsh -r -F -d 'The Swift Shared Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l nc -r -F -d 'The Nim Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ncld -r -F -d 'The Nim Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ncar -r -F -d 'The Nim Static Library Archiver'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ncsh -r -F -d 'The Nim Shared Library Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l mrc -r -F -d 'The Microsoft Resource Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l mrcflags -x -d 'The Microsoft Resource Flags'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l pc -r -F -d 'The Pascal Compiler'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l pcld -r -F -d 'The Pascal Linker'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l pcsh -r -F -d 'The Pascal Shared Library Linker'

# Cuda SDK Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l cuda -r -F -d 'The Cuda SDK Directory (default: auto)'

# Qt SDK Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l qt -r -F -d 'The Qt SDK Directory (default: auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l qt_sdkver -x -d 'The Qt SDK Directory (default: auto)'

# Vcpkg Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l vcpkg -r -F -d 'The Vcpkg Directory (default: auto)'

# Android Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ndk -r -F -d 'The NDK Directory'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ndk_sdkver -x -d 'The SDK Version for NDK (default: auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l android_sdk -r -F -d 'The Android SDK Directory'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l build_toolver -x -d 'The Build Tool Version of Android SDK'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ndk_stdcxx -x -a 'y n'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ndk_stdcxx -x -d 'Use stdc++ library for NDK (default: y)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ndk_cxxstl -x -a 'c++_static c++_shared gnustl_static'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ndk_cxxstl -x -d 'The stdc++ stl library for NDK'
