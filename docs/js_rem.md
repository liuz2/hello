# About rem

> This is a draft version, need to be polished and tested.

In CSS, rem stands for "root em".

## rem.js

代码如下：

```js
(function(window, document){
    var screenWidth;
    var html = document.documentElement;

    function getHtmlFontSize() {
        if (window.getComputedStyle) {
            return parseFloat(window.getComputedStyle(html, null)['font-size']);
        } else {
            return parseFloat(html.style.fontSize);
        }
    }

    function setMediaCss() {
        if (!screenWidth) {
            screenWidth = html.offsetWidth;

            if (screenWidth >= 1280) {
                screenWidth = 1280;
            } else if (screenWidth <= 640) {
                screenWidth *= (1280/screenWidth);
            } else if (screenWidth <= 320) {
                screenWidth *= (1280/screenWidth);
            }

            html.style.fontSize=200/640*screenWidth+'px';//根据页面大小算出font-size

            //以下是特殊处理 试过一台htc下的某个浏览器设置字体大小后再获取font-size会比所设的值会相对变小 所以设置大一点让它font-size的结果是想设的结果
            var htmlFs = getHtmlFontSize();
            var mediaFs = 200/640*screenWidth;
            if(htmlFs!==mediaFs && (htmlFs>mediaFs+1 || htmlFs<mediaFs-1)){
                html.style.fontSize='200px';
                html.style.fontSize=200/getHtmlFontSize()*mediaFs+'px';
            }
        } else {
            // 存在screenWidh
            var newScreenWidh=html.offsetWidth;
            if(screenWidth != newScreenWidh){//screenWidh不等于当前页面宽度肯定是旋转屏幕后触发的
                var style=document.createElement('style');//创建style标签设置media
                style.innerHTML='@media only screen and (width: '+newScreenWidh+'px) {html{font-size: '+200/640*newScreenWidh+'px !important;}}';
                document.getElementsByTagName('head')[0].appendChild(style);//把style插入到head里面
                window.removeEventListener('orientationchange',orientationchange);//设置了横竖屏的情况之后可以把旋转触发去掉
            }
        }
    }

    setMediaCss();

    function orientationchange() {
        setTimeout(function(){
            setMediaCss();
        }, 300);
    };

    if (window.addEventListener) {
        window.addEventListener('orientationchange', orientationchange);
    }
})(window, document);
```

## getComputedStyle

```js
var style = window.getComputedStyle(element[, pseudoElt]);
```

The `element` is the Element object.

```
EventTarget <--- Node <--- Element <--- HTMLElement <--- HTMLHtmlElement
```

The returned `style` is a live CSSStyleDeclaration object, which updates automatically when the element's styles are changed.

## HMTLElement.offsetWidth

![HTMLElement.offsetWidth](https://developer.mozilla.org/@api/deki/files/186/=Dimensions-offset.png)

The `HTMLElement.offsetWidth` read-only property returns the layout width of an element as an integer.

Typically, `offsetWidth` is a measurement in pixels of the element's CSS width, including any borders, padding, and vertical scrollbars(if rendered). It does not include the width of pseudo-elements such as `::before` or `::after`.

If the element is hidden, then `0` is returned.

This property will round the value to an integer. If you need a fractional value, see `element.getBoundingClientRect()`.

## REF

1. [rem.js][1]
1. [Window.getComputedStyle][2]
1. [HTMLElement.offsetWidth][3]
1. [Understanding and using rem units in CSS][4], by *Adrian Sandu*, 2015/10/06

[1]: https://m.qq.com/javascripts/lib/rem.js
[2]: https://developer.mozilla.org/en-US/docs/Web/API/Window/getComputedStyle
[3]: https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/offsetWidth
[4]: https://www.sitepoint.com/understanding-and-using-rem-units-in-css/ "Understanding and Using rem Units in CSS"
