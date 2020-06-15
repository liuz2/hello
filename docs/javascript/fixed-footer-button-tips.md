# 固定吸地按钮的注意事项

如果一个页面有固定吸地的按钮，比如：

```html
<style>
.fixed-bottom {
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
}
</style>

<div class="app">
    <div class="button fixed-bottom">
        吸底按钮
    </div>
</div>
```

这种页面会有如下兼容性问题。

## 页面底部出现空白

在某些机型（比如 iPhoneX 13.3.1(17D50)，微信版本 7.0.2）中，如果唤起虚拟键盘，将把页面向上推。输入完成后，隐藏虚拟键盘，此时页面底部会有较大空白。且该按钮的热区已经随着页面偏移。

为了解决这个问题，可以在输入框失去焦点后，手动让页面向下滚动：

```js
const $el = getMyAwesomeTextInput();
$el.addEventListener('blur', onBlur);

function onBlur() {
    /* 向下滚动 1 像素 */
    window.scrollBy(0, 1);
}
```