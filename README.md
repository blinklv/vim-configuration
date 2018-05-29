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
- [Ack](https://github.com/mileszs/ack.vim) ([ack][])
- [BufExplorer](https://github.com/jlanzarotta/bufexplorer)
- [Vim-Fugitive](https://github.com/tpope/vim-fugitive) ([git][])
- [Vim-Go](https://github.com/fatih/vim-go) ([Go][])
- [TagBar](https://github.com/majutsushi/tagbar) ([ctags][] or [gotags][])

All of these plugins are managed by [Vundle][] (include itself), the related configurations are in the `.vim/plugin.vim` file. Some plugins rely on some external programs, their download links are placed in parentheses.

## Shortcut Key

I list shortcut keys in common use for me.

- **NerdTree**
    - `Ctrl + n`: toggle *NERDTree*
    - `Shift + i`: display hidden files
    - `Shift + ?`: toggle help
- **NerdCommenter**
    - `<Leader>cc`: comment out the current line or text selected in visual mode.
    - `<Leader>cm`: comment the given lines using only one set of multipart delimiters.
    - `<Leader>ci`: toggle the comment state of the selected line(s) individually.
    - `<Leader>c<space>`: Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
- **BufExplorer**
    - `<Leader>be`: to start exploring in the current window
    - `<Leader>bt`: to toggle bufexplorer on or off in the current window
    - `<Leader>bs`: to start exploring in a newly split horizontal window
    - `<Leader>bv`: to start exploring in a newly split vertical window
- **TagBar**
    - `Shift + T`: toggle *tagbar*
- **Custom**
    - `Ctrl + l`: close the current window
    - `Ctrl + e`: open a blank tab
    - `Ctrl + p`: split window vertically
    - `<Leader>n`: move to the next tab
    - `<Leader>p`: move to the previous tab
    - `<Leader>f`: move to the first tab
    - `<Leader>l`: move to the last tab
    - `Ctrl + a`: In command-line mode, move the cursor to the first character of the line
    - `Ctrl + f`: In command-line mode, move the cursor to the right
    - `Ctrl + b`: In command-line mode, move the cursor to the left
    - `Ctrl + b`: In command-line mode, return

All **custom** shortcut keys are defined in `.vim/shortcut.vim` file.

[VIM]: https://en.wikipedia.org/wiki/Vim_(text_editor) "Vim Text Editor"
[Vundle]: https://github.com/VundleVim/Vundle.vim
[git]: https://git-scm.com/downloads "Git Downloads"
[Go]: https://golang.org/dl/ "Go Downloads"
[ctags]: http://ctags.sourceforge.net/
[gotags]: https://github.com/jstemmer/gotags
[C]: https://en.wikipedia.org/wiki/C_(programming_language)
[ack]:https://beyondgrep.com/ack-2.22-single-file
