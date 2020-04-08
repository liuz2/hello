# 字符复制

```c
#include <stdio.h>

int main() {
    int c;

    c = getchar();
    while (c != EOF) {
        putchar(c);
        c = getchar();
    }
}
```

使用 `Ctrl+C` 可以结束程序的输入。使用 `Ctrl+D` 可以输入 EOF。

提炼代码，减少重复逻辑：

```c
#include <stdio.h>

int main() {
    int c;

    while ((c = getchar()) != EOF) {
        putchar(c);
    }
}
```