# Module Wrapper

执行模块代码前，Node.js 会把模块代码封装到一个匿名函数中。如下：

```js
(function(exports, require, module, __filename, __dirname) {
    // Module code actually lives here
});
```

一来，可以把模块内部的全局变量限定到模块内部；二来，可以引入 `exports`, `require`, `__dirname` 等貌似全局变量，实际上却隶属于模块的模块级变量。

## REF

1. [The module wrapper](https://nodejs.org/api/modules.html#modules_the_module_wrapper)
