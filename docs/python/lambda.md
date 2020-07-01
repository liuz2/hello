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