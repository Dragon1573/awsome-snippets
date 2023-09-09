--[[ XMake 项目配置文件 ]]
--[[ @Author Dragon1573 ]]

-- 配置语言标准
set_languages("c17", "c++23")

-- 全局默认链接数学库，即使它没有使用到
add_syslinks("m")

-- 将编译模式锁定在调试状态
add_rules("mode.debug")

-- 关闭一切编译优化
set_optimize("none")

-- C 的编译配置
target("c")
    -- 编译为二进制可执行文件
    set_kind("binary")

    -- 添加主函数文件
    add_files("c/src/*.c")

    -- 添加头文件路径
    add_includedirs("c/include", {public = true})
target_end()

-- C++ 的编译配置
target("x")
    -- 编译为二进制可执行文件
    set_kind("binary")

    -- 添加主函数文件
    add_files("cpp/src/*.cpp")

    -- 添加头文件路径
    add_includedirs("cpp/include", {public = true})
target_end()

-- C++ 的测试配置
target("test_x")
    -- 编译为二进制可执行文件
    set_kind("binary")

    -- 添加到测试任务组
    set_group("tests")

    -- 配置测试主函数文件
    add_files("cpp/test/test.cpp")

    -- 添加测试依赖项
    add_deps("x")

    -- 添加测试包
    add_packages("gtest")
target_end()

--
-- 如果您想了解更多有关 xmake 的用法，请参见 https://xmake.io
--
-- ## 常见问题
--
-- 请在构建项目之前进入项目目录
--
--   $ cd projectdir
--
-- 1. 如何构建项目？
--
--   $ xmake
--
-- 2. 如何配置项目？
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. 构建输出目录在哪里？
--
--   默认输出目录为 `./build` ，您可以配置输出目录。
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. 构建项目后如何运行和调试目标？
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. 如何将目标安装到系统目录或其他输出目录？
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. 在 `xmake.lua` 中添加一些常用的编译标志
--
-- @code
--    -- 添加调试和发布模式
--    add_rules("mode.debug", "mode.release")
--
--    -- 添加宏定义
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- 将所有警告视为错误
--    set_warnings("all", "error")
--
--    -- 设置语言标准版本
--    set_languages("c99", "c++11")
--
--    -- 设置优化程度: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- 添加包含搜索目录
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- 添加链接库和搜索目录
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- 添加系统链接库
--    add_syslinks("z", "pthread")
--
--    -- 添加编译和链接标志
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--
