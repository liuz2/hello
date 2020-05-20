# CSS3 动画

## 配置动画

`animation` 可配置的参数有：

1. `animation-name`
1. `animation-duration`
1. `animation-timing-function`
1. `animation-delay`
1. `animation-iteration-count` 动画重复次数，使用 `infinite` 表示无限循环
1. `animation-direction` 动画的播放方向，可选值有 `normal`, `reverse`, `alternate`, `alternate-reverse`
1. `animation-fill-mode` 指定开始结束的状态，可选值有 `none`, `forwards`, `backwards`, `both`
1. `animation-play-state` 动画状态，可选值有 `running`, `paused`

## 使用 keyframes 定义动画序列

```css
p {
    animation-duration: 3s;
    animation-name: slidein;
}

@keyframes slidein {
    from {
        margin-left: 100%;
        width: 300%;
    }

    to {
        margin-left: 0%;
        width: 100%;
    }
}
```

## 使用动画事件

`AnimationEvent` 提供了动画相关的事件。使用方法如下：

```js
const el = document.querySelector('#watchme');
el.addEventListener('animationstart', listener, false);
el.addEventListener('animationend', listener, false);
el.addEventListener('animationiteration', listener, false);

el.className = 'slidein';

function listener(e) {
    console.log(e.type, e.elapsedTime);
}
```

## REF

1. [Using CSS animations - MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations)
