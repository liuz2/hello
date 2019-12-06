# Show Detailed Message Error From Other Domains

"Script error" is what browsers send to the onerror callback when an error originates from a JavaScript file served from a different origin.

## Demo

```html
<!doctype html>
<html>
<head>
  <title>example.com/test</title>
</head>
<body>
  <script src="http://another-domain.com/app.js"></script>
  <script>
  window.onerror = function (message, url, line, column, error) {
    console.log(message, url, line, column, error);
  }
  foo(); // call function declared in app.js
  </script>
</body>
</html>
```

Here's the contents of http://another-domain.com/app.js:

```js
// another-domain.com/app.js
function foo() {
  bar(); // ReferenceError: bar is not a function
}
```

## Solution

Add `crossorigin="anonymous"`, the "anonymous" keyword means that there will be no exchange of **user credentials** via cookies.

```html
<script src="http://another-domain.com/app.js" crossorigin="anonymous"></script>
```

Add Cross Origin HTTP Header

```
Access-Control-Allow-Origin: http://www.example.com, http://www.another-domain.com
```

If you use [`html-webpack-plugin`][4] to inject the assets into the template, you can use the [`webpack-subresource-integrity`][3] to automatically set `crossorigin` attribute.

## REF

1. [Script Error - sentry.io][1], by *Ben Vinegar*
1. [HTML attribute: crossorigin][2] - MDN

[1]: https://sentry.io/answers/javascript-script-error/ "Script Error"
[2]: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin "HTML attribute: crossorigin"
[3]: https://www.npmjs.com/package/webpack-subresource-integrity "webpack-subresource-integrity - npm"
[4]: https://github.com/jantimon/html-webpack-plugin#options "html-webpack-plugin"
