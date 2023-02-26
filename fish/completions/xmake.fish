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

# Emscripten Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l emsdk -r -F -d 'The emsdk directory'

# MingW Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l mingw -r -F -d 'The MingW SDK Directory'

# Other Configuration (config)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l debugger -x -d 'Set debugger (default: auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ccache -x -a 'y n'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l ccache -x -d 'Set the ccache directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l trybuild -x -a 'auto make autoconf cameke scons meson'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l trybuild -x -a 'bazel ninja msbuild xcode build ndkbuild xrepo'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l trybuild -x -d 'Set the ccache directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l tryconfigs -x -d 'Set the extra configurations of the third-party buildsystem for the try-build mode.'
complete -c xmake -A -n '__fish_seen_subcommand_from config' -s o -l buildir -r -F -d 'Set build directory. (default: build)'

# create
complete -c xmake -A -n '__fish_seen_subcommand_from create' -s f -l force -d 'Force to create project in a non-empty directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -s l -l language -x -a 'vala c++ go rust fortran swift pascal'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -s l -l language -x -a 'dlang objc++ nim cuda objc c zig'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -s l -l language -x -d 'The project language (default: c++)'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -n '__fish_seen_subcommand_from console' -s t -l template -x -a 'vala c++ go rust fortran swift pascal dlang objc++ nim cuda objc c zig'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -n '__fish_seen_subcommand_from qt.console qt.quickapp qt.quickapp_static qt.shared qt.static qt.widgetapp qt.widgetapp_static' -s t -l template -x -a 'c++'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -n '__fish_seen_subcommand_from shared' -s t -l template -x -a 'vala c++ fortran pascal dlang nim cuda c zig'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -n '__fish_seen_subcommand_from static' -s t -l template -x -a 'vala c++ go rust fortran dlang nim cuda c zig'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -n '__fish_seen_subcommand_from tbox.console tbox.shared tbox.static xmake.cli' -s t -l template -x -a 'c++ c'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -n '__fish_seen_subcommand_from xcode.bundle xcode.framework' -s t -l template -x -a 'objc++ objc'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -n '__fish_seen_subcommand_from xcode.iosapp xcode.iosapp_with_framework xcode.macapp xcode.macapp_with_framework' -s t -l template -x -a objc
complete -c xmake -A -n '__fish_seen_subcommand_from create' -s t -l template -x -d 'Select the project template id or name of the given language. (default: console)'
complete -c xmake -A -n '__fish_seen_subcommand_from create' -n __xmake_is_in_project -x -d Targets -a "(xmake show -l targets | string replace -ra '\e\[0m' '' | grep -P '\S+' -o)"

# doxygen
complete -c xmake -A -n '__fish_seen_subcommand_from doxygen' -r -F -s o -l outputdir -d 'Set the output directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from doxygen' -d 'Set the source code directory. (default: src)'

# format
complete -c xmake -A -n '__fish_seen_subcommand_from format' -x -s s -l style -a 'LLVM Google Chromium Mozilla Webkit'
complete -c xmake -A -n '__fish_seen_subcommand_from format' -x -s s -l style -d 'Set the path of .clang-format file, a coding style'
complete -c xmake -A -n '__fish_seen_subcommand_from format' -l create -d 'Create a .clang-format file from a coding style'
complete -c xmake -A -n '__fish_seen_subcommand_from format' -r -F -s f -d 'Set files path with pattern'

# global
complete -c xmake -A -n '__fish_seen_subcommand_from global' -s c -l clean -d 'Clean the cached user configs and detection cache.'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l check -d 'Just ignore detection cache and force to check all, it will reserve the cached user configs.'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l menu -d 'Configure with a menu-driven user interface.'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -x -l theme -a 'dark powershell plain ninja emoji light default'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -x -l theme -d 'The theme name. (default: default)'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -r -F -l debugger -d 'The debugger program path. (default: auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -r -F -l ccache -d 'Enable or disable the c/c++ compiler cache.'

# Build Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from global' -x -l build_warning -d 'Enable the warnings output by default when building.'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -r -F -l cachedir -d 'The global cache directory.'

# Network Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from global' -x -l network -a 'public private'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -x -l cachedir -d 'Set the network mode. (default: public)'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -x -l insecure-ssl -d 'Disable to check ssl certificates for downloading.'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -r -s x -l proxy -d 'Use proxy on given port. [protocol://]host[:port]'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -r -l proxy_hosts -d 'Only enable proxy for the given hosts list, it will enable all if be unset, and we can pass match pattern to list'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -r -F -l proxy_pac -d 'Set the auto proxy configuration file. (default: pac.lua)'

