# Base64 编解码

`btoa(string)` 可以将字符串进行 base64 编码；`atob(base64)` 将 base64 编码解码为字符串。

> b 代表字符串 binary string，a 代表 base64 编码（ASCII 码）

```js
window.btoa('Hello, World!')
// => "SGVsbG8sIFdvcmxkIQ=="
window.atob('SGVsbG8sIFdvcmxkIQ==')
// => "Hello, World!"
```

## 兼容性

[caniuse](https://caniuse.com/#search=btoa)

IE 10+ 基本都支持 `window.atob()` 和 `window.btoa()`。

## REF

1. [btoa()](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/btoa) - MDN
1. [atob()](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/atob)