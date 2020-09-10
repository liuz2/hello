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

## npm init

Create a package.json file.

[`create-egg`][3] 用到了这个特性：

> Thanks to `npm init` feature introduced at npm@6.

### SYNOPSIS

```sh
npm init [--force | -f | --yes | -y | --scope]
npm init <@scope> (same as `npx <@scope>/create`)
npm init [<@scope>/]<name> (same as `npx [<@scope>/]create-<name>`)
```

### EXAMPLES

Create a new React-based project using **create-react-app**:

```sh
$ npm init react-app ./my-react-app
```

Create a new **esm**-compatible package using **create-esm**:

```sh
$ mkdir my-esm-lib && cd my-esm-lib
$ npm init esm --yes
```

### DESCRIPTION

`npm init <initializer>` can be used to set up a new or existing npm package.

`initializer` in this case is an npm package named `create-<initializer>`, which will be installed by npx, and then have its main bin executed – presumably creating or updating package.json and running any other initialization-related operations.

The init command is transformed to a corresponding npx operation as follows:

- `npm init foo` -> `npx create-foo`
- `npm init @usr/foo` -> `npx @usr/create-foo`
- `npm init @usr` -> `npx @usr/create`

Any additional options will be passed directly to the command, so `npm init foo --hello` will map to `npx create-foo --hello`.

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
1. [npm-init][2]

[2]: https://docs.npmjs.com/cli/init "npm-init"
[3]: https://www.npmjs.com/package/create-egg "create-egg"
