"非兼容模式
set nocp
"底部标尺
set ru
"搜索时高亮显示结果
set hls
set is
"显示行号
set number
"使用:e命令的时候 可选项预览
set wildmenu
"文件默认编码utf-8
set enc=utf-8
"文件默认格式unix
set ff=unix
"缩进为4个空格宽度
set tabstop=4
"自动缩进使用的空格数
set shiftwidth=4
"编辑插入tab时，把tab算作的空格数
set softtabstop=4
"缩进使用空格
set expandtab
"自动缩进
set autoindent
"鼠标捕捉
set mouse=v
"打开语法高亮
syntax on
" no swp file
set nobackup

set comments=sl:/*,mb:*,ex:*/
"设置字典
"默认配色为darkblue
"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=2

" 重新载入配置
map <leader>s :source ~/.vimrc<CR>

" visual模式修改缩进时不退出该模式
vnoremap < <gv
vnoremap > >gv 

"映射F12键为行号的开关
map <F12> :set number!<CR>

nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

" 打开php折叠
"let php_folding = 1 
" 打开javascript折叠
"let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

filetype on
au BufNewFile,BufRead *.as set filetype=actionscript
au BufReadCmd *.jar,*.xpi,*.egg call zip#Browse(expand("<amatch>"))
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4

" 设置javascriptlint
"autocmd FileType javascript set makeprg=/home/xp/bin/js/jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '/home/xp/bin/js/jsl.conf'\ -process\ %
"autocmd FileType javascript set makeprg=sl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -process\ %
autocmd FileType javascript set makeprg=/home/panweizeng/bin/jslint\ %
autocmd FileType javascript set errorformat=%f(%l):\ %m
autocmd FileType javascript inoremap <silent> <F9> <C-O>:make<CR>
autocmd FileType javascript map <silent> <F9> :make<CR>


"""""""""""""""""""""""""""""
" TagList setting
"""""""""""""""""""""""""""""
"Exuberant ctags程序的位置
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
"在右侧窗口打开
let Tlist_Use_Right_Window=1
"只显示当前文件的tag
let Tlist_File_Fold_Auto_Close=1
"如果Taglist是最后一个窗口则退出vim
let Tlist_Exit_OnlyWindow = 1
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'




" bolow by zhiyelee
" 设置javascriptlint
autocmd FileType javascript set makeprg=jshint\ --config\ /opt/fe/fe.tools/jshint/jshintrc\ %
autocmd FileType javascript set errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
autocmd FileType javascript inoremap <silent> <F9> <C-O>:lint<CR>
autocmd FileType javascript map <silent> <F9> :lint<CR>


" fix backspace fail
set backspace=indent,eol,start
set cursorline
" 设置切换buf行为
set switchbuf=usetab,newtab

" In visual mode, git blame the selection
function! GitBlame() range
" look up function-range-example for more information
    let beg_line = line("'<")
    let end_line = line("'>")
    exec '!git blame -L '. beg_line. ','. end_line. ' %'
endfunction
vnoremap <leader>g :call GitBlame()<CR>

" In normal mode, git blame the current line
nnoremap <leader>g :exec '!git blame -L '. line("."). ','. line("."). ' %'<CR>


" 设置-作为单词一部分
set iskeyword+=-

cmap w!! w !sudo tee %

map <F5> <Esc>:!git grep -a2 -n -i <cword><CR>
