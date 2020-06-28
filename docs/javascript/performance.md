# Performance

Performance 接口提供了当前页面性能相关的信息。它是 High Resolution Time API 的一部分，但是被 [Performance Timeline API][1]，[Navigation Timing API][2]，[User Timing API][3] 和 [Resource Timing API][4] 增强。

通过访问 `window.performance` 只读属性可以获取该对象。

```js
window.performance

// => Performance { memory, navigation, onresourcetimingbufferfull, timeOrigin, timing }
```

## 属性

以下属性均不推荐使用。

`Performance.navigation`，只读属性，不推荐使用。这是一个遗留的 [PerformanceNavigation][5] 对象，提供了 timing 列出的操作相关的上下文信息，包括文件是加载还是刷新，发生了多少次重定向等。在 Workers 中不存在该属性。

```js
window.performance.navigation

// => PerformanceNavigation { type: 1, redirectCount: 0 }
```

`Performance.timing`，只读属性，不推荐使用。这也是一个遗留类型 [PerformanceTiming][7]，包含等待时间相关的信息。Workes 中不存在该属性。

```js
window.performance.timing
```

输出内容较多，如下所示：

```js
PerformanceTiming {
    navigationStart: 1593309456676
    fetchStart: 1593309456679
    unloadEventStart: 1593309456860
    unloadEventEnd: 1593309456861
    redirectEnd: 0
    redirectStart: 0
    domainLookupStart: 1593309456700
    domainLookupEnd: 1593309456700
    connectStart: 1593309456700
    connectEnd: 1593309456722
    secureConnectionStart: 1593309456708
    requestStart: 1593309456724
    responseStart: 1593309456852
    responseEnd: 1593309457985
    domLoading: 1593309456863
    domInteractive: 1593309458429
    domContentLoadedEventStart: 1593309458435
    domContentLoadedEventEnd: 1593309458438
    domComplete: 1593309459077
    loadEventStart: 1593309459077
    loadEventEnd: 1593309459118
}
```

每个字段表示的具体含义，可以查看[这里][7]。

`Performance.memory`，Chrome 新增的非标准扩展，提供了内存相关的基本信息，不推荐使用这个非标准 API。

```js
window.performance.memory

// => MemoryInfo {
//    jsHeapSizeLimit: 2172649472
//    totalJSHeapSize: 16402638
//    usedJSHeapSize: 15740170
//  }
```

`Performance.timeOrigin` 返回性能测量开始时间的高精度时间戳。

```js
window.performance.timeOrigin
// => 1593309456676.077
```

## 方法

- `clearMarks()` 在浏览器的 performance entry buffer 中清除特定的 mark
- `clearMeasures()` 在浏览器的 performance entry buffer 中清除特定的 measure
- `clearResourceTimings()` 从浏览器的 performance data buffer 中移除所有 `entryType` 为 "resource" 的 performance entries
- `getEntries()` 根据给定的 filter 返回一个 PerformanceEntry 列表

## 参考资料

1. [Performance - Web APIs](https://developer.mozilla.org/en-US/docs/Web/API/Performance), MDN
1. [A Primer for Web Performance Timing APIs][6], by *Xiaoqian Wu*

[1]: https://developer.mozilla.org/en-US/docs/Web/API/Performance_Timeline "Performance Timeline API"
[2]: https://developer.mozilla.org/en-US/docs/Web/API/Navigation_timing_API "Navigation Timing API"
[3]: https://developer.mozilla.org/en-US/docs/Web/API/User_Timing_API "User Timing API"
[4]: https://developer.mozilla.org/en-US/docs/Web/API/Resource_Timing_API "Resource Timing API"
[5]: https://developer.mozilla.org/en-US/docs/Web/API/PerformanceNavigation "PerformanceNavigation - Web APIs"
[6]: https://siusin.github.io/perf-timing-primer/ "A Primer for Web Performance Timing APIs"
[7]: https://developer.mozilla.org/en-US/docs/Web/API/PerformanceTiming "PerformanceTiming - Web APIs"