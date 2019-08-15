# 如何禁用 ESLint ?

```js
/* eslint-disable */
alert('foo');
/* eslint-enable */

/* eslint-disable no-alert, no-console */
alert('foo');
console.log('bar');
/* eslint-enable no-alert, no-console */
```

放到文件开头，可以在整个文件禁用

```js
/* eslint-disable */
alert('foo');
```

还可以禁用单行

```js
alert('foo'); // eslint-disable-line

// eslint-disable-next-line
alert('foo');

alert('foo'); /* eslint-disable-line */

/* eslint-disable-next-line */
alert('foo');
```

## REF

1. [Disabling Rules with Inline Comments](https://eslint.org/docs/user-guide/configuring#disabling-rules-with-inline-comments)