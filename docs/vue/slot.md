# 理解 Slot（插槽）

> 版本 2.6.0（2019年2月4日发布）引入了一个新的统一语法（`v-slot` 指令）。它可以取代 `slot` 和 `slot-scope`。

## 插槽内容

受 Web Components 规范初稿启发，Vue 实现了一种内容分发 API，即把 `<slot>` 元素当作内容的分发出口。

比如，可以这样使用自定义组件：

```xml
<navigation-link url="/profile">
    Your Profile
</navigation-link>
```

其中，`<navigation-link>` 的模板定义如下：

```xml
<a v-bind:href="url" class="nav-link">
    <slot></slot>
</a>
```

如果 `<navigation-link>` 的模板不包含 `<slot>` 元素，则它们之间的内容将被丢弃。

## 编译范围

TODO

## 参考资料

1. [Slots - Vue.js][1]
2. [New Slot Syntax][2]

[1]: https://vuejs.org/v2/guide/components-slots.html "Slots - Vue.js"
[2]: https://github.com/vuejs/rfcs/blob/master/active-rfcs/0001-new-slot-syntax.md "rfcs/0001-new-slot-syntax"