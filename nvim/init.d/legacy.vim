""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" 这是关于 Vim 与 NeoVim 的配置文件

" 启用鼠标支持
set mouse=a

" 关闭 Vi 兼容功能
set backspace=indent,eol,start

" 左下角显示编辑模式
set showmode

" 左下角显示输入的命令
set showcmd

" 启用和语言相关的自动缩进
filetype indent on

" 启用自动缩进
set autoindent

" 每个 Tab 的距离
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 自动把制表符缩进转换为空格缩进
set expandtab

" 根据文件类型设置对应的格式
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype xml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2

" 显示行号
set number

" 高亮显示光标所在行
set cul

" 设置最大行宽
set textwidth=120

" 不要在单词中执行换行
set linebreak

" 在自动折行时自动缩进
set wrapmargin=1

" 高亮匹配的括号
set showmatch

" 高亮搜索结果
set hlsearch

" 搜索时忽略大小写
set ignorecase

" 自动监听文件更改，当文件在外部被更改时发出提醒
set autoread

" 命令自动补全
set wildmenu

" 设置文件编码格式
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
