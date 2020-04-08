# 基本概念

[online reading](https://github.com/yeasy/docker_practice/blob/master/basic_concept/README.md)

1. 镜像（Image）
2. 容器（Container）
3. 仓库（Repository）

## 镜像

Docker 镜像是一个特殊的文件系统，除了提供容器运行时所需的程序、库、资源、配置等文件外，还包含一些为运行时准备的一些配置参数，它不包含任何动态数据。

为了减少体积，Docker 充分利用 Union FS 的技术，将镜像设计为分层存储的架构。

## 容器

镜像和容器的关系，就像类和实例一样。镜像是静态定义，容器是鲜活实例。

容器的实质是进程，运行在属于自己的独立命名空间。

每个容器运行，以镜像为基础层，在其上叠加一个存储层，称作**容器存储层**。

容器存储层要保持无状态化，所有文件写入操作，都应该使用数据卷（Volume），或者绑定宿主目录。

## 仓库

Docker Registry 提供了存储、分发镜像的服务，正如 npm registry 一般。最常用的是官方的 [Docker Hub](https://hub.docker.com/)。

一个 Docker Registry 可以包含多个仓库，每个仓库可以包含多个标签，每个标签对应一个镜像。

通常，一个仓库包含一个软件不同版本的镜像。

公开服务的 Docker Register 有以下几种

| 厂商     | Registry                                                     |
| -------- | ------------------------------------------------------------ |
| CoreOS   | [Quay.io](https://quay.io/repository/)                       |
| Google   | [Google Container Registry](https://cloud.google.com/container-registry/) |
| 阿里巴巴 | [阿里云加速器](https://cr.console.aliyun.com/#/accelerator)  |
| 道客网络 | [DaoCloud](https://www.daocloud.io/mirror)                   |
| 道客网络 | [DaoCloud Hub](https://hub.daocloud.io/)                     |

除了使用公开服务，用户可以在本地搭建私有 Docker Registry。官方提供了 Docker Registry 镜像，可以直接使用作为私有 Registry 服务。
