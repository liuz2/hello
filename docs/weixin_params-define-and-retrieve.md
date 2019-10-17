# 微信的参数定义及其获取方法

## [普通 Access Token](https://developers.weixin.qq.com/doc/offiaccount/Basic_Information/Get_access_token.html)

> access_token 是公众号的全局唯一接口调用凭据，公众号调用各接口时都需使用 access_token。开发者需要进行妥善保存。access_token 的存储至少要保留 512 个字符空间。access_token 的有效期目前为 2 个小时，需定时刷新，重复获取将导致上次获取的 access_token 失效。

获取方法

```
GET https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET
```

返回值

```json
{ "access_token": "ACCESS_TOKEN", "expires_in": 7200 }
```

参数释义

- `grant_type` 获取 access_token 填写 `client_credential`
- `appid` 第三方用户唯一凭证
- `secret` 第三方用户唯一凭证密钥，即 `appsecret`

## [jsapi_ticket](https://developers.weixin.qq.com/doc/offiaccount/OA_Web_Apps/JS-SDK.html#62)

> jsapi_ticket 是公众号用于调用微信 JS 接口的临时票据。正常情况下，jsapi_ticket 的有效期为 7200 秒，通过 access_token 来获取。由于获取 jsapi_ticket 的 api 调用次数非常有限，频繁刷新 jsapi_ticket 会导致 api 调用受限，影响自身业务，开发者必须在自己的服务全局缓存 jsapi_ticket。

获取方式

```
GET https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi
```

返回值

```json
{
    "errcode": 0,
    "errmsg": "ok",
    "ticket": "bxLdikRXVbTPdHSM05e5u5sUoXNKd8-41ZO3MhKoyN5OfkWITDGgnr2fwJ0m9E8NYzWKVZvdVtaUgWvsdshFKA",
    "expires_in": 7200
}
```

## [JSSDK 签名算法](https://developers.weixin.qq.com/doc/offiaccount/OA_Web_Apps/JS-SDK.html#62)

用伪代码表示如下：

```js
string1 = 'jsapi_ticket=xxx&noncestr=xxx&timestamp=xxx&url=xxx'
signature = sha1(string1)
```

## [网页授权 access_token](https://developers.weixin.qq.com/doc/offiaccount/OA_Web_Apps/Wechat_webpage_authorization.html)

> 微信网页授权是通过 OAuth2.0 机制实现的，在用户授权给公众号后，公众号可以获取到一个网页授权特有的接口调用凭证（网页授权access_token），通过网页授权 access_token 可以进行授权后接口调用，如获取用户基本信息；

获取方式

**1. 首先引导让用户同意授权，获取 code**

```
https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect
```

scope 包括 `snsapi_base` 和 `snsapi_userinfo`。前者用于获取 openid，后者获取用户基本信息。

**2. 通过 code 换取网页授权 access_token**

```
GET https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
```

返回值

```json
{
    "access_token": "ACCESS_TOKEN",
    "expires_in": 7200,
    "refresh_token": "REFRESH_TOKEN",
    "openid": "OPENID",
    "scope": "SCOPE" 
}
```

**3. 刷新access_token（如果需要）**

```
GET https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN
```

返回值

```json
{ 
    "access_token": "ACCESS_TOKEN",
    "expires_in": 7200,
    "refresh_token": "REFRESH_TOKEN",
    "openid": "OPENID",
    "scope": "SCOPE" 
}
```

**4. 拉取用户信息(需 scope 为 snsapi_userinfo)**

```
GET https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
```

返回值

```json
{
    "openid": "OPENID", 
    "nickname": "NICKNAME",
    "sex": "1",
    "province": "PROVINCE",
    "city": "CITY",
    "country": "COUNTRY",
    "headimgurl": "http://thirdwx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46",
    "privilege": ["PRIVILEGE1", "PRIVILEGE2"],
    "unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
}
```

**检验授权凭证（access_token）是否有效**

```
GET https://api.weixin.qq.com/sns/auth?access_token=ACCESS_TOKEN&openid=OPENID
```

返回值

```json
{ "errcode": 0, "errmsg": "ok" }
```