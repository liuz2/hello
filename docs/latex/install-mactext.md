# 安装 MacTeX

下载地址是 [MacTeX.pkg](http://tug.org/cgi-bin/mactex-download/MacTeX.pkg)，如果直接在浏览器下载，需要大概1周多的时间。建议使用迅雷下载。大约 30 多分钟内下完。

安装这个软件大概需要 6.74GB 的磁盘空间。

MacTeX 会创建符号链接 `/Library/TeX/texbin`，它间接指向 TeX Live 二进制目录。

TeX Live 是真正的 TeX 发行版，安装目录位于 `/usr/local/texlive/2020`。大部分用户通过“前端”工具使用 TeX，“前端”工具提供了用于输入源代码的编辑器和查看排版的预览窗口。MacTeX 安装的前端是 TeXShop，位于目录 `/Applications/TeX`。

安装时间大概5分钟左右。安装完成后，首先要阅读 `/Applications/TeX/Docs and Spell Utilities/READ ME FIRST.pdf`。

`READ ME FIRST.pdf` 一共8页，主要内容如下：

## READ ME FIRST

### 1 TeX, LaTeX, and TeXShop

TeX 是一种排版程序，起初用来编写数学和科学文档，后来才慢慢发展到其他领域。MacTeX 发行版包括 TeX 程序和大量周边产品：字体，样式文件等等。

用户看不到这些周边，人们通常利用前端工具使用 TeX。MacTeX 的前端工具是 TeXShop，它从 macOS 操作系统刚面世时就存在了。

TeX 本身具有非常原始的输入语言。最简单的 TeX，Knuth 称之为“处女” TeX。它只有原始命令，没有宏命令。普通的 TeX 是一系列宏集（Knuth 开发），让 TeX 在打字员的日常生活中可用。

后来，*Leslie Lamport* 开发了更庞大的宏集，名叫 LaTeX。它现在很流行，本文也会使用它。

### 2 TeX 和 TeXShop 使用第一步

在 `/Applications/TeX` 下找到 TeXShop，将图标拖到程序坞。

双击打开 TeXShop，会在界面右上角发现一个下拉菜单，上面写着“模板”。选择其中的“LaTeXTemplate”，窗口会填充 LaTeX 基本模板。

新的内容可以写在 `\begin{document}` 和 `\end{document}` 之间。写好内容后，可以点击左上角的「排版」，就可以预览文档。

默认对中文支持不好。输入中文，直接编译报错。如何正确显示中文呢？根据 [Kko 的博客][1] 设置如下：

1. 选择 `XeLaTeX`
2. 在文档头部增加 `\usepackage{ctex}` 即可。

### 3 TeX 第二步

TODO: 5/8

## 参考文档

1. [MacTeX - TeX Users Group](https://www.tug.org/mactex/mactex-download.html)
1. [在Mac下安装使用支持中文的LaTeX（一）][1]，作者*Kko*，2015/08/02

[1]: https://www.cnblogs.com/kko-liu/p/4696429.html "在Mac下安装使用支持中文的LaTeX（一）"