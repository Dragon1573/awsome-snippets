""" 这是 Vim & NeoVim 的根配置文件

"  (Neo)Vim 在使用 Fish Shell 为默认 Shell 环境的界面里会有问题
"  必须将 (Neo)Vim 设置为 Bourne (Again) Shell 环境
set shell=/bin/bash

"  加载通用兼容配置
source ~dragon1573/.config/nvim/init.d/legacy.vim
"source ~/.config/nvim/init.d/legacy.vim
"  启用真彩支持
source ~dragon1573/.config/nvim/init.d/truecolor.vim
"source ~/.config/nvim/init.d/truecolor.vim
"  加载 Vim-Plug 扩展插件
source ~dragon1573/.config/nvim/init.d/vim-plug.vim
"source ~/.config/nvim/init.d/vim-plug.vim
"  添加 Vim 扩展插件的智能补全
"  快来尝试大佬们收录的丰富 Vim 扩展插件吧！
source ~dragon1573/.config/nvim/init.d/vimawesome.vim
"source ~/.config/nvim/init.d/vimawesome.vim
