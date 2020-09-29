# git log

git log 的格式为：

```sh
$ git log [<options>] [<revision range>] [[--] <path>...]
```

如果想查看每次提交带来的改动，可以使用 `-p` 或 `--patch` 选项。还可以限制历史条目的最大数量，比如 `-2` 表示查看 2 条提交历史。

```sh
$ git log -p -2
```

> `-<number>`, `-n <number>`, `--max-count=<number>`: limit the number of commits to output

如果想查看倒序排列的提交历史，可以使用 `--reverse` 选项：

```sh
$ git log --reverse
```

> `--reverse`: output the commits chosen to be shown in reverse order. Cannot be combined with **--walk-reflogs**.

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

常见的 format 修饰符有：

- `%H` commit hash
- `%h` 简化的 commit hash
- `%T` tree hash
- `%t` 简化的 tree hash
- `%P` parent hashes
- `%p` 简化的 parent hashes
- `%an` author name
- `%ae` author email
- `%ad` author date（遵循 `--date=option` 格式）
- `%ar` author date, relative
- `%s` subject

`--graph` 选项可以绘制分支线条。

```sh
$ git log --pretty=format:"%h %s" --graph
```

时间限制选项 `--since` 和 `--until` 可以按日期筛选日志：

```sh
$ git log --since=2.weeks
```

时间格式很灵活，可以指定特定日期，比如 `2008-01-15`，也可以指定相对日期，比如 `2 years 1 day 3 minutes ago`。

另一个非常有用的过滤选项是 `-S`，它可以从过往历史提交中过滤指定的字符串。比如：

```sh
$ git log -S function_name
```

如果要修改时间格式，可以使用 `--date` 选项：

```sh
$ git log --date=format:"%Y-%m-%d %H:%M:%S" --pretty=format:"%ad"
2020-09-25 12:11:22
...
```

如果想忽略空格或空行，可以使用 `-b`, `-w`, 或 `--ignore-blank-lines`:

- `-b`, `--ignore-space-change` Ignore changes in amount of whitespace. This ignores whitespace at line end, and considers all other spequences of one or more whitespaces chracters to be equivalent.
- `-w`, `--ignore-all-space` Ignore whitespace when comparing lines. This ignores differences even if one line has whitespace where the other line has non.
- `--ignore-blank-line` Ignore changes whose lines are all blank.

## 参考资料

1. [git-log Documentation](https://www.git-scm.com/docs/git-log)
1. [Viewing the Commit History](https://www.git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History)
