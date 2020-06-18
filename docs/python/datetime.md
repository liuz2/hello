# DateTime 模块

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

[1]: https://docs.python.org/3/library/time.html "time module"