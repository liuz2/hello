# 列表渲染

```html
<div v-for="item in items" :key="item.message">
    {{ item.message }}
</div>
```

`v-for` 支持可选的第二个参数，表示索引：

```html
<div v-for="(item, index) in items">
    {{ index }} - {{ item.message }}
</div>
```

也可以使用 `of` 替换 `in`，更符合 JavaScript 语法：

```html
<div v-for="item of items"></div>
```

`v-for` 也可以遍历对象：

```html
<div v-for="value in object">
    {{ value }}
</div>
```

可以使用第二个可选参数，当作键值：

```html
<div v-for="(value, name) in object">
    {{ name }}: {{ value }}
</div>
```

第三个可选参数，表示索引值：

```html
<div v-for="(value, name, index) in object">
    {{ index }}. {{ name }}: {{ value }}
</div>
```

## 参考文档

1. [List Rendering](https://vuejs.org/v2/guide/list.html)