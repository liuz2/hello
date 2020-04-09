# npm install 详解

`npm install` 用来安装 package。package 的格式包含如下：

- a) 一个目录，其中包含 `package.json` 文件
- b) 一个包含 (a) 的压缩文件
- c) 一个指向 (b) 的 url
- d) `<name>@<version>` 在 registry 发布的 url，包含 (C)
- e) 指向 (d) 的 `<name>@<tag>`
- f) 满足 (e) 的 `<name>` 其中包含 `latest` 标签
- g) 可以解析为 (a) 的 `<git remote url>`

安装远程 git 仓库的命令如下：

```sh
$ npm install <git remote url>
```

其中的 `<git remote url>` 格式如下：

```sh
<protocol>://[<user>[:<password>]@]<hostname>[:<port>][:][/]<path>[#<commit-ish> | #semver:<semver>]
```

其中，`protocol` 只能是下列选项之一：

1. `git`
1. `git+ssh`
1. `git+http`
1. `git+https`
1. `git+file`

比如：

```sh
$ npm install https://example.com/npm/cli.git#v2.0.0
```

## REF

1. [npm install documentation][1]

[1]: https://docs.npmjs.com/cli/install "npm-install npm Documentation"
