# 虚拟环境（virtualenv）

## 什么是虚拟环境？

> A tool for creating isolated `virtual` python environments.

思考：两个依赖不同 Django 版本的项目如何同时进行？

虚拟环境是建立在宿主环境上的独立容器，具备和宿主环境相同的功能，可以快速创建和删除、方便管理。

## 虚拟环境的好处

1. 独立 - 相互隔离，互不影响
2. 纯净 - 只有当前项目的包和依赖，方便管理
3. 方便 - 摈弃频繁安装/卸载包和依赖

## 使用虚拟环境

```sh
# 安装 vitualenv 工具
$ pip install virtualenv

# 如果在 macOS 上使用 Homebrew 安装了 python3
$ pip3 install virtualenv

# 创建虚拟环境的目录
$ virtualenv folder
$ cd folder

# 进入虚拟环境
$ cd Scripts
$ activate

# 安装依赖
$ pip install django==1.11

# 退出虚拟环境
$ deactivate
```

为了简化不同虚拟环境之间的切换，可以安装 [`virtualenvwrapper`][3]

```sh
$ pip install virtualenvwrapper

# 设置环境变量 WORKON_HOME
$ export WORKON_HOME=~/Envs

# 切换到虚拟环境 env1
$ workon env1
```

具体文档可以参考[这里][4]。

## 参考资料

1. [virtualenv - 廖雪峰的官方网站][1]
1. [virtualenv - pypi][2]

[1]: https://www.liaoxuefeng.com/wiki/1016959663602400/1019273143120480 "virtualenv - 廖雪峰的官方网站"
[2]: https://pypi.org/project/virtualenv/ "virtualenv - PyPI"
[3]: https://pypi.org/project/virtualenvwrapper/ "virtualenvwrapper - PyPI"
[4]: https://virtualenvwrapper.readthedocs.io/en/latest/ "virtualenvwrapper documentation"