# dateTime 和 time 模块

## datetime 模块

导入模块：

```py
>>> import datetime
>>> dir(datetime)

['MAXYEAR', 'MINYEAR', '__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__spec__', 'date', 'datetime', 'datetime_CAPI', 'sys', 'time', 'timedelta', 'timezone', 'tzinfo']

>>> dir(datetime.datetime)
['__add__', '__class__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__ne__', '__new__', '__radd__', '__reduce__', '__reduce_ex__', '__repr__', '__rsub__', '__setattr__', '__sizeof__', '__str__', '__sub__', '__subclasshook__', 'astimezone', 'combine', 'ctime', 'date', 'day', 'dst', 'fold', 'fromisoformat', 'fromordinal', 'fromtimestamp', 'hour', 'isocalendar', 'isoformat', 'isoweekday', 'max', 'microsecond', 'min', 'minute', 'month', 'now', 'replace', 'resolution', 'second', 'strftime', 'strptime', 'time', 'timestamp', 'timetuple', 'timetz', 'today', 'toordinal', 'tzinfo', 'tzname', 'utcfromtimestamp', 'utcnow', 'utcoffset', 'utctimetuple', 'weekday', 'year']
```

下面是一系列常规操作：

```py
now_time = datetime.datetime.now()

print('now: {0}'.format(now_time))
# now: 2020-06-18 22:44:42.148933

# 获取日期
now_time.date()
# datetime.date(2020, 6, 18)
print('today: {0}'.format(now_time.date()))
# today: 2020-06-18

# 获取时间
now_time.time()
# datetime.time(22, 44, 42, 148933)
print('current time: {0}'.format(now_time.time()))
# current time: 22:44:42.148933

# 获取今天日期（和 now() 类似？）
datetime.datetime.today()
# datetime.datetime(2020, 6, 18, 22, 52, 35, 465320)

# 获取当前年份，月，日
now_time.year, now_time.month, now_time.day
# (2020, 6, 18)

# 获取当前时间的时分秒
now_time.hour, now_time.minute, now_time.second
# (22, 44, 42)

# 打印微秒
now_time.microsecond
# 148933
```

为了简化使用，可以改用如下的导入方式：

```py
from datetime import datetime

now_time = datetime.now()
now_time
# datetime.datetime(2020, 6, 18, 23, 0, 0, 417879)
```

datetime 模块[转换参数表][3]

| 参数 | 含义                            |
| ---- | ------------------------------- |
| %A   | 星期的名称，如 Monday           |
| %B   | 月份名，如January               |
| %m   | 用数字表示的月份（01-12）       |
| %d   | 用数字表示月份中的一天（01-31） |
| %Y   | 四位的年份，如2020              |
| %y   | 两位的年份，如20                |
| %H   | 24小时制的小时数（00-23）       |
| %I   | 12小时制的小时数（01-12）       |
| %p   | am或pm                          |
| %M   | 分钟数（00-59）                 |
| %S   | 秒数（00-59）                   |

自定义日期和时间

```py
from datetime import datetime, date, time

d = datetime(2020, 10, 30, 14, 5)
print(d)
# 2020-10-30 14:05:00

d2 = date(2020, 5, 1)
print(d2)
# 2020-05-01

t = time(13, 59, 59)
print(t)
# 13:59:59
```

将字符串转换为 datetime 对象 `strptime()`

```py
s = '2020-06-21'
d = datetime.strptime(s, '%Y-%m-%d')
print(d)
# 2020-06-21 00:00:00

datetime.strptime('2020-06-21 13:23:59', '%Y-%m-%d %H:%M:%S')
# datetime.datetime(2020, 6, 21, 13, 23, 59)
```

datetime 对象转换为字符串 `strftime()`

```py
now_time = datetime.now()
print(now_time)
# 2020-06-21 17:37:02.803543
s = datetime.strftime(now_time, '%Y/%m/%dT%H:%M:%S')
print(s)
# 2020/06/21T17:37:02
```

datetime 对象之间的加减操作

```py
from datetime import timedelta

n = datetime.now()
print(n)
# 2020-06-21 17:42:22.766981

# 时间的加法
n_next = n + timedelta(days=5, hours=42)
print(n_next)
# 2020-06-28 11:42:22.766981

# 时间的减法
d2 = datetime(2020, 6, 21)
d1 = datetime(2019, 1, 7)
diff = d2 - d1
type(diff)
# <class 'datetime.timedelta'>
diff.days
# 531
```

## time 模块

注意区分与 time 模块的不同：

```py
import time

time.time()
# 1592492672.9409091
```

使用 `help(time.time)` 可以得知：

```
time(...)
    time() -> floating point number

    Return the current time in seconds since the Epoch.
    Fractions of a second may be present if the system clock provides them.
```

Epoch 指的是什么？根据 [time 模块][1]文档的解释：

> The epoch is the point where the time starts, and is platform dependent. For Unix, the epoch is January 1, 1970, 00:00:00 (UTC). To find out what the epoch is on a given platform, look at time.gmtime(0).

另外，`time.sleep(seconds)` 可以让代码暂停一段时间。

## 参考资料

1. [datetime module][2]
1. [time module][1]

[1]: https://docs.python.org/3/library/time.html "time module"
[2]: https://docs.python.org/3/library/datetime.html "datetime module"
[3]: https://docs.python.org/3/library/datetime.html#strftime-and-strptime-format-codes "format codes"