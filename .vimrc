" .vimrc
"
" Author: blinklv <blinklv@icloud.com>
" Create Time: 2018-05-18
" Maintainer: blinklv <blinklv@icloud.com>
" Last Change: 2018-05-18
"
" My VIM configure. Many settings are personalized for me, but if you still like 
" it, you can copy this file (.vimrc) and .vim directory to your home directory.

" 如果使用的是evim (比较过程中忽略大小写), 
" 因为evim.vim已经做了如下的设定, 后续操作直接跳过.
if v:progname =~? "evim"
    finish
endif


" 关闭vi兼容模式.
set nocompatible
set background=light

comclear    " 清空所有命令
mapclear    " 清空所有map

" 只使用.vim中的配置.
set runtimepath=~/.vim
let $VIM = '~/.vim'
let $VIMRUNTIME = '~/.vim'

" 载入Vundle.
set rtp+=~/.vim/bundle/Vundle.vim   " 设置Vundle的默认执行路径.
filetype off                        " 载入Vundle之前需要关闭filetype.
so ~/.vim/vundle_plugin_list.vim    " 载入Vundle插件列表.

" 插入模式下回退操作的设置.
set backspace=indent,eol,start

" 鼠标设置
if has('mouse')
    set mouse=a
endif

" VIM备份设置.
" 1.默认情况下不进行备份处理.
" 2.当设置了VIM_BACKUP(环境变量, 描述了备份的目录)才进行备份处理.
if !exists('$VIM_BACKUP')
    set nobackup
else
    let &backupdir = $VIM_BACKUP
endif

" 载入支架脚本.
so ~/.vim/skel.vim

so ~/.vim/template.vim


" 显示
set history=50  " 50行命令历史.
set ruler       " 显示标尺.
set showcmd     " 显示命令.

" 语法高亮
if &t_Co > 2 || has("gui_running")
    syntax on
    set t_Co=256
    set hlsearch
    let c_comment_strings=1
endif

set nowrapscan " 不进行循环扫描.


" 对齐
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab 
set expandtab

if has('autocmd')
    filetype plugin indent on

    augroup vimrcEx
    au!
    " 对于所有的文本文件, 将文本宽度设置为78个字符.
    autocmd FileType text setlocal textwidth=78

    " 开始编辑文件的时候跳转到上次光标的位置.
    autocmd BufReadPost * 
        \ if line("'\"") >= 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    augroup END
else
    set autoindent
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" packadd matchit

" blinklv的版权信息.
ab bcpy <TAB><TAB>Copyright<SPACE>(C),<SPACE>blinklv.<SPACE>All<SPACE>right<SPACE>reserved.
" 腾讯客厅版权信息.
ab ktcpy <TAB><TAB>Copyright<SPACE>(C),<SPACE>kt-tencent.<SPACE>All<SPACE>right<SPACE>reserved.


let mapleader = "," " 定义map引导符.


" 编辑/重载.vimrc配置.
nnoremap     <leader>ev     :vsp $HOME/.vimrc<CR>
nnoremap     <leader>sv     :source $HOME/.vimrc<CR>

" (保存)关闭窗口.
nnoremap     <leader>cc     :close<CR>
nnoremap     <leader>wcc    :w<CR>:close<CR>

" 新建标签页.
nnoremap     <leader>tc     :tab<SPACE>
nnoremap     <leader>te     :tabe<SPACE>

" (保存)关闭标签页.
nnoremap     <leader>tt     :tabc!<CR>
nnoremap     <leader>wtt    :wa<CR>:tabc!<CR>

" 切换标签页.
nnoremap     <leader>n      :tabn<CR>
nnoremap     <leader>p      :tabp<CR>
nnoremap     <leader>f      :tabfirst<CR>
nnoremap     <leader>l      :tablast<CR>

" 切换buffer.
nnoremap     <leader>bn      :bnext<CR>
nnoremap     <leader>bp      :bprevious<CR>
nnoremap     <leader>bf      :bfirst<CR>
nnoremap     <leader>bl      :blast<CR>

" 让命令行模式下的操作更加类似shell.
cnoremap <C-A>  <Home>
cnoremap <C-F>  <Right>
cnoremap <C-B>  <Left>


" 操作代码块.
onoremap    {       a{

" " 每次进入一个新的缓冲区的时候
" " 都会重新的检测文件类型.
" au! BufEnter * :filetype detect

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

