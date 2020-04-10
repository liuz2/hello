# 安装开发环境

macOS 上必备的开发工具包括：

## iTerm2

iTerm2 让终端变得现代化。点击[官网首页](https://iterm2.com/)的下载按钮即可。

## Homebrew

macOS 下的包管理器。有了它，下载安装第三方工具变得易如反掌。

安装命令：

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

常见的命令如下：

```sh
# 安装
$ brew install wget
```

## Oh My Zsh

[官网](https://ohmyz.sh/)

## nginx

[nginx](https://nginx.org/) 是一个高性能的 HTTP 和反向代理 Web 服务器。

安装命令：

```sh
$ brew install nginx
```

启动：

```sh
$ nginx
```