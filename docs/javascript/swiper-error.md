# Vue.js 中引入 swiper 报错处理方法

如果在 vue.js 中引入 `vue-awesome-swiper@4.1.1` 报错，比如 uglify 不识别的 token，或者 Dom7 不识别的字符。都是因为 uglify 不识别 ES6 语法导致的。

其实 swiper 提供了两个版本，分别用于 ES6（默认）和 ES5- 开发。当出现上述错误时，只需使用 swiper 的 ES5- 版本即可。

可以修改 webpack.config.js 配置：

```js
{
    alias: {
        "swiper$": "swiper/js/swiper.min.js"
    }
}
```

如果不方便更改全局配置，可以修改本地的配置文件：

```js
const config = baseConfig();
config.resolve.alias["swiper$"] = "swiper/js/swiper.min.js";

module.exports = config;
```

## REF

1. [vue build err (Dom7)](https://github.com/surmon-china/vue-awesome-swiper/issues/206)