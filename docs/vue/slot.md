# 理解 Slot（插槽）

> 版本 2.6.0（2019年2月4日发布）引入了一个新的统一语法（`v-slot` 指令）。它可以取代 `slot` 和 `slot-scope`。新语法的逻辑依据在[这个 RFC](https://github.com/vuejs/rfcs/blob/master/active-rfcs/0001-new-slot-syntax.md) 中。

## 插槽内容

受 Web Components 规范初稿启发，Vue 实现了一种内容分发 API，把 `<slot>` 元素当作内容的分发出口。

比如，可以像这样使用自定义组件：

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
	`url` 将是 undefined，因为插槽内容会_传送到_ `<navigation-link>`，而不是在 `<navigation-link>`
	组件内_定义_。
	-->
</navigation-link>
```

> 记住，父级模板的所有变量仅在父范围内有效；子模板中的变量仅子模板范围内有效。

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

有时需要多个插槽。比如，在 `<base-layout>` 组件中有如下模板：

```xml
<div class="container">
    <header>
        <!-- We want header content here -->
    </header>
    <main>
        <!-- We want main content here -->
    </main>
    <footer>
        <!-- We want footer content here -->
    </footer>
</div>
```

对于这种情况，`<slot>` 元素有一种特殊的属性：`name`，它可以用来定义更多的插槽：

```xml
<div class="container">
    <header>
        <slot name="header"></slot>
    </header>
    <main>
        <slot></slot>
    </main>
    <footer>
        <slot name="footer"></slot>
    </footer>
</div>
```

没有 `name` 的 `<slot>` 拥有默认的 name: `default`。

为了向命名插槽写入内容，我们可以在 `<template>` 上使用 `v-slot` 指令，只需将插槽名称当作 `v-slot` 的参数即可。

```xml
<base-layout>
    <template v-slot:header>
        <h1>Here might be a page title</h1>
    </template>
    
    <p>A paragraph for the main content.</p>
    <p>And another one.</p>
    
    <template v-slot:footer>
        <p>Here's some contact info.</p>
    </template>
</base-layout>
```

这样一来，`<template>` 包裹的元素将被写入相应的插槽位置，其余元素将被写入 default 插槽。

当然，也可以将 default 插槽的内容放入 `<template>` 中，比如：

```xml
<template v-slot:default>
    Some Default Content
</template>
```

⚠️ 注意：`v-slot` 指令只能在 `<template>` 元素上使用。这一点与不推荐使用的 `slot` 属性不同。谨记！

> 以下是 v2.6.0- 的旧版语法。

TODO

## Scoped 插槽

> 以下是 v2.6.0+ 的更新

有时候，需要让插槽内容访问子组件内部的数据。比如，`<current-user>` 组件有如下模板：

```xml
<span>
    <slot>{{ user.lastName }}</slot>
</span>
```

如果我们想替换后备内容，用 first name 代替 last name。比如：

```xml
<current-user>
    {{ user.firstName }}
</current-user>
```

以上的写法无法正常运行，因为只有 `<current-user>` 组件可以使用 `user` 变量。我们提供的插槽内容却是在父容器中渲染的。两者没有交集。

为了让父容器的插槽内容访问 `user` 变量，可以将 `user` 绑定为 `<slot>` 元素的一个属性：

```xml
<span>
    <slot v-bind:user="user">
        {{ user.lastName }}
    </slot>
</span>
```

绑定到 `<slot>` 的属性，称作**插槽属性（slot props）**。现在，在父容器中，可以使用 `v-slot` 定义插槽属性的名称：

```xml
<current-user>
    <template v-slot:default="slotProps">
        {{ slotProps.user.firstName }}
    </template>
</current-user>
```

在上例中，我们使用 `slotProps` 来表示包含所有插槽属性的对象。但是，我们可以使用任意名称。

### 单独默认插槽的简写语法

对于上面的例子，如果默认插槽是唯一的内容，组件标签可以用作插槽的模板。这允许用户在组件上直接使用 `v-slot` 指令：

```xml
<current-user v-slot:default="slotProps">
    {{ slotProps.user.firstName }}
</current-user>
```

还可以更进一步简写。如果是 default 插槽，那么 `v-slot` 的参数可以省略：

```xml
<current-user v-slot="slotProps">
    {{ slotProps.user.firstName }}
</current-user>
```

注意：默认插槽的简写语法不能和命名插槽混写，否则会导致范围混淆。

```xml
<!-- 不合法，会导致警告 -->
<current-user v-slot="slotProps">
    {{ slotProps.user.firstName }}
    <template v-slot:other="otherSlotProps">
        slotProps is NOT available here
    </template>
</current-user>
```

只要存在多个插槽，务必使用 `<template>` 的完整写法：

```xml
<current-user>
    <template v-slot:default="slotProps">
        {{ slotProps.user.firstName }}
    </template>
    
    <template v-slot:other="otherSlotProps">
        ...
    </template>
</current-user>
```

### 解构插槽属性

在内部，scoped 插槽会将插槽内容封装到一个函数，函数只有一个参数：

```js
function internal_func(slotProps) {
    // ... slot content ...
}
```

这意味着 `v-slot` 的数值可以接受任意合法的 JavaScript 变量。在某些环境下（单文件组件或现代浏览器），还可以使用 ES2015 的解构赋值获取某些属性。

```xml
<current-user v-slot="{ user }">
    {{ user.firstName }}
</current-user>
```

这种写法不仅让模版更简洁，还可以重命名属性：

```xml
<current-user v-slot="{ user.person }">
    {{ person.firstName }}
</current-user>
```

甚至可以定义默认参数：

```xml
<current-user v-slot="{ user = { firstName: 'Guest' } }">
    {{ user.firstName }}
</current-user>
```

> 以下是 v2.6.0- 的内容，不推荐使用

## 动态插槽名称

> v2.6.0+ 新增内容



## 参考资料

1. [Slots - Vue.js][1]
2. [New Slot Syntax][2]

[1]: https://vuejs.org/v2/guide/components-slots.html "Slots - Vue.js"
[2]: https://github.com/vuejs/rfcs/blob/master/active-rfcs/0001-new-slot-syntax.md "rfcs/0001-new-slot-syntax"