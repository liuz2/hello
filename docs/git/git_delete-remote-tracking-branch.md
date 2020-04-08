# 删除本地的远程追踪分支

如果本地的分支名为 `test`，对应远程的 `origin/test`。如果要删除本地的 `origin/test` 追踪分支，需要执行：

```sh
$ git branch -d -r origin/test
```