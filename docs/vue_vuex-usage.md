# 使用 Vuex

> 以下是官方文档的学习笔记。

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

通过 `store.getters` 访问 getters 方法，语法类似属性:

```js
store.getters.doneTodos
```

Getters 的第二个参数是其他的 getters:

```js
getters: {
    doneTodosCount: (state, getters) => {
        return getters.doneTodos.length;
    },
},
```

现在可以在组件中使用：

```js
computed: {
    doneTodosCount() {
        return this.$store.getters.doneTodosCount;
    }
}
```

可以向 getters 中传递参数，

```js
getters: {
    getTodoById: (state) => (id) => {
        return state.todos.find(todo => todo.id === id);
    }
},
```

```js
store.getters.getTodoById(2);
```

`mapGetters` 辅助函数可以把 store 中的 getters 映射到组件的计算属性：

```js
import { mapGetters } from 'vuex';

export default {
    computed: {
        ...mapGetters([
            'doneTodosCount',
            'anotherGetter',
        ])
    },
}
```

或者映射到不同的名字：

```js
...mapGetters({
    doneCount: 'doneTodosCount',
})
```

## [Mutations](https://vuex.vuejs.org/guide/mutations.html)

Vuex mutations 酷似 event 事件。

```js
const store = new Vuex.Store({
    state: {
        count: 1,
    },
    mutations: {
        increment(state) {
            state.count++;
        }
    },
})
```

```js
store.commit('increment');
```

commit 可以携带参数：

```js
mutations: {
    increment(state, n) {
        state.count += n;
    }
}

state.commit('increment', 2);
```

大部分场景下，参数是对象类型：

```js
mutations: {
    increment(store, payload) {
        state.count += payload.amount;
    }
},

store.commit('increment', {
    amount: 10,
});
```

还可以使用包含 type 类型的 object 提交变更：

```js
store.commit({
    type: 'increment',
    amount: 10,
});
```

使用 mutation 常量

```js
// mutation-types.js
export const SOME_MUTATION = 'SOME_MUTATION';

// store.js
import Vuex from 'vuex';
import { SOME_MUTATION } from './mutation-types.js';

const store = new Vuex.Store({
    state: { ... },
    mutations: {
        [SOME_MUTATION](state) {
            // mutate state
        },
    },
});
```

**注意：mutations 必须是同步操作。**

可以使用 `mapMutations` 简化 mutation 到组件的映射

```js
import { mapMutations } from 'vuex';

export default {
    methods: {
        ...mapMutations([
            // this.increment() => this.$store.commit('increment')
            'increment',
            // this.incrementBy(amount) => this.$store.commit('incrementBy', amount)
            'incrementBy',
        ]),
        ...mapMutations({
            // this.add() => this.$store.commit('increment')
            add: 'increment',
        })
    },
}
```

## [Actions](https://vuex.vuejs.org/guide/actions.html)

Action 和 mutation 的不同在于：

1. action 不直接操作 state，而是提交 mutation
1. action 可以包含任意的异步操作

```js
const store = new Vuex.Store({
    state: {
        count: 0,
    },
    mutations: {
        increment(state) {
            state.count++;
        },
    },
    actions: {
        increment(context) {
            context.commit('increment');
        },
    },
})
```

Action 监听函数的参数 context 具有和 store 相同的属性和方法，但是 context 和 store 不是同一个实例。

通常，会使用解构语法简化访问：

```js
actions: {
    increment({ commit }) {
        commit('increment');
    },
},
```

使用 `store.dispatch()` 抛出 Action 事件：

```js
store.dispatch('increment');
```

可以在 action 中执行异步操作：

```js
actions: {
    incrementAsync({ commit }) {
        setTimeout(() => {
            commit('increment');
        }, 1000);
    },
},
```

action 也支持同样的带参函数和对象风格的事件触发：

```js
store.dispatch('incrementAsync', {
    amount: 10,
});

store.dispatch({
    type: 'incrementAsync',
    amount: 10,
});
```

如下是一个购物车实例：

```js
actions: {
    checkout({ commit, state }, products) {
        const savedCartItems = [...state.cart.added];
        commit(types.CHECKOUT_REQUEST);
        shop.buyProducts(
            products,
            () => commit(types.CHECKOUT_SUCCESS),
            () => commit(types.CHECK_FAILURE, savedCartItems),
        );
    },
},
```

