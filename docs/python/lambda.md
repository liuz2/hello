# lambda 函数

lambda 是一种表达式，用于创建内嵌的简单匿名函数。

```py
lst = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
result = filter(lambda n: n % 2 != 0, lst)
result
# <filter object at 0x7f98ff110a58>
list(result)
# [1, 3, 5, 7, 9, 11]
```