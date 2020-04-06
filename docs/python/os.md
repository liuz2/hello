# OS 模块

这个模块提供了操作系统相关的操作。如果想读写文件，请使用 `open()` 函数；如果想处理路径，请使用 `os.path` 模块；如果想读取命令行的所有文件的全部行文本，请参考 fileinput 模块；如果要创建临时目录或文件，请使用 `tempfile` 模块；对于文件和目录处理的高级处理，请使用 `shutil` 模块。

>  注意：本模块的所有函数，遇到错误时，会抛出 `OSError` 异常。

## 文件名称、命令行参数和环境变量

在 Python 中，文件名称、命令行参数和环境变量都使用 string 表示。在某些系统中，需要提前将这些 string 类型转换为 bytes 类型，然后才能供系统使用。

## 进程参数

以下函数和数据元素提供了针对当前进程和用户的信息以及操作。

### environ

一个 mapping 对象，表示环境变量。比如，`environ['HOME']` 代表你的用户目录，相当于 C 语言中的 `getenv("HOME")`。

```py
>>> os.environ['HOME']
'/Users/liuz'
```

### system(command)

在子进程中执行 `command` 命令。这是通过调用标准 C 函数 `system()` 实现的。比如，打开 Vim 编辑器：

```py
>>> os.system('vim')
```

### sep

当前操作系统用来分隔路径的符号。在 POSIX 中是 `/`，在 Windows 中是 `\\`。

```py
>>> os.sep
'/'
```

### pathsep

用来分隔搜寻路径的符号，在 POSIX 中是 `:`，在 Windows 中是 `;`。

```py
>>> os.pathsep
':'
```

### urandom(n)

返回一个加密级别的随机字符串。

```py
>>> os.urandom(2)
b'n\x96'
```

### getcwd()

返回当前路径。

```py
>>> os.getcwd()
'/path/to/current/directory'
```

### chdir()

更改当前路径。

```py
>>> os.chdir('node_modules')
```

### mkdir()

创建目录。

```py
>>> os.mkdir('hello')
```

如果重复创建，会报错：

```py
>>> os.mkdir('hello')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
FileExistsError: [Errno 17] File exists: 'hello'
```

### listdir()

列出当前目录下的文件（含目录）。

```py
>>> os.listdir()
['.DS_Store', 'node_modules', 'docs', 'README.md', '.gitignore', '.git', 'assets']
```

### rename()

重命名。

```py
>>> os.rename('hello', 'world')
```

### rmdir()

删除空目录。如果目录不存在、或者非空，将分别抛出 `FileNotFoundError` 或 `OSError` 异常。

```py
>>> os.listdir()
```



## 参考文档

1. [os - 包罗万象的操作系统接口 - Python 3.7.7 文档](https://docs.python.org/3.7/library/os.html)