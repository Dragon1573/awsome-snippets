# 子命令组
set __ACTIONS_SUBCOMMAND i install c clean u uninstall update service b build g global q require f config r run p package create
set __PLUGINS_SUBCOMMAND doxygen repo plugin format project l lua check show watch m macro


function __fish_xmake_complete_no_subcommand
    # 扫描当前命令行里面有没有包含子命令
    for i in (commandline -opc)
        # XMake 提供了如下的操作和插件命令，它们都是子命令，需要单独标记
        if contains -- $i $__ACTIONS_SUBCOMMAND $__PLUGINS_SUBCOMMAND
            return 1
        end
    end
    return 0
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
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a install -d 'Package and install the target binary files.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a clean -d 'Remove all binary and temporary files.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a uninstall -d 'Uninstall the project binary files.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a update -d 'Update and uninstall the xmake program.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a service -d 'Start service for remote or distributed compilation and etc.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a build -d 'Build targets if no given tasks.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a global -d 'Configure the global options for xmake.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a require -d 'Install and update required packages.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a config -d 'Configure the project.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a run -d 'Run the project target.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a package -d 'Package target.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a create -d 'Create a new project.'
# 插件
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a doxygen -d 'Generate the doxygen document.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a repo -d 'Manage package repositories.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a plugin -d 'Manage plugins of xmake.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a format -d 'Format the current project.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a project -d 'Generate the project file.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a lua -d 'Run the lua script.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a check -d 'Check the project sourcecode and configuration.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a show -d 'Show the given project information.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a watch -d 'Watch the project directories and run command.'
complete -c xmake -f -n __fish_xmake_complete_no_subcommand -a macro -d 'Run the given macro.'

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

# check
complete -c xmake -A -n '__fish_seen_subcommand_from check' -s l -l list -d 'Show all supported checkers list.'
complete -c xmake -A -n '__fish_seen_subcommand_from check' -l info -x -d 'Show the given checker information.'

# clean
complete -c xmake -A -n '__fish_seen_subcommand_from clean' -s a -l all -d 'Clean all auto-generated files by xmake.'
