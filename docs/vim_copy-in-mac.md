# macOS 下复制 vim 的内容到系统剪切板

```sh
# 把全文发给剪切板
:w !pbcopy 

# 把当前行发给剪贴板
:.w !pbcoy

# 把选中行发给剪贴板
:!tee >(pbcopy)
```

## REF

1. [os X 下 vim 无法复制到系统剪切板的问题][1], 2014/01/09, asked by *guoqiao*

[1]: https://www.v2ex.com/t/96300
