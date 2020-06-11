# 快速上手

[Angular入门：你的第一个应用][1]通过在 stackblitz 的在线项目讲解 Angular 的基础概念。

## 模板语法

使用 `*ngFor` 指令，实现列表渲染：

```html
<div *ngFor="let product of products"></div>
```

`*ngFor` 是一个**结构型指令**，结构型指令可以修改 DOM 结构。结构型指令以 `*` 前缀为标志。

使用 `{{}}` 插值语法在模板中插入内容，把属性值渲染为文本。

```html
<div *ngFor="let product of products">
    <h3>
        {{ product.name }}
    </h3>
</div>
```

使用 `[]` 属性绑定语法，在模板表达式中使用属性值：

```html
<a [title]="product.name + ' details'">
    {{ product.name }}
</a>
```

条件指令 `*ngIf` 会根据属性是否存在，显示隐藏 DOM 元素：

```html
<p *ngIf="product.description">
    Description: {{ product.description }}
</p>
```

事件绑定通过把事件名称包裹在圆括号 `()` 中完成：

```html
<button (click)="share()">
    Share
</button>
```

如果想掌握所有的模板语法，需要[浏览模板语法指南](https://angular.cn/guide/template-syntax)。

## 组件

组件包含三部分：

1. 一个组件类，处理数据和功能。
1. 一个 HTML 模板，决定 UI。
1. 组件专属的样式，定义外观和感觉。

> 酷似 Flash 库元件的组织方式。

要了解组件及其模板交互的详情，可以浏览[组件简介](https://angular.cn/guide/architecture-components)。

## 输入

使用 Augular Generator 生成的 .ts 文件内容如下：

```ts
import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-product-alerts',
    templateUrl: './product-alerts.component.html',
    styleUrls: ['./product-alerts.component.css']
})
export class ProductAlertsComponent implements OnInit {
    constructor() {}

    ngOnInit() {}
}
```

`@Component()` 装饰器表明它下面的类是一个组件。它提供了有关该组件的元数据，包括它的选择器、模板和样式。

`selector` 用于标识组件，是组件在模板中出现的标签名。按照惯例，组件选择器以 `app-` 开头，后跟组件名称。

`@Input()` 装饰器表示该属性是从该组件的父组件中传入的：

```ts
import { Input } from '@angular/core';

export class ProductAlertsComponent implements OnInit {
    @Input() product;
    constructor() {}

    ngOnInit() {}
}
```

使用该组件时，只需将组件名称放入即可：

```html
<app-product-alerts
    [product]="product">
</app-product-alerts>
```

浏览[组件交互](https://angular.cn/guide/component-interaction)，查询更多父子组件交互的细节。

## 输出

使用 `@Output()` 装饰器和事件发射器 `EventEmitter()` 定义一个属性，可以在属性变化时发出事件。

```ts
import { Output, EventEmitter } from '@angular/core';

export class ProductAlertsComponent {
    @Input() product;
    @Output() notify = new EventEmitter();
}
```

```html
<button (click)="notify.emit()">Notify Me</button>
```

接着在父组件中定义监听方法：

```ts
export class ProductListComponent {
    onNotify() {
        // do some awesome action
    }
}
```

```html
<app-product-alerts
    [product]="product"
    (notify)="onNotify()">
</app-product-alerts>
```

## 参考资料

1. [Angular 入门：你的第一个应用][1]

[1]: https://angular.cn/start
