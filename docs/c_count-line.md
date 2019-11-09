# 行计数

```c
#include <stdio.h>

/* count the number of line in stdin */
int main() {
    int c, nl;

    nl = 0;
    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            ++nl;
        }
    }
    printf("%d\n", nl);
}
```