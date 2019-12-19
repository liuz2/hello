# Getting Started

## Install

```sh
$ yarn add --dev jest
# or
$ npm install --save-dev jest
```

## Example

Create `sum.js`:

```js
function sum(a, b) {
    return a + b;
}

module.exports = sum;
```

Then, create `sum.test.js`:

```js
const sum = require('./sum');

test('adds 1 + 2 to equal 3', function() {
})
```

## REF

1. [Getting Started with Jest][1]

[1]: https://jestjs.io/docs/en/getting-started.html "Getting Started with Jest"
