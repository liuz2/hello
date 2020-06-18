# os.path 模块

查看 `os.path` 的所有属性：

```py
dir(os.path)

['__all__', '__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__spec__', '_get_sep', '_joinrealpath', '_varprog', '_varprogb', 'abspath', 'altsep', 'basename', 'commonpath', 'commonprefix', 'curdir', 'defpath', 'devnull', 'dirname', 'exists', 'expanduser', 'expandvars', 'extsep', 'genericpath', 'getatime', 'getctime', 'getmtime', 'getsize', 'isabs', 'isdir', 'isfile', 'islink', 'ismount', 'join', 'lexists', 'normcase', 'normpath', 'os', 'pardir', 'pathsep', 'realpath', 'relpath', 'samefile', 'sameopenfile', 'samestat', 'sep', 'split', 'splitdrive', 'splitext', 'stat', 'supports_unicode_filenames', 'sys']
```

判断是否目录 `isdir()`:

```py
os.path.isdir('foobar')

True
```

判断是否文件 `isfile()`:

```py
os.path.isfile('foobar')

False
```

判断目录或文件是否存在 `exists()`:

> 在 mac 平台不区分文件名大小写

```py
os.path.exists('foobar')

True
```

获取目录名 `dirname()`:

```py
>>> os.path.dirname('a/b/c')

'a/b'

>>> os.path.dirname('a/b/c/')

'a/b/c'
```

获取文件名 `basename()`:

```py
my_path = '/path/to/the/file.txt'
os.path.basename(my_path)

'file.txt'
```

拆分目录和文件名 `split()`:

```py
my_path = '/path/to/the/file.txt'
os.path.split(my_path)

('/path/to/the', 'file.txt')
```

拆分扩展名 `splitext()`:

```py
my_path = '/path/to/the/file.txt'
os.path.splitext(my_path)

('/path/to/the/file', '.txt')
```

拼接目录 `join()`:

```py
os.path.join('/path/to', 'a', 'b', 'c')

'/path/to/a/b/c'
```

## 参考文档

1. [os.path 模块 - Python 3.7 文档](https://docs.python.org/3.7/library/os.path.html)