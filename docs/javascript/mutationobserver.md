# MutationObserver

`MutationObserver` 接口提供了监听 DOM 树改动的能力。它用来替换较早的 [Mutation Events](https://developer.mozilla.org/en-US/docs/DOM/Mutation_events) 事件。*Paul Kinlan* 在[文章][4]中表示，Mutation Events 由于性能不佳而被淘汰。

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

`callback` 实例如下：

```js
function callback(mutationList, observer) {
    mutationList.forEach((mutation) => {
        switch(mutation.type) {
            case 'childList':
            // one or more children have been added to and/or removed from the tree
            break;

            case 'attributes':
            // attribute value changed on the element
            break;
        }
    })
}
```

## 创建并开启监视

`MutationObserver` 的方法 `observe()` 可以开启监视。

```js
const targetNode = document.querySelector('#someElement');
const observerOptions = {
    childList: true,
    attributes: true,
    subtree: true,
}

const observer = new MutationObserver(callback);
observer.observe(targetNode, observerOptions);
```

如果想停止监视，可以使用 `disconnect()` 函数。

## 应用实例

[Vue.nextTick][6] 用到了 MutationObserver.

## 参考文档

1. [MutationObserver](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver), MDN
1. [MutationObserver.MutationObserver()](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver/MutationObserver), MDN
1. [Can I use MutationObserver?][1], caniuse.com
1. [MutationRecord][2]
1. [MutationObserver.observe()][3]
1. [Detect DOM changes with Mutation Observers][4], by *Paul Kinlan*, 2012/02
1. [DOM MutationObserver - reacting to DOM changes without killing browser performance][5], by *Jeff Griffiths*, 2012/05/10, hacks.mozilla.org
1. [Vue.nextTick 的源码实现][6], by *chenjsh36*

[1]: https://caniuse.com/#search=MutationObserver "Can I use MutationObserver?"
[2]: https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord "MutationRecord"
[3]: https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver/observe "MutationObserver.observe()"
[4]: https://developers.google.cn/web/updates/2012/02/Detect-DOM-changes-with-Mutation-Observers "Detect DOM changes with Mutation Observers"
[5]: https://hacks.mozilla.org/2012/05/dom-mutationobserver-reacting-to-dom-changes-without-killing-browser-performance/ "DOM MutationObserver - reacting to DOM changes without killing browser performance"
[6]: https://github.com/chenjsh36/NotesOfVue/blob/master/Vue_8.md "nextTick 的源码实现"
