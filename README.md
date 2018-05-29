# Vim Configuration

![Building](https://img.shields.io/badge/building-passing-green.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

My [VIM][] Configuration. Many settings are personalized for me, but if you still like it, you can copy my configuration to your home directory.

## Install

```bash
git clone 'https://github.com/blinklv/vim-configuration.git' /tmp/vim-configuration
cp -R /tmp/vim-configuration/{.vimrc,.vim}  $HOME/
```

**NOTE**: *.vimrc* file and *.vim* directory are hidden, you can use 'ls -a' command to check them.

## Template

I create some header template files in the `.vim/template` directory. The following are contents of `.vim/template/template.c`, which is [C][] language header template.

```c
/*
 *
 * Author:
 * Create Time:
 * Maintainer:
 * Last Change:
 */
```

When you create a new file named `hello.c`, the above contents will be inserted into it.

```c
/* hello.c
 *
 * Author: blinklv <blinklv@icloud.com>
 * Create Time: 2018-05-29
 * Maintainer:
 * Last Change:
 */
```

As you can see, the file name, the `Author` and the `Create Time` are filled. If you add some contents to `hello.c` and save them. The `Maintainer` and the `Last Change` are also filled.

```c
/* hello.c
 *
 * Author: blinklv <blinklv@icloud.com>
 * Create Time: 2018-05-29
 * Maintainer: blinklv <blinklv@icloud.com>
 * Last Change: 2018-05-29
 */

#include<stdio.h>

int main() {
    printf("hello\n");
}
```

The configurations for updating templates are in the `.vim/template.vim` file.

## Plugin

- [Vundle][]
- [Incsearch](https://github.com/haya14busa/incsearch.vim)
- [NerdTree](https://github.com/scrooloose/nerdtree)
- [NerdCommenter](https://github.com/scrooloose/nerdcommenter)
- [Ack](https://github.com/mileszs/ack.vim)
- [BufExplorer](https://github.com/jlanzarotta/bufexplorer)
- [Vim-Fugitive](https://github.com/tpope/vim-fugitive)
- [Vim-Go](https://github.com/fatih/vim-go)
- [TagBar](https://github.com/majutsushi/tagbar)

All of these plugins are managed by [Vundle][] (include itself), the related configurations are in the `.vim/plugin.vim` file. Some plugins rely on some external programms, their download links are as follows:

**ack**

```bash
curl 'https://beyondgrep.com/ack-2.22-single-file' > /tmp/ack
cp /tmp/ack /usr/local/bin/
```

**vim-fugitive**

Download [git][].

**vim-go**

Download [Go][]

**tagbar**

Download [ctags][] or [gotags][]

[VIM]: https://en.wikipedia.org/wiki/Vim_(text_editor) "Vim Text Editor"
[Vundle]: https://github.com/VundleVim/Vundle.vim
[git]: https://git-scm.com/downloads "Git Downloads"
[Go]: https://golang.org/dl/ "Go Downloads"
[ctags]: http://ctags.sourceforge.net/
[gotags]: https://github.com/jstemmer/gotags
[C]: https://en.wikipedia.org/wiki/C_(programming_language)
