" template.vim
"
" Author: blinklv <blinklv@icloud.com>
" Create Time: 2018-05-18
" Maintainer: blinklv <blinklv@icloud.com>
" Last Change: 2018-05-25
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

" Get the line range of the current buffer. If the line number of the last
" line is greater than 16, return the defualt range [1,16].
function! s:get_range()
    if line('$') > 16
        return '1,16'
    else
        return printf('1,%d', line('$'))
    endif
endfunction

" Insert a template when you create a new file.
function! s:insert_template(opts) 
    exe printf(':0r %s/.vim/template/%s', $HOME, a:opts.file_name)
    let range = s:get_range()

    " The first line of some script programming languages are interpreter
    " command in UNIX class system. So I handle this case by using an 
    " additional File field.
    if has_key(a:opts, 'has_file_field')
        exe printf('silent! %ss/File:.*/File: %s', range, expand('%:t'))
    else
        exe printf('silent! 1s/^\([^\s]*\).*$/\1 %s/', expand('%:t'))
    endif

    exe printf('silent! %ss/Author:.*/Author: %s <%s>', range, s:author, s:author_email)
    exe printf('silent! %ss/Create Time:.*/Create Time: %s', range, strftime('%Y-%m-%d'))
endfunction

" Update the existing template information when you change the content of your file.
function! s:update_template(opts)
    let range = s:get_range()
    exe 'normal ma'
    exe printf('silent! %ss/Maintainer:.*/Maintainer: %s <%s>', range, s:maintainer, s:maintainer_email)
    exe printf('silent! %ss/Last Change:.*/Last Change: %s', range, strftime('%Y-%m-%d'))
    exe 'normal `a'
endfunction


" Golang file header template. All files which have the .go suffix will
" use this header template.
let s:golang_opts = { 'file_name': 'template.go' }

augroup golang
    au!
    autocmd BufNewFile *.go call s:insert_template(s:golang_opts)
    autocmd BufWritePre,FileWritePre *.go call s:update_template(s:golang_opts)
augroup END

" vim script header template. All files which have the .vim suffix or .vimrc file 
" will use this header template. 
let s:vimscript_opts = { 'file_name': 'template.vim' }

augroup vimscript
    au!
    autocmd BufNewFile *.vim,.vimrc call s:insert_template(s:vimscript_opts)
    autocmd BufWritePre,FileWritePre *.vim,.vimrc call s:update_template(s:vimscript_opts)
augroup END

" Python header template. All files which have the .py or .py3 suffix will
" use this header template.
let s:python_opts = {
            \ 'file_name': 'template.py',
            \ 'has_file_field': 1 }


augroup python
    au!
    autocmd BufNewFile *.py,*.py3 call s:insert_template(s:python_opts)
    autocmd BufWritePre,FileWritePre *.py,*.py3 call s:update_template(s:python_opts)
augroup END


" C language header template. All files which have the .c suffix will use this 
" header template.
let s:c_opts = { 'file_name': 'template.c' }

augroup c
    au!
    autocmd BufNewFile *.c call s:insert_template(s:c_opts)
    autocmd BufWritePre,FileWritePre *.c call s:update_template(s:c_opts)
augroup END

" C++ language header template. All files which have the .cc or .cpp suffix will use this 
" header template.
let s:cpp_opts = { 'file_name': 'template.cc' }

augroup cpp
    au!
    autocmd BufNewFile *.cc,*.cpp call s:insert_template(s:cpp_opts)
    autocmd BufWritePre,FileWritePre *.cc,*.cpp call s:update_template(s:cpp_opts)
augroup END

" JavaScript header template. All files which have the .js suffix will use
" this header template.
let s:javascript_opts = { 'file_name': 'template.js' }

augroup javascript
    au!
    autocmd BufNewFile *.js call s:insert_template(s:javascript_opts)
    autocmd BufWritePre,FileWritePre *.js,*.cpp call s:update_template(s:javascript_opts)
augroup END

" HTML header template. All files which have the .html suffix will use this
" header template.
augroup html
    au!
    " It only inserts the content of template.html when you create a new file.
    autocmd BufNewFile *.html 0r $HOME/.vim/template/template.html
augroup END

" Bash Script header template. All files which have the .sh or .bash suffix
" will use this header template.
let s:bash_opts = {
            \ 'file_name': 'template.sh',
            \ 'has_file_field': 1 }

augroup bash
    au!
    autocmd BufNewFile *.sh,*.bash call s:insert_template(s:bash_opts)
    autocmd BufWritePre,FileWritePre *.sh,*.bash call s:update_template(s:bash_opts)
augroup END

" Protobuf protocol header template. All files which have the .proto or .pb
" suffix will use this header template.
let s:protobuf_opts = { 'file_name': 'template.proto' }

augroup protobuf
    au!
    autocmd BufNewFile *.proto,*.pb call s:insert_template(s:protobuf_opts)
    autocmd BufWritePre,FileWritePre *.proto,*.pb call s:update_template(s:protobuf_opts)
augroup END

" LICENSE template. All files named LICENSE,License or license will use this
" named .
augroup license
    au!
    autocmd BufNewFile LICENSE,License,license 0r $HOME/.vim/template/template.license
    autocmd BufNewFile LICENSE,License,license exe 'silent! 3s/\[year\]/' . strftime("%Y")
    autocmd BufNewFile LICENSE,License,license exe 'silent! 3s/\[fullname\]/' . $USER
augroup END

" YAML header template. All files which have the .yaml or yml suffix will use
" this header template.
let s:yaml_opts = { 'file_name': 'template.yaml' }
augroup yaml
    au!
    autocmd BufNewFile *.yaml,*.yml call s:insert_template(s:yaml_opts)
    autocmd BufWritePre,FileWritePre *.yaml,*.yml call s:update_template(s:yaml_opts)
augroup END
