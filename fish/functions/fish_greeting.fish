function fish_greeting
    set RELEASE_VERSION (lsb_release -r | awk '{print $2}')
    set CODE_VERSION (lsb_release -c | awk '{print $2}')
    echo "欢迎使用 Ubuntu $RELEASE_VERSION $CODE_VERSION 和 Fish Shell ！"
    echo -e '输入 \e[32mhelp\e(B\e[m 查看使用指南'
    echo
    fortune-zh
end
