# Function.prototype.apply 和 Function.prototype.call 的区别是什么？

按照 [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) 的解释：

> The `apply()` method calls a function with a given `this` value, and arguments provided as an array (or an array-like object).

> Note: While the syntax of `apply()` function is almost identical to that of `call()`, the fundamental difference is that `call()` accepts an argument list, while `apply()` accepts a single array of arguments.

可以看出两者的区别仅仅在于形参的不同。`apply()` 的形参是参数列表（参数个数不定），`apply()` 的参数只有一个，类型是数组。

```js
const scores = [60, 77, 89, 61];
const result = Math.max.apply(null, scores);
console.log(result);
// 89
```