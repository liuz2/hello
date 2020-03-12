# 修复 RPC failed 的报错

可以强制 git 使用 http/1.1。命令如下：

```sh
$ git config --global http.version HTTP/1.1
```

## 参考文档

1. [git - error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)][1], stackoverflow

[1]: https://stackoverflow.com/questions/59282476/error-rpc-failed-curl-92-http-2-stream-0-was-not-closed-cleanly-protocol-erro "git - error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)"