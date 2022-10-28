# 【注意事项】
# 由于本脚本需要调用 netsh.exe 创建/删除规则
# 请以管理员身份运行以下函数

### 查询 Windows 内置端口转发列表
function Forwardings() {
    netsh interface portproxy show all
}

### 新建 Windows 内置端口转发规则
#
# 使用 netsh.exe 实现 Windows 端口转发能力
#
# 参数列表
# --------
# PortMappings: string[]
#     端口映射列表，以 "Host1:Guest1,Host2:Guest2,..." 形式组成
#     其中 Host 或 Guest 可以为单个端口 "Port"
#     也可以为端口范围 "Begin-End"
#     范围包含两侧端点
# Guest: string
#     目标主机，当前仅支持 IPv4 地址
function Expose {
    param (
        [Parameter(Mandatory)] [string[]]$PortMappings,
        [Parameter(Mandatory)] [string]$Guest
    )

    if (($PortMappings.Count -lt 1) -or ($Guest -notmatch "[\d+.]{4}")) {
        Write-Output "Usage: Expose -PortMappings <Host1:Guest1>, [Host2:Guest2], ... -Guest <Guest_IP>"
        exit 1
    }

    foreach ($mapping in $PortMappings) {
        # Port Mappings are in "host:guest" format
        $array = $mapping.Split(":")
        if ($array.Get(0).Contains("-") -and $array.Get(1).Contains("-")) {
            # There are multiple continuous ports should be forwarded
            $hostArray = $array.Get(0).Split("-")
            $guestArray = $array.Get(1).Split("-")
            if (($hostArray.Get(1) - $hostArray.Get(0)) -eq ($guestArray.Get(1) - $guestArray.Get(0))) {
                $count = [int]($hostArray.Get(1) - $hostArray.Get(0))
                for ($i = 0; $i -le $count; $i++) {
                    $h = [int]($hostArray.Get(0)) + $i
                    $g = [int]($guestArray.Get(0)) + $i
                    netsh interface portproxy add v4tov4 listenport=$h listenaddress=0.0.0.0 connectport=$g connectaddress=$Guest | Out-Null
                    if ($?) {
                        Write-Output "Port forwarding Created: ${Guest}:$g --> 0.0.0.0:$h"
                    }
                }
            }
            else {
                # Port counts should always match
                Write-Output "Mismatch counts of port forwarding!"
                exit 1
            }
        }
        else {
            $hostPort = $array.Get(0)
            $guestPort = $array.Get(1)
            netsh interface portproxy add v4tov4 listenport=$hostPort listenaddress=0.0.0.0 connectport=$guestPort connectaddress=$Guest | Out-Null
            if ($?) {
                Write-Output "Port forwarding Created: ${Guest}:$guestPort --> 0.0.0.0:$hostPort"
            }
        }
    }

    Write-Output ""
    netsh interface portproxy show all
}

### 移除 Windows 内置端口转发规则
#
# 参数列表
# --------
# Ports: string[]
#     端口列表，以 "Ports1,Ports2,..." 形式组成
#     其中 Ports 可以是单个端口 "Port"
#     也可以是一段连续的端口范围 "Begin-End"
#     其中范围包含两侧端点
function Cover {
    param (
        [Parameter(Mandatory)] [string[]]$Ports
    )

    if ($Ports.Count -lt 1) {
        Write-Output "Usage: Cover -Ports <Port1>, [Port2], ..."
        exit 1
    }

    foreach ($Port in $Ports) {
        if ($Port.Contains("-")) {
            # There are multiple continuous ports should be forwarded
            $PortRange = $Port.Split("-")
            $beginPort = [Int32]($PortRange.Get(0))
            $endPort = [Int32]($PortRange.Get(1))
            foreach ($p in $beginPort..$endPort) {
                netsh interface portproxy delete v4tov4 $p 0.0.0.0 | Out-Null
                if ($?) {
                    Write-Output "Port forwarding deleted: 0.0.0.0:$p"
                }
            }
        }
        else {
            netsh interface portproxy delete v4tov4 $Port 0.0.0.0 | Out-Null
            if ($?) {
                Write-Output "Port forwarding deleted: 0.0.0.0:$Port"
            }
        }
    }

    Write-Output ""
    netsh interface portproxy show all
}
