# 打印温度对照表

```c
#include <stdio.h>

int main() {
    int fahr, celsius;
    int lower, upper, step;

    lower = 0;
    upper = 300;
    step = 20;

    fahr = lower;
    while (fahr <= upper) {
        celsius = 5 * (fahr - 32) / 9;
        printf("%d\t%d\n", fahr, celsius);
        fahr = fahr + step;
    }
}
```

让温度右对齐：

```diff
- printf("%d\t%d\n", fahr, celsius);
+ printf("%3d %6d\n", fahr, celsius);
```

使用浮点数增加精度：

```diff
- int fahr, celsius;
+ float fahr, celsius;

- celsius = 5 * (fahr - 32) / 9;
- printf("%3d %6d\n", fahr, celsius);
+ celsius = (5.0/9.0) * (fahr-32.0);
+ printf("%3.0f %6.1f\n", fahr, celsius);
```

使用 for 循环：

```c
#include <stdio.h>

int main() {
    int fahr;
    
    for (fahr = 0; fahr <= 300; fahr = fahr + 20) {
        printf("%3d %6.1f\n", fahr, (5.0/9.0)*(fahr-32));
    }
}
```

使用符号常量：

```c
#include <stdio.h>

#define LOWER 0
#define UPPER 300
#define STEP 20

int main() {
    int fahr;
    
    for (fahr = LOWER; fahr <= UPPER; fahr = fahr + STEP) {
        printf("%3d %6.1f\n", fahr, (5.0/9.0)*(fahr-32));
    }
}
```