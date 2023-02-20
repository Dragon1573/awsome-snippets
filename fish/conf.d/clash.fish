# 让 WSL2 自动连接 Windows 上的 Clash for Windows
function enable_clash
    # 添加一个环境变量
    if test "$PROXY_ENABLED" = "false"
        # 修改环境变量值
        set -gx PROXY_ENABLED true
        sed -i '$s/false/true/g' ~/.config/fish/conf.d/clash.fish

        # 配置代理所需的环境变量
        set CLASH_SERVER (grep 'nameserver' /mnt/wsl/resolv.conf | awk '{print $2}')
        set CLASH_PORT (grep 'mixed-port' /mnt/c/Users/Dragon1573/.config/clash/config.yaml | awk '{print $2}')
        set -gx http_proxy "http://$CLASH_SERVER:$CLASH_PORT/"
        set -gx https_proxy "http://$CLASH_SERVER:$CLASH_PORT/"

        # 流编辑实现魔法
        echo 'set -gx http_proxy' "http://$CLASH_SERVER:$CLASH_PORT" >> ~/.config/fish/conf.d/clash.fish
        echo 'set -gx https_proxy' "http://$CLASH_SERVER:$CLASH_PORT" >> ~/.config/fish/conf.d/clash.fish
    end
    status_clash
end

function disable_clash
    if test "$PROXY_ENABLED" = "true"
        set -gx PROXY_ENABLED false
        sed -i '$s/true/false/g' ~/.config/fish/conf.d/clash.fish

        # 移除代理相关环境变量
        set -ge http_proxy
        set -ge https_proxy

        # 流编辑实现魔法
        sed -i '48,49d' ~/.config/fish/conf.d/clash.fish
    end
    status_clash
end

function status_clash
    # 直接展示本配置文件「当前状态」段的内容
    grep -A 4 '# 当前状态' ~/.config/fish/conf.d/clash.fish
end

# 当前状态
set -gx PROXY_ENABLED false
