# Mocha 如何支持 ES6 模块语法？

Mocha v6.0.0 [移除了 `--compilers`][1]，同时提供了更方便的 `--require` 选项。

如果想在测试用例中使用 ES6 模块语法，可以按如下步骤操作。

首先，下载 [`@babel/register`][3] 等 babel 全家桶:

```sh
$ npm install --save-dev @babel/core @babel/register @babel/preset-env
```

然后，创建 `.babelrc`:

```json
{
    "presets": [
        ["@babel/preset-env"]
    ]
}
```

接着，修改 `package.json`，新增如下命令：

```json
{
    "scripts": {
        "test": "mocha --require @babel/register"
    }
}
```

最后，运行 `npm run test` 。从此，测试用例和 ES6 模块语法愉快的在一起了。🎉

## REF

1. [compilers deprecation][2]
1. [Trying ES6 style import gives 'Cannot use import statement outside a module'][4], by *lena*, 2019/11/26

[1]: https://mochajs.org/#-compilers "compilers option"
[2]: https://github.com/mochajs/mocha/wiki/compilers-deprecation "compilers deprecation"
[3]: https://babeljs.io/docs/en/next/babel-register.html "@babel/register"
[4]: https://stackoverflow.com/questions/59042716/trying-es6-style-import-gives-cannot-use-import-statement-outside-a-module "Trying ES6 style import"
