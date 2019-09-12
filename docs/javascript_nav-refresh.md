# 页面回退强制刷新

```js
window.addEventListener('pageshow', (e) => {
    if (e.persisted) {
        location.reload();
    }
});
```

## REF

1. [Window:pageshow event](https://developer.mozilla.org/en-US/docs/Web/API/Window/pageshow_event) - MDN