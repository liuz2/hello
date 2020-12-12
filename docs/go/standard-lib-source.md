# 自带标准库源码

首先，查看 Go 的安装路径

```sh
$ which go
/usr/local/go/bin/go
```

进入源码路径，四处闲逛即可。

```sh
$ cd /usr/local/go/src
```

比如，想查看 `strings.Join()` 的实现：

```sh
$ vim strings/strings.go
```

```go
// Join concatenates the elements of a to create a single string. The separator string
// sep is placed between elements in the resulting string.
func Join(a []string, sep string) string {
    if len(a) == 0 {
        return ""
    }
    if len(a) == 1 {
        return a[0]
    }
    n := len(sep) * (len(a) - 1)
    for i := 0; i < len(a); i++ {
        n += len(a[i])
    }

    b := make([]byte, n)
    bp := copy(b, a[0])
    for _, s := range a[1:] {
        bp += copy(b[bp:], sep)
        bp += copy(b[bp:], s)
    }
    return string(b)
}
```