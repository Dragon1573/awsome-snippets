# :sparkles: 实用配置文件集合

当你刚安装完一个软件，发现这个软件的配置文件无比复杂，但又按捺不住自己希望软件样式花里胡哨？那么你来对了！

这个仓库存储了一些常用软件的配置文件，它们大部分开箱即用，下载到特定的目录就能够自动生效，但仍有极少数需要您手动修改配置文件。

快来试试吧 :heart:

## 开箱即用的配置文件

- Conda: `~/.condarc`
- CMake: `$WORKSPACE/CMakeList.txt`
- Oh My Posh 3: `~/.config/oh-my-posh3/half-life.schema.json`
- Jupyter Notebook: `~/.jupyter/jupyter_notebook_config.py`
- Neofetch: `~/.config/neofetch/config.conf`
- Winget: `~/AppData/Local/Packages/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe/LocalState/settings.json`
- Microsoft Edge Driver: `/usr/local/bin/upgrade-msedgedriver.sh`

## 手动修改的配置文件

这些配置文件需要与你现有的配置内容合并，它们不应该彻底替换你的配置文件内容。你可以考虑复制以下配置文件的内容，并附加在现有配置文件的末尾。

- Powershell: `~/Documents/Powershell/Microsoft.PowerShell_profile.ps1`

## 其他特殊的配置文件

### Fish

[Fish Shell](https://fishshell.com/) 配置文件归档在 `fish` 目录下，用户将此目录整个下载并重命名为 `~/.config/fish/` ，即可直接使用。

### Lazygit

[Lazygit](https://github.com/jesseduffield/lazygit) 配置文件归档在 `lazygit` 目录下，用户将此目录整个下载并重命名为 `~/.config/lazygit` ，还需要安装 `git-delta` 才能使配置文件完全可用并生效。

### NeoVim

[NeoVim](https://neovim.io/) 配置文件统一归档在 `nvim` 目录之下，用户将此目录整个下载并重命名为 `~/.config/nvim/` 后，还需要执行如下操作：

1. 确保您的 NeoVim 版本在 `0.4.0` 以上。
2. 确保您安装了 Nodejs 14.14 及以上版本。
3. 启动 Vim 或 NeoVim ，执行 `:PlugInstall`
4. 使用 `:CocInstall` 前缀命令安装您需要的语言插件，比如 `:CocInstall coc-pyright` 。

### Pip

[Pip](https://pip.pypa.io/en/stable/) 配置文件归档在 `pip` 目录下，用户将此目录整个下载并重命名为 `~/.config/pip/` 。确保您已经安装了 `python3-pip` 。

如果您使用的是 Windows ，请将此目录重命名为 `%USERPROFILE%/pip` ，并将其中的 `pip.conf` 重命名为 `pip.ini` 。

### Poetry

[Python Poetry](https://python-poetry.org/) 配置文件归档在 `pypoetry` 目录下，用户将此目录整个下载并重命名为 `~/.config/pypoetry` ，还需要执行如下操作：

1. 安装 Python 3.7 及以上版本
2. 安装最新版本 Poetry

### Virtualenv

[Virtualenv](https://virtualenv.pypa.io/en/latest/) 配置文件归档在 `virtualenv` 目录下，用户将此目录整个下载并重命名为 `~/.config/virtualenv/`，还需要执行如下操作：

1. 如果您使用的是 Linux ，请尝试安装 `python3-pip` 、 `python3-venv` 和 `python3-virtualenv`
2. 如果您使用的是 Windows ，请尝试 `pip install -U virtualenv`
3. 我没有使用过 macOS ，请尝试一下 Linux 的解决方案
