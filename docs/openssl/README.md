# OpenSSL

OpenSSL 是一个密码学工具集，它实现了 Transport Layer Security (TLS v1，安全传输层协议) 和其他密码学标准。

`openssl req` 主要用来产生和处理 PKCS#10 格式的请求证书。它还能创建自签名的证书，作为根 CA 使用。例如，创建的指令如下：

```sh
$ openssl req -new -x509 -days 36500 -nodes -newkey rsa:2048 -keyout cert.key -out cert.crt -extensions v3_req
```

1. [PKCS#10 是什么？](./pkcs10.md)