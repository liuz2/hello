# 设置文本溢出

## 单行文本

```css
.ellipsis {
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
```

## 多行文本

```css
.ellipsis2 {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}
```
