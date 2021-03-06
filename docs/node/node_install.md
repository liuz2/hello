# Node.js 安装和配置

## macOS

```sh
$ brew install node
```

## Windows

进入[下载地址][1]，选择对应的 Windows Installer 即可。

## Linux

直接使用已编译好的包：

```sh
$ wget https://nodejs.org/dist/v10.9.0/node-v10.9.0-linux-x64.tar.xz
$ tar xf node-v10.9.0-linux-x64.tar.xz
$ cd node-v10.9.0-linux-x64/
$ ./bin/node -v
v10.9.0
```

设定软链接：

```sh
$ ln -s /usr/software/nodejs/bin/npm   /usr/local/bin/ 
$ ln -s /usr/software/nodejs/bin/node   /usr/local/bin/
```

### Ubuntu 源码安装

```sh
$ sudo git clone https://github.com/nodejs/node.git
$ sudo chmod -R 755 node
$ cd node
$ sudo ./configure
$ sudo make
$ sudo make install
$ node --version
```

## 基本代码

```js
var http = require("http");

http.createServer(function(request, response) {
    response.writeHead(200, { "Content-Type": "text/plain" });
    response.end("Hello, Universe!");
}).listen(8888);

console.log("Server running at http://127.0.0.1:8888/");
```

## REF

- [Node.js 安装配置 | 菜鸟教程](http://www.runoob.com/nodejs/nodejs-install-setup.html)

[1]: "https://nodejs.org/en/download/" "Download Node.js"