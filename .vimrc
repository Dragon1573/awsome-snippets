" This is the configuration file of Vim.

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

" Display status bar
set laststatus=2

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