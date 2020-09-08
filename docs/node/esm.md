# 开启 ESM 模块

编写 `app.mjs`

```js
#!/usr/bin/env -S node --experimental-modules
import foo from './foo.mjs';
console.log(foo);
```

`foo.mjs` 如下：

```js
export default 42;
```

## REF

1. [五分钟了解 Node.js Shebang](https://mp.weixin.qq.com/s/6ascDu9z99nhUlEfnEMB0g)
