# 第二章 语言及其文法

## 7 [基本概念](https://www.bilibili.com/video/BV1zW411t7YE?p=7)

字母表（Alphabet）

字母表 $\Sigma$ 是一个有穷符号集合。符号的典型例子包括字母、数字、标点符号、$\dots$

例如：

- 二进制字母表：$\{0, 1\}$
- ASCII 字符集
- Unicode 字符集

字母表既然是集合，就可以进行集合的运算。

### 字母表上的运算

**字母表 $\Sigma_1$ 和 $\Sigma_2$ 的乘积（product）**:

$$\Sigma_1\Sigma_2 = \{ab|a\in\Sigma_1, b\in\Sigma_2\}$$

例如：$\{0,1\}\{a,b\} = \{0a, 0b, 1a, 1b\}$

**字母表 $\Sigma$ 的 $n$ 次幂（power）**：

$$\begin{cases}\Sigma^0=\{\epsilon\}\\ \Sigma^n=\Sigma^{n-1}\Sigma,n\ge1\end{cases}$$

例如：$\{0,1\}^3 = \{0,1\}\{0,1\}\{0,1\} = \{000,001,010,011,100,101,110,111\}$

可见，字母表的 $n$ 次幂，实际上就是长度为 $n$ 的符号串构成的集合。长度为 0 的集合就是空串，用 $\epsilon$ 表示。

**字母表的 $\Sigma$ 的正闭包（positive closure）**：

$$\Sigma^+ = \Sigma \cup \Sigma^2 \cup \Sigma^3 \cup \dots$$

字母表的正闭包，是 $\Sigma$ 字母表的各个正整数次幂的并集。

例如：

$$\{a,b,c,d\}^+ = \{a,b,c,d,\\ aa,ab,ac,ad,ba,bb,bc,bd,\dots,\\ aaa,aab,aac,aad,aba,abb,abc,\dots\}$$

字母表的正闭包：长度为正数的符号串构成的集合。

**字母表 $\Sigma$ 的克林闭包（Kleene closure）**：

$$\Sigma^* = \Sigma^0 \cup \Sigma^+ = \Sigma^0 \cup \Sigma \cup \Sigma^2 \cup \Sigma^3 \cup \dots$$

例如：

$$\{a,b,c,d\}^* = \{\epsilon, a,b,c,d,\\ aa,ab,ac,ad,ba,bb,bc,bd,\dots,\\ aaa,aab,aac,aad,aba,abb,abc,\dots\}$$

由此可见，字母表的克林闭包：任意字符串（长度可以为零）构成的集合

### 串（string）

设 $\Sigma$ 是一个字母表，$\forall{x}\in\Sigma^*$，则 $x$ 称为是 $\Sigma$ 上的一个串。

串是字母表中符号的一个有穷序列。

串 $s$ 的长度，通常记作 $|s|$，是指 $s$ 中符号的个数。例如：$|aab| = 3$

空串是长度为0的串，用 $\epsilon(epsilon)$ 表示。例如：$|\epsilon| = 0$

### 串上的运算 - 连接

如果 $x$ 和 $y$ 是串，那么 $x$ 和 $y$ 的连接（concatenation）是把 $y$ 附加到 $x$ 后面而形成的串，记作 $xy$

例如，如果 $x=dog$ 且 $y=house$ ，那么 $xy = doghouse$

空串是连接运算的单位元（identity），即，对于任何串 $s$ 都有，$\epsilon{s} = s\epsilon = s$

设 $x, y, z$ 是三个字符串，如果 $x = yz$，则称 $y$ 是 $x$ 的**前缀**，$z$ 是 $x$ 的**后缀**。

### 串上的运算 - 幂

串 $s$ 的幂运算：

$$\begin{cases}s^0 = \epsilon\\ s^n = s^{n-1}s, n \ge 1\end{cases}$$

$s^1 = s^0s = \epsilon{s} = s, \quad s^2 = ss, \quad s^3 = sss, \dots$

串 $s$ 的 $n$ 次幂：将 $n$ 个 $s$ 连接起来

## 8 [文法的定义](https://www.bilibili.com/video/BV1zW411t7YE?p=8)

TODO