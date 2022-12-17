""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" 以下配置内容可能在 Vim 或 NeoVim 中兼容，但它本意只给 NeoVim 用
""" 打开真彩色支持（https://github.com/CarloWood/neovim-true-color-scheme-editor）

if has('nvim')
  "  NeoVim 专属配置
  set t_8f=\e[38;2;%lu;%lu;%lum
  set t_8b=\e[48;2;%lu;%lu;%lum
  set termguicolors
endif
"  设置配色方案
colorscheme cwcolors
"  启用语法支持
syntax enable

"  绑定 [F10] 快捷键，让它可以在当前光标下展示语法高亮组
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
\       '> trans<' . synIDattr(synID(line("."),col("."),0),"name") .
\       "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"  高亮行尾多余的空格
let c_space_errors=1
"  使用正则表达式搜索时，不高亮后续匹配
set noincsearch

"  如有需要，请手动移除以上存在冲突的配置项
