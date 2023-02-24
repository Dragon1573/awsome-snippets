# :sparkles: 实用配置文件集合

当你刚安装完一个软件，发现这个软件的配置文件无比复杂，但又按捺不住自己希望软件样式花里胡哨？那么你来对了！

这个仓库存储了一些常用软件的配置文件，它们大部分开箱即用，下载到特定的目录就能够自动生效，但仍有极少数需要您手动修改配置文件

快来试试吧 :heart:

## 开箱即用的配置文件

安装了相应的工具之后，将下列配置文件放置于指定的位置即可开箱即用！

- CMake: `<workspace_folder>/CMakeLists.txt`
- XMake: `<workspace_folder>/xmake.lua`

## 手动修改的配置文件

这些配置文件需要与你现有的配置内容合并，它们不应该彻底替换你的配置文件内容。你可以考虑复制以下配置文件的内容，并附加在现有配置文件的末尾

- Powershell: `~/Documents/Powershell/Microsoft.PowerShell_profile.ps1`

## 其他特殊的配置文件

### Aria2

[Aria2](https://aria2.github.io/) 配置文件归档在 `aria2` 目录下，用户将此目录下的 `aria2.conf` 下载到本地，启动时使用
`--conf-path` 指定使用此配置文件即可生效。

### Fish

[Fish Shell](https://fishshell.com/) 配置文件归档在 `fish` 目录下，用户将此目录整个下载并重命名为 `~/.config/fish/` ，即可直接使用

### Lazygit

[Lazygit](https://github.com/jesseduffield/lazygit) 配置文件归档在 `lazygit` 目录下，用户将此目录整个下载并重命名为 `~/.config/lazygit` ，还需要安装 `git-delta` 才能使配置文件完全可用并生效

### Neofetch (HyFetch)

[Neofetch](https://github.com/dylanaraps/neofetch) 和 [HyFetch](https://github.com/hykilpikonna/hyfetch) 配置文件归档在 `neofetch` 目录下，它们共享相同的配置文件

将此目录整个下载并重命名为 `~/.config/neofetch` 后既可直接使用

### NeoVim

[NeoVim](https://neovim.io/) 配置文件统一归档在 `nvim` 目录之下，用户将此目录整个下载并重命名为 `~/.config/nvim/` 后，还需要执行如下操作：

1. 确保您的 NeoVim 版本在 `0.4.0` 以上
2. 确保您安装了 Nodejs 14.14 及以上版本
3. 普通 Linux 用户请在 `init.vim` 文件里使用带 `"` 的相对路径
4. 下载和更新插件分别执行 `:PlugInstall` 和 `:PlugUpdate` ， 清除插件执行 `:PlugClear`
5. 使用 `:CocInstall` 前缀命令安装您需要的语言插件，比如 `:CocInstall coc-pyright`
6. 如果需要用 SSH 来更新 vimPlug 在 `vim-plug.vim` 文件更改

### Oh My Posh

[Oh My Posh](https://ohmyposh.dev/) 配置文件归档在 `oh-my-posh` 目录下，用户将此目录整个下载并重命名为 `~/.config/oh-my-posh` 后，按照官方文档安装 Oh My Posh 并使用此主题文件

### Pip

[Pip](https://pip.pypa.io/en/stable/) 配置文件归档在 `pip` 目录下，用户将此目录整个下载并重命名为 `~/.config/pip/` 。确保您已经安装了 `python3-pip` 

如果您使用的是 Windows ，请将此目录重命名为 `%USERPROFILE%/pip` ，并将其中的 `pip.conf` 重命名为 `pip.ini` 

### Poetry

[Python Poetry](https://python-poetry.org/) 配置文件归档在 `pypoetry` 目录下，用户将此目录整个下载并重命名为 `~/.config/pypoetry` ，还需要执行如下操作：

1. 安装 Python 3.7 及以上版本
2. 安装最新版本 Poetry

### Windows Subsystem Linux 2

为了方便使用 WSL2 ，我特地编写了一些小脚本用来提升工作效率。你只需要将本项目 `sbin` 目录下的所有文件下载到 `/usr/local/sbin/` 目录下，并授予 `-rwxr-xr-x` （即 `0755` ）权限即可使用

### Virtualenv

[Virtualenv](https://virtualenv.pypa.io/en/latest/) 配置文件归档在 `virtualenv` 目录下，用户将此目录整个下载并重命名为 `~/.config/virtualenv/`，还需要执行如下操作：

1. 如果您使用的是 Linux ，请尝试安装 `python3-pip` 、 `python3-venv` 和 `python3-virtualenv`
2. 如果您使用的是 Windows ，请尝试 `pip install -U virtualenv`
3. 我没有使用过 macOS ，请尝试一下 Linux 的解决方案

### Winget (Windows Package Manager CLI)

[Winget](https://github.com/microsoft/winget-cli) 配置文件归档在 `winget` 目录下，用户将此目录下的所有文件下载到
`%APPDATA%/Local/Packages/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe/LocalState/` 目录中，即可自动加载此配置
