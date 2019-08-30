# 特殊变量

下面是一个简单 Makefile 样例：

```makefile
lib/index.js: src/index.js
    mkdir -p $(dir $@)
    babel $< --out-file $@ --source-maps
```

```makefile
lib/%: src/%
    mkdir -p $(dir $@)
    babel $< --out-file $@ --source-maps
```

| 变量 | 含义 |
| --- | --- |
| `$<` | 前置文件列表，如上例中的 `src/index.js` |
| `$@` | 目标文件，如上例中的 `lib/index.js` |
| `%` | 同等替换的字符串 |
| `$$` | `$` 符号 |