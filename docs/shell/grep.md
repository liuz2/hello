# GREP

GREP 是 Global search Regular Expression and Print out the line 的简称，即全局搜索正则表达式并打印匹配行。

grep 命令选项及其意义如下

| 选项                         | 意义                                                             |
|------------------------------|------------------------------------------------------------------|
| -c, --count                  | 只输出匹配行的数量                                               |
| -i, --ignore-case            | 搜索时忽略大小写                                                 |
| -h, --no-filename            | 查询多文件时不显示文件名                                         |
| -l, --files-with-matches     | 只列出符合匹配的文件名，而不列出具体的匹配行                     |
| -n, --line-number            | 列出所有的匹配行，并显示行号                                     |
| -s, --no-messages            | 不显示不存在或无匹配文本的错误信息                               |
| -v, --invert-match           | 显示不包含匹配文本的所有行                                       |
| -w, --word-regexp            | 匹配整词                                                         |
| -x, --line-regexp            | 匹配整行                                                         |
| -r, --recursive              | 递归搜索，不仅搜索当前工作目录，而且搜索子目录                   |
| -q, --quiet                 | 禁止输出任何结果，以退出状态表示搜索是否成功                     |
| -b, --byte-offset            | 打印匹配行距文件头部的偏移量，以字节为单位                       |
| -o, --only-matching          | 与 -b 选项结合使用，打印匹配的词距文件头部的偏移量，以字节为单位 |
| -E, --extended-regexp        | 支持扩展的正则表达式                                             |
| -F, --fixed-strings          | 不支持正则表达式，按照字符串的字面意思进行匹配。                 |
| -A num, --after-context=num  | 打印匹配行之后 num 行文本                                        |
| -B num, --before-context=num | 打印匹配行之前 num 行文本                                        |
| -C num, --context=num        | 打印匹配行前后 num 行文本，默认为2                               |
| --exclude                    | 排除特定文件                                                     |
| --exclude-dir                | 排除特定文件夹                                                   |
| -I                           | 忽略二进制文件                                                   |

`grep` 会在给定的文件中搜索匹配特定模式的行，并输出。

grep 的通用格式：

```
grep [options] [pattern] [file ...]
```

无论模式是什么，只要包含空格，就需要用双引号括起来。否则，容易和文件名混淆。

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

排除某些文本。比如，排除 `/etc/passwd` 中的注释和包含 `false` 的文本行：

```sh
$ cat /etc/passwd | grep -v -e false -e "#"
```

## 自定义 oh-my-zsh 的 grep

> 假如，我们想在 grep 中忽略 `node_modules` 目录。

编辑 `~/.oh-my-zsh/lib/grep.zsh`，修改 `VCS_FOLDERS` 变量，新增 `node_modules` 文件夹：

```diff
- VCS_FOLDERS="{.bzr,CVS,.git,.hg,.svn}"
+ VCS_FOLDERS="{node_modules,.bzr,CVS,.git,.hg,.svn}"
```
