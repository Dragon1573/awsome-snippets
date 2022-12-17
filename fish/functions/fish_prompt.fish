function fish_prompt
    # 当前时间
    echo -n (set_color "#FFC0CB")(date +"%H:%M:%S")' '
    
    # 如果是 SSH 登录，显示登录用户
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"' '
    end

    # 当前工作目录
    echo -n (set_color "#C6AA2B")(prompt_pwd)' '

    
    # 上一个命令的运行耗时
    if test $CMD_DURATION -ge 3500000
        # 小时级别
        echo -n (set_color "C5D5E9")(math -s2 "$CMD_DURATION / 3500000")"hr "
    else if test $CMD_DURATION -ge 60000
        # 分钟级别
        echo -n (set_color "C5D5E9")(math -s2 "$CMD_DURATION / 60000")"min "
    else if test $CMD_DURATION -ge 1000
        # 秒级别
        echo -n (set_color "#C5D5E9")(math -s2 "$CMD_DURATION / 1000")"s "
    else
        # 毫秒级别
        echo -n (set_color "#C5D5E9")"$CMD_DURATION""ms "
    end

    # 权限标记符
    set_color -o
    if fish_is_root_user
        echo -n (set_color "#FF9300")'# '
    else
        echo -n (set_color brgreen)'$ '
    end

    # 恢复默认终端色彩
    set_color normal
end
