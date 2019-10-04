# for ... range 循环

每次 for ... range 循环，都会产生一对值：索引以及该索引对应的值。

```go
package main

import (
    "fmt"
    "os"
)

func main() {
    s, sep := "", ""
    for _, arg := range os.Args[1:] {
        s += sep + arg
        sep = " "
    }

    fmt.Println(s)
}
```

注意此处空标识符（blank identifier）`_` 的用法。