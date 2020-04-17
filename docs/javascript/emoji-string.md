# 正确识别 emoji 字符长度

emoji 表情符号，在 JS 中会被认为是两个字符，比如：

```js
'一个🚗'.length
// 4
```

阮一峰在《ECMAScript 6》的[字符串的新增方法][2]一章有详细解释：

> JavaScript 内部，字符以 UTF-16 的格式储存，每个字符固定为 2 个字节。对于那些需要4个字节储存的字符（Unicode 码点大于 `0xFFFF` 的字符），JavaScript 会认为它们是两个字符。

恰好，emoji 字符的码点大于 `0xFFFF`。

为了正确显示 emoji 字符的长度，可以使用扩展运算符 `...`，将字符串转换为数组，然后获取数组的长度即可。

```js
const s = '一个🚗';
const arr = [...s];
arr
// ['一', '个', '🚗']
arr.length
// 3
```

因为，扩展运算符能够正确识别大于 `0xFFFF` 的 Unicode 字符。

## 参考资料


1. [数组的扩展][1] / 扩展运算符的应用 / 字符串，阮一峰
2. [字符串的新增方法][2]，阮一峰

[1]: https://es6.ruanyifeng.com/#docs/array "数组的扩展"
[2]: https://es6.ruanyifeng.com/#docs/string-methods "字符串的新增方法"