# 第二章 语言及其文法

## 7 [基本概念](https://www.bilibili.com/video/BV1zW411t7YE?p=7)

字母表（Alphabet）

字母表 $\Sigma$ 是一个有穷符号集合。符号的典型例子包括字母、数字、标点符号、$\dots$

例如：

- 二进制字母表：$ \{ 0, 1 \} $
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

自然语言的例子 - 句子的构成规则

- <句子> $\rightarrow$ <名词短语><动词短语>
- <名词短语> $\rightarrow$ <形容词><名词短语>
- <名词短语> $\rightarrow$ <名词>
- <动词短语> $\rightarrow$ <动词><名词短语>
- <形容词> $\rightarrow little$
- <名词> $\rightarrow boy$ 
- <名词> $\rightarrow apple$ 
- <动词> $\rightarrow eat$ 

用尖括号括起来的部分称为**语法成分**。未用尖括号括起来的部分表示**语言的基本符号**。

### 文法的形式化定义

$$G = (V_T, V_N, P, S)$$

$G$: 文法，表示为一个四元组。

$V_T$ ：**终结符集合**。终结符（$terminal\ symbol$）是文法所定义的语言的**基本符号**，有时也称为 $token$ 。其中 $V$ 表示向量 $Vector$ 。

例：$V_T = \{apple, boy, eat, little\}$

$V_N$ 表示**非终结符集合**。**非终结符**（$nonterminal$）是用来表示语法成分的符号，有时也称为**“语法变量”**。

例：$V_N = \{<句子>,<名词短语>,<动词短语>,<形容词>,\dots\}$

终结符集合和非终结符结合是不相交的：$V_T \cap V_N = \varnothing$

终结符和非终结符统称为**文法符号**。$V_T \cup V_N = $ 文法符号集

$P$ ：产生式集合。**产生式**（$production$）描述了将终结符和非终结符组合成串的方法。

产生式的一般形式：$\alpha \rightarrow \beta$，读作：$\alpha$ 定义为 $\beta$ 。$\alpha$ 和 $\beta$ 都是**文法符号串**。

其中：$\alpha \in (V_T \cup V_N)^+$ ，且 $\alpha$ 中至少包含 $V_N$ 中的一个元素：称为产生式的**头**（$head$）或**左部**（$left\ side$）

$\beta \in (V_T \cup V_N)^*$：称为产生式的**体**（$body$）或**右部**（$right\ side$）

例：$P=\begin{cases}<句子> \rightarrow <名词短语><动词短语>,\\ <名词短语> \rightarrow <形容词><名词短语>, \\ \dots\end{cases}$

$S$ ：**开始符号**。$S \in V_N$ 开始符号（$start\ symbol$）表示的是该文法中最大的语法成分。

例：$S = <句子>$

下面是一个简化版本的，用来表示算术表达式的文法：

$G = (\{id,+,*,(,)\},\{E\}, P, E)\\ \begin{align*}P = \{  &E \rightarrow E + E, \\ &E \rightarrow E * E, \\ &E \rightarrow (E), \\  &E \rightarrow id \}\end{align*}$

约定：在不引起歧义的前提下，可以只写产生式。

$$\begin{align*}G:\ &E \rightarrow E + E\\ &E \rightarrow E * E\\ &E \rightarrow (E)\\ &E \rightarrow id\end{align*}$$

### 产生式的简写

对一组有相同左部的 $\alpha$ 产生式：

$$\begin{equation}\alpha \rightarrow \beta_1, \alpha \rightarrow \beta_2, \dots, \alpha \rightarrow \beta_n\end{equation}$$

可以简记为：

$$\alpha \rightarrow \beta_1 | \beta_2 | \dots | \beta_n$$

读作：$\alpha$ **定义为** $\beta_1$，或者 $\beta_2$，$\dots$，或者 $\beta_n$。

$\beta_1, \beta_2, \dots, \beta_n$ 称为 $\alpha$ 的**候选式**（$Candidate$）

例：

$$E \rightarrow E + E\\E \rightarrow E * E\\E \rightarrow (E)\\E \rightarrow id$$  可以简化为：$$E \rightarrow E + E | E * E | (E) | id$$

### 符号约定

下述符号是**终结符**：

- 字母表中排在前面的小写字母，如 $a, b, c$
- 运算符，如 $+, *$ 等
- 标点符号，如括号、逗号等
- 数字 $0, 1, \dots, 9$
- 粗体字符串，如 **id**, **if** 等

下述符号是**非终结符**：

- 字母表中排在前面的大写字母，如 $A, B, C$
- 字母 $S$，通常表示开始符号
- 小写、斜体的名字，比如 *expr*, *stmt* 等
- 代表程序构造的大写字母，如 $E$（表达式）、$T$（项）和 $F$（因子）

字母表中排在后面的大写字母（如$X, Y, Z$）表示**文法符号**（即终结符或非终结符）

字母表中排在后面的小写字母（主要是 $u, v, \dots, z$） 表示**终结符号串**（包括空串）

小写的希腊字母，如 $\alpha, \beta, \gamma$ ，表示**文法符号串**（包括空串）

除非特别说明，第一个产生式的左部就是开始符号。

## 9 [语言的定义](https://www.bilibili.com/video/BV1zW411t7YE?p=9)

TODO