# branch

## 删除多个分支

强制删除本地所有分支（慎用）

```sh
$ git branch | xargs git branch -D
```

删除本地已经合并分支

```sh
$ git branch | xargs git branch -d
```

按照某些条件过滤，删除指定分支

```sh
$ git branch | grep "example" | xargs git branch -d
```

删除本地的远程追踪分支：

```sh
$ git branch -r | grep "example" | xargs git branch -d -r
```

## REF

1. [Git 删除本地多个分支](https://www.jianshu.com/p/40aba7579558), 简书，2018/11/19
