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

当你想在插槽中使用数据时，比如：

```xml
<navigation-link url="/profile">
    Logged in as {{ user.name }}
</navigation-link>
```

插槽所能使用的变量范围和模板的其他部分一样。插槽并不能访问 `<navigation-link>` 的内部变量。比如，通过如下方式访问 `url` 是不可以的：

```xml
<navigation-link url="/profile">
    Clicking here will send you to: {{ url }}
    <!--
	`url` 将是 undefined，因为插槽内容会传送到 `<navigation-link>`，而不是在 `<navigation-link>`
	组件内定义。
	-->
</navigation-link>
```

> 记住，父模板的一切变量都会编译到父范围；子模板中的一切都将编译到子范围。

## 后备内容（Fallback Content）

有时候，需要为插槽指定后备内容。比如，对于 `<submit-button>` 组件：

```xml
<button type="submit">
    <slot></slot>
</button>
```

我们想在为提供任何内容时，渲染出 "Submit" 字段。只需要将后备内容置于 `<slot>` 之间：

```xml
<button type="submit">
    <slot>Submit</slot>
</button>
```

## 命名插槽

> 以下是 v2.6.0+ 更新内容。

TODO

> 以下是 v2.6.0- 的旧版语法。

## 参考资料

1. [Slots - Vue.js][1]
2. [New Slot Syntax][2]

[1]: https://vuejs.org/v2/guide/components-slots.html "Slots - Vue.js"
[2]: https://github.com/vuejs/rfcs/blob/master/active-rfcs/0001-new-slot-syntax.md "rfcs/0001-new-slot-syntax"