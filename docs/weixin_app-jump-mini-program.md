# 如何跳转到其他微信小程序？

实际使用时，需要将下文中的 `my-appid` 替换为真实的 appid。

## 设定基础库版本

将基础库版本设定为 2.4.0+

## 设置 app.json

> 当小程序需要使用 `wx.navigateToMiniProgram` 接口跳转到其他小程序时，需要先在配置文件中声明需要跳转的小程序 appId 列表，最多允许填写 10 个。

```json
{
    "navigateToMiniProgramAppIdList": [
        "my-appid",
    ],
}
```

## 跳转

如果使用 `<navigator>` 组件：

```xml
<navigator target="miniProgram"
    app-id="my-appid"
    path="/pages/index/index?foo=bar"
    version="release">
</navigator>
```

如果使用 API：

```js
wx.navigateToMiniProgram({
    appId: 'my-appid',
    path: '/pages/index/index?foo=bar',
    envVersion: 'release',
});
```

envVersion 的合法值

- develop 开发版	
- trial 体验版
- release 正式版

## REF

1. [全局配置](https://developers.weixin.qq.com/miniprogram/dev/reference/configuration/app.html)
1. [wx.navigateToMiniProgram](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/miniprogram-navigate/wx.navigateToMiniProgram.html)