""" coc.nvim 插件设置

"  需要使用 :CocInstall 手动安装如下插件
"
"  前端语言相关：coc-json coc-yaml

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"  有些语言服务在备份文件上会有问题
"  请查阅 https://github.com/neoclide/coc.nvim/issues/649
set nobackup
set nowritebackup

"  更长的刷新时间（默认是 4000ms ）会带来可感知的延时和不好的用户体验
set updatetime=250

"  始终显示签名列，否则它会在每次进行检查的时候发生偏移
set signcolumn=yes

"  绑定 [Tab] 键来触发补全并在列表中导航。
"  注意：这是默认情况下始终选择的完整配置项，你可能希望在配置文件里通过
"  `"suggest.noselect": true` 来启用无选择模式。
"  注意：使用命令 `:verbose imap <tab>` 确保选项卡在放入配置文件的
"  时候没有提前被其他插件进行映射。
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"  让 [CR] 键接受选择的补全项，或者通知 coc.nvim 进行格式化。
"  [C-g U] 中断当前操作并撤销，请自行选择。
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"  用 [Ctrl + `] 触发补全
inoremap <silent><expr> <C-`> coc#refresh()

" 使用 `[g` 和 `]g` 在代码诊断中进行导航
" 使用 `:CocDiagnostics` 来获取所有的诊断内容
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 跳转到代码导航
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用 [K] 键打开文档
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 当光标长时间位于标识符上时，自动高亮标识符及其所有的引用
autocmd CursorHold * silent call CocActionAsync('highlight')

" [r + n] 重命名标识符
" 注意此处的 <leader> 键默认是 `\`
nmap <leader>rn <Plug>(coc-rename)

" [fs] 格式化选中代码
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-select)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 对选定的代码块执行可用的代码操作
" 例子：`<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 对当前光标位置执行代码操作
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
" 对整个文件执行代码操作
nmap <leader>as  <Plug>(coc-codeaction-source)
" 对当前行的错误诊断，执行最佳快速修复
nmap <leader>qf  <Plug>(coc-fix-current)

" 对整个文件进行代码重构
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
" 对当前选中的片段进行代码重构
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" 触发 CodeLens （代码棱镜，代码状态指示器）显示
" 类似于 VSCode 内嵌的标识符/函数文档提示框
" 详细信息参考 https://blog.csdn.net/Sherlock_Holmes_lv/article/details/118930564
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" 支持 <C-b> 和 <C-f> 对浮动窗口/弹窗进行上下滚动
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" 使用 <C-s> 来选择一个范围
" 需要语言服务器支持 'textDocument/selectionRange'
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" 添加 `:Format` 命令来格式化所有文本，同时绑定快捷键
command! -nargs=0 Format :call CocActionAsync('format')
xmap <silent><C-l> :Format<CR> 
nmap <silent><C-l> :Format<CR> 

" 添加 `:Fold` 命令以折叠当前文件内容
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" 添加 `:OR` 命令以自动整理当前文件的导入
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" 添加 (Neo)Vim 原生状态栏支持
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" 支持自动刷新状态栏
autocmd User CocStatusChange redrawstatus

""" 关于 CocList 的按键映射
" 展示所有代码诊断信息
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" 管理扩展
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" 展示可用命令
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" 在当前文件查找标识符
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" 在整个工作区查找标识符
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" 对下一个项目执行默认操作
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" 对上一个项目执行默认操作
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" 恢复最新的 CocList 列表
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
