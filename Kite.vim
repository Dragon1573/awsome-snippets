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
