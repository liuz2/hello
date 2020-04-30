# 使用微信小程序订阅消息

## 开发步骤

### 提前准备

- appId: `YOUR_APP_ID`
- secret: `YOUR_APP_SECRET`
- 订阅消息模板ID：`YOUR_TEMPLATE_ID`

以及模板消息的详细内容，比如：

```
签到类型 {{thing1.DATA}}
签到奖励 {{thing2.DATA}}
累计次数 {{number3.DATA}}
备注 {{thing10.DATA}}
```

### 触发用户订阅

使用 [`wx.requestSubscribeMessage(params)`][1]：

```js
wx.requestSubscribeMessage({
    tmplIds: [''],
    success(res) {},
    fail(res) {}
})
```

### 下发订阅消息

使用 [`subscribeMessage.send()`][2]：

```js
const cloud = require('wx-server-sdk');
cloud.init();
exports.main = async (event, context) => {
    try {
        const result = await cloud.openapi.subscribeMessage.send({
            touser: 'OPENID',
            page: 'index',
            lang: 'zh_CN',
            data: {
                number01: {
                    value: xxx
                }
            },
            templateId: 'TEMPLATE_ID',
            miniprogramState: 'developer'
        });
        
        return result;
    } catch (err) {
        return err;
    }
}
```


## 参考文档

1. [小程序订阅消息开发指南](https://developers.weixin.qq.com/community/develop/article/doc/00026407d58cf07bb96941b0e5b813)，作者 Jianbo，2019-11-07

[1]: https://developers.weixin.qq.com/miniprogram/dev/api/open-api/subscribe-message/wx.requestSubscribeMessage.html
[2]: https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/subscribe-message/subscribeMessage.send.html#method-cloud "subscribeMessage.send"