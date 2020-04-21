# 覆盖预置的 rules

修改 `.eslintrc.js` 文件中的 `rules` 字段

```diff
module.exports = {
    rules: {
+        indent: [
+            'error',
+            4,
+        ],
    }
}
```