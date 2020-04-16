# GitHub 高级用法

## 模糊文件查找

在任何仓库按 <kbd>t</kbd> 将会触发模糊文件查找。

> 在 Gitlab 仓库也有效。

## 轻松浏览文件和目录

安装 [Octotree](https://github.com/ovity/octotree) 浏览器插件。

## Markdown 必备格式提示

1. 使用 `<kbd>` 可以让文字像按钮一般显示。
1. 高亮显示 RGB 颜色值，可以自带颜色后缀。`#aabbcc`
1. 使用 `diff` 显示文件更新操作
1. 使用 `<details><summary>tips</summary>...</details>` 可以隐藏详细内容
1. 居中显示图像和文字：`<div align="center">...</div>`
1. 更小的文字：`<sup>` 或 `<sub>`

## 查看提交数据

使用 `git shortlog -sn` 查看 commit 数量排行榜

使用 `git shortlog -sn --no-merges` 排除合并提交。

## 参考文献

1. [GitHub Protips: Tips, tricks, hacks, and secrets from Lee Reilly](https://github.blog/2020-04-09-github-protips-tips-tricks-hacks-and-secrets-from-lee-reilly/)