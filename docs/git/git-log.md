# git log

git log 的格式为：

```sh
$ git log [<options>] [<revision range>] [[--] <path>...]
```

如果想查看每次提交带来的改动，可以使用 `-p` 或 `--patch` 选项。还可以限制历史条目的最大数量，比如 `-2` 表示查看 2 条提交历史。

```sh
$ git log -p -2
```

如果想查看每次提交的简要信息，可以使用 `--stat` 选项：

```sh
$ git log --stat
```

`--pretty` 选项可以改变预置 log 信息样式。预置的格式有：`oneline`, `short`, `full`, `fuller`。

```sh
$ git log --pretty=oneline
```

最酷的 `--pretty` 选项值是 `format`，它让你可以完全自定义输出格式。当你要生成机器处理的信息时，这个选项十分有效。

```sh
$ git log --pretty=format:"%h - %an, %ar : %s"
```

## 参考资料

1. [git-log Documentation](https://www.git-scm.com/docs/git-log)
1. [Viewing the Commit History](https://www.git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History)