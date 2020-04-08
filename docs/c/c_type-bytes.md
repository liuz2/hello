# 数据类型和长度

C 语言提供了下列几种基本数据类型。

| 数据类型 | 说明 | 字节长度 |
| --- | --- | --- |
| `char` | 字符型 | 1 |
| `int` | 整型 | 2~4 |
| `float` | 单精度浮点型 | |
| `double` | 双精度浮点型 | |

基本数据类型前，还可以有限定符。比如，`long` 和 `short` 用于限定整型。

```c
short int sh;
long int counter;
```

| 数据类型 | 说明 | 字节长度 |
| --- | --- | --- |
| `short int` | 短整型 | 2 |
| `long int` | 长整型 | 4 |

类型长度定义在以下文件中：

1. `<limits.h>`
1. `<float.h>`

枚举常量，是另外一种类型的常量。它是一个整型值的列表。

```c
enum boolean { NO, YES };
enum months { JAN = 1, FEB, MAR, APR, MAY, JUN,
JUL, AUG, SEP, OCT, NOV, DEC };
```