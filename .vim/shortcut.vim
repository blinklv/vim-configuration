" shortcut.vim
"
" Author: blinklv <blinklv@icloud.com>
" Create Time: 2018-05-25
" Maintainer: blinklv <blinklv@icloud.com>
" Last Change: 2018-05-25
"
" My shortcut settings of VIM normal mode.

" Edit/Source .vimrc configure.
nnoremap     <leader>ev     :vsp $HOME/.vimrc<CR>
nnoremap     <leader>sv     :source $HOME/.vimrc<CR>

" Close the current window.
nnoremap <C-L> :close<CR>
" Open a blank tag.
nnoremap <C-E> :tabe<CR>
" Split window vertically.
nnoremap <C-P> :vsp<CR>

" Move to the next/previous/first/last tab.
nnoremap     <leader>n      :tabn<CR>
nnoremap     <leader>p      :tabp<CR>
nnoremap     <leader>f      :tabfirst<CR>
nnoremap     <leader>l      :tablast<CR>

" Make moving cursor in the command-line mode like what you do in BASH
cnoremap <C-A>  <Home>
cnoremap <C-F>  <Right>
cnoremap <C-B>  <Left>
cnoremap <C-J>  <Return>






