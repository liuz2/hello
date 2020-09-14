# zlib

The `zlib` module provides compression functionality implemented using Gzip, Deflate/Inflate, and Brotli.

Compression and decompression are built around the Node.js [Streams API](./stream.md).

Compressing or decompressing a stream (such as a file) can be accomplished by piping the source stream through a `zlib Transform` stream into a destination stream:

```js
const { createGzip } = require('zlib');
const { pipeline } = require('stream');
const {
    createReadStream,
    createWriteStream
} = require('fs');

const gzip = createGzip();
const source = createReadStream('input.txt');
const destination = createWriteStream('input.txt.gz');

pipeline(source, gzip, destination, (err) => {
    if (err) {
        console.error('An error occurred:', err);
        process.exitCode = 1;
    }
});
```

## REF

1. [zlib](https://nodejs.org/api/zlib.html)
