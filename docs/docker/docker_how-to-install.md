# 如何安装

[online reading](https://github.com/yeasy/docker_practice/blob/master/install/README.md)

Docker 分为 CE 和 EE 两大版本。CE 即社区版（免费版，支持周期 7 个月），EE 是企业版，付费使用，支持周期 24 个月。

## Ubuntu

[online reading](https://github.com/yeasy/docker_practice/blob/master/install/ubuntu.md)

安装成功后，需要建立 docker 用户组：

```sh
# 建立 docker 组
$ sudo groupadd docker

# 将当前用户加入 docker 组
$ sudo usermod -aG docker $USER
```

测试 docker 是否安装成功

```sh
$ docker run hello-world
```

## macOS

[Docker for Mac](https://docs.docker.com/docker-for-mac/) 要求的系统配置如下：

1. Mac hardware must be a 2010 or a newer model.
1. macOS must be version 10.14 or newer.
1. At least 4GB of RAM.
1. VirtualBox prior to version 4.3.30 must not be installed as it is not compatible with Docker Desktop.

从官网下载 Docker.dmg，双击安装即可。

After you’ve successfully installed Docker Desktop, open a terminal and run `docker --version` to check the version of Docker installed on your machine.

```sh
$ docker --version
Docker version 18.09.0, build 4d60db4
```

为了验证是否安装正确，可以运行 hello-world 实例：

```sh
$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```

尝试运行 ubuntu

```sh
$ docker run -it ubuntu bash
```

Run `docker image ls` to list the `hello-world` image that you download to your machine.

```sh
$ docker image ls

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hello-world         latest              f2a91732366c        2 years ago         1.85kB
```

List the `hello-world` container (spawned by the image) which exits after displaying its message. If it is still running, you do not need the `--all` option:

```sh
$ docker ps --all

    CONTAINER ID     IMAGE           COMMAND      CREATED            STATUS
    54f4984ed6a8     hello-world     "/hello"     20 seconds ago     Exited (0) 19 seconds ago
```

尝试运行 Nginx 服务器：

```sh
$ docker run -d -p 80:80 --name webserver nginx
```

停止 Nginx 服务器并删除：

```sh
$ docker stop webserver
$ docker rm webserver
```

## 镜像加速器

[online reading](https://github.com/yeasy/docker_practice/blob/master/install/mirror.md)

* https://registry.docker-cn.com
* https://reg-mirror.qiniu.com/

检查加速器是否生效

```sh
$ docker info
...
Registry Mirrors:
  https://registry.docker-cn.com/
```

## REF

1. [Orientation and setup](https://docs.docker.com/get-started/)