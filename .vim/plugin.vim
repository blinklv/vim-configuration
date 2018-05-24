" plugin.vim
"
" Author: blinklv <blinklv@icloud.com>
" Create Time: 2018-05-24
" Maintainer: blinklv <blinklv@icloud.com>
" Last Change: 2018-05-24
"
" This file lists all custom plugins for me, they're managed by Vundle. If
" some plugins are rarely used by myself, although they are recommended by
" many people, I also won't list them in here. Because it's the most important 
" to fit yourself :)

" The following functions are related to how to configure plugins, they will
" be called after loading plugins.
function! s:insearch_configure()
    set incsearch
    set hlsearch
    map /   <Plug>(incsearch-forward)
    map ?   <Plug>(incsearch-backward)
    map g/  <Plug>(incsearch-stay)
endfunction

function! s:nerdtree_configure()
    au VimEnter * :NERDTree
    nnoremap <C-N> :NERDTreeToggle<CR>
endfunction

call vundle#begin()

" Let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'

" Incremental search.
Plugin 'haya14busa/incsearch.vim' | call s:insearch_configure()

" File browser
Plugin 'scrooloose/nerdtree' | call s:nerdtree_configure()

" Golang development
Plugin 'fatih/vim-go'

call vundle#end()
