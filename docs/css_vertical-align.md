# 实现垂直居中

方法一：

```css
.element {
    width: 600px; height: 400px;
    position: absolute; left: 50%; top: 50%;
    margin-top: -200px;    /* 高度的一半 */
    margin-left: -300px;    /* 宽度的一半 */
}
```

方法二：

```css
.element {
    width: 600px; height: 400px;
    position: absolute; left: 50%; top: 50%;
    transform: translate(-50%, -50%);    /* 50%为自身尺寸的一半 */
}
```

方法三：

```css
.element {
    width: 600px; height: 400px;
    position: absolute; left: 0; top: 0; right: 0; bottom: 0;
    margin: auto;    /* 有了这个就自动居中了 */
}
```

## REF

1. [小tip: margin:auto实现绝对定位元素的水平垂直居中][1]，张鑫旭，2013/11/19

[1]: https://www.zhangxinxu.com/wordpress/2013/11/margin-auto-absolute-%e7%bb%9d%e5%af%b9%e5%ae%9a%e4%bd%8d-%e6%b0%b4%e5%b9%b3%e5%9e%82%e7%9b%b4%e5%b1%85%e4%b8%ad/ "小tip: margin:auto实现绝对定位元素的水平垂直居中"