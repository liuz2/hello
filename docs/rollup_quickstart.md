# Quickstart with Rollup.js

## Install

```sh
$ npm install -g rollup
$ rollup --help
```

## 编译

如果源文件是 `main.js`，目标文件是 `bundle.js`，则根据不同的目标平台，有以下不同的编译选项：

```sh
# browsers
$ rollup main.js --file bundle.js --format iife

# node.js
$ rollup main.js --file bundle.js --format cjs

# browsers and node.js
$ rollup main.js --file bundle.js --format umd --name "myBundle"
```

## REF

1. [rollup.js](https://rollupjs.org/guide/en/)
