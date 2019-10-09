# Github 镜像

golang 在 github 建立了一些镜像库，如 https://github.com/golang/net 就是 https://golang.org/x/net 的镜像库。

获取 golang.org/x/net 包，其实只需要以下步骤：

```sh
$ mkdir -p $GOPATH/src/golang.org/x
$ cd $GOPATH/src/golang.org/x
$ git clone https://github.com/golang/net.git
```

## REF

1. [国内的go get问题的解决 | CSDN](https://blog.csdn.net/gongpulin/article/details/80972806), by *gongpulin*, 2018-07-09