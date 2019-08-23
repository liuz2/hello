# 动态绑定 class 和 style

## Object 类型

```html
<div v-bind:class="{ active: isActive }"></div>
```

```html
<div
    class="static"
    v-bind:class="{ active: isActive, 'text-danger': hasError }">
</div>
```

```html
<div v-bind:class="classObject"></div>
```

```js
{
    data: {
        classObject: {
            active: true,
            'text-danger': false,
        }
    }
}
```

```html
<div v-bind:class="classObject"></div>
```

```js
{
    data: {
        isActive: true,
        error: null,
    },
    computed: {
        classObject: function() {
            return {
                active: this.isActive && !this.error,
                'text-danger': this.error && this.error.type === 'fatal',
            },
        },
    }
}
```

## 数组类型

```html
<div v-bind:class="[activeClass, errorClass]"></div>
```

```js
{
    data: {
        activeClass: 'active',
        errorClass: 'text-danger',
    }
}
```

可以使用三元运算符实现条件判断：

```html
<div v-bind:class="[isActive ? activeClass : '', errorClass]"></div>
```

可以混合使用对象格式和数组格式：

```html
<div v-bind:class="[{ active: isActive }, errorClass]"></div>
```

## 绑定内联样式

```html
<div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>
```

```js
{
    data: {
        activeColor: 'red',
        fontSize: 30,
    }
}
```

建议使用对象类型：

```html
<div v-bind:style="styleObject"></div>
```

```js
{
    data: {
        styleObject: {
            color: 'red',
            fontSize: '13px',
        }
    }
}
```

还可以使用对象数组：

```html
<div v-bind:style="[baseStyles, overridingStyles]"></div>
```

## REF

1. [Class and Style Bindings](https://vuejs.org/v2/guide/class-and-style.html) - vuejs.org