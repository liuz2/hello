# 弹框禁止页面滚动

1. 设置页面高度为 100%，并且设置 CSS `overflow: hidden`
1. 设置弹框容器的 `tabindex` 为 -1，并且调用其 `focus()` 函数，让它激活
1. 监听 `touchmove` 事件，根据 target 是否位于弹框内，进行选择性阻止。

[Demo](https://liuz2.gitee.io/test/index.html)