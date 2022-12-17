""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim-Plug 相关设置（https://github.com/junegunn/vim-plug#usage）

call plug#begin()

"  目录树（https://github.com/preservim/nerdtree）
Plug 'scrooloose/nerdtree'
"  启动 Vim 时同步启动 NERDTree ，将光标还原到编辑区
autocmd VimEnter * NERDTree | wincmd p
"  当 NERDTree 是唯一窗口的唯一侧栏时，跟着 Vim 一并提出
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"  缩进线（https://github.com/Yggdroot/indentLine）
Plug 'Yggdroot/indentLine'
"  启动 Vim 时打开前导空白符显示
autocmd VimEnter * LeadingSpaceEnable
"  启动 Vim 时打开缩进线显示
autocmd VimEnter * IndentLinesEnable

"  一个基于 Nodejs 的插件，像 VSCode 一样加载扩展并提供语言服务器
"  https://github.com/neoclide/coc.nvim
"  使用发行分支（推荐）
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"  配置文件太复杂了，单独放一个配置文件去
source ~dragon1573/.config/nvim/init.d/vim-plugs/coc-nvim.vim

call plug#end()
