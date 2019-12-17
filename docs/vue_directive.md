# 自定义指令

除了内置的指令（如 `v-model` 和 `v-show`），Vue 也允许用户自定义指令。自定义指令一般用来操作底层 DOM。

比如，想让一个元素自动获取焦点：

```js
// 注册一个全局自定义指令 `v-focus`
Vue.directive('focus', {
    inserted(el) {
        el.focus();
    }
});
```

也可以使用组件的 `directives` 选项，注册局部指令：

```js
directives: {
    focus: {
        inserted(el) {
            el.focus();
        }
    }
}
```

在模板中，就可以使用 `v-focus` 引入指令：

```html
<input v-focus>
```

## 钩子函数

指令定义对象提供了如下钩子函数：

- `bind` 当指令和元素首次绑定时调用，可以进行一次性的设置工作
- `inserted` 当被绑定元素插入到它的父节点时调用（这仅保证它的父节点存在，并不能保证位于文档中）
- `update` 在组件的 VNode 更新后调用，此时它的子节点也许尚未更新
- `componentUpdated` 在元素 VNode 更新后，并且它的子节点全部更新后调用
- `unbind` 当元素同指令解绑时调用

## 钩子函数形参

钩子函数均包含以下参数：

- `el` 绑定指令的 DOM 元素
- `bind`
    - `name` 指令的名称，没有 `v-` 前缀
    - `value` 传入指令的数值。比如在 `v-my-directive="1 + 1"` 中，value 是 2
    - `oldValue` 旧值，仅在 `update` 和 `componentUpdated` 有效
    - `expression` 指令表达式的字符串数值。比如在 `v-my-directive="1+1"` 中，expression 是 `"1+1"`
    - `arg`
    - `modifiers`
- [`vnode`][2] Vue 编译器产生的虚拟节点
- `oldVnode`

## REF

1. [Custom Directives - Vue.js][1]

[1]: https://vuejs.org/v2/guide/custom-directive.html "Custom Directives"
[2]: https://github.com/vuejs/vue/blob/dev/src/core/vdom/vnode.js "VNode class declaration"
