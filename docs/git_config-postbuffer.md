# POST git-receive-pack (chunked) 的解决办法

在 `~/.gitconfig` 中加入如下内容即可：

```
[http]
    postBuffer = 524288000
```

## REF

1. [使用SourceTree Push 出现 POST git-receive-pack (chunked) 的解决方法](https://www.cnblogs.com/duwei/p/4370908.html), by *TuWei*, 2015-03-27