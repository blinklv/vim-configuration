" plugin.vim
"
" Author: blinklv <blinklv@icloud.com>
" Create Time: 2018-05-23
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

function! s:nerdcommenter_configure()
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1 
    
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1
endfunction

call vundle#begin()

" Let Vundle manage Vundle, required.
" Documentation: help vundle
Plugin 'VundleVim/Vundle.vim'

" Incremental search.
" Documentation: help incsearch.vim
Plugin 'haya14busa/incsearch.vim' | call s:insearch_configure()

" File browser
" Documentation: help nerdtree
Plugin 'scrooloose/nerdtree' | call s:nerdtree_configure()

" The NERD commenter provides many different commenting operations and styles 
" which are invoked via key mappings and a menu.
" Documentation: help nerdcommenter
Plugin 'scrooloose/nerdcommenter' | call s:nerdcommenter_configure()

" Vim frontend for the programmer's search tool ack. Install the ack executable: 
" curl https://beyondgrep.com/ack-2.22-single-file > ack && chmod 0755 ack
"
" Usage: :Ack [options] {pattern} [{directories}]
" Documentation: help Ack
Plugin 'mileszs/ack.vim'

" With bufexplorer, you can quickly and easily switch between buffers by using 
" the one of the default public interfaces:
" 
" <Leader>be - To start exploring in the current window.
" <Leader>bt - To toggle bufexplorer on or off in the current window.
" <Leader>bs - To start exploring in a newly split horizontal window.
" <Leader>bv - To start exploring in a newly split vertical window.
"
" Documentation: help bufexplorer
Plugin 'jlanzarotta/bufexplorer'

" A gateway to Git.
" Documentation: help fugitive
Plugin 'tpope/vim-fugitive'

" Golang development
" Documentation: help vim-go
Plugin 'fatih/vim-go'


" All of your Plugins must be added before the following line.
call vundle#end()
