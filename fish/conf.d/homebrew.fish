 # 为 Linuxbrew 设置 PATH, MANPATH 之类乱七八糟的环境变量
 eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

 # 替换 Linuxbrew 本身的源
 set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.bfsu.edu.cn/git/homebrew/brew.git"
 
 # Linuxbrew 专属设置
 set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.bfsu.edu.cn/git/homebrew/homebrew-core.git"
