# 编写 CLI 应用

CLI，Command Line Interface 是指命令行接口。常用的前端工具，比如 Webpack, Rollup, Vue, React, Angular 等，都有 CLI 应用。

想要构建 CLI 应用，首先要知道 Node.js 的 [`process.argv`][1] 保存着 Node.js 的命令行参数。

比如，编写 `main.js`：

```js
process.argv.forEach((val, index) => {
    console.log(`${index}: ${val}`);
});
```

如果在命令行中输入：`node main.js one two=three four`，则输出如下：

```
0: /path/to/global/node
1: /path/to/main.js
2: one
3: two=three
4: four
```

可以知道，`process.argv` 是一个字符串数组。数组的第一个参数表示 node.js 可执行文件的绝对路径，第二个参数表示执行的 JavaScript 入口文件，其他多余参数，从第三个参数开始存储。

`process.argv` 不做参数解析，可以自己手动解析，但不如使用流行的参数解析库。

常用的解析库有 [minimist][2] 等。

## 使用 minimist

TODO

## 阅读 minimist 源码

TODO

## 参考资料

1. [process.argv][1], Node.js Documentation

[1]: https://nodejs.org/dist/latest-v12.x/docs/api/process.html#process_process_argv "process.argv"
[2]: https://github.com/substack/minimist "substack/minimist"