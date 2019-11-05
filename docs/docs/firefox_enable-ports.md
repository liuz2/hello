# 开启其他端口号

1. 打开设置页 `about:config`
1. 新建字符串键 `network.security.ports.banned.override`
1. 输入目标端口号，比如 `8080`。如果是多个端口号，用半角逗号隔离，比如 `81,88,98`。
1. 在保证安全的情况下，还可以开启所有的端口号。比如 `1-65535`。

## REF

1. [此地址使用了一个通常用于网络浏览以外的端口。出于安全原因，Firefox 取消了该请求。](https://blog.csdn.net/aqgsh/article/details/18736603), by *aqgsh*, 2014-01-24