# 增加全局变量

可以在两个地方增加全局变量：JavaScript 文件的注释和配置文件。

## JavaScript 文件的注释

可以在注释中增加全局变量：

```js
/* global var1, var2 */
```

如果要让全局变量可修改，需要增加 `writable` 修饰符：

```js
/* global var1:writable, var2:writable */
```

## 配置文件

在配置文件的 `globals` 配置项中增加全局变量，如果变量只读，设为 `readonly`，如果可写，设为 `writable`。

```json
{
    "globals": {
        "var1": "writable",
        "var2": "readonly"
    }
}
```

如果要禁用某些全局变量，应当使用 `off` 将其关闭：

```json
{
    "env": {
        "es6": true
    },
    "globals": {
        "Promise": "off"
    }
}
```

由于历史原因，以下数值是等价的：

```js
false === "readable" === "readonly"
true === "writeable" === "writable"
```

除 `readonly` 和 `writable` 之外，其余数值已被废弃，不推荐使用。

## 参考文献

1. [Specifying Globals](https://eslint.org/docs/user-guide/configuring#specifying-globals), ESLint