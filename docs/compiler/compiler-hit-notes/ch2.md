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

自然语言的例子

如果有单词串：`little boy eats apple`，文法规则参照上节的自然语言的定义。那么，如何判定一个词串是否满足文法的句子？

### 推导（Derivations）和归约（Reductions）

给定文法 $G = \{V_T, V_N, P, S\}$，如果 $\alpha \rightarrow \beta \in P$，那么可以将符号串 $\gamma\alpha\delta$ 中的 $\alpha$ **替换**为 $\beta$，也就是说，将 $\gamma\alpha\delta$ **重写**（$rewrite$）为 $\gamma\beta\delta$，记作 $\gamma\alpha\delta \Rightarrow \gamma\beta\delta$。此时，称文法中的符号串 $\gamma\alpha\delta$ **直接推导**（$directly\ derive$）出 $\gamma\beta\delta$

简而言之，就是用产生式的右部替换产生式的左部。

如果 $\alpha_0 \Rightarrow \alpha_1, \alpha_1 \Rightarrow \alpha_2, \alpha_2 \Rightarrow \alpha_3, \dots, \alpha_{n-1} \Rightarrow \alpha_n$，则可以记作 $\alpha_0 \Rightarrow \alpha_1 \Rightarrow \alpha_2 \Rightarrow \alpha_3 \Rightarrow \dots \Rightarrow \alpha_{n-1} \Rightarrow \alpha_n$，称符号串 $\alpha_0$ 经过 $n$ 步推导出 $\alpha_n$，可简记为 $\alpha_0 {\color{red}\Rightarrow^n} \alpha_n$

- $\alpha \Rightarrow^0 \alpha$

- $\Rightarrow^{+}$ 表示“经过正数步推导”
- $\Rightarrow^{*}$ 表示“经过若干（可以是0）步推导”

视频 03:43 处，有自然语言的推导例子。03:52 显示出归约是推导的逆运算。

回答前面的问题：有了文法（语言规则），如何判定某一词串是否是该语言的句子？

- 句子的推导（派生） --- 从生成语言的角度
- 句子的归约 --- 从识别语言的角度

无论通过哪种途径，都需要根据规则来识别。

### 句型和句子

如果 $S \Rightarrow^* \alpha, \alpha \in (V_T \cup V_N)^*$，则称 $\alpha$ 是 $G$ 的一个句型（$sentential\ form$）。

一个句型中既可以包含终结符，又可以包含非终结符，也可能是空串。

如果 $S \Rightarrow^* w, w \in V_T^*$，则称 $w$ 是 $G$ 的一个句子（$sentence$）。

句子是**不包含非终结符**的句型。06:29 有句型和句子的举例说明。

### 语言的形式化定义

由文法 $G$ 的开始符号 $S$ 推导出的所有句子构成的集合称为**文法 $G$ 生成的语言**，记作 $L(G)$。即：

$$L(G) = \{w | S \Rightarrow^*w, w \in V_T*\}$$

文法解决了无穷语言的有穷表示问题。

### 语言上的运算

| 运算                 | 定义和表示                                                   |
| -------------------- | ------------------------------------------------------------ |
| $L$ 和 $M$ 的并      | $L \cup M = \{s | s \in L\ or\ s \in M\}$                    |
| $L$ 和 $M$ 的连接    | $LM = \{ st | s \in L\ and\ t \in M\}$                       |
| $L$ 的幂             | $\begin{cases}L^0 = \{\epsilon\}\\ L^n = L^{n-1}L, n \ge 1\end{cases}$ |
| $L$ 的 $Kleene$ 闭包 | $L^* = \bigcup_{i=0}^{\infty}L^i$                            |
| $L$ 的正闭包         | $L^+ = \bigcup_{i=1}^{\infty}L^i$                            |

例：令 $L = \{A, B, \dots, Z, a, b, \dots, z\}, D = \{0, 1, \dots, 9\}$。则 $L(L \cup D)^*$ 表示的语言是**标识符**。

## 10 [文法的分类](https://www.bilibili.com/video/BV1zW411t7YE?p=10)

### Chomsky 文法分类体系

- 0型文法（Type-0 Grammer）
- 1型文法（Type-1 Grammer）
- 2型文法（Type-2 Grammer）
- 3型文法（Type-3 Grammer）

### 0 型文法（Type-0 Grammer）

$\alpha \rightarrow \beta$

无限制文法（$Unrestricted\ Grammer$）或短语结构文法（$Phrase\ Structure\ Grammer, PSG$）

$\forall \alpha \rightarrow \beta\in P$，$\alpha$ 中至少包含1个非终结符。

由0型文法 $G$ 生成的语言 $L(G)$ 称为 **0 型语言**。

