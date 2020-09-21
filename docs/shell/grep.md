# GREP

`grep` 会在给定的文件中搜索匹配特定模式的行，并输出。

grep 的通用格式：

```
grep [options] [pattern] [file ...]
```

常用的 option 选项有：

`-A num, --after-context=num` 打印匹配行之后的 num 行文本

`-B num, --before-context=num` 打印匹配行之前的 num 行文本

`-C[num, --context=num]` 打印匹配行前后的 num 行文本，num 默认为 2.

`--exclude` 排除特定文件

`--exclude-dir` 排除特定文件夹

`-i, --ignore-case`, Perform case insensitive matching. By default, **grep** is case sensitive. 

`-R, -r, --recursive` 递归搜索指定的子目录

`-h, --no-filename` 不打印文件名

`-l, --files-with-matches` 只打印包含匹配行的文件名

`-n, --line-number` 打印行号

`-q, --quient, --silent` 安静模式

`-v, --invert-match` 反转匹配行

`-w, --word-regexp` 匹配单词

## 常用场景

在目录 foo 下查找文本 bar

```sh
$ grep -r "bar" foo
```

在目录 foo 下查找文本 bar，排除 `node_modules` 文件夹：

```sh
$ grep --exclude-dir node_modules -r "bar" foo
```

在目录 foo 下查找文本 bar，打印匹配行周围 3 行文本：

```sh
$ grep -C 3 -r "bar" foo
```
## 自定义 oh-my-zsh 的 grep

> 假如，我们想在 grep 中忽略 `node_modules` 目录。

编辑 `~/.oh-my-zsh/lib/grep.zsh`，修改 `VCS_FOLDERS` 变量，新增 `node_modules` 文件夹：

```diff
- VCS_FOLDERS="{.bzr,CVS,.git,.hg,.svn}"
+ VCS_FOLDERS="{node_modules,.bzr,CVS,.git,.hg,.svn}"
```
