# events

创建一个自定义事件发生器：

```js
const EventEmitter = require('events').EventEmitter;
const channel = new EventEmitter();
channel.on('join', () => {
    console.log('Welcome!');
});

channel.emit('join');
```

## REF

1. [events](https://nodejs.org/api/events.html)
