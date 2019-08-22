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

## 嵌套路由

```html
<div id="app">
    <router-view></router-view>
</div>
```

```js
const User = {
    template: `
		<div class="user">
			<h2>User {{ $router.params.id }}</h2>
			<router-view></router-view>
		</div>
	`,
}

const router = new VueRouter({
    routes: [
        {
            path: '/user/:id',
            component: User,
            children: [
                { path: 'profile', component: UserProfile },
                { path: 'posts', component: UserPosts },
                { path: '', component: UserHome },
            ]
        },
    ],
});
```

**注意，嵌套路径若以 `/` 开头，将被认为是根目录。**

## 程序跳转

```js
router.push(location, onComplete, onAbort);
router.push('home');
router.push({ path: 'home' });
// name LOVE params
router.push({ name: 'user', params: { userId: '123' } });
// path LOVE query
router.push({ path: 'register', query: { plan: 'private' } });
```

```js
router.replace(location, onComplete, onAbort);
```

```js
router.go(n);
```

## 命名路由

```js
const router = new VueRouter({
    routes: [
        {
            path: '/user/:userId',
            name: 'user',
            component: User,
        }
    ]
});
```

```html
<router-link :to="{ name: 'user', params: { userId: 123 }}">User</router-link>
```

```js
router.push({ name: 'user', params: { userId: 123 } });
```

## 命名视图

没有制定名字的 `<router-view>` 将拥有 `default` 名称。

```html
<router-view class="view one"></router-view>
<router-view class="view two" name="a"></router-view>
<router-view class="view three" name="b"></router-view>
```

注意，多个视图使用多个组件，因此需要使用 `components`。注意其中的 `s`！

```js
const router = new VueRouter({
    routes: [
        {
            path: '/',
            components: {
                default: Foo,
                a: Bar,
                b: Baz,
            }
        }
    ]
});
```

### 嵌套命名视图

```html
<div>
    <h1>
        User Settings
    </h1>
    <NavBar/>
    <router-view />
    <router-view name="helper" />
</div>
```

```js
{
    path: '/settings',
    component: UserSettings,
    children: [
        {
            path: 'emails',
            component: UserEmailsSubscriptions,
        },
        {
            path: 'profile',
            components: {
                default: UserProfile,
                helper: UserProfilePreview,
            },
        }
    ]
}
```

## 重定向和别名

### 重定向

```js
const router = new VueRouter({
    routes: [
        { path: '/a', redirect: '/b' },
    ],
});

const router = new VueRouter({
    routes: [
        { path: '/a', redirect: { name: 'foo' } },
    ],
});

const router = new VueRouter({
    routes: [
        {
            path: '/a',
            redirect: to => {
                // the function receives the target route as the argument
                // return redirect path/location here
            }
        }
    ]
});
```

导航守卫不适合重定向的源路由，仅适用目标路由。

### 别名

如果 `/a` 的别名是 `/b`，当用户访问 `/b` 时，URL 保持为 `/b` 不动，但是显示的内容是 `/a` 路由的内容。

```js
const router = new VueRouter({
    routes: [
        { path: '/a', component: A, alias: '/b' },
    ]
})
```

## 向路由组件传递参数

如果在组件中使用 `$route` 参数，将会在组件和路由形成强耦合。为了解耦，需要设置 `props` 参数为 `true`。

```js
const User = {
    props: ['id'],
    template: '<div>User {{ id }}</div>',
}

const router = new VueRouter({
    routes: [
        { path: '/user/:id', component: User, props: true },
        // for named views
        {
            path: '/user/:id',
            components: { default: User, sidebar: Sidebar },
            props: { default: true, sidebar: false },
        }
    ]
})
```

当 `props: true` 时，`route.params` 将设为组件的 props 属性。

当 `props` 为对象格式时，该对象将直接设为组件属性，适合静态属性的情况。

`props` 还可以是函数类型：

```js
const router = new VueRouter({
    routes: [
        {
            path: '/search',
            component: SearchUser,
            props: (route) => ({ query: route.query.q }),
        }
    ]
})
```

## HTML5 历史模式

`vue-router` 默认使用 hash 模式，也可以改为 history 模式：

```js
const router = new VueRouter({
    mode: 'history',
    routes: [...],
});
```

服务器设置

