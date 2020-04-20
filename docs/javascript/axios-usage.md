# 如何使用 axios ?

axios 是一个基于 Promise 的 HTTP 客户端，可用于浏览器和 node.js。它受 Angular 的 `$http service` 影响很大。

## 安装

使用 npm：

```sh
$ npm install axios
```

使用 jsDelivr CDN: 

```html
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
```

## 使用

axios 基于 Promise，可使用 `then` 或 `catch` 处理请求结果：

```js
import axios from 'axios';

axios.get('/user?ID=12345')
    .then((res) => {
        console.log(res.data);
    })
    .catch(err => {
        debugger;
    })
    .then(res => {
        debugger;
    });
```

`get()` 的第2个参数可以传入参数对象 params:

```js
axios.get('/user', {
        params: {
            ID: '1234'
        }
    })
    .then((res) => {
        console.log(res.data);
    })
    .catch(err => {
        debugger;
    })
    .then(res => {
        debugger;
    });
```

通过在外层函数增加 `async` 关键字，还能简化异步函数的写法：

```js
async function onSend() {
    try {
        const response = await axios.get('/user?ID=2234');
        console.log(response.data);
    } catch(error) {
        debugger;
        console.log(error);
    }
}
```

发送 POST 请求时，`post()` 第二个参数是发送的数据：

```js
axios.post('/user', {
        firstName: 'Tony',
        lastName: 'Stark'
    }).then(res => {
        debugger;
    }).catch(err => {
        debugger;
    });
```

还可以同时发起多个请求：

```js

```

## 参考文献

1. [axios/axios](https://github.com/axios/axios)