" .vimrc
"
" Author: blinklv <blinklv@icloud.com>
" Create Time: 2018-05-18
" Maintainer: blinklv <blinklv@icloud.com>
" Last Change: 2018-05-24
"
" My VIM configure. Many settings are personalized for me, but if you still like 
" it, you can copy this file (.vimrc) and .vim directory to your home directory.

" Because eVim starts Vim and sets options to make it behave like a modeless editor. 
" So we don't do anything for it when your editor is eVim.
if v:progname =~? 'evim'
    finish
endif


" Shutdown VIM compatible mode, because it will cause all the enhancements 
" and improvements of Vi Improved are turned off. 
set nocompatible

" It's my personal habits :)
set background=light

" Clean all existing commands and maps. I don't want to my custom settings
" are affected by them.
comclear    
mapclear

" Only using VIM configures in the '.vim' directory of your home directory.
" There usually exists a global VIM configure, I also don't want to my custom
" settings are polluted by them.
set runtimepath=~/.vim
let $VIM = '~/.vim'
let $VIMRUNTIME = '~/.vim'


" set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim 
filetype off " required for Vundle
so ~/.vim/plugin.vim " All of my plugins are added to this file.
filetype plugin indent on " required for Vundle
" Vundle Brief help (Yes, my memory is not very good :)
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

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
" nnoremap     <leader>cl     :close<CR>
" nnoremap     <leader>wcl    :w<CR>:close<CR>
nnoremap <C-L> :close<CR>

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

