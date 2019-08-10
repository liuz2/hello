# 使用镜像

[online reading](https://github.com/yeasy/docker_practice/blob/master/image/README.md)

## 获取镜像

```sh
# docker pull [OPTIONS] NAME[:TAG|@DIGEST]
$ docker pull ubuntu:18.04
```

运行 bash 并进行交互式操作：

```sh
$ docker run -it --rm \
	ubuntu:18.04 \
	bash
$ cat /etc/os-release
```

以上参数的意义：

* `-i` 交互式操作
* `-t` 分配一个终端
* `--rm` 容器退出后将其删除，即人走茶凉
* `ubuntu:18.04` 启动容器的基础镜像
* `bash` 命令

## 列出镜像

[online reading](https://github.com/yeasy/docker_practice/blob/master/image/list.md)

```sh
$ docker image ls

# 查看镜像、容器、数据卷所占用的空间
$ docker system df

# 查看虚悬镜像（dangling image）
$ docker image ls -f dangling=true

# 删除虚悬镜像
$ docker image prune

# 显示中间层镜像
$ docker image ls -a

# 只显示 ubuntu 仓库的镜像
$ docker image ls ubuntu

# 显示特定的某个镜像
$ docker image ls ubuntu:18.04

# 使用过滤器 -f, --filter
$ docker image ls -f since=mongo:3.2
$ docker image ls -f before=mongo:3.2
$ docker image ls -f label=com.example.version=0.1

# 只显示数字哈希值
$ docker image ls -q
```

可以使用 [Go 模板语法](https://gohugo.io/templates/introduction/)，对输出内容自定义

```sh
$ docker image ls --format "{{.ID}}: {{.Repository}}"

# 以表格等距显示，并且有标题行
$ docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"
```

## 删除本地镜像

```sh
# docker image rm [OPTIONS] IMAGE [IMAGE...]
$ docker image rm 501
$ docker image rm centos

# 使用镜像摘要删除镜像
$ docker image ls --digests
$ docker image rm node@sha256:b4fxxxx
```

删除行为分两种：

1. `Untagged` 只删除标签 🏷️
2. `Deleted` 真正删除镜像 💿

可以用 docker image ls 命令配合删除：

```sh
$ docker image rm $(docker image ls -q redis)

$ docker image rm $(docker image ls -q -f before=mongo:3.2)
```

## 利用 commit 理解镜像构成

[online reading](https://github.com/yeasy/docker_practice/blob/master/image/commit.md)

⚠️ 不要使用 `docker commit` 定制镜像。定制镜像应该使用 `Dockerfile` 完成。

下面来定制一个 Web 服务器：

```sh
$ docker run --name webserver -d -p 80:80 nginx

# 进入容器
$ docker exec -it webserver bash

# 修改 nginx 欢迎内容
$ echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html

$ exit

# 查看具体改动
$ docker diff webserver

# 将改动后的容器存储层保存为镜像
# docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
$ docker commit \
	--author "Tao Wang <twang2218@gmail.com>" \
	--message "修改了默认网页"
	webserver \
	nginx:v2

# 查看新定制的镜像
$ docker image ls nginx

# 查看镜像内的历史记录
$ docker history nginx:v2

# 运行新镜像，将容器 80 端口映射到 81 端口
$ docker run --name web2 -d -p 81:80 nginx:v2
```

慎用 `docker commit`，因为：

1. 会添加大量无关内容，导致镜像臃肿
2. 会生成黑箱镜像，不利于镜像的后期维护
3. 每次修改都会叠加新层，导致镜像更加臃肿