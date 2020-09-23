# fs

The `fs` module enables interacting with the file system in a way modeled on standard POSIX functions.

To use this module:

```js
const fs = require('fs');
```

## Methods

fs.readFile(path[, options], callback)

Asynchronously reads the entire contents of a file.

```js
fs.readFile('/etc/passwd', (err, data) => {
    if (err) throw err;
    console.log(data);
})
```

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

**fs.readdir()**

Asynchronous readdir(3). Read the contents of a directory.

**fs.watchFile()**

`fs.watchFile(filename[, options], listener)`

Watch for changes on `filename`. The callback `listener` will be called each time the file is accessed.

The `listener` gets two arguments the current stat object and the previous stat object:

```js
fs.watchFile('message.txt', (curr, prev) => {
    console.log(`the current mtime is: ${curr.mtime}`);
    console.log(`the previous mtime was: ${prev.mtime}`);
});
```

Using `fs.watch()` is more efficient than `fs.watchFile` and `fs.unwatchFile`. `fs.watch` should be used instead of `fs.watchFile` and `fs.unwatchFile` when possible.

## REF

1. [File System](https://nodejs.org/api/fs.html)
