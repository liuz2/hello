# 如何让输出不换行？

可以使用 `process.stdout.write()` 命令：

```js
process.stdout.write('hello')
process.stdout.write(' world')
process.stdout.write('\n')
```

输出为单行的 `hello world`