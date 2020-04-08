# 理解正则表达式

## 什么是回溯？

进入到匹配路径选择时，遇到失败的匹配路径，尝试走另外一个匹配路径的行为，称作回溯（Backtrack）。

## 如何减少或避免回溯？
1. 优化正则表达式：时刻注意回溯造成的性能影响
2. 使用 DFA 正则引擎的正则表达式

## 什么是 DFA 正则引擎？

传统正则引擎分为 NFA（非确定性有限状态自动机）和 DFA（确定性有限状态自动机）。

DFA 指对于给定的任意一个状态和输入字符，DFA 只会转移到一个确定的状态，并且 DFA 不允许出现没有输入字符的状态转移。

## DFA 和 NFA 引擎的区别？

|      | DFA                                                          | NFA                                                          |
| ---- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 原理 | 把正则表达式转换成一个图的邻接表，然后通过跳表的形式判断一个字符串是否匹配该正则 | 在语法解析的时候，构造出的一个有向图。然后通过深搜的方式，去一条路径一条路径的递归尝试 |
| 优点 | 匹配速度快                                                   | 功能强大，能拿到匹配的上下文信息，支持各种功能，比如断言、捕获组、环视等 |
| 缺点 | 不支持高级功能，比如捕获组、断言等                           | 对开发人员要求较高，需注意回溯造成的性能问题                 |

大部分语言的正则引擎都是 NFA 的，JavaScript 也是。

## 参考文档

1. [浅谈正则表达式原理 | AlloyTeam][1]，作者毕龙，2019/07/15
2. [Details of the Cloudflare outage on July 2, 2019][2], by *John Graham-Cumming*, 2019/07/12

[1]: http://www.alloyteam.com/2019/07/13574/ "浅谈正则表达式原理"
[2]: https://blog.cloudflare.com/details-of-the-cloudflare-outage-on-july-2-2019/ "Details of the Cloudflare outage on July 2, 2019"