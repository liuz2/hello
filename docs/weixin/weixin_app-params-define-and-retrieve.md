# 微信小程序的参数定义及其获取方式

## [用户登录凭证 code](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/login/wx.login.html)

> 用户登录凭证（有效期五分钟）。开发者需要在开发者服务器后台调用 `auth.code2Session`，使用 code 换取 openid 和 session_key 等信息。

```js
wx.login({
    successs(res) {
        console.log(res.code);
    },
})
```

## [会话密钥 session_key](https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/login/auth.code2Session.html)

请求地址

```
GET https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code
```

返回值

```json
{
    "openid": "用户唯一标识",
    "session_key": "会话密钥",
    "union_id": "用户在开放平台的唯一标识符，在满足 UnionID 下发条件的情况下会返回",
    "errcode": "",
    "errmsg": ""
}
```

## [数据签名校验](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/signature.html)

签名算法的伪代码

```
signature = sha1(rawData + session_key)
```

## [加密数据解密算法](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/signature.html)

接口如果涉及敏感数据（如 wx.getUserInfo 当中的 openId 和 unionId），接口的明文内容将不包含这些敏感数据。开发者如需要获取敏感数据，需要对接口返回的加密数据(encryptedData) 进行对称解密。 解密算法如下：

1. 对称解密使用的算法为 `AES-128-CBC`，数据采用 `PKCS#7` 填充。
1. 对称解密的目标密文为 `Base64_Decode(encryptedData)`。
1. 对称解密秘钥 `aeskey = Base64_Decode(session_key)`, aeskey 是 16 字节。
1. 对称解密算法初始向量为 `Base64_Decode(iv)`，其中 iv 由数据接口返回。

## REF

1. [小程序登录时序图](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/login.html)
1. [开放数据校验与解密](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/signature.html)