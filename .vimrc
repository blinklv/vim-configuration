" .vimrc
"
" Author: blinklv <blinklv@icloud.com>
" Create Time: 2018-05-18
" Maintainer: blinklv <blinklv@icloud.com>
" Last Change: 2018-06-12
"
" My VIM configuration. Many settings are personalized for me, but if you still like 
" it, you can copy this file (.vimrc) and .vim directory to your home directory.

" Because eVim starts Vim and sets options to make it behave like a modeless editor. 
" So we don't do anything for it when your editor is eVim.
if v:progname =~? 'evim'
    finish
endif


" Shutdown VIM compatible mode, because it will cause all the enhancements 
" and improvements of Vi Improved are turned off. 
set nocompatible

" Clean all existing commands and maps. I don't want to my custom settings
" are affected by them.
comclear    
mapclear

" '\' (default) key is far from my right fingers, I think ',' key is more
" suitable than that.
let mapleader = ","

set encoding=utf8

" Only using VIM configures in the '.vim' directory of your home directory.
" There usually exists a global VIM configure, I also don't want to my custom
" settings are polluted by them.
set runtimepath=~/.vim
let $VIM = '~/.vim'
let $VIMRUNTIME = '~/.vim'

" Normally, we don't backup files. If B environment variable is set, this
" feature will be enabled.
if !exists('$VIM_BACKUP')
    set nobackup
else
    let &backupdir = $VIM_BACKUP
endif

" It's my personal habits :)
set background=light
set history=50
set ruler
set showcmd
set nowrapscan

" Alignment.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab 
so ~/.vim/align.vim

" Because TAB character may be different in various platform, I don't like
" the layout of my codes changing when the platform changes. So I expand 
" TAB character.
set expandtab

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

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

" Load template files configure.
so ~/.vim/template.vim

" Backspace in insert mode:
" indent - allow backspacing over autoindent
" eol    - allow backspacing over line breaks (join lines)
" start  - allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.
set backspace=indent,eol,start

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  syntax on

  " Also switch on highlighting the last used search pattern.
  set hlsearch

  " I like highlighting strings inside C comments.
  let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


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

" Load personal shortcut settings.
so ~/.vim/shortcut.vim
