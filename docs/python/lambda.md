# lambda 函数

lambda 是一种表达式，用于创建内嵌的简单匿名函数。

```py
# filter 函数过滤奇数
lst = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
result = filter(lambda n: n % 2 != 0, lst)
result
# <filter object at 0x7f98ff110a58>
list(result)
# [1, 3, 5, 7, 9, 11]

# map 函数求立方
lst = [1, 2, 3, 4, 5, 6]
result = map(lambda n: n * n * n, lst)
result
# <map object at 0x7f88c4a10a58>
list(result)
# [1, 8, 27, 64, 125, 216]

# 如果 map 函数中传入的列表多于一个，则 map 函数并行执行
rest = map(lambda x,y:x*10+y, [1, 2, 3], [4, 5, 6])
print(list(rest))
# [14, 25, 36]
```

`reduce()` 函数不是内建函数，需要从 `functools` 包中引入：

```py
lst = [1, 2, 3, 4]
reduce(lambda a,b:a+b, lst)
# Traceback (most recent call last):
#   File "<stdin>", line 1, in <module>
# NameError: name 'reduce' is not defined

from functools import reduce
reduce(lambda a,b:a+b, lst)
# 10
```

为什么 reduce() 不是内建函数？因为 [Guido 讨厌它][1]。

## 参考资料

1. [The fate of reduce() in Python 3000][1], by *Guido van Rossum*, 2005/03/10

[1]: https://www.artima.com/forums/flat.jsp?forum=106&thread=98196 "The fate of reduce() in Python 3000"