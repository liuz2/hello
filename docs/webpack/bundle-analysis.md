# 查看打包的分析

使用 [webpack-bundle-analyzer][1] 能够可视化的查看包的组成元素。

首先安装依赖

```sh
$ npm install --save-dev webpack-bundle-analyzer
```

然后，修改构建配置：

```js
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

module.exports = {
    plugins: [
        new BundleAnalyzerPlugin()
    ]
}
```

更多分析工具可以查看 [SurviveJS - Webpack][2] 的相关章节。

[1]: https://www.npmjs.com/package/webpack-bundle-analyzer "webpack-bundle-analyzer"
[2]: https://survivejs.com/webpack/optimizing/build-analysis/