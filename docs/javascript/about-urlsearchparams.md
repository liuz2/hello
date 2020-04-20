# URLSearchParams

`URLSearchParams` API 提供了对于查询字符串（`?` 之后的字符串）的一些简单操作。常用方法如下：

1. `append()` - 添加新键值对
1. `delete()` - 删除指定的所有键值对
1. `get()` - 获取第一个键值
1. `getAll()` - 获取所有的键值
1. `has(key)` - 判断 key 是否存在
1. `set(key, value)` - 设定键名为 key 的数值为 value
1. `toString()` - 获取查询字符串格式

通常开发人员使用正则表达式或字符串分割来处理 URL 的查询字符串，麻烦且易错。

Chrome 49 实现了 [URL 规范](https://url.spec.whatwg.org/#urlsearchparams) 中的 URLSearchParams。

```js
const params = new URLSearchParams('q=search+string&version=1&person=Eric')
console.log(params.get('q'))        // => "search string"
console.log(params.get('version'))  // => "1"
console.log(Array.from(params))     // => [["q", "search string"], ["version", "1"], ["person", "Eric"]]
```

如果查询字符串有多个同名参数，`get()` 只返回第一个参数：

```js
const params = new URLSearchParams('version=1&person=Eric&version=2')
console.log(params.get('version'))  // => "1"
```

但是 `let ... of` 可以**遍历所有的同名参数**：

```js
const params = new URLSearchParams('version=1&person=Eric&version=2')
for (let p of params) {
    console.log(p)
}

// 输出如下：
["version", "1"]
["person", "Eric"]
["version", "2"]
```

`set()` 可以修改第一个指定的参数值，如果有多个同名参数，会将删除其余的同名参数：

```js
const params = new URLSearchParams('version=1&person=Eric&version=2')
params.set('version', 42)
console.log(params.toString())  // => "version=42&person=Eric"
```

`append()` 用来新增一个参数：

```js
const params = new URLSearchParams('version=1&person=Eric')
params.append('version', 42)
console.log(params.toString())  // => "version=1&person=Eric&version=42"
```

`delete()` 删除指定的参数，有多少删多少：

```js
const params = new URLSearchParams('version=1&name=tony&version=2')
params.delete('version')
console.log(params.toString())  // => "name=tony"
```

## 与 URL 协同工作

大部分情况下，开发人员会处理完整的 url 地址。此时，使用 `URL` 构造函数会很方便。

```js
const url = new URL('https://example.com?foo=1&bar=2')
const params = new URLSearchParams(url.search)
params.set('baz', 3)

console.log(params.has('baz'))  // => true
console.log(params.toString())  // => foo=1&bar=2&baz=3
```

如果要更新当前的 url，可以获取，更新，然后使用 `history.replaceState()` 更新地址：

```js
var params = new URLSearchParams(location.search)
params.set('version', 42)

window.history.replaceState({}, '', `${location.pathname}?${params}`)
```

## 特性检测和浏览器支持

目前支持 `URLSearchParams` 的浏览器有：

```js
if ('URLSearchParams' in window) {
    // 浏览器支持 URLSearchParams
}
```

可以使用 `@ungap/url-search-params` 兼容旧版浏览器：

```js
import URLSearchParams from '@ungap/url-search-params'
```

## 参考文献

1. [URLSearchParams | MDN][1]
1. [Easy URL Manipulation with URLSearchParams | Google Developers][2], by *Eric Bidelman*, 2016/01
1. [ungap project][4]

[1]: https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams "URLSearchParams | MDN"
[2]: https://developers.google.cn/web/updates/2016/01/urlsearchparams "Easy URL Manipulation with URLSearchParams | Google Developers"
[3]: https://caniuse.com/#search=URLSearchParams "Can I use ... URLSearchParams?"
[4]: https://ungap.github.io/ "ungap"
[5]: https://github.com/ungap/url-search-params "@ungap/url-search-params"