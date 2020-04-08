# offsetLeft 和 offsetTop

1. offsetLeft 和 offsetTop 表示从一个元素外部边界到它的 `offsetParent` 内部边界的像素距离。
1. 元素的 offsetParent 表示其最近的祖先元素，并且：
    1. 该祖先的 position 不是 static；
    1. 如果没有这样的祖先元素，则 `<body>` 或其他文档元素（非视图元素）充当 offsetParent；
    1. 如果查找过程中，遇到 `<td>`, `<th>` 或 `<table>`，即使它们的 position 是 static，也会当作 offsetParent 返回；
1. [online demo](https://liuz2.gitee.io/test/dom-size/offsetleft-offsettop.html)

## REF

1. [Chapter 5 - Element Node Geometry & Scrolling Geometry](http://www.domenlightenment.com/#5)