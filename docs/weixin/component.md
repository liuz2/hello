# 组件

所有自定义组件都需要基础库版本 `1.6.3` 及更高。

组件的 `.json` 文件需要设置：

```json
{
    "component": true
}
```

自定义组件的 `.js` 文件，需要使用 `Component()` 构造函数。

```js
Component({
    properties: {
        innerText: {
            type: String,
            value: 'default value',
        }
    },

    data: {
        someData: {},
    },

    methods: {
        customMethod: function() {},
    },

    observers: {
        'numberA, numberB': function(numberA, numberB) {
            this.setData({
                sum: numberA + numberB
            });
        }
    }
})
```

数据监听器 `observers` 在小程序基础库 `v2.6.1+` 中可用。

## 参考资料

1. [自定义组件](https://developers.weixin.qq.com/miniprogram/dev/framework/custom-component/)
1. [Component() 构造函数](https://developers.weixin.qq.com/miniprogram/dev/reference/api/Component.html)
1. [数据监听器](https://developers.weixin.qq.com/miniprogram/dev/framework/custom-component/observer.html)
