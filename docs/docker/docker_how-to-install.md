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

检查版本

```sh
$ docker --version
$ docker-compose --version
$ docker-machine --version
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