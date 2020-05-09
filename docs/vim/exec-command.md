# 在 Vim 中执行命令

在 Vim 中执行命令有以下几种形式。

## :!command

不退出 vim，执行 shell 命令 command，将命令输出显示在 vim 的命令区域，不会改变当前编辑的文件的内容。

例如：`:!ls -l`。

> 一个有用的技巧 `:!bash`，开启一个全新的 bash shell。

如果想执行当前文件，可以输入 `%`，比如：

```sh
# 统计当前文件的行数
:!wc -l %
```

## :r !command

将 shell 命令 command 的结果插入到当前行的下一行。比如：

```sh
# 读取系统时间并插入到当前行的下一行
:r !date
```

## :m,n !command

将起始行号 m 和结束行号 n 指定的范围中的内容输入到 shell 命令 command 处理，并将处理结果替换起始行号和结束行号指定的范围中的内容。比如：

```sh
# 将 62 行到 72 行的内容进行排序
:62,72 !sort
```

可以指定一行：

```sh
# 将 62 行的小写字母转为大写字母
:62 !tr "[a-z]" "[A-Z]"
```

当前行可以用 `.` 表示：

```sh
:. !tr "[a-z]" "[A-Z]"
```

## :m,n w !command

将起始行号 m 和结束行号 n 所指定的范围的内容作为命令 command 的输入。不会改变当前编辑的文件的内容。

```sh
:62,72 w !sort

# 把当前行当作 bash shell 来执行
:. w !bash
```

## 参考文献

1. [vim中执行shell命令小结](https://blog.csdn.net/topgun38/article/details/8013115)，作者 *topgun38*，2012/09/24