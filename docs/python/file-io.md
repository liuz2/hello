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

## 文件的读取

```py
f = open('test.txt')
# 读取全部文件
res = f.read()

# 读取 4 个字符
res = f.read(4)

# 随机读取
f.seek(2)

# 读取一行数据
f.readline()

# 读取所有行，并返回列表
f.readlines()

f.close()
```

## 文件的写入

使用 `write()` 函数向打开的文件对象写入内容：

```py
file_name = 'data.txt'
f = open(file_name, 'w')
f.write('hello')
f.write('world')
f.close()
```

就会创建一个文件 `data.txt`，其内容为 `helloworld`

使用 `writelines()` 函数写入多行内容：

```py
file_name = 'data.txt'
with open(file_name, 'w') as f:
    l = ['first line\n', 'second line\n', 'third line']
    f.writelines(l)
```