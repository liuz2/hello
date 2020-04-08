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

使用双精度 double 可以处理更大的值：

```c
#include <stdio.h>

int main() {
    double nc;

    for (nc = 0; getchar() != EOF; ++nc)
        ;
    printf("%.0f\n", nc);
}
```