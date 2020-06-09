# 打包 Vue 组件

打包时需要移除对 Vue 的依赖，具体如下设置：

```js
{
    externals: {
        vue: {
            root: 'Vue',
            commonjs: 'vue',
            commonjs2: 'vue',
            amd: 'vue',
        }
    }
}
```

## 参考文档

1. [打包 Vue 组件库的正确姿势](https://jingsam.github.io/2016/11/18/bundle-vue-components.html)，作者彭金金，2016/11/18