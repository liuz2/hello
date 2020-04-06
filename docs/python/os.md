# OS 模块

这个模块提供了操作系统相关的操作。如果想读写文件，请使用 `open()` 函数；如果想处理路径，请使用 `os.path` 模块；如果想读取命令行的所有文件的全部行文本，请参考 fileinput 模块；如果要创建临时目录或文件，请使用 `tempfile` 模块；对于文件和目录处理的高级处理，请使用 `shutil` 模块。

>  注意：本模块的所有函数，遇到错误时，会抛出 `OSError` 异常。

## 文件名称、命令行参数和环境变量

在 Python 中，文件名称、命令行参数和环境变量都使用 string 表示。在某些系统中，需要提前将这些 string 类型转换为 bytes 类型，然后才能供系统使用。

## 进程参数

以下函数和数据元素提供了针对当前进程和用户的信息以及操作。

### os.environ

一个 mapping 对象，表示环境变量。比如，`environ['HOME']` 代表你的用户目录，相当于 C 语言中的 `getenv("HOME")`。

```py
>>> os.environ['HOME']
'/Users/liuz'
```



## 参考文档

1. [os - 包罗万象的操作系统接口 - Python 3.7.7 文档](https://docs.python.org/3.7/library/os.html)