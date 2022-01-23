""" This is the configuration file of Vim itself.

" Disable Vi compatability
set backspace=indent,eol,start

" Syntax highlighting
syntax on

" Mode display
set showmode

" Command display
set showcmd

" Auto indentation for language
filetype indent on

" Auto indentation
set autoindent

" Shifts for a level
set shiftwidth=2

" Auto convert tabs into spaces
set expandtab

" Spaces for converting tabs
set softtabstop=2

" Line numbers
set number

" Maximum characters for a line
set textwidth=80

" Auto warp
set wrap

" Don't warp in a word
set linebreak

" Keep spaces from edges when wrapping
set wrapmargin=1

" Brackets pairing display
set showmatch

" Highlight searching results
set hlsearch

" Search in case-ignore mode
set ignorecase

" Warn me when file has been edit elsewhere
set autoread

" Auto completion of the command
set wildmenu

" Configure file encoding
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

""" The following contents setting up Kite Integration of Vim.

" Enable Kite Integration automatically
KiteEnableAutoStart

" Configure status line so you can see the satus of Kite
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" Enable Autocompletions
let g:kite_auto_complete=1
let g:kite_tab_complete=1

" Show completions UI even with 1 character
set completeopt-=menu
set completeopt+=menuone

set completeopt-=longest    " Don't insert the longest common text
set completeopt-=preview    " Hide documentation preview window
set completeopt+=noinsert   " Don't insert text automatically

" To visit the tutorial, Press [K] in Normal Mode!
