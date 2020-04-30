# Testing Asynchronous Code

## Callbacks

Instead of putting the test in a function with an empty argument, use a single argument called `done`. Jest will wait until the `done` callback is called before finishing the test.

```js
test('the data is peanut butter', done => {
    function callback(data) {
        expect(data).toBe('peanut butter');
        done();
    }

    fetchData(callback);
})
```

If `done()` is never called, the test will fail.

## Promises

```js
test('the data is peanut butter', () => {
    return fetchData().then(data => {
        expect(data).toBe('peanut butter');
    });
});
```

Be sure to return the promise - if you omit this return statement, your test will complete before the promise returned from fetchData resolves and then() has a chance to execute the callback.

TODO

## REF

1. [Testing Asynchronous Code][1]

[1]: https://jestjs.io/docs/en/asynchronous "Testing Asynchronous Code"
