# http

The HTTP interfaces in Node.js are designed to support many features of the protocol which have been traditionally difficult to use. In particular, large, possibly chunk-encoded, messages. The interface is careful to never buffer entire requests or responses, so the user is able to stream data.

## API

### http.createServer()

```js
http.createServer([options][, requestListener])
```

Return a new instance of `http.Server`

```js
http.createServer((req, res) => {
    console.log(req.url);
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end('Hello World');
}).listen(8000, '127.0.0.1');
```

其中的 `req` 是 `IncomingMessage` 类型，`res` 是 `ServerResponse` 类型。它们的继承关系如下：

```
IncomingMessage -> Readable -> Stream -> EventEmitter -> Object

ServerResponse -> OutgoingMessage -> Stream -> EventEmitter -> Object
```

其中的 `.end()` 方法定义在 `Stream` 中。

### server.listen([port[, host[, backlog]]][, callback])

- port <number>
- host <string>
- backlog <number> Common parameter of server.listen() functions.
- callback <Function>.
- Returns: <net.Server>

Start a TCP server listening for connections on the given port and host.

If port is omitted or is 0, the operating system will assign an arbitrary unused port, which can be retrieved by using `server.address().port` after the `'listening'` event has been emitted.

If host is omitted, the server will accept connections on the unspecified IPv6 address (::) when IPv6 is available, or the unspecified IPv4 address (0.0.0.0) otherwise.

In most operating systems, listening to the unspecified IPv6 address (::) may cause the net.Server to also listen on the unspecified IPv4 address (0.0.0.0).

## REF

1. [http](https://nodejs.org/api/http.html)
