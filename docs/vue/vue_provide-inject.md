# 使用 provide 和 inject

> 2.2.0+ 后可用

类型

- provide: `Object | () => Object`
- inject: `Array<string> | { [key:string]: string | Symbol | Object }`

`provide` 和 `inject` 是为高级插件/组件库准备的，不建议在日常项目中使用。

这对选项允许父组件向子组件传递参数。

`provide` 和 `inject` 不是响应式的。

```js
var Provider = {
    provide: {
        foo: 'bar'
    }
}

var Child = {
    inject: ['foo'],
    created() {
        console.log(this.foo);
    },
}
```

对于 v2.2.1+ 的 Vue.js，inject 数值可以当作 `props` 和 `data` 的初始值。

## REF

1. [provide/inject][1]

[1]: https://vuejs.org/v2/api/#provide-inject "provide/inject"