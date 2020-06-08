# html2canvas 的 bug 记录

## 在微信中无法生成截图

环境参数：
- 操作系统版本：iOS 13.4.1 (17E262)
- 微信版本：v7.0.12
- html2canvas 版本：`^1.0.0-rc.5`

问题描述：调用 `html2canvas(el, options)` 后，在最新的微信中不执行 `.then()` 和 `.catch()` 的异步回调。但是在 macOS 上可以正常执行，在移动端的 safari 也可以正常执行。

最新的 html2canvas 版本在最新的微信中有问题，旧 html2canvas 的版本没问题。

解决办法：将 html2canvas 回退到 `^1.0.0-alpha.12` 版本即可。

以下是两个在线 demo：

1. [使用最新版本的 html2canvas](https://www.1zh.tech/test/html2canvas-demo/index.html)
1. [使用 v1.0.0-alpha.12 版本的 html2canvas](https://www.1zh.tech/test/html2canvas-demo/index.12.html)