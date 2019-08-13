[TOC]

# 使用 Vue-Router

## 快速入门

```html
<div id="app">
    <p>
        <router-link to="/foo">Go to Foo</router-link>
        <router-link to="/bar">Go to Bar</router-link>
    </p>
    <router-view></router-view>
</div>
```

```js
const Foo = { template: '<div>foo</div>' };
const Bar = { template: '<div>bar</div>' };

const router = new VueRouter({
    routes: [
        { path: '/foo', component: Foo },
        { path: '/bar', component: Bar },
    ],
});

const app = new Vue({
    router,
}).$mount('#app');
```

注入 router 后，可以在组件中使用 `this.$router` 获取当前路由器，以及 `this.$route` 获取当前路由。

```js
// Home.vue
export default {
    computed: {
        username() {
            return this.$route.params.username;
        },
    },
    methods: {
        goBack() {
            window.history.length > 1
            	? this.$router.go(-1)
            	: this.$router.push('/');
        },
    },
}
```

`<router-link>` 将为匹配路由的超链接自动添加 `.router-link-active` 类。

## 动态路由匹配

```js
const User = {
    template: '<div>User {{ $route.params.id }}</div>',
}

const router = new VueRouter({
    routes: [
        { path: '/user/:id', component: User },
    ]
})
```

匹配的动态参数，可以通过 `this.$route.params` 获取。除此之外，还有 `$route.query` 和 `$route.hash` 属性。

### 监听参数变化

只需监听 `$route` 对象：

```js
const User = {
    template: '...',
    watch: {
        '$route'(to, from) {
            // react to route changes...
        },
    },
},
```

或，使用 `beforeRouteUpdate` 路由守卫（2.2 引入）

```js
const User = {
    template: '...',
    beforeRouteUpdate(to, from, next) {
        // react to route changes...
        // don't forget to call next()
    }
}
```

### 默认路由

```js
[
    { path: '*' },
    { path: '/user-*' },
]
```

`$route.params.pathMatch` 可以匹配星号对应的路由片段。

## REF

1. [Vue Router]([https://router.vuejs.org](https://router.vuejs.org/))