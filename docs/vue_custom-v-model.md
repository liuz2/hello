# 自定义组件的 `v-model`

默认情况下，组件的 `v-model` 指令依赖 `value` 属性和 `input` 事件。如果想自定义，可以使用 `model` 选项：

```js
Vue.Component('base-checkbox', {
    model: {
        prop: 'checked',
        event: 'change',
    },
    props: {
        checked: Boolean,
    },
    template: `
        <input
            type="checkbox"
            v-bind:checked="checked"
            v-on:change="$emit('change', $event.target.checked)" />
    `
})
```

然后就可在该组件使用 `v-model`

```html
<base-checkbox v-model="lovingValue"></base-checkbox>
```

## REF

1. [Customizing Component `v-model`](https://vuejs.org/v2/guide/components-custom-events.html#Customizing-Component-v-model) - vue.js