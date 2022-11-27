#!/usr/bin/env bash
# 自动升级 Microsoft Edge Driver

function run_upgrade {
  # 正式执行升级任务
  echo -e "\e[33m安装/升级任务：$1 ==> $2\e[0m"
  rm -rvf "/opt/microsoft/msedgedriver/*"
  wget -O "/tmp/edgedriver_linux64.zip" \
    "https://msedgedriver.azureedge.net/$2/edgedriver_linux64.zip" && \
    unzip "/tmp/edgedriver_linux64.zip" -d "/opt/microsoft/msedgedriver/" && \
    rm -rvf "/tmp/edgedriver_linux64.zip"
  return $?
}

# 权限检查
if [ "$(whoami)" != "root" ]; then
  echo -e "\e[31m权限错误！您需要使用 sudo 或以 root 身份执行！\e[0m"
  exit -1
fi

# 检查 Edge 和 Driver 版本
edge_stable=$(microsoft-edge-stable --version 2> /dev/null | awk '{print $3}')
edge_driver=$(/opt/microsoft/msedgedriver/msedgedriver --version 2> /dev/null | awk '{print $4}')
if [ -z "$edge_stable" ]; then
  # 没检测到 Edge Stable 版本
  echo -e "\e[31m未检测到主程序版本！可能您尚未安装 Microsoft Edge Stable for Linux ？"
  exit 1
elif [ -z "$edge_driver" ]; then
  # 没检测到 Edge Driver 版本
  echo -e "\e[31m未检测到驱动器版本！可能您尚未安装 Microsoft Edge Driver ？"
  echo -e "\e[32m是否下载并安装 Microsoft Edge Driver ？[Y/N]\e[0m"
  read response
  if [ -z "$response" ]; then
    response="Y"
  fi
  if [ "$response" == "y" ] || [ "$response" == "Y" ]; then
    edge_driver="Not installed"
    run_upgrade "$edge_driver" "$edge_stable"
    if [ $? ]; then
      echo -e "\e[32m已成功安装 Microsoft Edge Driver！\e[0m"
      echo -e "\e[32m当前驱动版本：$edge_stable\e[0m"
      echo -e "\e[32m安装路径：/opt/microsoft/msedgedriver/msedgedriver\e[0m"
      exit 0
    else
      echo -e "\e[031m驱动程序安装失败！请重试或手动完成安装！\e[0m"
    fi
  fi
elif [ "$edge_stable" == "$edge_driver" ]; then
  # 两者版本相互匹配，不需要执行升级
  echo -e "\e[32m当前驱动程序与主程序版本匹配，无需升级！\e[0m"
  exit 0
else
  # 两者版本不匹配，升级 Driver 版本
  echo -e "\e[33m检测到新版本！\e[0m"
  run_upgrade "$edge_driver" "$edge_stable"
  exit $?
fi