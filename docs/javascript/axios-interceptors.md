# axios interceptors usage

You can intercept requests or responses before they are handled by then or catch.

```js
// Add a request interceptor
axios.interceptors.request.use((config) => {
    // Do something before request is sent
    return config;
  }, function (error) {
    // Do something with request error
    return Promise.reject(error);
  });

// Add a response interceptor
axios.interceptors.response.use((response) => {
    // Any status code that lie within the range of 2xx cause this function to trigger
    // Do something with response data
    return response;
  }, function (error) {
    // Any status codes that falls outside the range of 2xx cause this function to trigger
    // Do something with response error
    return Promise.reject(error);
  });
```

If you need to remove an interceptor later you can.

```js
const myInterceptor = axios.interceptors.request.use(function () {/*...*/});
axios.interceptors.request.eject(myInterceptor);
```

You can add interceptors to a custom instance of axios.

```js
const instance = axios.create();
instance.interceptors.request.use(function () {/*...*/});
```

## Show me the code

```sh
➜  axios git:(master) grep -r "interceptors" ./lib
./lib/core/Axios.js:  this.interceptors = {
./lib/core/Axios.js:  // Hook up interceptors middleware
./lib/core/Axios.js:  this.interceptors.request.forEach(function unshiftRequestInterceptors(interceptor) {
./lib/core/Axios.js:  this.interceptors.response.forEach(function pushResponseInterceptors(interceptor) {
./lib/core/InterceptorManager.js: * Iterate over all the registered interceptors
./lib/core/InterceptorManager.js: * interceptors that may have become `null` calling `eject`.
./lib/core/README.md:- Managing interceptors
./lib/adapters/README.md:  //  - request interceptors have already run
./lib/adapters/README.md:    //  - response interceptors will run
```

Let's look at `lib/core/InterceptorManager.js` first:

```js
function InterceptorManager() {
    this.handlers = [];
}

InterceptorManager.prototype.use = function use(fulfilled, rejected) {
    this.handlers.push({
        fulfilled: fulfilled,
        rejected: rejected,
    });

    return this.handlers.length - 1;
}

InterceptorManager.prototype.eject = function eject(id) {
    if (this.handlers[id]) {
        this.handlers[id] = null;
    }
}

InterceptorManager.prototype.forEach = function forEach(fn) {
    utils.forEach(this.handlers, function forEachHandler(h) {
        if (h !== null) {
            fn(h);
        }
    });
}
```

Let's look at `lib/core/Axios.js`, how it works:

```js
var dispatchRequest = require('./dispatchRequest');

function Axios(instanceConfig) {
    this.defaults = instanceConfig;
    this.interceptors = {
        request: new InterceptorManager(),
        response: new InterceptorManager(),
    };
}

Axios.prototype.request = function request(config) {
    var chain = [dispatchRequest, undefined];
    var promise = Promise.resolve(config);

    this.interceptors.request.forEach(function unshiftRequestInterceptors(interceptor) {
        chain.unshift(interceptor.fulfilled, interceptor.rejected);
    });

    this.interceptors.response.forEach(function pushResponseInterceptors(interceptor) {
        chain.push(interceptor.fulfilled, interceptor.rejected);
    });

    while (chain.length) {
        promise = promise.then(chain.shift(), chain.shift());
    }

    return promise;
}
```

因此，axios 的请求和响应都可以增加多个拦截器。请求的拦截器按照增加的顺序倒序调用。响应的拦截器按照增加的顺序正序调用。

## Show me a demo

## REF

1. [Interceptors](https://github.com/axios/axios#interceptors)
