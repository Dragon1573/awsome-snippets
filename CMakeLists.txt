cmake_minimum_required(VERSION 3.20.2)      # CMake 版本
project(CMake)                              # 项目名称
include_directories(inc)                    # 头文件目录
aux_source_directory(src DIR_SRCS)          # 源文件目录
set(MAIN ${DIR_SRCS})                       # 主程序名称
set(PROJECT_BINARY_DIR target)              # 编译输出目录
set(CMAKE_CXX_STANDARD_REQUIRED 20)         # C++ 标准版本
set(CMAKE_C_STANDARD_REQUIRED 17)           # C 标准版本
add_executable(${PROJECT_NAME} ${MAIN})     # 指定目标可执行文件

#[[ 配置 CMake 编译参数列表 ]]
if (CMAKE_SYSTEM_NAME MATCHES "Windows")
    # 将下列警告视为错误
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /we4013 /we4431 /we4133 /we4716 /we6244 /we6246 /we4457 /we4456 /we4172 /we4700 /we4477 /we4018 /we4047")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /we4013 /we4431 /we4133 /we4716 /we6244 /we6246 /we4457 /we4456 /we4172 /we4700 /we4477 /we4018 /we4047")
elseif (CMAKE_SYSTEM_NAME MATCHES "Linux" OR CMAKE_SYSTEM_NAME MATCHES "Darwin")
    # 将下列警告视为错误
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=implicit-function-declaration -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=return-type -Werror=shadow -Werror=return-local-addr -Werror=uninitialized -Werror=format -Werror=sign-compare -Werror=int-conversion")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror=return-type -Werror=shadow -Werror=return-local-addr -Werror=uninitialized -Werror=format -Werror=sign-compare")
endif ()
