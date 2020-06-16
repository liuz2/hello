# LaTeX 简介

LaTeX 是个高质量排版系统，常用于制作科技和学术文档。其实它能用于任意形式的出版物排版。

LaTeX 不是文字处理器。它鼓励作者将精力集中在内容上，不必为文字版式发愁。

> LaTeX 在这一点上和 CSS 的目的有些类似。

下面是一个简单的 LaTeX 样例：

```latex
\documentclass{article}
\title{Cartesian closed categories and the price of eggs}
\author{Jane Doe}
\date{September 1994}
\begin{document}
    \maketitle
    Hello world!
\end{document}
```

简单解释一下：

1. 本文档是一篇文章
1. 它的标题是 `Cartesian closed categories and the price of eggs`
1. 它的作者是 `Jane Doe`
1. 写作日期是 `September 1994`
1. 文档内容由标题和 `Hello world!` 构成

LaTeX 的特性包括：

1. 可以排版期刊文章，技术报告，书籍和幻灯片
1. 可以操控大型文档，内容涵盖章节、交叉引用、表格和图形
1. 可以排版复杂的数学公式
1. 使用 AMS-LaTeX 进行数学的高级排版
1. 自动生成目录和索引
1. 多语言排版
1. 包含艺术品、原色和专色（？）
1. 使用 PostScript 或 Metafont 字体

## 安装 & 使用

如果你是 mac 用户，可以安装 [MacTex][1]。体积大约 4 GB（2020/04/08 的版本）。

如果不想本地安装，可以使用在线服务，比如 [Papeeria][2]，[Overleaf][3]，[Datazar][4] 或 [LaTeX Base][5] 等。

## 参考资料

1. [Introduction to LaTeX](https://www.latex-project.org/about/)
1. [Overleaf, Online LaTeX Editor][3]
1. [LaTeX Tutorials for Beginners](https://www.bilibili.com/video/av36853649/), bilibili
1. [一份其实很短的 LaTeX 入门文档](https://liam.page/2014/09/08/latex-introduction/)，作者 *Liam Huang*，2014/09/08

[1]: https://www.tug.org/mactex/ "MacTeX - TeX Users Group"
[2]: https://papeeria.com/ "Papeeria: online LaTeX editor"
[3]: https://www.overleaf.com/ "Overleaf"
[4]: https://www.datazar.com/ "Datazar"
[5]: https://latexbase.com/ "LaTeX Base"