# Package Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l pkg_searchdirs -r -F -d 'The search directories of the remote package.'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l pkg_cachedir -r -F -d 'The cache root directory of the remote package.'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l pkg_installdir -r -F -d 'The install root directory of the remote package.'

# Cuda SDK Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l cuda -r -F -d 'The Cuda SDK Directory (default: auto)'

# Qt SDK Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from config' -l qt -r -F -d 'The Qt SDK Directory (default: auto)'

# Vcpkg Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l vcpkg -r -F -d 'The Vcpkg Directory (default: auto)'

# Android Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l ndk -r -F -d 'The NDK Directory'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l ndk_sdkver -x -d 'The SDK Version for NDK (default: auto)'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l android_sdk -r -F -d 'The Android SDK Directory'
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l build_toolver -x -d 'The Build Tool Version of Android SDK'

# Emscripten Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l emsdk -r -F -d 'The emsdk directory'

# MingW Configuration (global)
complete -c xmake -A -n '__fish_seen_subcommand_from global' -l mingw -r -F -d 'The MingW SDK Directory'

# install
complete -c xmake -A -n '__fish_seen_subcommand_from install' -s o -l installdir -r -F -d 'Set the install directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from install' -x -s g -l group -d 'Install all targets of the given group. It support path pattern matching.'
complete -c xmake -A -n '__fish_seen_subcommand_from install' -s a -l all -d 'Install all targets.'
complete -c xmake -A -n '__fish_seen_subcommand_from install' -l admin -d 'Try to request administrator permission to install'
complete -c xmake -A -n '__fish_seen_subcommand_from install' -n __xmake_is_in_project -x -d Targets -a "(xmake show -l targets | string replace -ra '\e\[0m' '' | grep -P '\S+' -o)"

# lua
complete -c xmake -A -n '__fish_seen_subcommand_from lua' -s l -l list -d 'List all scripts.'
complete -c xmake -A -n '__fish_seen_subcommand_from lua' -s c -l command -d 'Run script as command'
complete -c xmake -A -n '__fish_seen_subcommand_from lua' -x -s d -l deserialize -d 'Deserialize arguments starts with given prefix'
complete -c xmake -A -n '__fish_seen_subcommand_from lua' -x -d Scripts -a '(xmake lua -l | tail -n +2 | grep -P "\S+" -o)'

# macro
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -s b -l begin -d 'Start to record macro.'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -s e -l end -d 'Stop to record macro.'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -l show -d 'Show the content of the given macro.'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -s l -l list -d 'List all macros.'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -s d -l delete -d 'Delete the given macro.'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -s c -l clear -d 'Clear the all macros.'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -r -F -l import -d 'Import the given macro file or directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -r -F -l export -d 'Export the given macro to file or directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -x -a '.' -d 'Run the anonymous macro'
complete -c xmake -A -n '__fish_seen_subcommand_from macro' -x -a '..' -d 'Run the last command'

# package
complete -c xmake -A -n '__fish_seen_subcommand_from package' -r -F -s o -l outputdir -d 'Set the output directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -s a -l all -d 'Package all targets.'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -x -s f -l format -a 'oldpkg local remote'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -x -s f -l format -d 'Set the package format. (default: local)'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -x -l homepage -d 'Set the homepage of package.'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -x -l description -d 'Set the description of package.'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -x -l url -d 'Set the url of remote package.'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -x -l version -d 'Set the version of remove package.'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -x -l shasum -d 'Set the sha256 or commit of remote package.'
complete -c xmake -A -n '__fish_seen_subcommand_from package' -n __xmake_is_in_project -x -d Targets -a "(xmake show -l targets | string replace -ra '\e\[0m' '' | grep -P '\S+' -o)"

# plugin
complete -c xmake -A -n '__fish_seen_subcommand_from plugin' -s i -l install -d 'Install plugins.'
complete -c xmake -A -n '__fish_seen_subcommand_from plugin' -s u -l update -d 'Update plugins.'
complete -c xmake -A -n '__fish_seen_subcommand_from plugin' -s c -l clear -d 'Clear all installed plugins.'

# project
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -a 'make cmake ninja compile_flags'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -a xmakefile -d 'makefile with xmake'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -a xcode -d 'need cmake'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -a compile_commands -d 'clang compilation database with json format'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -a vs -d 'auto detect'
for year in (seq 2002 2022)
    complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -a "vs$year"
