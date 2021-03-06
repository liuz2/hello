# Design Mistakes in Node

这是 *[Ryan Dahl][7]* 在 JS Conf Berlin 2018 上做的演讲 PPT 的笔记重点。

## 背景

- Ryan 创建了 Node.js，并负责初期的管理。
- 他的关注点主要在于**事件驱动的 HTTP 服务器**。
- 在当时，这个关注点对服务器端的 JavaScript 的确很重要。
- 2012 年，Ryan 不再管理 Node.js。

后来 Ryan 重新使用了 Node.js，他的目标变了。动态语言适合科学计算（**scientific computing**），通常是快速的一次性计算。而 JavaScript 是最好的动态语言。

下面是 Ryan 从作者的角度，对 Node.js 进行反省，得出对一些设计错误。

## 遗憾：没有坚持使用 Promise

Ryan 曾在 2009 年 6 月在 Node 中增加了 Promise，但是在 2010 年 2 月移除了它。

Promise 是 `async/await` 的不可缺少的抽象。

Node 的统一使用 Promise 有可能会加速最终的标准化落地和 `async/await`。

由于上述原因，如今 Node.js 的很多异步 API 已过气。

## 遗憾：安全

V8 本身是一个很棒的安全沙箱。

如果当初考虑周详，Node 的安全性可能比其他语言都要好上许多。

比如：你的代码风格检测器不应该获得电脑和网络的完整权限。

## 遗憾：构建系统（GYP）

构建系统很难，同时也很重要。

V8 (via Chrome) 开始使用 [GYP][2]，Ryan 也跟着把 Node 切换上去。

后来，Chrome 放弃 GYP，转而使用 GN。此时 Node 变为 GYP 的孤独唯一的用户。

GYP 也不是一个丑陋的内部接口 - 任何想要绑定 V8 的开发者，都可以使用它。

对用户来说，这是个糟糕的体验。它不是 JSON，而是 Python 改编过的 JSON。

持续使用 GYP 可能是 Node 核心最大的失败。

应该提供一个核心语言函数接口（FFI: core Foreign Function Interface），而不是引导用户编写面向 V8 的 C++ 绑定。

许多早期用户建议迁移到 FFI，遗憾的是 Ryan 忽略了这些建议。

Ryan 对于 libuv 采用 autotools 也十分失望。

## 遗憾：package.json

NPM 的 Isaac 发明了 package.json。

Ryan 批准了 package.json，允许 Node 的 `require()` 检查 package.json 的 `main` 字段。

最终，在 Node 发行版中包含了 NPM，把它变为事实的标准。

不幸的是，模块仓库是被私有化控制的集中化管理。

因此 `require("somemodule")` 十分不明确，该模块可以在太多地方定义，比如 `package.json`，本地 `node_modules` 目录，或 NPM 的数据库。

使用 package.json，导致了“模块”就是指一个文件夹下的文件，这一概念的流行。

这是一种非必要的抽象。

package.json 现在包含大量无关的信息，比如授权，仓库地址，描述等。这是一种样板噪声（**boilerplate noise**）。

如果只允许使用相对路径和 URL，路径本身就定义了版本。根本无需定义依赖。

## 遗憾：node_modules

漫画：node_modules 是全宇宙最重的物质，甚至比黑洞还要重。

它让模块解析算法的复杂度大大增加。

默认使用厂商（*vendored-by-default*）出发点是好的，但实际上仅仅使用 `$NODE_PATH` 无法组织这些。

同浏览器语义化相去甚远。

## 遗憾：require("module") 可以不带 .js 后缀

不必要的更加隐晦。

和浏览器的 JavaScript 工作机制不一致。在 script 标签的 src 属性中，不可以忽略 .js 后缀。

模块加载器需要在多个路径中查询文件系统，来猜测用户的意图。

## 遗憾：index.js

我以为这招很聪明，因为有 index.html...

这给模块加载系统增加了不必要的负担。

当导入了 package.json 时，这个机制更加没用。

---

我在 Node 上的设计错误，几乎完全集中在如何管理用户代码上。

和早期的事件驱动的 IO 系统不同，模块系统几乎算是一种马后炮。

下面介绍一种新的原型语言：[Deno][4]

一种基于 V8 的安全的 TypeScript 运行时。

## Deno 目标：安全

利用 JavaScript 是一种安全沙箱这一事实。

- 默认情况下，一段脚本运行时，不应访问任何网络请求或本机文件系统。
- 用户可以利用标志位开启权限：`--allow-net`, `--allow-write`。
- 这允许用户运行不可信的工具（比如 linter）。

不允许在 V8 上绑定任意的原生函数

- 所有的系统调用通过消息传递（protobuf 序列化）
- 仅有两个原生函数：`send` 和 `recv`
- 以上简化了设计，让系统更容易审计

> [protobuf][6] 是 Google 出品的一种语言无关的，平台无关的，可扩展的结构化数据序列化方案。

## Deno 目标：简化模块系统

- 不兼容现存的 Node 模块
- 导入路径只有相对路径和 URL 两种
- 导入模块必须提供扩展名
- 首次加载远程 URL 模块时，会下载并无限期缓存在本地。只有添加了 `--reload` 标志位后，才会再次下载该资源
- 通过指定非默认的缓存路径，可以使用厂商（`vendering`）

```js
import { test } from 'https://unpkg.com/deno_testing@0.0.5/testing.ts';
import { log } from './util.ts';
```

## 目标：可执行文件内置 TypeScript 编译器

- TS 非常优美
    - 它是一种可选的类型语言
    - 允许语言从快速开发无缝成长为结构严密的重型项目
- Deno 依赖 TS 编译器执行模块解析和递增式缓存
- 未编辑的 TS 文件不应重新编译
- 普通的 JS 文件应该也可以正常运行
- 可以使用 V8 快照快速启动

## Deno 目标：仅包含一个单独的可执行文件

## Deno 目标：使用 2018

- 使用 Parcel 把 Node 模块打包为一个 bundle。
- 原生代码存在很棒的基础设施

## Deno 目标：其他

- 遇到未捕获的 promise 报错，deno 应立即停止
- 支持顶层 await
- 当功能重复时，支持浏览器兼容

## 总结

以下是 Ryan Dahl 关于 Node.js 设计中的遗憾，以及 Deno 做的相应改进措施：

| Node.js | Deno |
| --- | --- |
| 未使用 Promise | 使用 Promise |
| 安全机制不完善 | 默认提供安全选项 |
| 构建系统（GYP） | TODO |
| package.json 让模块解析的算法复杂 | 无需 package.json |
| node_modules 过于复杂 | 使用全局的缓存路径 |
| 导入模块时无需指定 `.js` 后缀 | 必须指定后缀 |
| 默认入口文件 `index.js` | 无默认入口文件 |

## REF

1. [Design Mistakes in Node][1], by *Ryan Dahl*, 2018/06
1. [Protocol Buffers][6], Google Developers

[1]: https://tinyclouds.org/jsconf2018.pdf "Design Mistakes in Node"
[2]: https://gyp.gsrc.io/ "GYP - Generate Your Projects"
[3]: https://github.com/denoland/deno "deno"
[4]: https://deno.land/ "Deno, a secure runtime for JavaScript and TypeScript"
[5]: https://github.com/protocolbuffers/protobuf "Protocol Buffers"
[6]: https://developers.google.cn/protocol-buffers/ "Protocol Buffers"
[7]: https://gitee.com/liuz2/reading-list/blob/master/p/ryan-dahl.md "Ryan Dahl"