# 模块和 package

## 模块

1. 在 Node.js 中，模块分为 `.js` JavaScript 脚本文件、`.json` JSON 文本文件以及 `.node` 编译后的二进制模块文件。
2. 通过使用 `exports` 对象，将模块内部的变量或函数暴露到外部。也可以使用 `module.exports` 代替 `exports`。
3. 在 Node.js 中，可以将目录名指定为模块名，只需为该目录指定一个入口点即可。
4. 入口点通过 `package.json` 的 `main` 字段指定。
5. 如果操作系统的环境变量 `NODE_PATH` 有效，则 Node.js 在当前目录搜索不到模块时，会在该全局目录中继续搜索。
6. 在 UNIX 操作系统中，Node.js 还会在以下两个目录中搜索模块 `$HOME/.node_modules` 和 `$HOME/.node_libraries`。
7. 在 Node.js 中，通过包对一组模块进行统一管理。一个包实际上是一个目录，其中包含 `package.json` 文件。

在模块内部，可以访问当前模块的一些属性：

1. `module.id` 默认情况下，主模块的 id 属性值为 `"."`，其他模块的 id 属性值为该模块的绝对路径。
2. `module.filename` 当前模块的文件名，即绝对路径。
3. `module.loaded` 表示模块是否加载完毕。
4. `module.parent` 当前模块的父模块对象。是一个 `Module` 实例。
5. `module.children` 一个数组，包含当前模块的所有子模块，每个元素也是 `Module` 实例。

## Module 实例样例

```
Module {
  id: '.',
  exports: {},
  parent: null,
  filename: '/Users/foobar/Desktop/node-in-action/app.js',
  loaded: false,
  children:
   [ Module {
       id: '/Users/foobar/Desktop/node-in-action/foo.js',
       exports: {},
       parent: [Circular],
       filename: '/Users/foobar/Desktop/node-in-action/foo.js',
       loaded: false,
       children: [],
       paths: [Array] } ],
  paths:
   [ '/Users/foobar/Desktop/node-in-action/node_modules',
     '/Users/foobar/Desktop/node_modules',
     '/Users/foobar/node_modules',
     '/Users/node_modules',
     '/node_modules' ] }
```

## package.json 包含的常用字段

[online reading](https://docs.npmjs.com/creating-a-package-json-file)

1. `name` 包名。
2. `preferglobal` 是否支持全局安装。
3. `description` 包说明。
4. `version` 版本号。
5. `author` 作者信息数组。
6. `maintainers` 维护者信息数组。
7. `bugs` bug 的提交地址
8. `licenses` 许可证数组。
9. `repository` 仓库托管地址数组。
10. `keywords` 关键字数组，通常用于搜索。
11. `dependencies` 本包所依赖的包。

真实世界的案例，[webpack/package.json](https://github.com/webpack/webpack/blob/master/package.json)

### peerDependencies 是什么？

[Peer Dependencies](https://blog.domenic.me/peer-dependencies/), by *Domenic Denicola*, 2013/02/08

package.json 中的 `peerDependencies` 主要用来定义插件和宿主的依赖关系，即在插件中声明宿主版本号。

现实世界的例子 [`github.com/youzan/vant/package.json`]((https://github.com/youzan/vant/blob/985c64eaebef215dc7e0c05afa0ef27f756ad668/package.json#L65-L67))：

```json
{
    "name": "vant",
    "version": "1.5.0-beta2",
    "peerDependencies": {
        "vue": ">= 2.5.0"
    }
}
```

## REF

- [npm](http://www.runoob.com/nodejs/nodejs-npm.html)