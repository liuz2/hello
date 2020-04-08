# Docker 是什么？

[online reading](https://yeasy.gitbooks.io/docker_practice/content/introduction/what.html)

Docker 最初是 dotCloud 公司创始人 Solomon Hykes 发起的一个公司内部项目，并于 2013 年 3 月以 Apache 2.0 授权协议开源。

Docker 最初在 Ubuntu 12.04 上开发实现；Red Hat 从 RHEL 6.5 开始支持。

Docker 使用 Go 语言进行开发实现，基于 Linux 内核的 group，namespace，以及 AUFS 类的 Union FS 等技术，对进程进行封装隔离，属于操作系统层面的虚拟化技术。最初实现是基于 LXC，从 0.7 版以后开始去除 LXC，转而使用自行开发的 libcontainer，从 1.11 开始，则进一步演进为使用 runC 和 containered。

[为什么要使用 Docker？](https://github.com/yeasy/docker_practice/blob/master/introduction/why.md)

1. 更高效的利用系统资源
2. 更快速的启动时间
3. 一致的运行环境
4. 持续交付和部署
5. 更轻松的迁移
6. 更轻松的维护和扩展