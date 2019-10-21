# 元素尺寸

1. `scrollHeight` 表示元素的所有内容的高度和內边距，包括不可见的溢出内容。
1. `clientHeight` 表示视野中可见的内容和內边距，不包括 x 轴的滚动条高度、边框、外边距。
1. `offsetHeight` 比 `clientHeight` 多出了边框和滚动条高度。
1. `scrollTop` 滚动条滚动了多少距离。
1. 获取 `scrollTop` 的兼容写法：`document.documentElement.scrollLeft || document.body.scrollLeft`。
1. `HTMLElement.offsetTop` 只读属性，返回当前元素相对于它的 `offsetParent` 顶部的距离。
1. [`HTMLElement.offsetParent`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLelement/offsetParent) 表示当前元素距离最近的父容器。
1. `Element.getBoundingClientRect()` 返回元素尺寸和相对当前视口的距离。

## REF

1. [图解scrollHeight, clientHeight, offsetHeight, scrollTop以及获取方法 | 简书](https://www.jianshu.com/p/d267456ebc0d), by *米店的老板娘*, 2017-05-08
1. [HTMLElement.offsetTop](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/offsetTop)
1. [Element.getBoundingClientRect()](https://developer.mozilla.org/en-US/docs/Web/API/Element/getBoundingClientRect)