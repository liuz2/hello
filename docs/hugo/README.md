# Hugo

[Hugo](https://gohugo.io/) is the world's fastest framework for building websites.

## [快速起步](https://gohugo.io/getting-started/quick-start/)

安装

```sh
$ brew install hugo
```

验证安装是否正确

```sh
$ hugo version
```

创建新网站

```sh
$ hugo new site quickstart
```

增加一个主题

```sh
$ cd quickstart
$ git init
$ git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
```

在配置文件中开启主题：

```sh
$ echo 'theme = "ananke"' >> config.toml
```

添加内容

```sh
$ hugo new posts/my-first-post.md
```

开启 Hugo 服务器，允许草稿

```sh
$ hugo server -D
```

构建静态网站

```sh
$ hugo -D
```