### 1型文法（Type-1 Grammer）

$\alpha \rightarrow \beta$

上下文有关文法（$Context-Sensitive\ Grammer, CSG$）

$\forall \alpha \rightarrow \beta \in P, |\alpha| \le |\beta|$

产生式的一般形式：$\alpha_1A\alpha_2 \rightarrow \alpha_1\beta\alpha_2 (\beta \ne\epsilon)$

$CSG$ 中不包含 $\epsilon-$ 产生式（又成空产生式，指产生式的右侧 $\beta$ 是空串 $\epsilon$）

由上下文有关文法（1型文法）$G$ 生成的语言 $L(G)$，叫做上下文有关语言（1型语言）。

### 2型文法（Type-2 Grammer）

$\alpha \rightarrow \beta$

上下文无关文法（$Context-Free\ Grammer, CFG$）

$\forall \alpha \rightarrow \beta\in P, \alpha \in V_N$

产生式一般形式：$A \rightarrow \beta$

由上下文无关文法（2型文法）$G$ 生成的语言 $L(G)$，叫做上下文无关语言（2型语言）。

### 3型文法（Type-3 Grammer）

$\alpha \rightarrow \beta$

正则文法（$Regular\ Grammer, RG$）

- 右线性（$Right\ Linear$）文法：$A \rightarrow wB, or\ A \rightarrow w$
- 左线性（$Left\ Linear$）文法：$A \rightarrow Bw, or\ A \rightarrow w$
- 左线性文法和右线性文法都称为正则文法

视频 04:41 有右线性文法的例子。

由正则文法（3型文法）$G$ 生成的语言 $L(G)$ 称作正则语言（3型语言）。正则文法能描述程序设计语言的多数单词。

### 四种文法之间的关系

逐级限制

- 0型文法：$\alpha$ 中至少包含1个非终结符
- 1型文法（CSG）：$|\alpha| \le |\beta|$
- 2型文法（CFG）：$\alpha \in V_N$
- 3型文法（RG）：$A \rightarrow wB,\ or\ A \rightarrow w\quad (A \rightarrow Bw,\ or\ A \rightarrow w)$

逐级包含

0型文法集合包含1型，1型包含2型，2型包含3型

## 11 [CFG 的分析树](https://www.bilibili.com/video/BV1zW411t7YE?p=11)

正则文法虽然可以描述程序语言中的大多数单词，但是它的生成能力有限，它几乎描述不了程序设计语言中的句子构造。而上下文无关文法（CFG）可以描述几乎程序设计语言的大部分构造，也是被研究的最多的一种文法。

分析树用来描述句子结构的。以下是分析树的正式定义

- 根节点的标号为文法开始符号
- 内部节点表示对于一个产生式 $\alpha \rightarrow \beta$ 的应用，该节点的标号是此产生式左部 $A$。该节点的子节点的标号从左到右构成了产生式的右部 $\beta$。
- 叶节点的标号既可以是非终结符，也可以是终结符。从左到右排列叶节点得到的符号串称为是这棵树的产出（$yeild$）或边缘（$frontier$）

### 分析树是推导的图形化表示

给定一个推导 $S \Rightarrow \alpha_1 \Rightarrow \alpha_2 \Rightarrow \dots \alpha_n$，对于推导过程中得到的每一个句型 $\alpha_i$，都可以构造出一个边缘为 $\alpha_i$ 的**分析树**。

### （句型的）短语

给定一个句型，其分析树中的每一棵子树的边缘称为该句型的一个短语（$phrase$）

如果子树只有父子两代节点，那么这棵子树的边缘称为该句型的一个直接短语（$immediate\ phrase$）

### 二义性文法（Ambiguous Grammer）

如果一个文法可以为某个句子生成多棵分析树，则称这个文法是二义性的。

比如，如下文法：

$\begin{align*}S \rightarrow\ &\textbf{if}\ E\ \textbf{then}\ S\\ |\ &\textbf{if}\ E\ \textbf{then}\ S\ \textbf{else}\ S\\ |\ &other\end{align*}$

对应的句型：$\textbf{if}\ E_1\ \textbf{then}\ \textbf{if}\ E_2\ \textbf{then}\ S_1\ \textbf{else}\ S_2$ 就有二义性。

为了避免二义性，可以引入**消岐规则**。比如，对于如上的文法，可以增加规则：每个 $else$ 和最近的尚未匹配的 $if$ 匹配。

### 二义性文法的判定

对于任意一个上下文无关文法，不存在一个算法，判定它是无二义性的；但能给出一组充分条件，满足这组充分条件的文法是无二义性的。

所谓充分条件是指：

- 满足，肯定无二义性
- 不满足，也未必就是有二义性的