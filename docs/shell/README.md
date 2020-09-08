# Shell

William Shotts 在 *The Linux Command Line* 一书中说：

> Freedom is the power to decide what your computer does, and the only way to have this freedom is to know what your computer is doing. Freedom is a computer that is without secrets, one where everything can be known if you care enough to find out.

## 让脚本可执行

假如有脚本文件 `app.js`，内容如下：

```sh
#!/usr/bin/env node
console.log('Hello, World!');
```

增加执行权限：

```sh
$ chmod u+x app.js
```

## 目录

1. [ab](./ab.md)
1. [如何查看目录大小？](./shell_disk-usage.md)
1. [如何使用 cal 查看日历？](./cal.md)
1. [如何使用 grep?](./grep.md)
1. [tail](./tail.md)
1. [awk](./awk.md)

## REF

1. [The Linux Command Line](http://www.linuxcommand.org/tlcl.php/), by *William Shotts*
1. [快乐的 Linux 命令行](http://billie66.github.io/TLCL/)，The Linux Command Line 中文版，by 好奇猫工作室