使用 `mapActions` 辅助函数简化组件内的方法映射：

```js
import { mapActions } from 'vuex';

export default {
    methods: {
        ...mapActions([
            // this.increment() => this.$store.dispatch('increment')
            'increment',
            // this.incrementBy(amount) => this.$store.dispatch('incrementBy', amount)
            'incrementBy',
        ]),
        ...mapActions({
            // this.add() => this.$store.dispatch('increment')
            add: 'increment',
        }),
    }
}
```

为了知道 action 何时结束，可以使用 Promise

```js
actions: {
    actionA({ commit }) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                commit('someMutation');
                resolve();
            }, 1000);
        })
    }
},

// 然后在组件中这般调用
store.dispatch('actionA').then(() => {
    // ...
});

// 在另一个 action 中使用

actions: {
    actionB({ dispatch, commit }) {
        return dispatch('actionA').then(() => {
            commit('someOtherMutation');
        });
    },
},
```

如果使用 async/await，以上代码可以简化为：

```js
actions: {
    async actionA({ commit }) {
        commit('gotData', await getData());
    },

    async actionB({ dispatch, commit }) {
        await dispatch('actionA');
        commit('gotOtherData', await getOtherData());
    },
},
```

## [Modules](https://vuex.vuejs.org/guide/modules.html)

Vuex 可以划分为多个 modules。

```js
const moduleA = {
    state: { ... },
    mutations: { ... },
    actions: { ... },
    getters: { ... },
};

const moduleB = {
    state: { ... },
    mutations: { ... },
    actions: { ... },
    getters: { ... },
};

const store = new Vuex.Store({
    modules: {
        a: moduleA,
        b: moduleB,
    },
});

store.state.a;
store.state.b;
```

在 module 的 mutations 和 getters 中，第一个参数是 module 的局部 state

```js
const moduleA = {
    state: {
        count: 0,
    },
    mutations: {
        increment(state) {
            state.count++;
        },
    },

    getters: {
        doubleCount(state) {
            return state.count * 2;
        },
    },
};
```

在模块下的 action，`context.state` 表示局部状态，根状态是 `context.rootState`。

```js
const moduleA = {
    actions: {
        incrementIfOddOnRootSum({ state, commit, rootState }) {
            if ((state.count + rootState.count) % 2 === 1) {
                commit('increment');
            }
        }
    }
}
```

在模块的 getters 中，根状态是第三个参数：

```js
const moduleA = {
    getters: {
        sumWithRootCount(state, getters, rootState) {
            return state.count + rootState.count;
        },
    },
};
```

如果将模块设定为 `namespaced: true`，则模块注册时，它的所有 getters, actions, mutations 都将自动位于模块路径命名空间下。

```js
const store = new Vuex.Store({
    modules: {
        account: {
            namespaced: true,
            state: { ... },
            getters: {
                isAdmin() { ... }, // => getters['account/isAdmin']
            },
            actions: {
                login() { ... }, // => dispatch('account/login');
            },
            mutations: {
                login() { ... }, // => commit('account/login')
            },

            modules: {
                myPage: {
                    state: { ... },
                    getters: {
                        state: { ... },
                        getters: {
                            profile() { ... }, // => getters['account/profile']
                        },
                    },
                },
                posts: {
                    namespaced: true,
                    state: { ... },
                    getters: {
                        popurlar() { ... }, // => getters['account/posts/popular']
                    },
                },
            },
        },
    },
});
```

命名空间的模块暂时忽略。

一个真实的 [Vuex 案例](https://github.com/vuejs/vuex/tree/dev/examples/shopping-cart)。

## [处理表单](https://vuex.vuejs.org/guide/forms.html)

当结合使用 `v-model` 和 `Vuex` 时，双向计算属性可以简化代码：

```html
<input v-model="message">
```

```js
computed: {
    message: {
        get() {
            return this.$store.obj.message;
        },
        set(value) {
            this.$store.commit('updateMessage', value);
        },
    },
}
```

## REF

1. [Vuex](https://vuex.vuejs.org)
1. [Learn Vuex][scrimba] - scrimba

[scrimba]: https://scrimba.com/g/gvuex