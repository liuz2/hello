# git config

设置全局用户名和邮箱：

```sh
$ git config --global user.name "Your Name"
$ git config --global user.email "email@example.com"
```

除 `--global` 外，还可以使用 `--system` 和 `--local`。它们各自含义如下：

- `--local` 针对当前的版本仓库，默认值，优先级最高
- `--global` 针对当前用户有效
- `--system` 针对当前设备的所有用户，优先级最低
