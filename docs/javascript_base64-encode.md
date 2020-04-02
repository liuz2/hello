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

## 原理

> 以下摘自 litongqian 的掘金文章[《Base64原理》][1]。

因为有些网络传送渠道不支持所有字节，比如传统邮件只支持可见字符，像 ASCII 码的控制字符就无法传输。图片的二进制流也是无法传输的。Base64 应运而生，基于 64 个可打印字符来表示二进制数据。

标准的 Base64 协议规定的字符集如下：

```
ABCDEFGHIJKLMNOPQRSTUVWXYZ
abcdefghijklmnopqrstuvwxyz
0123456789+/
```

因为 `64=2^6`，因此用 6bit 表示一个 Base64 字符，1byte 是 8bit，6 和 8 的最小公约数是 24。因此，通常将 3byte 表示为 4 个 Base64 字符。如果二进制数据长度不是 3 的整数倍，则将其尾部补 0。如果转换后的 Base64 字符个数不是 4 的倍数，则其尾部补 `=`。


## REF

1. [btoa()](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/btoa) - MDN
1. [atob()](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/atob)
1. [Base64 原理 - 掘金][1], by *litongqian*

[1]: https://juejin.im/post/5bd00c0251882577787451f4 "Base64 原理"