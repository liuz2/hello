# 微信小程序自定义组件 slot

组件模板中可以使用 `<slot>` 节点，承载业务方页面提供的页面元素。

```xml
<!-- 组件模板 -->
<view class="wrapper">
    <view>这是组件的内部节点</view>
    <slot></slot>
</view>
```

```xml
<!-- 引用组件的页面模板 -->
<view>
    <component-tag-name>
        <view>这里是插入到组件 slot 中的内容。</view>
    </component-tag-name>
</view>
```

默认情况下，一个组件的 wxml 中只能有一个 slot。需要使用多 slot 时，可以在组件 js 中声明启用。

```js
Component({
    options: {
        multipleSlots: true,
    },
})
```

此时，可以在这个组件的 wxml 中使用多个 slot，以不同的 name 来区分。

```xml
<!-- 组件模板 -->
<view class="wrapper">
    <slot name="before"></slot>
    <view>这里是组件的内部细节</view>
    <slot name="after"></slot>
</view>
```

```xml
<!-- 引用组件的页面模板 -->
<view>
    <component-tag-name>
        <view slot="before">这里是插入到组件 slot name="before" 中的内容</view>
        <view slot="after">这里是插入到组件 slot name="after" 中的内容</view>
    </component-tag-name>
</view>
```

## REF

1. [组件模板和样式 | 自定义组件](https://developers.weixin.qq.com/miniprogram/dev/framework/custom-component/wxml-wxss.html)