# HTTPS 服务器

以下是最简单的 https 服务器代码：

```js
const https = require('https');
const fs = require('fs');

const keyPath = '/path/to/cert.pem';
const keyContent = fs.readFileSync(keyPath);

const options = {
    key: keyContent,
    cert: keyContent,
};

https.createServer(options, (req, res) => {
    res.writeHead(200);
    res.end('Hello World!\n');
}).listen(8000);
```

## 参考资料

