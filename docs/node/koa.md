# Koa

> Koa, next generation web framework for node.js

Koa is a new web framework designed by the team behind Express, which aimed to be a smaller, more expressive, and more robust foundation for web applications and APIs. By leveraging async function, Koa allows you to ditch callbacks and greatly increase error-handling.

## Installation

Koa requires node v7.6.0 or higher for ES2015 and async function support.

```sh
$ nvm install 7
$ npm i koa
$ node my-koa-app.js
```

## Application

A Koa application is an object containing an array of middleware functions which are composed and executed in a stack-like manner upon request.

The obligatory hello world application:

```js
const Koa = require('koa');
const app = new Koa();

app.use(async ctx => {
    ctx.body = 'Hello World';
});

app.listen(3000);
```

### Cascading

Koa middleware cascade in a more traditional way as you may be used to with similar tools. However with async functions we can achieve "true" middleware.

The following example responds with "Hello world", however first the request flows through the `x-response-time` and `logging` middleware to mark when the request started, then continue to yield control through the response middleware. When a middleware invokes `next()` the function suspends and passes control to the next middleware defined. After there are no more middleware to execute downstream, the stack will unwind and each middleware is resumed to perform its upstream behavior.

```js
const Koa = require('koa');
const app = new Koa();

// logger
app.use(async (ctx, next) => {
    await next();
    const rt = ctx.response.get('X-Response-Time');
    console.log(`${ctx.method} ${ctx.url} - ${rt}`);
});

// x-response-time
app.use(async (ctx, next) => {
    const start = Date.now();
    await next();
    const ms = Date.now() - start;
    ctx.set('X-Response-Time', `${ms}ms`);
});

// response
app.use(async ctx => {
    ctx.body = 'Hello Koa!';
});

app.listen(3000);
```

### Settings

Application settings are properties on the `app` instance, currently the following are supported:

- `app.env` defaulting to the **NODE_ENV** or "development"
- `app.proxy` when true proxy header fields will be trusted
- `app.subdomainOffset` offset of `.subdomains` to ignore

### app.listen(...)

A Koa application is not a 1-to-1 representation of an HTTP server. One or more Koa applications may be mounted together to form larger applications with a single HTTP server.

The `app.listen(...)` method is simply sugar for the following:

```js
const http = require('http');
const Koa = require('koa');
const app = new Koa();
http.createServer(app.callback()).listen(3000);
```

This means you can spin up the same application as both HTTP and HTTPS or on multiple address.

```js
const http = require('http');
const https = require('https');
const Koa = require('koa');

const app = new Koa();
http.createServer(app.callback()).listen(3000);
https.createServer(app.callback()).listen(3001);
```

### app.callback()

Return a callback function suitable for the `http.createServer()` method to handle a request. You may also use this callback function to mount your Koa app in a Connect/Express app.

### app.use(function)

Add the given middleware function to this application.

### app.keys=

Set signed cookie keys.

These are passed to [KeyGrip][2], however you may also pass your own KeyGrip instance. For example the following are acceptable:

```js
app.keys = ['im a newer secret', 'i like turtle'];
app.keys = new KeyGrip(['im a newer secret', 'i like turtle'], 'sha256');
```

These keys may be rotated and are used when signing cookies with the `{ signed: true }` option:

```js
ctx.cookies.set('name', 'tobi', { signed: true });
```

### app.context

`app.context` is the prototype from which `ctx` is created. You may add additional properties to `ctx` by editing `app.context`. This is useful for adding properties or methods to `ctx` to be used across your entire app.

For example, to add a reference to your database from `ctx`:

```js
app.context.db = db();

app.use(async ctx => {
    console.log(ctx.db);
});
```

Note:

- Many properties on ctx are defined using getters, setters, and `Object.defineProperty()`. You can only edit these properties (not recommended) by using `Object.defineProperty()` on `app.context`.
- Mounted apps currently use their parent's ctx and settings. Thus mounted apps are really just groups of middleware.

### Error Handling

By default outputs all errors to stderr unless `app.silent` is `true`. The default error handler also won't output errors when `err.status` is 404 or `err.expose` is `true`. To perform custom error-handling logic such as centralized logging you can add an "error" event listener:

```js
app.on('error', err => {
    log.error('server error', err);
});
```

If an error is in the req/res cycle and it is not possible to respond to the client, the `Context` instance is also passed:

```js
app.on('error', (err, ctx) => {
    log.error('server error', err, ctx);
});
```

When an erro occurs and it is still possible to respond to the client, aka no data has been written to the socket, Koa will respond appropriately with a 500 "Internal Server Error". In either case an app-level "error" is emitted for logging purposes.

## Context

A Koa Context encapsulates node's `request` and `response` objects into a single object which provides many helpful methods for writing web applications and APIs.

A `Context` is created *per request*, and is referenced in middleware as the receiver, or the `ctx` identifier, as shown in the following snippet:

