# 如何让元素获得焦点？

`HTMLElement.focus()` 可以把焦点置于某一特定元素，前提是该元素可以获得焦点。

语法：

```js
element.focus({
    // 控制是否阻止页面滚动
    preventScroll: Boolean,
});
```

通过将元素的 `tabindex` 设为 `"-1"`，可以把链接和表单之外的元素可以获取程序设置的焦点。

## REF

1. [HTMLElement.focus() | MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/focus)
1. [Keyboard Accessibility - Tabindex](https://webaim.org/techniques/keyboard/tabindex)