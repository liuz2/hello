# process

## Properties

The `process.pid` property returns the PID of the process.

The `process.execPath` property returns the absolute pathname of the executable that started the Node.js process.

The `process.argv` property returns an array containing the command line arguments passed when the Node.js process was launched. The first element will be `process.execPath`. See `process.argv0` if access to the original value of argv[0] is needed. The second element will be the path to the JavaScript file being executed. The remaining elements will be any additional command line arguments.

```js
// app.js
console.log(process.argv);
```

```sh
$ node app.js a b c
// => 
[ '/Users/myself/.nvm/versions/node/v10.15.0/bin/node',
  '/Users/myself/path/to/app.js',
  'a',
  'b',
  'c' ]
```

## Methods

The `process.kill()` method sends the `signal` to the process identified by `pid`.

```js
process.kill(pid, signal?)
```

The default `signal` is `'SIGTERM'`.

The `process.exit(code?)` method instructs Node.js to terminate the process synchronously with an exit status of `code`.

## REF

1. [process](https://nodejs.org/api/process.html)
