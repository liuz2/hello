# 常用的 npm 命令

```sh
# 升级 npm
$ sudo npm install npm -g

# 查看当前目录安装的包
$ npm list
# 查看全局安装的包
$ npm list -g

# 卸载模块
$ npm uninstall <package_name>

# 搜索模块
$ npm search <package_name>

# 查看信息
$ npm view <package_name>

# 查看当前项目的顶级 node_modules 绝对目录
$ npm root
# 查看全局包的安装路径
$ npm root -g

# 清空 npm 本地缓存
$ npm cache clear

# 更新当前目录下的模块
$ npm update <package>

# 更新全局模块
$ npm update <package> -g

# 查看可执行文件的路径
$ npm bin
$ npm bin --global
```

## npm-ci

> Install a project with a clean slate

```sh
$ npm ci
```

它通常用于持续构建系统，比如 Travis：

```yml
# .travis.yml
install:
- npm ci
# keep the npm cache around to speed up installs
cache:
    directories:
    - "$HOME/.npm"
```

使用 `npm-ci` 前，要确保 `package-lock.json` 或 `npm-shrinkwrap.json` 务必存在。

`npm-ci` 和 `npm-install` 命令相似，只不过前者推荐用于自动化环境（比如测试平台、持续继承和部署等）使用。它会比普通的 `npm-install` 快，也会更严格。

`npm-ci` 和 `npm-install` 的主要不同是：

1. 项目必须存在 `package-lock.json` 或 `npm-shrinkwrap.json`
1. 如果 package 锁定文件和 `package.json` 不匹配，`npm ci` 会报错退出，而不会更新包 锁定文件
1. `npm ci` 一次只能安装完整的项目：该接口无法安装单个依赖
1. 如果已经存在 `node_modules` 目录，`npm ci` 会将其删除，然后再重新安装
1. 它不会写入 `package.json` 文件或任何 package 锁定文件：安装依赖项其实是冻结的

## 参考文档

1. [npm-ci](https://docs.npmjs.com/cli/ci.html)