# TypeScript 和 Babel 如何结合使用？

[TypeScript 的 Babel 插件][2]（`@babel/preset-typescript`）让 TypeScript 的使用变得前所未有的简便，这个插件来自 TypeScript 和 Babel 官方团队长达一年的合作。

## 用最新的 JS 语法，同时不失兼容性

Babel 可以把新语法转换为兼容性的旧语法。TypeScript 有类似的转译功能，将 `target` 设为 `ES5` 或 `ES6` 即可。但是 Babel 通过 [`babel-preset-env`][3]，对于转译做了更细致的设置，可以通过指定目标环境来选择转译的特性。

```json
{
    "targets": {
        "browsers": [
            "last 2 versions",
            "safari >= 7"
        ],
        "node": "6.10"
    }
}
```

Babel 使用 [compat-table][4] 决定在不同环境下，针对哪些特性进行转译。

[create-react-app][5] 的用法很有趣，在开发阶段使用最新的浏览器，提升速度；在生产环境使用更广泛的浏览器，保证兼容性。

**package.json**

```json
{
    "name": "react-scripts",
    "version": "1.1.0",
    "browserslist": {
        "development": [
            "last 2 chrome versions",
            "last 2 firefox versions",
            "last 2 edge versions"
        ],
        "production": [
            ">1%",
            "last 4 versions",
            "Firefox ESR",
            "not ie < 11"
        ]
    }
}
```

## Babel 可定制性强

[官方插件][6] 覆盖最新的语法。第三方插件也很多，可以参考 [awesome-babel][7] 列表。

注意，如果插件对语法进行了较大改动，会导致 TypeScript 无法编译。

## Babel Macros

[`babel-plugin-macros`][8] 无需在 Babel 配置文件中设置，而是作为依赖注入源码。比如：

```js
import idx from 'idx.macro';

const friends = idx(
    props,
    _ => _.user.friends[0].friends
);
```

所有的 Babel macros 与 TypeScript 兼容。还可以降低运行时依赖，减少客户端计算量。[这篇文章][9]有详细解释。

## 使用单一编译器会更简单

在 Babel 7 之前，需要串联两个独立编译器（TypeScript 和 Babel）,编译流程如下：

```
TS > TS Compiler > JS > Babel > JS (again)
```

配置脚本复杂晦涩。好在 Babel 7 之后，只使用 Babel 一个编译器就行了。

对于 Babel 的支持无处不在，可以检查 [Babel Setup][10] 页面。

## 编译速度更快

Babel 如何处理 TypeScript 代码？只是移除 TypeScript 代码，使其变为普通的 JavaScript 代码。

优点有二：

1. 编译速度超级快⚡️
1. 仅在特定时间报告类型错误

如何检测类型错误呢？可以使用 `npm run check-types` 脚本，可以修改 `npm test` 脚本，使其首先检测类型，然后运行单元测试。

## 如何使用 TypeScript 和 Babel?

将 js 代码重命名为 ts

```sh
$ find src -name "*.js" -exec sh -c `mv "$0" "${0%.js}.ts"` {} ;
```

在 Babel 中添加 TypeScript

```sh
$ npm install --save-dev @babel/preset-typescript @babel/plugin-proposal-class-properties @babel/plugin-proposal-object-rest-spread
```

设置 Babel（在 `.babelrc` 或 `babel.config.js` 中）

```json
{
    "preset": [
        "@babel/preset-typescript"
    ],
    "plugins": [
        "@babel/proposal-class-properties",
        "@bable/proposal-object-reset-spread"
    ]
}
```

Babel 默认寻找 `.js` 文件，可以通过以下两种方式之一修改：

1. 如果使用 Babel CLI，设置 `--extensions '.ts'`
1. 如果使用 Webpack，在 `resolve.extensions` 中增加 `ts`

增加 `check-types` 命令

```json
{
    "scripts": {
        "check-types": "tsc"
    }
}
```

其中的 `tsc` 需要安装依赖：`npm install --save-dev typescript`

配置 TypeScript 需要使用 `tsconfig.json`：

```json
{
    "compilerOptions": {
        "target": "esnext",
        "moduleResolution": "node",
        "allowJS": true,
        "noEmit": true,
        "strict": true,
        "isolatedModules": true,
        "esModuleInterop": true
    },
    "include": [
        "src"
    ]
}
```

🔚 配置结束！

[JavaScript 迁移手册][11]，指导开发者如何把一个现存的 JavaScript 代码库，迁移到 TypeScript 语言。微软的 [TypeScript-Babel-Starter][12] 包含更多的指导。

代码格式检测，使用 ESLint 就够了。

## REF

1. [TypeScript With Babel: A Beautiful Marriage][1], by *Matt Turnbull*, 2019/02/12
1. [TypeScript plugin for Babel][2]
1. [Migrating from JavaScript][11]
1. [TypeScript Babel Starter][12]

[1]: https://iamturns.com/typescript-babel/ "TypeScript With Babel: A Beautiful Marriage"
[2]: https://babeljs.io/docs/en/babel-preset-typescript.html "TypeScript Plugin for Babel"
[3]: https://babeljs.io/docs/en/babel-preset-env/ "babel-preset-env"
[4]: https://kangax.github.io/compat-table/ "compat-table"
[5]: https://github.com/facebook/create-react-app/blob/96ba7bddc1600d6f5dac9da2418ee69793c22eca/packages/react-scripts/package.json#L82-L94 "create-react-app"
[6]: https://babeljs.io/docs/en/plugins "official plugins"
[7]: https://github.com/babel/awesome-babel "awesome-babel"
[8]: https://github.com/kentcdodds/babel-plugin-macros "babel-plugin-macros"
[9]: https://babeljs.io/blog/2017/09/11/zero-config-with-babel-macros "Zero Config With Babel Macros"
[10]: https://babeljs.io/en/setup "Babel Setup"
[11]: https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html "Migrating from JavaScript"
[12]: https://github.com/Microsoft/TypeScript-Babel-Starter "TypeScript Babel Starter"