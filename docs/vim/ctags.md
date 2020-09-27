# ctags

**ctags**, also known as **ctags-exuberant**. It's a reimplementation of ctags(1).

## Install

```sh
$ brew install ctags
$ ctags --version
Exuberant Ctags 5.8, Copyright (C) 1996-2009 Darren Hiebert
  Compiled: Oct  6 2019, 20:31:35
  Addresses: <dhiebert@users.sourceforge.net>, http://ctags.sourceforge.net
  Optional compiled features: +wildcards, +regex
```

## Usage

生成标签文件

```sh
$ ctags -R
```

在 .vimrc 中加入如下选项：

```
set tags=tags;
```

按 <kbd>Ctrl+]</kbd>，光标会根据标签跳转到函数的定义。按 <kbd>Ctrl+t</kbd> 会返回。

如果出现同名的标签关键字，可以使用 `:tn` 或 `:tp` 切换选中的标签。也可以用 `:ts` 触发一个标签列表菜单。

使用 `g]` 可以打开一个标签列表，而不是立即跳转。

打开文件时直接跳转到指定标签：

```sh
$ vim -t get_kind
```

## 自动更新标签

在 `.vimrc` 中加入如下命令：

```
autocmd BufWritePost *.py silent! !ctags -R &
```

## REF

1. [ctags - Homebrew Formulae][1]

[1]: https://formulae.brew.sh/formula/ctags "ctags - Homebrew Formulae"
