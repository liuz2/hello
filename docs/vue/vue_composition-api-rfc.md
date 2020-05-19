# Vue Composition API RFC

Composition API 是 vue 3.x 提出的一个新的组织代码的方案，与 Vue 2.x 的以 options 为组织结构不同，Composition API 以逻辑为组织单位。这在大型项目中，更加便于维护和代码复用。

本文是 RFC 的要点摘录。

基本例子：

```html
<template>
    <button @click="increment">
        Count is: {{ state.count }}, double is: {{ state.double }}
    </button>
</template>

<script>
import { reactive, computed } from 'vue';

export default {
    setup() {
        const state = reactive({
            count: 0,
            double: computed(() => state.count * 2),
        });

        function increment() {
            state.count++;
        }

        return {
            state,
            increment,
        }
    }
}
</script>
```

背后的动机有两个：

1. 逻辑复用和代码组织
2. 更好的类型推断

## API 介绍

使用 `reactive` 创建一些 reactive state：

```js
import { reactive } from 'vue';

const state = reactive({
    count: 0
});
```

使用 `watchEffect` 增加副作用：

```js
import { reactive, watchEffect } from 'vue';

const state = reactive({
    count: 0,
});

watchEffect(() => {
    document.body.innerHTML = `count is ${state.count}`;
});
```

> `watchEffect` 和 2.x 的 `watch` 相似，只是无需分离数据源和副作用回调。

使用计算属性：

```js
import { reactive, computed } from 'vue';

const state = reactive({
    count: 0,
})

const double = computed(() => state.count * 2);
```

创建可变的 ref 值：

```js
const count = ref(0);
console.log(count.value); // 0

count.value++;
console.log(count.value); // 1
```

## REF

1. [Composition API RFC | Vue Composition API](https://vue-composition-api-rfc.netlify.com)
1. [Function-based Component API#42](https://github.com/vuejs/rfcs/pull/42)
1. [API Reference | Vue Composition API](https://composition-api.vuejs.org/api.html)