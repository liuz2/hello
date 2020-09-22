# vim-plug

**vim-plug**, a minimalist Vim plugin manager.

## Install

```sh
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

如果由于网络原因无法下载，可以直接编辑 `plug.vim`，将其拷贝至 `~/.vim/autoload/plug.vim` 中。

修改 `.vimrc`，放入 `vim-plug` 初始化代码：

```
call plug#begin()
Plug 'easymotion/vim-easymotion'
call plug#end()
```

保存 `.vimrc` 文件，然后重载（`:w | source $MYVIMRC`）

执行 `:PlugInstall` 来安装插件

`vim-plug` 有两个主要命令：

1. `:PlugUpdate` 更新所有已安装的插件
1. `:PlugClean` 删除 `.vimrc` 中已经移除的插件

## 延迟加载

如果想要在 `:NERDTreeToggle` 命令执行时再加载 NERDTree，可以使用 `on` 参数：

```
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
```

如果只想为特定文件类型加载某个插件，可以使用 `for` 参数：

```
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
```

## REF

1. [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
