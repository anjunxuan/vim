" Vundle插件相关——插件管理
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set backspace=indent,eol,start " 解决退格键不能删除的问题

set nu              " 显示行号
set go=             " 不要图形按钮
"color asmanian2     " 设置背景主题
set guifont=Courier_New:h10:cANSI   " 设置字体

syntax on           " 语法高亮
set background=dark
colorscheme solarized
hi Normal ctermbg=NONE

set ruler           " 显示标尺
set showcmd         " 输入的命令显示出来，看的清楚些
set t_Co=256

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" 显示行标尺
set cursorline
"set cursorcolumn

" 设置当文件被改动时自动载入
set autoread

"代码补全
set completeopt=preview,menu

"代码折叠
set foldcolumn=0
set foldmethod=syntax
set foldlevel=3
set foldenable

" 去掉输入错误的提示声音
set noeb

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 自动缩进
set autoindent
set cindent

" Tab键的宽度
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" 在行和段开始处使用制表符
set smarttab

" 历史记录数
set history=1000

"禁止生成临时文件
set nobackup
set noswapfile

"搜索逐字符高亮
set hlsearch
set incsearch

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 总是显示状态行
set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 为C程序提供自动缩进
set smartindent


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic插件相关——格式检查
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_cpplint_exec = "cpplint"
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_cpp_config_file = '/Users/junxuan.an/work/ofo/git/.syntastic_cpp_config'
let g:syntastic_c_include_dirs = ['/Users/junxuan.an/work/ofo/git/personas/webserver/include']
let g:syntastic_cpp_include_dirs = ['/Users/junxuan.an/work/ofo/git/personas/webserver/include']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动更新文件的修改日期
function! AutoUpdateTheLastUpdateInfo()
    let s:original_pos = getpos(".")
    let s:regexp = "^\\s*\\([#\\\"\\*]\\|\\/\\/\\)\\s\\?[lL]ast \\([uU]pdate\\|[cC]hange\\):"
    let s:lu = search(s:regexp)
    if s:lu != 0
        let s:update_str = matchstr(getline(s:lu), s:regexp)
        call setline(s:lu, s:update_str . strftime(" %Y-%m-%d %H:%M:%S", localtime()))
        call setpos(".", s:original_pos)
    endif
endfunction
autocmd BufWritePost *.{h,hpp,c,cpp} call AutoUpdateTheLastUpdateInfo()
"autocmd BufNewFile *.{h,hpp,c,cpp} exec 'call append(0, "\/\/ Last Update:" . strftime("%Y-%m-%d %H:%M:%S", localtime()))'


autocmd BufRead *.log* set
\ nonu

"------------------ YouCompleteMe -------------------
" Linux vim && NeoVim Using YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0
autocmd InsertLeave * if pumvisible() == 0|pclose|endif    "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项


""""""""""""""""""""""""""""""""""""""""""""""""""""
" 当新建 .h .c .hpp .cpp 等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()"

" 版权信息
func SetTitle()
    call setline(1,"// Copyright (c) ".strftime("%Y").", ofo Inc.")
    call append(line("."),   "// All rights reserved.")
    call append(line(".")+1, "// Author: anjunxuan@ofo.com")
    call append(line(".")+2, "// Last Update:".strftime(" %Y-%m-%d %H:%M:%S", localtime()))
    call append(line(".")+3, "")
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""
Glaive codefmt clang_format_style='Google'

"""""""""""""""""""""""""""""""""""""
set rtp+=/usr/lib/python3.4/site-packages/powerline/bindings/vim
let g:minBufExplForceSyntaxEnable = 1
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! has("gui_running")  
  set t_Co=256  
endif  
if &diff  
  colors peaksea  
endif



