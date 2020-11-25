# cURL

> cURL is a computer software project providing a library and command-line tool for transferring data using various network protocols. The name stands for "Client URL", which was first released in 1997.

[cURL][1] 是一个计算机软件项目，提供的命令行工具可以使用各种网络协议传输数据。cURL 代表“客户端URL”，1997 年首次发布。它的源码位于 [github][3]。

cURL 的主要作者是 *Daniel Stenberg*，他编写了《[Everything curl][2]》- 一本详尽且免费的开源书。在线阅读地址：[点击阅读][4]。

以下是常见的一些任务：

## 下载文件

保留远程文件名

```sh
$ curl -O http://example.com/a.jpg
```

如果远程响应是重定向，则需要增加 `-L` 选项：

```sh
$ curl -O -L http://example.com/redirect.jpg
```

如果要实现**断点续传**，可以使用 `-C` 选项：

```sh
$ curl -C - -O http://example.com/continue.jpg
```

`-f, --fail`: (HTTP) Fail silently (no output at all) on server errors. This is mostly done to better enable scripts etc to better deal with failed attempts.

`-o, --output <file>`: Write output to `<file>` instead of stdout. If you are using `{}` or `[]` to fetch multiple documents, you can use `#` followed by a number in the `<file>` specifier. That variable will be replaced with the current string for the URL being fetched. Like in:

```
curl http://{one,two}.example.com -o "file_#1.txt"
```

or use several like:

```
curl http://{site,host}.host[1-5].com -o "#1_#2"
```

`--create-dirs`: When used in conjunction with the `-o, --output` option, curl will create the necessary local directory hierarchy as needed. This option creates the dirs mentioned with the `-o, --output` option, nothing else.

[1]: https://curl.haxx.se/
[2]: https://curl.haxx.se/book.html
[3]: https://github.com/curl/curl
[4]: https://ec.haxx.se/
