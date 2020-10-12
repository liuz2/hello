# pip

## 常用命令

pip 是一个 Python 包管理工具。常用的命令如下：

```sh
# 安装软件包
$ pip install some-package

# 查看帮助
$ pip --help
```

查看安装的文件信息：

```sh
$ pip show --files SomePackage
```

展示过期的包：

```sh
$ pip list --outdated
```

更新包:

```sh
$ pip install --upgrade SomePackage
```

卸载包：

```sh
$ pip uninstall SomePackage
```

## 更改 pip 源到国内镜像

国内镜像源：

- 豆瓣 https://pypi.doubanio.com/simple/
- 阿里云 https://mirrors.aliyun.com/pypi/simple/
- 清华大学
    - https://pypi.tuna.tsinghua.edu.cn/simple/
    - https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/

临时更改

```sh
$ pip install some-package -i https://mirrors.aliyun.com/pypi/simple/
```

永久更改

```sh
# 升级 pip 到最新版本
$ pip install pip -U
$ pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
```

## 参考资料

1. [pip - The Python Package Installer][2]
1. [更换 pip 源到国内镜像][1]，作者*JazPd*，2019/03/09

[1]: https://www.cnblogs.com/believepd/p/10499844.html "更换 pip 源到国内镜像"
[2]: https://pip.pypa.io/en/stable/ "pip - The Python Package Installer"
