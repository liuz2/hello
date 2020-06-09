# 使用视口单位

以 Less 为例，假如设计稿宽度为 750 像素。则可以如下设置：

```less
@vw: 7.5vw;

.foo {
    width: 100/@vw;
}
```

其中，100 是设计稿的尺寸。

## REF

1. [利用视口单位实现适配布局](https://aotu.io/notes/2017/04/28/2017-4-28-CSS-viewport-units/), by *Tingglelaoo*, 2017-04-28