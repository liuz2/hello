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
function getUserAccount() {
    return axios.get('/user/12345');
}

function getUserPermissions() {
    return axios.get('/user/12345/permissions');
}

Promise.all([getUserAccount(), getUserPermissions()])
    .then(axios.spread(function(acct, perms) {
        // Do something...
    }))
```

## axios API

**axios(config)**

```js
// Send a POST request
axios({
    method: 'post',
    url: '/user/12345',
    data: {
        firstName: 'Fred',
        lastName: 'Flintstone'
    }
})
```

```js
// GET request for remote image
axios({
    method: 'get',
    url: 'http://example.com/image',
    responseType: 'stream'
})
    .then(function(response) {
        response.data.pipe(fs.createWriteStream('ada_lovelace.jpg'));
    });
```

**axios(url, config?)**

```js
// Send a GET request
axios('/user/12345')
```

### 请求方法别名

为了简化调用，提供了以下别名：

1. axios.request(config)
1. axios.get(url, config?)
1. axios.delete(url, config?)
1. axios.head(url, config?)
1. axios.options(url, config?)
1. axios.post(url, data?, config?)
1. axios.put(url, data?, config?)
1. axios.patch(url, data?, config?)

### 创建实例

可以使用自定义配置项创建新的实例：

```js
const instance = axios.create({
    baseURL: 'http://example.com/',
    timeout: 1000,
    headers: {
        'X-Custom-Header': 'foobar'
    }
})
```

实例方法如下，两个配置项将合并处理：

1. axios#request(config)
1. axios#get(url, config?)
1. axios#delete(url, config?)
1. axios#head(url, config?)
1. axios#options(url, config?)
1. axios#post(url, data?, config?)
1. axios#put(url, data?, config?)
1. axios#patch(url, data?, config?)
1. axios#getUri(url, data?, config?)

## 请求配置项：

```js
{
    url: '/user',
    method: 'get',
    baseURL: 'http://example.com/api',
    transformRequest: [function (data, headers){
        // Do something awesome
        return data;
    }],
    transformResponse: [function (data) {
        // Do something awesome

        return data;
    }],
    headers: { 'X-Requested-With': 'XMLHttpRequest' },
    params: {
        ID: 1234
    },
    paramsSerializer: function(params) {
        return Qs.stringify(parmas, { arrayFormat: 'brackets' })
    },
    data: {
        firstName: 'Fred'
    },
    data: 'Country=Brasil&city=Belo Horizonte',
    timeout: 1000,
    withCredentials: true,
    adapter: function(config) {},
    auth: {
        username: '',
        password: '',
    },
    responseType: 'json',
    responseEncoding: 'utf8',
    xsrfCookieName: 'XSRF-TOKEN',
    xsrfHeaderName: 'X-XSRF-TOKEN',
    onUploadProgress: function (progressEvent) {
        // Do whatever you want with the native progress event
    },
    onDownloadProgress: function (progressEvent) {
        // Do whatever you want with the native progress event
    },
    maxContentLength: 2000,
    maxBodyLength: 2000,
    validateStatus: function (status) {
        return status >= 200 && status < 300; // default
    },
    maxRedirects: 5,
    socketPath: null,
    httpAgent: new http.Agent({ keepAlive: true }),
    httpsAgent: new https.Agent({ keepAlive: true }),
    proxy: {
        host: '127.0.0.1',
        port: 9000,
        auth: {
            username: 'mikeymike',
            password: 'rapunz3l'
        }
    },
    cancelToken: new CancelToken(function (cancel) {
    }),
    decompress: true,
}
```

## 响应模式

响应数据包含如下结构：

```js
{
    data: {},
    status: 200,
    statusText: 'OK',
    headers: {},
    config: {},
    request: {}
}
```

## 参考文献

1. [axios/axios](https://github.com/axios/axios)