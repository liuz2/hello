# 监听键盘事件

1. keypress 事件已被废弃，不推荐使用。
1. 按下任意按键，触发 `keydown` 事件 `e`。e 包含的属性有：code, key, keyCode 等。

比如，当按下小写字母 `a` 时，

- code: KeyA
- key: a
- keyCode: 65

## REF

1. [keypress event](https://developer.mozilla.org/en-US/docs/Web/API/Document/keypress_event) - MDN
1. [keydown event](https://developer.mozilla.org/en-US/docs/Web/API/Document/keydown_event) - MDN