# 使用 Vuex

## [安装](https://vuex.vuejs.org/installation.html)

```sh
$ npm install vuex --save
```

```js
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
```

[Scrimba][scrimba] 上的教程很有趣。

## [起步](https://vuex.vuejs.org/guide/)

创建简单 store

```js
const store = new Vuex.Store({
    state: {
        count: 0,
    },
    mutations: {
        increment(state) {
            state.count++;
        }
    },
});
```

使用 store:

```js
store.commit('increment');
console.log(store.state.count);
```

## [State](https://vuex.vuejs.org/guide/state.html)

在根组件中使用 `store` 选项注入 Vuex，就可以在子组件中使用 `this.$store.state` 获取状态。

如果属性过多，可以使用 `mapState` 辅助函数简化写法：

```js
import { mapState } from 'vuex';

export default {
    computed: mapState({
        count: state => state.count,
        countAlias: 'count',
        countPlusLocalState(state) {
            return state.count + this.localCount;
        },
    }),
};
```

如果计算属性的名称与 vuex 中的属性名一致，可以传入数组：

```js
computed: mapState([
    'state',
]),
```

## [Getters](https://vuex.vuejs.org/guide/getters.html)

Vuex 的 getters 类似计算属性。

```js
const store = new Vuex.Store({
    state: {
        todos: [
            { id: 1, text: '...', done: true },
            { id: 2, text: '...', done: false },
        ],
    },
    getters: {
        doneTodos: state => {
            return state.todos.filter(todo => todo.done);
        },
    },
})
```

## REF

1. [Vuex](https://vuex.vuejs.org)
1. [Learn Vuex][scrimba] - scrimba

[scrimba]: https://scrimba.com/g/gvuex