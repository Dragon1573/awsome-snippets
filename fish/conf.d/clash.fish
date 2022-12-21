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
    else
        echo -n "Proxy pass is "
        status_clash
    end
end

function disable_clash
    if test "$PROXY_ENABLED" = "true"
        # 去掉这个环境变量
        set -gx PROXY_ENABLED false
        sed -i '$s/true/false/g' ~/.config/fish/conf.d/clash.fish
        # 移除代理相关环境变量
        set -ge http_proxy
        set -ge https_proxy
    else
        echo -n "Proxy pass is "
        status_clash
    end
end

function status_clash
    if test "$PROXY_ENABLED" = "true"
        echo -e (set_color brgreen)"Enabled"(set_color normal)
    else if test "$PROXY_ENABLED" = "false"
        echo -e (set_color brred)"Disabled"(set_color normal)
    end
end

# 当前状态
set -gx PROXY_ENABLED true
