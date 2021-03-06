# ES6 方便好用的特性

## STRING

`padStart()` 在字符串前新增前缀：

```js
const s = '12';
s.padStart(4, '0');
// => '0012'
```

`includes()` 判断是否包含某个子串：

```js
const str = 'foo bar';
str.includes('foo');
// => true
```

`repeat()` 复制字符串：

```js
'foo '.repeat(3);
// => 'foo foo foo '
```

## ARRAY

`includes()` 判断数组是否包含某个元素：

```js
const arr = [1, 42, 3];
arr.includes(42);
// => true
```

## ITERATOR

使用 `for ... of` 循环遍历数组和字符串：

```js
for (let item of [42, 12, 36]) {
    console.log(item);
}
// =>
// 42
// 23
// 36

for (let c of 'foo') {
    console.log(c);
}
// =>
// f
// o
// o
```

## 参考资料

1. [ES6 入门教程（第3版）](https://es6.ruanyifeng.com/)，作者阮一峰，2017 年 9 月，电子工业出版社