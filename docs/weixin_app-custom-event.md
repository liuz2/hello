# 自定义组件的事件

触发事件

```js
// 事件的 detail 属性，提供给事件监听函数
const myEventDetail = {};
// bubbles?, composed?, capturePhase?
const myEventOption = {};
this.triggerEvent('myevent', myEventDetail, myEventOption);
```

监听事件

```xml
<component-tag-name bind:myevent="onMyEvent" />
```

```js
Page({
    onMyEvent(e) {
        console.log(e.detail);
    },
})
```

## REF

1. [组件间通信与事件](https://developers.weixin.qq.com/miniprogram/dev/framework/custom-component/events.html)