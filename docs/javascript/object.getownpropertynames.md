# Object.getOwnPropertyNames()

The `Object.getOwnPropertyNames()` method returns an array of all properties (**including non-enumerable properties** except for those which use Symbol) found directly in a given object.

```js
const object1 = { a: 1, b: 2, c: 3 };
console.log(Object.getOwnPropertyNames(object1);
// => ["a", "b", "c"]
```

## Description

`Object.getOwnPropertyNames()` returns an array whose elements are strings corresponding to the enumerable and non-enumerable properties found directly in a given object obj. The ordering of the enumerable properties in the array is consistent with the ordering exposed by a `for...in` loop (or by `Object.keys()`) over the properties of the object. The ordering of the non-enumerable properties in the array and the ordering among the enumerable properties is not defined.

In ES5, if the argument to this method is not an object (a primitive), then it will cause a TypeError. In ES2015, a non-object argument will be coerced to an object.

If you want only the enumerable properties, see [Object.keys()][./object.keys.md] or use a [for...in][./for-in.md] loop (note that this will also return enumerable properties found along the prototype chain for the object unless the latter is filtered with `hasOwnProperty()`).

## REF

1. [Object.getOwnPropertyNames()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyNames)
