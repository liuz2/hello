# 获取用户微信绑定的手机号

设置 button 组件

```xml
<button open-type="getPhoneNumber" bindgetphonenumber="onGetPhone"></button>
```

> 在 bindgetphonenumber 等返回加密信息的回调中调用 `wx.login` 登录，可能会刷新登录态。此时服务器使用 `code` 换取的 `sessionKey` 不是加密时使用的 `sessionKey`，导致解密失败。建议开发者提前进行 `login`；或者在回调中先使用 `checkSession` 进行登录态检查，避免 `login` 刷新登录态。

然后在组件的 js 中获取加密数据：

```js
Component({
    methods: {
        onGetPhone(e) {
            const {
                errMsg,
                encryptedData,
                iv,
            } = e.detail;

            if (errMsg === 'getPhoneNumber:ok') {
                this.sendToServer({ encryptedData, iv });
            }
        },

        sendToServer(params) {
            console.log('send params into your server to decipher');
        }
    },
})
```

## REF

1. [button 组件](https://developers.weixin.qq.com/miniprogram/dev/component/button.html)