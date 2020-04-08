# 《斯坦福大学公开课：编译原理》笔记

讲师 Alex Aiken

## [Introduction](https://www.bilibili.com/video/av27845355/?p=1)

Interpreter is online, and compiler is offline.

1954, IBM develops the 704。软件成本超过硬件成本，导致人们研究降低软件开发的方法。

1953 年，[John Backus][backus] 发明 **Speedcoding** 解释器。方便开发，但速度极慢，且占用内存较大。

1954-1957 年，John Backus 开发了 FORTRAN 1。FORTRAN 是第一款流行的编译语言，影响了后来的编译器的结构。

## [Structure of a Compiler](https://www.bilibili.com/video/av27845355/?p=2)

编译器大体包含以下五个部件：

1. Lexical Analysis 词法分析
1. Parsing 语法分析
1. Semantic Analysis 语义分析
1. Optimization 优化
1. Code Generation 代码生成

> **Lexical analysis** divides program text into "words" or "tokens".

> **Parsing** = Diagramming Sentences, a tree.

> Compilers perform limited **semantic analysis** to catch inconsistencies.

比如类型检查和作用域绑定。

> **Optimization** is a little bit like editing.

> **Code Generation** usually produces assembly code, but it can also produces a translation to another language.

随着时间发展，编译器的五个部件占用比例也发生着改变。目前，编译器的主要部分在于 Semantic Analysis 和 Optimization。

## [The Economy of Programming Languages](https://www.bilibili.com/video/av27845355/?p=3)

TODO:

## REF

1. [Alex Aiken][author] - stanford
1. [CS143: Compilers](https://web.stanford.edu/class/cs143/index2018.html) - standord 2018 - 包含课程的幻灯片
1. [斯坦福大学编译原理课程质量怎么样？](https://www.zhihu.com/question/28679215/answer/43883727), by *RednaxelaFX* - 知乎

[author]: http://theory.stanford.edu/~aiken/
[backus]: http://www.thocp.net/biographies/backus_john.htm