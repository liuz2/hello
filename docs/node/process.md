# process

## Properties

The `process.pid` property returns the PID of the process.

## Methods

The `process.kill()` method sends the `signal` to the process identified by `pid`.

```js
process.kill(pid, signal?)
```

The default `signal` is `'SIGTERM'`.

The `process.exit(code?)` method instructs Node.js to terminate the process synchronously with an exit status of `code`.

## REF

1. [process](https://nodejs.org/api/process.html)
