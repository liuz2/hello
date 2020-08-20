# 编写私有的通用模块

首先，增加 `.gitignore` 配置文件，避免 `node_modules/` 导致的体积暴增。

```
node_modules
```

## 构建脚本

通过模块可以使用 [rollup.js][2] 构建。相对于 Webpack，rollup.js 更轻量，速度更快。

rollup.js 的配置文件例子如下：

```js
// rollup.config.js
const buble = require('rollup-plugin-buble');
const terser = require('rollup-plugin-terser').terser;

module.exports = {
    input: 'src/main.js',

    output: {
        // 输出文件路径
        file: 'dist/bundle.min.js',
        name: 'my_demo_module',
        // 输出模块格式，常用的有 es, cjs, umd 等
        format: 'es',
    },

    plugins: [
        // 转译 ES6 语法
        buble(),
        // 压缩混淆
        terser()
    ],

    // 保持外部依赖的独立加载
    external: [
        'axios'
    ]
}
```

然后要配置 `package.json`，指定主文件和构建脚本等信息：

```json
{
    "name": "my-demo-module",
    "version": "1.0.0",
    "description": "My Awesome Demo Module",
    "main": "dist/bundle.min.js",
    "scripts": {
        "build": "rollup -c rollup.config.js"
    },
    "repository": {
        "type": "git",
        "url": "https://example.com/my-demo-module.git"
    },
    "dependencies": {
        "axios": "^0.19.2"
    }
}
```

打包时运行 `npm run build` 即可。

## 打标签

每次模块更新时，都需要增加标签。标签名可以是符合 [semver][3] 的语义化版本号。

```sh
$ git tag v0.0.2
$ git push origin v0.0.2
```

## 使用

当业务方使用时，模块的下载方式如下：

```sh
$ npm i git+https://example.com/my-demo-module.git#v0.0.2
```

注意，一定要使用 `git+https` 协议。`v0.0.2` 用于指定标签名。

## 参考资料

1. [rollup.js / repl][1]
1. [rollup.js / guide][2]

[1]: https://rollupjs.org/repl "rollup.js / repl"
[2]: https://rollupjs.org/guide/en/ "rollup.js / guide"
[3]: https://semver.org "Semantic Versioning 2.0.0"