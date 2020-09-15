# net

The net module provides an asynchronous network API for creating stream-based TCP or IPC servers (net.createServer()) and clients (net.createConnection()).

For example:

```js
const net = require('net');
const server = net.createServer(socket => {
    socket.on('data', data => {
        socket.write(data);
    });
});

server.listen(8888);
```

You can connect with this server with `telnet`:

```sh
$ telnet 127.0.0.1 8888
```

`socket` is an instance of `Socket`. Its inheritance is:

```
Socket -> Duplex -> Readable -> Stream -> EventEmitter -> Object
```

`data` is a `Uint8Array`，每次的 `data` 都以 `\r\n` 结尾。(即 13, 10)

## REF

1. [net](https://nodejs.org/api/net.html)
