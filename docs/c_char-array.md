# 使用字符数组

```c
#include <stdio.h>

#define MAXLINE 1000 /* 允许的输入行最大长度 */

int getline(char line[], int maxline);
void copy(char to[], char from[]);

int main() {
    int len; /* current line length */
    int max; /* max line length so far */
    char line[MAXLINE]; /* current line */
    char longest[MAXLINE]; /* keeps the longest line */

    max = 0;
    while ((len = getline(line, MAXLINE)) > 0)
        if (len > max) {
            max = len;
            copy(longest, line);
        }
    if (max > 0)
        printf("%s", longest);
    return 0;
}

/* getline: read line into s, and return length */
int getline(char s[], int lim) {
    int c, i;

    for (i = 0; i<lim-1 && (c=getchar())!=EOF && c!='\n'; ++i)
        s[i] = c;
    if (c == '\n') {
        s[i] = c;
        ++i;
    }
    s[i] = '\0';
    return i;
}

/* copy: copy from to to */
void copy(char to[], char from[]) {
    int i;

    i = 0;
    while ((to[i] = from[i]) != '\0')
        ++i;
}
```

在 macOS 上编译该源代码，会导致报错：

```sh
error: conflicting types for 'getline'
```

问题在于，《C 程序设计语言》遵循的是 ANSI C 标准，该标准的库文件并不包含 `getline` 函数。但是操作系统自带的 C 编译器，默认使用 POSIX 标准，扩展了 ANSI C，包含了 `getline` 函数。

所以，只需重命名 `getline` 即可。

```diff
- int getline(char line[], int maxline);
+ int my_getline(char line[], int maxline);
```

## REF

1. [How to solve a conflicting types error in c?](https://stackoverflow.com/questions/55861379/how-to-solve-a-conflicting-types-error-in-c) | stackoverflow