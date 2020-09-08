# Buffer

`Buffer` objects are used to represent a fixed-length sequence of bytes. Many Node.js APIs support `Buffer`s.

The `Buffer` class is a subclass of JavaScript's Uint8Array class and extends it with methods that cover additional use cases. Node.js APIs accept plain Uint8Array wherever Buffer are supported as well.

The `Buffer` class is within the global scope.

```js
// create a zero-filled Buffer of length 10
const buf1 = Buffer.alloc(10);

// creates a Buffer of length 10,
// filled with bytes which all have the value `1`
const buf2 = Buffer.alloc(10, 1);

// creates an uninitialized buffer of length 10.
// This is faster than calling Buffer.alloc() but the returned
// Buffer instance might contain old data that needs to be
// overwritten using fill(), write(), or other functions that fill the Buffer's
// contents
const buf3 = Buffer.allocUnsafe(10);

// creates a Buffer containing the bytes [1, 2, 3]
const buf4 = Buffer.from([1, 2, 3]);

// creates a Buffer containing the bytes [1, 1, 1, 1] - the entries
// are all truncated using `(value & 255)` to fit into the range 0-255
const buf5 = Buffer.from([257, 257.5, -255, '1']);

// creates a Buffer containing the UTF-8-encoded bytes for the string 'test'
const buf6 = Buffer.from('test');

// creates a Buffer containing the Latin-1 bytes
const buf7 = Buffer.from('test', 'latin1');
```

## Buffers and character encodings

When converting between `Buffer` and strings, a character encoding may be specified. If no character encoding is specified, UTF-8 will be used as the default.

```js
const buf = Buffer.from('hello world', 'utf8');
console.log(buf.toString('hex'));
console.log(buf.toString('base64'));
```

The character encodings currently supported by Node.js are the followings:

- `utf8`
- `utf16le`. Unlike `utf8`, each character in the string will be encoded using either 2 or 4 bytes. Node.js only supports the little-endian variant of UTF-16.
- `latin1`. Latin-1 stands for ISO-8859-1. 

Converting a `Buffer` into a string using one of the above is referred to as decoding, and converting a string into a `Buffer` is referred to as encoding.

```
Buffer ==(decode)==> string
string ==(encode)==> Buffer
```

Node.js also supports the following two binary-to-text encodings. For binary-to-text encodings, the naming convention is reversed: Converting a `Buffer` into a string is typically referred to as encoding, and converting a string into a `Buffer` as decoding. 

- `base64`
- `hex`. Encode each byte as two hexadecimal characters.

```
Buffer ==(encode)==> string
string ==(decode)==> Buffer
```

The following legacy character encodings are also supported:

- `ascii`
- `binary`. Alias for `latin1`.
- `ucs2`. Alias for `utf16le`

## REF

1. [Buffer](https://nodejs.org/api/buffer.html)
1. [Uint8Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array), MDN
