# NERDTree

## Installation

Vim 8+ packages, see `:help packages` for more information

```sh
$ git clone https://github.com/preservim/nerdtree ~/.vim/pack/vendor/start/nerdtree
$ vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
```

## Config NERDTree

update `~/.vimrc`:

```
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" map a specific key F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
```

## Create a new file or directory

1. Press `m` to bring up the NERDTree Filesystem Menu.
2. Type `a` to add a child node and then simply enter the filename.
3. To create a directory follow the same steps but append a `/` to the filename.
 
## REF

1. [preservim/nerdtree](https://github.com/preservim/nerdtree)
1. [Creating a new file or directory in Vim using NERDTree](https://sookocheff.com/post/vim/creating-a-new-file-or-directoryin-vim-using-nerdtree/), by *Kevin Sookocheff*, 2013/04/19
