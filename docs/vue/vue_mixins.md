# 使用 mixins

Example:

```js
var myMixin = {
    created() {
        this.hello();
    },
    methods: {
        hello() {
            console.log('hello from mixin!');
        },
    },
}

var Component = Vue.extend({
    mixins: [myMixin],
});

var component = new Component();
```

当 mixin 和组件的数据有重叠时，会通过一定的算法合并。具体如下：

1. data 字段会递归合并，组件的 data 优先级更高。
1. 生命周期函数，将合并为数组。mixin 中的函数优先执行。
1. object 类型的选项，比如 `methods`, `components`, `directives`，将合并到一个对象。当有冲突时，组件的优先级更高。

## 全局 Mixin

慎用！

```js
Vue.mixin({
    created() {
        var myOption = this.$options.myOption;
        if (myOption) {
            console.log(myOption);
        }
    },
})

new Vue({
    myOption: 'hello!',
})
```

## REF

1. [Mixins - Vue.js][1]

[1]: https://vuejs.org/v2/guide/mixins.html "Mixins - Vue.js"