```js
app.use(async ctx => {
    ctx             // the Context
    ctx.request     // a Koa Request
    ctx.response    // a Koa Response
});
```

Many of the context's accessors and methods simply delegate to their `ctx.request` or `ctx.response` equivalents for convenience, and are otherwise identical. For example `ctx.type` and `ctx.length` delegate to the `response` object, and `ctx.method` delegate to the `request`.

### API

Context specific methods and accessors.

- `ctx.req` Node.js `request` object
- `ctx.res` Node.js `response` object

Bypassing Koa's response handling is not supported. Avoid using the following node properties:

- `res.statusCode`
- `res.writeHead()`
- `res.write()`
- `res.end()`

**ctx.request**

A Koa `Request` object

**ctx.response**

A Koa `Response` object

**ctx.state**

The recommended namespace for passing information through middleware and to your frontend views.

```js
ctx.state.user = await User.find(id);
```

**ctx.app**

Application instance reference.

**ctx.cookies.get(name, [options])**

Get cookie name with options.

Koa uses the [cookies][3] module where options are simply passed.

**ctx.cookies.set(name, value, [options])**

Set cookie name to value with options:

- `maxAge` a number representing the milliseconds from `Date.now()` for expiry
- `signed` sign the cookie value
- `expires` a Date for cookie expiration
- `path` cookie path, `/` by default
- `domain` cookie domain
- `secure` secure cookie
- `httpOnly` server-accessible cookie, `true` by default
- `overwrite` a boolean indicating whether to overwrite previously set cookies of the same name (false by default).

**ctx.throw([status], [msg], [properties])**

Helper method to throw an error with a `.status` property defaulting to 500 that will allow Koa to respond appropriately. The following combinations are allowed:

```js
ctx.throw(400);
ctx.throw(400, 'name required');
ctx.throw(400, 'name required', { user: user });
```

For example, `ctr.throw(400, 'name required')` is equivalent to:

```js
const err = new Error('name required');
err.status = 400;
err.expose = true;
throw err;
```

Note that these are user-level errors and are flagged with `err.expose` meaning the messages are appropriate for client responses, which is typically not the case for error messages since you do not want to leak failure details.

Koa uses [http-erros][4] to create errors.

**ctx.assert(value, [status], [msg], [properties])**

Helper method to throw an error similar to `.throw()` when `!value`. Similar to node's [assert()][5] method.

**ctx.respond**

To bypasss Koa's built-in response handling, you may explicitly set `ctx.respond = false;`. Use this if you want to write to the raw `res` object instead of letting Koa handle the response for you.

Note that using this is not supported by Koa. This may break intended functionality of Koa middleware and Koa itself.

### Request aliases

The following accessors and alias Request equivalents:

- `ctx.header`
- `ctx.headers`
- `ctx.method`
- `ctx.method=`
- `ctx.url`
- `ctx.url=`
- `ctx.originalUrl`
- `ctx.origin`
- `ctx.href`
- `ctx.path`
- `ctx.path=`
- `ctx.query`
- `ctx.query=`
- `ctx.querystring`
- `ctx.querystring=`
- `ctx.host`
- `ctx.hostname`
- `ctx.fresh`
- `ctx.stale`
- `ctx.socket`
- `ctx.protocol`
- `ctx.secure`
- `ctx.ip`
- `ctx.ips`
- `ctx.subdomains`
- `ctx.is()`
- `ctx.accepts()`
- `ctx.acceptsEncodings()`
- `ctx.acceptsCharsets()`
- `ctx.acceptsLanguages()`
- `ctx.get()`

### Response aliases

The following accessors and alias Response equivalents:

- `ctx.body`
- `ctx.body=`
- `ctx.status`
- `ctx.status=`
- `ctx.message`
- `ctx.message=`
- `ctx.length`
- `ctx.length=`
- `ctx.type`
- `ctx.type=`
- `ctx.headerSent`
- `ctx.redirect()`
- `ctx.attachment()`
- `ctx.set()`
- `ctx.append()`
- `ctx.remove()`
- `ctx.lastModified=`
- `ctx.etag=`

## Request

A Koa Request object is an abstraction on top of node's vanilla request object, providing additional functionality that is useful for every day HTTP server development.

### Content Negotiation

Koa's request object includes helpful content negotiation utilities powered by [accepts][6] and [negotiator][7]. These utilities are:

- request.accepts(types)
- request.acceptsEncodings(types)
- request.acceptsCharsets(charsets)
- request.acceptsLanguages(langs)

## Response

RTFM.

## REF

1. [Koa](https://koajs.com/)

[2]: https://github.com/crypto-utils/keygrip "crypto-utils/keygrip"
[3]: https://github.com/jed/cookies "jed/cookies"
[4]: https://github.com/jshttp/http-errors "jshttp/http-erros"
[5]: http://nodejs.org/api/assert.html "assert"
[6]: http://github.com/expressjs/accepts "expressjs/accepts"
[7]: https://github.com/federomero/negotiator "federomero/negotiator"
