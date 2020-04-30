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

test('adds 1 + 2 to equal 3', () => {
    expect(sum(1, 2)).toBe(3);
})
```

Add scripts in `package.json`

```json
{
    "scripts": {
        "test": "jest"
    }
}
```

Run `yarn test` or `npm run test`.

This test use `expect` and `toBe` to test that two values were exactly identical. They are called **Matchers**.

## Additional Configuration

`jest --init` will create a basic configuration file.

### Using Babel

To use Babel, install required dependencies:

```sh
$ yarn add --dev babel-jest @babel/core @babel/preset-env
```

Configure Babel by creating a `babel.config.js` file in the root of your project:

```js
module.exports = {
    presets: [
        [
            '@babel/preset-env',
            {
                targets: {
                    node: 'current'
                }
            }
        ]
    ]
}
```

The ideal configuration for Babel will depend on your project. See [Babel's docs][3] for more details.

## REF

1. [Getting Started with Jest][1]
1. [babel-jest][2]

[1]: https://jestjs.io/docs/en/getting-started.html "Getting Started with Jest"
[2]: https://github.com/facebook/jest/tree/master/packages/babel-jest "babel-jest"
[3]: https://babeljs.io/docs/en/ "Babel Documentation"
