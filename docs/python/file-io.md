# 文件读写

## 文件读写模式

| 值 | 描述 |
| --- | --- |
| r | 读取模式（默认值）|
| w | 写入模式 |
| x | 独占写入模式 |
| a | 附加模式 |
| b | 二进制模式（与其他模式结合使用）|
| t | 文本模式（默认值，与其他模式结合使用）|
| + | 读写模式（与其他模式结合使用）|

## 文件的打开与关闭

使用 `open()` 函数打开文件

```py
f = open('data.txt')
f
# <_io.TextIOWrapper name='data.txt' mode='r' encoding='UTF-8'>
f.mode
# 'r'
f.name
# 'data.txt'
```

使用 `close()` 函数关闭文件

```py
f.close()
```

使用 `with` 语法（上下文管理器）

```py
with open('somefile.txt') as f:
    do_something(f)
```

到达语句末尾时，将自动关闭文件，即使出现异常也是如此。