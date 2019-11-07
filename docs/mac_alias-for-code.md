# alias for VSCode on macOS

首先，编辑 `~/.profile` 文件：

```sh
$ vim ~/.profile
```

增加如下内容：

```sh
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
```

在当前命令行窗口重新读取 `~/.profile`:

```sh
. ~/.profile
```

在 zsh 环境下，还需要在 `~/.zshrc` 下新增如下代码：

```diff
+ . ~/.zshrc
```

## REF

1. [macOS 下 VSCode 在终端下 code ./ 打开当前项目](https://segmentfault.com/q/1010000005104983)