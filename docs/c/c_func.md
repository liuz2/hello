# 使用函数

```c
#include <stdio.h>

int power(int m, int n);

int main() {
    int i;
    for (i = 0; i < 10; ++i)
        printf("%d %3d %6d\n", i, power(2, i), power(-3, i));
    return 0;
}

/* power: return the power n of base, n >= 0 */
int power(int base, int n) {
    int i, p;

    p = 1;
    for (i = 1; i <= n; ++i)
        p = p * base;
    return p;
}
```

在 C 语言中，所有函数参数都是**通过值**传递的。