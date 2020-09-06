# Tasks vs. Microtasks

首先看一下如下代码，猜测一下执行结果：

```js
console.log('script start');

setTimeout(function() {
    console.log('setTimeout');
}, 0);

Promise.resolve()
    .then(function() {
        console.log('promise1');
    })
    .then(function() {
        console.log('promise2');
    });

console.log('script end');
```

在 Chrome v85 的输出结果如下：

```
script start
script end
promise 1
promise 2
setTimeout
```

为什么会出现这个结果？这涉及到「任务」和「微任务」。

每个线程都有自己的时间循环。

两个任务之间，浏览器可以渲染页面，反应出新的变化。

微任务则更轻量，它会在当前任务执行末期执行。微任务包括 mutation observer callbacks, promise callbacks 等。

## REF

1. [Tasks, microtasks, queues and schedules][1], by *Jake Archibald*, 2015/08/17

[1]: https://jakearchibald.com/2015/tasks-microtasks-queues-and-schedules/ "Tasks, microtasks, queues and schedules"
