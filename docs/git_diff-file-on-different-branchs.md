# 比较不同分支的某个具体文件的修改差异

```sh
$ git diff branch_a branch_b -- path/to/file
```

其中，`--` 用来分割 git 参数和文件路径。