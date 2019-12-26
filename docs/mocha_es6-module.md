# Mocha 如何支持 ES6 模块语法？

在 v6.0.0 中，[移除了 `--compilers` 选项][1]。但是，Mocha 提供了更简单的 `--require` 选项。

如果要支持 ES6 模块语法，首先，下载 [`@babel/register`][3]:

```sh
$ npm install --save-dev @babel/core @babel/register @babel/preset-env
```

创建 `.babelrc`:

```json
{
    "presets": [
        ["@babel/preset-env"]
    ]
}
```

修改 `pacakge.json`，新增如下命令：

```json
{
    "scripts": {
        "test": "mocha --require @babel/register"
    }
}
```

运行 `npm run test` 即可。现在，可以在测试用例中愉快是使用 ES6 模块语法了。🎉

## REF

1. [compilers deprecation][2]
1. [Trying ES6 style import gives 'Cannot use import statement outside a module'][4], by *lena*, 2019/11/26

[1]: https://mochajs.org/#-compilers "compilers option"
[2]: https://github.com/mochajs/mocha/wiki/compilers-deprecation "compilers deprecation"
[3]: https://babeljs.io/docs/en/next/babel-register.html "@babel/register"
[4]: https://stackoverflow.com/questions/59042716/trying-es6-style-import-gives-cannot-use-import-statement-outside-a-module "Trying ES6 style import"
