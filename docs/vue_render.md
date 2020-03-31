# render 函数

## 基本用法

使用 `render` 可以代替 `template` 模板字符串：

```js
Vue.component('anchored-heading', {
    render(createElement) {
        return createElement(
            'h' + this.level,   // tag name
            this.$slots.default, // array of children
        );
    },

    props: {
        level: {
            type: Number,
            required: true,
        }
    }
});
```

在单页应用中，可以向子组件动态传入属性：

```js
// main.js
import Vue from 'vue';
import App from './App.vue';

new Vue({
    render: h => h(App, {
    	props: {
      		foo: 38,
    	},
  	}),
}).$mount('#app');

// App.vue
export default {
    props: ['foo'],
}
```

## createElement 函数签名

```js
// @returns {VNode}
createElement(
    // {String | Object | Function}
    // An HTML tag name, component options, or async
    // function resolving to one of these. Required.
    'div',

    // {Object}
    // A data object corresponding to the attributes
    // you would use in a template. Optional.
    {
        // (see details in the next section below)
    },

    // {String | Array}
    // Children VNodes, built using `createElement()`,
    // or using strings to get 'text VNodes'. Optional.
    [
        'Some text comes first.',
        createElement('h1', 'A headline'),
        createElement(MyComponent, {
            props: {
                someProp: 'foobar',
            },
        }),
    ],
)
```

## data object 详解

```js
{
    // Same API as `v-bind:class`, accepting either
    // a string, object, or array of strings and objects.
    class: {
        foo: true,
        bar: false
    },
    // Same API as `v-bind:style`, accepting either
    // a string, object, or array of objects.
    style: {
        color: 'red',
        fontSize: '14px'
    },
    // Normal HTML attributes
    attrs: {
        id: 'foo'
    },
    // Component props
    props: {
        myProp: 'bar'
    },
    // DOM properties
    domProps: {
        innerHTML: 'baz'
    },
    // Event handlers are nested under `on`, though
    // modifiers such as in `v-on:keyup.enter` are not
    // supported. You'll have to manually check the
    // keyCode in the handler instead.
    on: {
        click: this.clickHandler
    },
    // For components only. Allows you to listen to
    // native events, rather than events emitted from
    // the component using `vm.$emit`.
    nativeOn: {
        click: this.nativeClickHandler
    },
    // Custom directives. Note that the `binding`'s
    // `oldValue` cannot be set, as Vue keeps track
    // of it for you.
    directives: [
        {
            name: 'my-custom-directive',
            value: '2',
            expression: '1 + 1',
            arg: 'foo',
            modifiers: {
                bar: true
            }
        }
    ],
    // Scoped slots in the form of
    // { name: props => VNode | Array<VNode> }
    scopedSlots: {
        default: props => createElement('span', props.text)
    },
    // The name of the slot, if this component is the
    // child of another component
    slot: 'name-of-slot',
    // Other special top-level properties
    key: 'myKey',
    ref: 'myRef',
    // If you are applying the same ref name to multiple
    // elements in the render function. This will make `$refs.myRef` become an
    // array
    refInFor: true
}
```

## REF

1. [Render Functions & JSX](https://vuejs.org/v2/guide/render-function.html)