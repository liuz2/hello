# 事件机制简介

Node.js 的事件使用观察者模式。

Node.js 有多个内置事件，比如 `events.EventEmitter`：

```js
var events = require("events");
var eventEmitter = new events.EventEmitter();

eventEmitter.on("eventName", eventHandler);

eventEmitter.emit("eventName");
```

举例如下：

```js
var events = require("events");
var eventEmitter = new events.EventEmitter();

var connectHandler = function connected() {
    console.log("connected successfully");
    eventEmitter.emit("data_received");
}

eventEmitter.on("connection", connectHandler);
eventEmitter.on("data_received", function() {
    console.log("data received successful!");
})

eventEmitter.emit("connection");

console.log("program executed complete");
```

函数执行顺序为：

```sh
connected successfully
data received successful!
program executed complete
```

> 虽然是回调函数，但是依然执行很快。在 `emit` 抛出事件时，立即执行。

## EventEmitter 对象

`EventEmitter` 的核心就是事件触发与事件监听器功能的封装。可以使用自定义类继承它：

```js
var util = require("util");
var EventEmitter = require("events").EventEmitter;

var Server = function() {
    console.log("init");
}

util.inherits(Server, EventEmitter);

var s = new Server();

s.on("abc", function() {
    console.log("abc");
})

s.emit("abc");
```

## REF

- [Node.js 事件机制 | 菜鸟教程](http://www.runoob.com/nodejs/nodejs-event-loop.html)
- [EventEmitter 对象 | 菜鸟教程](http://www.runoob.com/nodejs/nodejs-event.html)