end
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -a vsxmake -d 'auto detect'
for year in (seq 2010 2022)
    complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -a "vsxmake$year"
end
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s k -l kind -d 'Install plugins.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s m -l modes -d 'Set the project modes.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -s a -l archs -d 'Set the project archs.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -l lsp -a 'clangd cpptools ccls'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -x -l lsp -d 'Set the LSP backend for compile_commands.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -d 'Set the output directory.' -F

# repo
complete -c xmake -A -n '__fish_seen_subcommand_from project' -f -s a -l add -d 'Add the given remote repository url.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -f -s r -l remove -d 'Remove the given remote repository url.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -f -s u -l update -d 'Update all local repositories from the remote.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -f -s c -l clear -d 'Clear all added repositories.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -f -s l -l list -d 'List all added repositories.'
complete -c xmake -A -n '__fish_seen_subcommand_from project' -f -s g -l global -d 'Save repository to global. (default: local)'

# run
complete -c xmake -A -n '__fish_seen_subcommand_from run' -x -s d -l debug -d 'Run and debug the given target.'
complete -c xmake -A -n '__fish_seen_subcommand_from run' -x -s a -l all -d 'Run all targets.'
complete -c xmake -A -n '__fish_seen_subcommand_from run' -x -s g -l group -d 'Run all targets of the given group. It support path pattern matching.'
complete -c xmake -A -n '__fish_seen_subcommand_from run' -r -F -s w -l workdir -d 'Work directory of running targets, default is folder of targetfile'
complete -c xmake -A -n '__fish_seen_subcommand_from run' -x -s j -l jobs -d 'Set the number of parallel compilation jobs. (default: 1)'
complete -c xmake -A -n '__fish_seen_subcommand_from run' -x -l detach -d 'Run targets in detached processes.'
complete -c xmake -A -n '__fish_seen_subcommand_from run' -n __xmake_is_in_project -x -d Targets -a "(xmake show -l targets | string replace -ra '\e\[0m' '' | grep -P '\S+' -o)"

# show
complete -c xmake -A -n '__fish_seen_subcommand_from show' -x -s l -l list -a 'platforms toolchains rules envs buildmodes themes architectures targets packages'
complete -c xmake -A -n '__fish_seen_subcommand_from show' -x -s l -l list -d 'Show the values list of the given name.'
complete -c xmake -A -n '__fish_seen_subcommand_from show' -x -s t -l target -d 'Show the information of the given target.'

# uninstall
complete -c xmake -A -n '__fish_seen_subcommand_from uninstall' -r -F -l installdir -d 'Set the install directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from uninstall' -x -s p -l prefix -d 'Set the prefix directory.'
complete -c xmake -A -n '__fish_seen_subcommand_from uninstall' -l admin -d 'Try to request administrator permission to uninstall'
complete -c xmake -A -n '__fish_seen_subcommand_from uninstall' -n __xmake_is_in_project -x -d Targets -a "(xmake show -l targets | string replace -ra '\e\[0m' '' | grep -P '\S+' -o)"

# update
complete -c xmake -A -n '__fish_seen_subcommand_from update' -f -l uninstall -d 'Uninstall the current xmake program.'
complete -c xmake -A -n '__fish_seen_subcommand_from update' -f -s s -l scriptonly -d 'Update scripts only.'
complete -c xmake -A -n '__fish_seen_subcommand_from update' -f -l integrate -d 'Integrate xmake with default shell.'
complete -c xmake -A -n '__fish_seen_subcommand_from update' -f -s f -l force -d 'Force to update and reinstall the given version.'

# watch
complete -c xmake -A -n '__fish_seen_subcommand_from watch' -x -s c -l commands -d 'Run the multiple commands instead of the default build command.'
complete -c xmake -A -n '__fish_seen_subcommand_from watch' -r -F -s s -l script -d 'Run the given lua script file.'
complete -c xmake -A -n '__fish_seen_subcommand_from watch' -r -F -s d -l watchdirs -d 'Set the given recursive watch directories, the project directories will be watched by default.'
complete -c xmake -A -n '__fish_seen_subcommand_from watch' -r -F -s p -l plaindirs -d 'Set the given non-recursive watch directories, the project directories will be watched by default.'
complete -c xmake -A -n '__fish_seen_subcommand_from watch' -r -F -s r -l run -d 'Build and run target.'
