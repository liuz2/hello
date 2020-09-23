# Function.prototype.apply 和 Function.prototype.call 的区别是什么？

按照 MDN 的解释：

> The `apply()` method calls a function with a given `this` value, and **arguments provided as an array** (or an array-like object).

> The `call()` method calls a function with a given `this` value and arguments provided individually.

> Note: While the syntax of `apply()` function is almost identical to that of `call()`, the fundamental difference is that `call()` accepts an argument list, while `apply()` accepts a single array of arguments.


可以看出两者的区别仅仅在于形参的不同。`call()` 的形参是参数列表（参数个数不定），`apply()` 的参数只有一个，类型是数组。

This is a `Function.apply()` example:

```js
const scores = [60, 77, 89, 61];
const result = Math.max.apply(null, scores);
console.log(result);
// 89
```

This is a `Function.call()` example:

```js
function Product(name, price) {
    this.name = name;
    this.price = price;
}

function Food(name, price) {
    Product.call(this, name, price);
    this.category = 'food';
}

console.log(new Food('cheese', 5).name);
```

## REF

1. [Function.prototype.apply()][1], MDN
1. [Function.prototype.call()][2], MDN

[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply "Function.prototype.apply()"
[2]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call "Function.prototype.call()"
