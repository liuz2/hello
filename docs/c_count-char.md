# 字符计数

```c
#include <stdio.h>

int main() {
    long nc;

    nc = 0;
    while (getchar() != EOF) {
        ++nc;
    }
    printf("%ld\n", nc);
}
```