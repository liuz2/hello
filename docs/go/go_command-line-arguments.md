# 打印命令行参数

**args.go**

```go
package main

import (
    "fmt"
    "os"
    "strings"
)

func main() {
    str := strings.Join(os.Args[1:], " ")
    fmt.Println(str)
}
```

执行命令及运行结果如下：

```sh
$ go run args.go -a b -c d
-a b -c d
```