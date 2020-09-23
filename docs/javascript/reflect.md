# Reflect

**Reflect** is a built-in object that provides methods for interceptable JavaScript operations. The methods are the same as those of [proxy handlers][2]. `Reflect` is not a function object, so it's not constructible.

All properties and methods of `Reflect` are static (just like the `Math` object).

## Reflect.apply

The static `Reflect.apply()` method calls a target function with arguments as specified.

**Syntax**

```js
Reflect.apply(target, thisArguments, argumentsList)
```

The **argumentsList** is an array-like object specifying the arguments with which `target` should be called.

```js
console.log(Reflect.apply(Math.floor, undefined, [1.75]));
// => 1

console.log(Reflect.apply(String.fromCharCode, undefined, [104, 101, 108, 108, 111]));
// => "hello"

console.log(Reflect.apply(RegExp.prototype.exec, /ab/, ['confabulation']).index);
// => 4

console.log(Reflect.apply(''.charAt, 'ponies', [3]));
// => "i"
```

**Description**

In ES5, you typically use the `Function.prototype.apply()` method to call a function with a given `this` value and `arguments` provided as an array (or an array-like object).

```js
Function.prototype.apply.call(Math.floor, undefined, [1.75]);
```

With `Reflect.apply()` this becomes less verbose and easier to understand.

## REF

1. [Reflect - MDN][1]
1. [Reflect.apply][3]

[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect "Reflect"
[2]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy "Proxy"
[3]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/apply "Reflect.apply"
