# 使用 Dockerfile 定制镜像

[online reading](https://github.com/yeasy/docker_practice/blob/master/image/build.md)

Dockerfile 是一个文本文件，包含多条指令（instruction），每条指令构建一层。

这次使用 Dockerfile 定制 `nginx`：

```sh
$ mkdir mynginx
$ cd mynginx
$ touch Dockerfile
```

其内容为：

```dockerfile
FROM nginx
RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html
```

`FROM` 指定基础镜像。它是必备指令，且必须是第一条指令。

Docker Hub 上有很多高质量的官方镜像，包括

* 服务类的镜像
  * `nginx`
  * `redis`
  * `mongo`
  * `mysql`
  * `httpd`
  * `php`
  * `tomcat`
* 语言应用的镜像
  * `node`
  * `openjdk`
  * `python`
  * `ruby`
  * `golang`
* 操作系统镜像
  * `ubuntu`
  * `debian`
  * `centos`
  * `fedora`
  * `alpine`

除了现有镜像，Docker 还存在一个特殊镜像，名为 `scratch`，表示空白的镜像：

```dockerfile
FROM scratch
...
```

对于 Linux 下静态编译的程序，不需要有操作系统提供运行时支持，直接使用 `FROM scratch` 会让镜像体积更加小巧。

`RUN` 指令用来执行命令。有两种格式：

1. shell 格式：`RUN <command>`
2. exec 格式：`RUN ["exec", "param1", "param2"]`

下面是一个错误的镜像制作例子：

```dockerfile
FROM debian:jessie

RUN apt-get update
RUN apt-get install -y gcc libc6-dev make
RUN wget -O redis.tar.gz "http://download.redis.io/releases/redis-3.2.5.tar.gz"
RUN mkdir -p /usr/src/redis
RUN tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1
RUN make -C /usr/src/redis
RUN make -C /usr/src/redis install
```

每个 RUN 会新建一层。上面的写法创建了 7 层镜像，臃肿多余。Union FS 是有最大层数限制的。

正确写法如下：

```dockerfile
FROM debian:jessie

RUN buildDeps='gcc libc-dev make' \
	&& apt-get update \
	&& apt-get install -y $buildDeps \
	&& wget -O redis.tar.gz "http://download.redis.io/releases/redis-3.2.5.tar.gz" |
	&& mkdir -p /usr/src/redis \
	&& tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
	&& make -C /usr/src/redis \
	&& make -C /usr/src/redis install \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm redis.tar.gz \
	&& rm -r /usr/src/redis \
	&& apt-get purge -y --auto-remove $buildDeps
```

只有一条命令，产生一层。最后添加了清理工作。

## 构建镜像

```sh
# docker build [OPTIONS] PATH | URL | -
$ docker build -t nginx:v3 .
```

## 镜像构建上下文（Context）

构建时，用户会指定构建镜像上下文的路径，`docker build` 得知该路径后，会将路径下的所有内容打包，然后上传到 Docker 引擎。

一般而言，应当将 Dockerfile 放置到一个空目录。如果不想让 Docker 打包某些文件，可以编写 `.dockerignore` 指定忽略文件。

## 其他 `docker build` 的用法

```sh
# 直接用 Git repo 进行构建
$ docker build https://github.com/twang2218/gitlab-ce-zh.git#:8.14

# 用 tar 压缩包构建
$ docker build http://server/context.tar.gz

# 从标准输入中读取 Dockerfile 进行构建
$ docker build - < Dockerfile
$ cat Dockerfile | docker build -

# 从标准输入中读取上下文压缩包进行构建
$ docker build - < context.tar.gz
```

## 例子：自定义 Ubuntu

```dockerfile
FROM ubuntu 
RUN buildDeps='vim wget less' \
	&& apt-get update \
	&& apt-get install -y $buildDeps \
	&& sed -i 's/\(^.*usr\/share\/man\)/\# \1/' /etc/dpkg/dpkg.cfg.d/excludes \
	&& apt-get --reinstall install -y man-db coreutils
```