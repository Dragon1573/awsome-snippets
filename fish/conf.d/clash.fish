# Automatically connect WSL2 to Clash for Windows
set CLASH_SERVER (grep 'nameserver' /mnt/wsl/resolv.conf | awk '{print $2}')
set CLASH_PORT (grep 'mixed-port' /mnt/c/Users/Dragon1573/.config/clash/config.yaml | awk '{print $2}')
set -gx http_proxy "http://$CLASH_SERVER:$CLASH_PORT/"
set -gx https_proxy "http://$CLASH_SERVER:$CLASH_PORT/"
