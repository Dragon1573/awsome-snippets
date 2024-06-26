""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim-Plug 相关设置（https://github.com/junegunn/vim-plug#usage）
"""
""" 在 Windows Powershell Core 中，启动 NeoVim 的用户身份存在问题，自动执行 :PlugInstall 会存在非常特别的问题，
""" 移除自动安装，在用户首次启动 NeoVim 时手动执行 :PlugInstall 安装插件能很好地解决这个问题。

call plug#begin()

"  使用 SSH 链接更新插件
let g:plug_url_format = 'git@github.com:%s.git'
"  使用SSH 更新 Vim-Plug 自身
let s:plug_src = 'git@github.com:junegunn/vim-plug.git'

"  目录树（https://github.com/preservim/nerdtree）
Plug 'scrooloose/nerdtree'
"  启动 Vim 时同步启动 NERDTree ，将光标还原到编辑区
autocmd VimEnter * NERDTree | wincmd p
"  当 NERDTree 是唯一窗口的唯一侧栏时，跟着 Vim 一并提出
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"  展示隐藏的文件和目录
let NERDTreeShowHidden=1

"  缩进线（https://github.com/Yggdroot/indentLine）
Plug 'Yggdroot/indentLine'
"  启动 Vim 时打开前导空白符显示
autocmd VimEnter * LeadingSpaceEnable
"  启动 Vim 时打开缩进线显示
autocmd VimEnter * IndentLinesEnable

"  coc.nvim 的 Vim Language 支持
"  https://github.com/neoclide/coc-neco
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

"  一个基于 Nodejs 的插件，像 VSCode 一样加载扩展并提供语言服务器
"  https://github.com/neoclide/coc.nvim
"  使用发行分支（推荐）
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"  配置文件太复杂了，单独放一个配置文件去
source ~/.config/nvim/init.d/vim-plugs/coc-nvim.vim

"  状态栏美化（https://github.com/vim-airline/vim-airline）
Plug 'vim-airline/vim-airline'
"  开启 coc.nvim 集成
let g:airline#extensions#coc#enabled = 1
"  开启 coc.nvim 状态栏显示
let g:airline#extensions#coc#show_coc_status = 1

call plug#end()
