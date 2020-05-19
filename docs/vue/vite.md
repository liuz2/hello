# Vite

> 以下内容来自 [vuejs/vite][1]，2020/05/19

## Vite 是什么

Vite 是法语单词，意为“快”。发音为 `/vit/`。

> An opinionated web dev build tool. It's fast.

Vite 开发阶段使用原生的 ES 模块，打包阶段使用 Rollup。按需编译，速度飞快⚡️。

Vite 目前仍处于实验阶段，但 Vuejs 团队打算使其适合生产。

## 起步

```sh
$ npx create-vite-app <project-name>
$ cd <project-name>
$ npm install
$ npm run dev
```

## 特性

### 裸模块解析

原生的 ES 模块不支持**裸模块解析**（Bare Module Resolving），比如：

```js
import { createApp } from 'vue';
```

以上写法默认会抛出异常。Vite 会检测所有 .js 文件的裸模块导入语句，并将其改写为特殊路径，比如 `/@modules/vue`。在这些特殊路径下，Vite 会进行模块解析，从安装依赖中获取正确的文件路径。

注意，`vue` 会被特殊处理。如果本地依赖没有安装 vue，则会回退到 Vite 自身的依赖。

### 模块热更新

`.vue` 单组件文件自动热更新，并为 `.js` 提供了简单的 HMR API 接口。

### TypeScript

支持 TypeScript，使用 `<script lang="ts">` 导入即可。

Vite 只进行转译，不做类型类型校验。类型校验应当是 IDE 的分内事。

Vite 使用 [esbuild](https://github.com/evanw/esbuild) 转译，相对于 tsc，速度要快 20～30 倍。

### CSS / JSON 导入

可以从 js 中直接导入 `.css` 和 `.json` 文件。

### 资源 URL 处理

可以在 `*.vue` 模板、样式和 `.css` 文件中引用资源，资源路径可以是绝对地址或相对地址。

所有被引用的资源，打包时都会被拷贝到 dist 目录，但不会拷贝未引用资源。

`public` 目录是个例外。其中的资源无论是否使用，都将按原样拷贝至 dist 目录。它可以提供代码中未引用的资源，比如 `robots.txt`。

如果要将资源部署到另一个嵌套路径，使用 `--base=/your/public/path/` 指定即可。

### PostCSS

只需在根目录放置 `postcss.config.js`，并安装必要插件，Vite 会自动把 PostCSS 配置应用于 `*.vue` 文件的样式和导入的纯 `*.css` 文件。

### CSS Modules

注意，使用 CSS Modules 时无需配置 PostCSS，开箱即用。在 `*.vue` 组件中使用 `<style module>`，对于纯 `.css` 文件，需要将 CSS 模块文件命名为 `*.module.css`，以便从中导入命名哈希。

### CSS 预处理器

因为 Vite 仅针对现代浏览器，推荐使用原生的 CSS 变量，书写符合未来标准的纯 CSS。如果坚持使用 CSS 预处理器，可以安装对应的预处理器：

```sh
$ yarn add -D sass
```

```html
<style lang="scss">
    /* use scss */
</style>
```

注意：目前还不支持从 `.js` 中导入 CSS / 预处理器文件。

### 生产构建

使用 `vite build` 打包。

## 配置文件

可以在项目中创建 `vite.config.js` 或 `vite.config.ts`，Vite 会自动使用。也可以用 `vite --config my-config.js` 明确的指定配置文件。

## How and Why

与 `Vue-CLI` 或其他打包工具相比，Vite 开发阶段无需打包。因此无论模块总量多少，Vite 的冷启动速度、热更新速度都很快。

与 Vite 相似的项目还有 `es-dev-server` 和 `Snowpack`。

## 参考文献

1. [vuejs/vite][1]

[1]: https://github.com/vuejs/vite "vuejs/vite"