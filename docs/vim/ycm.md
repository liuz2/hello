# YouCompleteMe Plugin

如果使用 [`vim-plug` 插件管理器](./vim-plug.md)，则需要在 `.vimrc` 中加入如下设置:

```
let g:plug_timeout = 300
Plug 'ycm-core/YouCompleteMe', {'do':'./install.py'}
```

保存 `.vimrc`，然后执行如下命令：

```
:source $MYVIMRC | PlugInstall
```

需要安装许多的依赖，并且需要 Python 3.6.0+，否则会报错：

```
YouCompleteMe unavailable: requires Vim compiled with Python (3.6.0+) support.
```

## REF

1. [ycm-core/YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
