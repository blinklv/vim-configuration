" template.vim
"
" Author: blinklv <blinklv@icloud.com>
" Create Time: 2018-05-18
" Maintainer: blinklv <blinklv@icloud.com>
" Last Change: 2018-05-18
"
" There are some template files in template directory, Which define some common 
" header styles and information. This script will load these templates and insert 
" them into a new file or update some data (like date) in existing files.

" Avoid loading templates repeatedly.
if exists('did_load_template')
    finish
endif

let did_load_template = 1 " Means this file (template.vim) has been executed.

" It's strange to load a template when defining this template. So we should
" skip this case.
if expand('%:p') =~ $HOME . '/\.vim/template/template\..*'
    finish
endif

" The following settings will be used by many templates. If they don't 
" satisfy your needs, you can change them.
let s:author = $USER

let s:author_email = $EMAIL
if empty(s:author_email)
    " If you don't set the EMAIL environment variable, a default iCloud 
    " email address will be constructed for you.
    let s:author_email = s:author . '@icloud.com'
endif

let s:maintainer = s:author
let s:maintainer_email = s:author_email

" Insert a template when you create a new file.
function! s:insert_template(opts) 
    exe printf(':0r %s/.vim/template/%s', $HOME, a:opts.file_name)

    " The first line of some script programming languages are interpreter
    " command in UNIX class system. So I handle this case by using an 
    " additional File field.
    if has_key(a:opts, 'has_file_field')
        exe printf('silent! %ss/File:.*/File: %s', a:opts.range, expand('%'))
    else
        exe printf('silent! 1s/^\([^\s]*\).*$/\1 %s/', expand('%'))
    endif

    exe printf('silent! %ss/Author:.*/Author: %s <%s>', a:opts.range, s:author, s:author_email)
    exe printf('silent! %ss/Create Time:.*/Create Time: %s', a:opts.range, strftime('%Y-%m-%d'))
endfunction

" Update the existing template information when you change the content of your file.
function! s:update_template(opts)
    exe 'normal ma'
    exe printf('silent! %ss/Maintainer:.*/Maintainer: %s <%s>', a:opts.range, s:maintainer, s:maintainer_email)
    exe printf('silent! %ss/Last Change:.*/Last Change: %s', a:opts.range, strftime('%Y-%m-%d'))
    exe 'normal `a'
endfunction

" Golang file header template. All files which have the .go suffix will
" use this header template.
let s:golang_opts = {
            \ 'file_name': 'template.go',
            \ 'range': '1,6' }

augroup golang
    au!
    autocmd BufNewFile *.go call s:insert_template(s:golang_opts)
    autocmd BufWritePre,FileWritePre *.go call s:update_template(s:golang_opts)
augroup END

" vim script header template. All files which have the .vim suffix and .vimrc file 
" will use this header template. 
let s:vimscript_opts = {
            \ 'file_name': 'template.vim',
            \ 'range': '1,6' }

augroup vimscript
    au!
    autocmd BufNewFile *.vim,.vimrc call s:insert_template(s:vimscript_opts)
    autocmd BufWritePre,FileWritePre *.vim,.vimrc call s:update_template(s:vimscript_opts)
augroup END

" Python header template. All files which have the .py and .py3 suffix will
" use this header template.
let s:python_opts = {
            \ 'file_name': 'template.py',
            \ 'range': '1,8',
            \ 'has_file_field': 1 }


augroup python
    au!
    autocmd BufNewFile *.py,*.py3 call s:insert_template(s:python_opts)
    autocmd BufWritePre,FileWritePre *.py,*.py3 call s:update_template(s:python_opts)
augroup END


