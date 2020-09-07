# onerror

The `onerror` property of the GlobalEventHandlers mixin is an EventHandler that process error events.

Error events are fired at various targets for different kinds of errors:

- When a **JavaScript runtime error** occurs, an `error` event using interface `ErrorEvent` is fired at window and `window.onerror()` is invoked.
- When a resouce **fails to load**, an `error` event using interface `Event` is fired at the element that initiated the load, and the `onerror()` handler on the element is invoked. These error events do not bubble up to window.

## Syntax

For historical reasons, different arguments are passed to `window.onerror` and `element.onerror` handlers.

### window.onerror

```js
window.onerror = function(message: string, source: string, lineno: number, colno: number, error: Error) { ... };
```

When the function returns `true`, this prevents the firing of the default event handler.

### window.addEventListener('error')

```js
window.addEventListener('error', function(event: ErrorEvent) { ... })
```

`event` of type `ErrorEvent` contains all the information about the event and the error.

The `ErrorEvent` interface represents events providing information related to errors in scripts or in files. It has the following properties:

```
message: string,
filename: string,
lineno: number,
colno: number,
error: object,
```

### element.onerror

```js
element.onerror = function(event: Event) { ... }
```

A good example for this is when you are using an image tag, and need to specify a backup image in case the one you need is not available on the server for any reason.

```html
<img src="imagenotfound.gif" onerror="this.onerror=null;this.src='imagefound.gif';" />
```

## Notes

When an error occurs in a script, loaded from a different domain, the details of the error are not reported to prevent leaking information. Instead the error reported is simply "Script error.".

This behavior can be overriden in some browsers using the `crossorigin` attribute on `<script>` and having the server send the appropriate CORS HTTP response headers.

## REF

1. [GlobalEventHandlers.onerror](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onerror)
1. [ErrorEvent](https://developer.mozilla.org/en-US/docs/Web/API/ErrorEvent)
