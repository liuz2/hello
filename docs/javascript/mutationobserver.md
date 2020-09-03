# MutationObserver

`MutationObserver` 接口提供了监听 DOM 树改动的能力。它用来替换较早的 [Mutation Events](https://developer.mozilla.org/en-US/docs/DOM/Mutation_events) 事件。

`MutationObserver` 的[兼容性][1]截止到 2020-09-02 是 97.35%

## 构造函数

首先要使用 `MutationObserver` 构造函数创建实例：

```js
const observer = new MutationObserver(callback);
```

回调函数 `callback` 的参数有两个：

1. [`MutationRecord`][2] 数组，每个元素记录了改动的详情
1. 唤起 `callback` 的 `MutationObserver` 实例

`MutationRecord` 实例的属性有：

1. `type: string`，可选值有 `attributes`, `characterData`, `childList`
1. `target: Node`，受影响的改动节点
1. `addedNodes: NodeList`
1. `removedNodes: NodeList`
1. `previousSibling: Node`
1. `nextSibling: Node`
1. `attributeName: string`
1. `attributeNamespace: string`
1. `oldValue: string`

## TODO 实例方法

## 参考文档

1. [MutationObserver](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver), MDN
1. [MutationObserver.MutationObserver()](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver/MutationObserver), MDN
1. [Can I use MutationObserver?][1], caniuse.com
1. [MutationRecord][2]

[1]: https://caniuse.com/#search=MutationObserver "Can I use MutationObserver?"
[2]: https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord "MutationRecord"