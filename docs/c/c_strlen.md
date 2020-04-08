# 获取字符串长度

```c
int strlen(char s[]) {
    int i;

    i = 0;
    while (s[i] != '\0)
        ++i;
    return i;
}
```

注意，字符串的长度不包括末尾的 `\0` 分隔符。