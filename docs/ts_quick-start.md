# 快速上手 TypeScript

安装

```sh
$ npm install -g typescript
```

编写第一个 TypeScript 文件 `greeter.ts`：

```ts
// 增加类型标注
function greeter(person: string) {
    return 'Hello, ' + person;
}

let user = 'Jane User';

document.body.textContent = greeter(user);
```

编译

```sh
$ tsc greeter.ts
```

编译结果是 `greeter.js`，内容与源码相差无几。

## 接口

使用关键词 `interface` 定义接口。

```ts
interface Person {
    firstName: string;
    lastName: string;
}

function greeter(person: Person) {
    return 'Hello, ' + person.firstName + ' ' + person.lastName;
}

let user = { firstName: 'Jane', lastName: 'User' };

document.body.textContent = greeter(user);
```

## 类

[To Be Continued](https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html#classes)

## REF

1. [TypeScript in 5 minutes](https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html)