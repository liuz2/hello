# 使用 Homebrew

安装 Homebrew

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

`-c` 选项后的字符串，提供了命令内容。

常用的 brew 操作：

```sh
# 安装 wget
$ brew install wget

# 卸载
$ brew uninstall wget

# 列举本机安装的软件
$ brew list

# 升级软件
$ brew upgrade deno

# 升级 Homebrew 本身
$ brew update

# brew cask 可以安装 App，字体或其他闭源软件
$ brew cask install firefox

```

## 参考文献

1. [Documentation](https://docs.brew.sh/)