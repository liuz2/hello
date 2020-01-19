# 如何处理 window not defined 的报错？

在 Node 环境中，不存在 `window` 全局变量。为了在 mocha 中对前端代码进行单元测试，可以引入 `jsdom` 和 `jsdom-global`。

```sh
$ npm install --save-dev jsdom jsdom-global
```

其中，[JSDOM][1] 是一种适用于 Node.js 环境的，符合 DOM 和 HTML 规范的纯 JavaScript 实现。而 [`jsdom-global`][2] 会在 Node.js 环境中注入 `document`，`window` 等全局变量。

然后，修改 test 脚本命令：

```json
{
    "scripts": {
        "test": "mocha --require jsdom-global/register"
    }
}
```

[1]: https://github.com/jsdom/jsdom "jsdom/jsdom"
[2]: https://github.com/rstacruz/jsdom-global "rstacruz/jsdom-global"
[3]: https://stackoverflow.com/questions/34059644/mocha-command-giving-referenceerror-window-is-not-defined "mocha command giving ReferenceError: window is not defined"
