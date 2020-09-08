# fs

The `fs` module enables interacting with the file system in a way modeled on standard POSIX functions.

To use this module:

```js
const fs = require('fs');
```

## Methods

```js
fs.writeFileSync(file, data, options?)
fs.writeFile(file, data, options?, callback)

// exists is deprecated but existsSync is not
fs.existsSync(path)
fs.exists(path, callback)

fs.unlinkSync(path)
fs.unlink(path, callback)
```

`fs.unlink()` will not work on a directory, empty or otherwise. To remove a directory, use `fs.rmdir()`

## REF

1. [File System](https://nodejs.org/api/fs.html)
