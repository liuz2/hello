# 关于 Gerrit

[Gerrit][2] 是 Google 为 Android 系统研发量身定制的一套免费开源的代码审核系统，它在传统的源码管理协作流程中强制性引入代码审核机制，通过人工代码审核和自动化代码验证过程，将不符合要求的代码屏蔽在代码库之外，确保核心代码多人校验、多人互备和自动化构建核验。

[点击这里][3]可以查看更详细的 Gerrit 历史。

引入 Gerrit 之前的系统架构
![Before Gerrit](https://pic1.zhimg.com/8b3d939d22207c7f9bb1318111b72ee8_r.jpg)

引入 Gerrit 之后的系统架构
![After Gerrit](https://pic1.zhimg.com/40789f16211f2aa28b3fe5491dc8ce04_r.jpg)

几乎任何需要正式发布的项目都应当使用 Gerrit 来进行代码审查，如果团队中有新人，必须使用 Gerrit 确保代码质量。

整体上来说，个推使用的标准配置为 Gerrit+Jenkins+Sonar。

> Sonar ([SonarQube][5])是一个开源平台，用于管理源代码的质量。Sonar 不只是一个质量数据报告工具，更是代码质量管理平台。

## 安装

> 如果有时间，可以详细阅读 Gerrit 的[官方文档][4]。

首先在[官网][2]下载最新包 gerrit-3.1.4.war。

部署和运行：

```sh
$ java -jar gerrit-3.1.4.war init -d review_site
```

## 参考文档

1. [Gerrit代码Review入门实战][1]，作者 *Hong Jack*，知乎专栏

[1]: https://zhuanlan.zhihu.com/p/21482554 "Gerrit代码Review入门实战"
[2]: https://www.gerritcodereview.com/ "Gerrit Code Review"
[3]: https://www.gerritcodereview.com/about.html "Gerrit's History"
[4]: https://gerrit-documentation.storage.googleapis.com/Documentation/3.1.4/index.html "Gerrit Docs"
[5]: https://www.sonarqube.org/ "Code Quality and Security | SonarQube"