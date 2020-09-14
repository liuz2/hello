# stream

A stream is an abstract interface for working with streaming data in Node.js. The stream module provides an API for implementing the stream interface.

There are many stream objects provided by Node.js. For instance, a request to an HTTP server and `process.stdout` are both stream instances.

Streams can be readable, writable, or both. All streams are instances of [EventEmitter](./events.md).

## API

```js
stream.pipeline(source[, ...transforms], destination, callback);

stream.pipeline(streams, callback)
```

## REF

1. [stream](https://nodejs.org/api/stream.html)