```
# nginx
location / {
	try_files: $uri $uri/ /index.html;
}
```

## 导航守卫

`vue-router` 提供的导航守卫主要用来重定向或取消跳转。

### 全局前置守卫

使用 `router.beforeEach` 注册全局前置守卫。

```js
const router = new VueRouter({ ... })

router.beforeEach((to, from, next) => {
    // ...
})
```

每个守卫函数接收三个参数：

1. `to: Route` 目标 Route 对象
1. `from: Route` 当前 Route 对象
1. `next: Function` 必须调用 next 后，才能完整解析钩子函数。后续导航行为取决于传入 `next` 的参数。

`next()` 函数有以下行为：

1. `next()` 进入流水线的下个钩子函数。若已抵达流水线末端，导航被确认。
1. `next(false)` 中止当前导航。
1. `next('/')` 或 `next({ path: '/' })` 跳向不同地址。可以传递的参数包括：`replace: true`, `name: 'home'` 等。
1. `next(error)` （2.4.0+），导航中止，错误实例传入 `router.onError()`。

**一定要调用 `next` 函数，否则页面无法跳转。**

### 全局解析守卫（Global Resolve Guards）

使用 `router.beforeResolve`。

### 全局后置钩子

钩子与守卫不同，没有 `next` 函数，无法改变路由。

```js
router.afterEach((to, from) => {
    // ...
})
```

### 单路由守卫

在每个路由的配置对象中，可以定义 `beforeEnter` 守卫。

```js
const router = new VueRouter({
    routes: [
        {
            path: '/foo',
            component: Foo,
            beforeEnter: (to, from, next) => {
                // ...
            }
        }
    ],
});
```

### 组件內守卫

可以在路由组件内部定义路由导航守卫。常用的函数有：

1. `beforeRouteEnter`
1. `beforeRouteUpdate`
1. `beforeRouteLeave`

```js
const Foo = {
    template: `...`,
    beforeRouteEnter (to, from, next) {
        // 渲染该组件路由前执行，无法调用 `this` 实例
    },
    beforeRouteUpdate (to, from, next) {
        // 当渲染一个组件的路由变化时，同时会复用该组件
        // 比如，`/foo/1` 跳转至 `/foo/2`
    },
    beforeRouteLeave (to, from, next) {
        // 路由离开时执行
    },
}
```

`beforeRouteEnter` 无法获取 `this` 参数，但是可以通过回调函数获取 vm 实例。

```js
beforeRouteEnter (to, from, next) {
    next(vm => {
        // access to component instance via `vm`
    })
}
```

### 完整的导航流程

1. 导航触发
2. 在非活跃组件中调用 leave 守卫
3. 调用全局 `beforeEach` 守卫
4. 在复用组件调用 `beforeRouteUpdate` 守卫
5. 执行路由配置中的 `beforeEnter` 函数
6. 解析异步路由组件
7. 在激活组件中执行 `beforeRouteEnter` 守卫
8. 执行全局的 `beforeResolve` 守卫
9. 导航确认
10. 执行全局 `afterEach` 钩子
11. 触发 DOM 更新
12. 在实例化的 vue 中执行 `beforeRouteEnter` 的 `next` 中的回调函数

## 路由元数据

可以在定义路由时增加 `meta` 字段

```js
const router = new VueRouter({
    routes: [
        {
            path: '/foo',
            component: Foo,
            children: [
                {
                    path: 'bar',
                    component: Bar,
                    meta: {
                        requiresAuth: true,
                    },
                }
            ]
        }
    ]
})
```

`routes` 配置的每一项都称作 **路由记录**，路由记录可嵌套。因此，当匹配到一个路由时，可能会对应多个路由记录。

比如，对于 `/foo/bar` 将匹配父路由记录和子路由记录。所有匹配的路由记录都在 `$route。matched` 数组中，因此需要遍历 `$route.matched` 以便检查 meta 字段。

```js
router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requiresAuth)) {
        if (!auth.loggedIn()) {
            next({
                path: '/login',
                query: { redirect: to.fullPath },
            });
        } else {
            next();
        }
    } else {
        next();
    }
})
```


## REF

1. [Vue Router]([https://router.vuejs.org](https://router.vuejs.org/))
1. [Navigation Guards](https://router.vuejs.org/guide/advanced/navigation-guards.html)