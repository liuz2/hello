# 理解 Cookie

2020年3月24日，Webkit 博客宣布，Safari 将全面禁止第三方 Cookie。那么，Cookie 到底是什么呢？它是怎么泄漏隐私的呢？

MDN 上对 Cookie 的介绍是：

> An HTTP cookie (web cookie, browser cookie) is a small piece of data that a server sends to the user's web browser. The browser may store it and send it back with the next request to the same server. Typically, it's used to tell if two requests came from the same browser — keeping a user logged-in, for example. It remembers stateful information for the stateless HTTP protocol.

简单的说，Cookie 是服务端向客户端写入的一小段数据，用于在多次请求之间保存状态。

Cookie 的用途主要有三个：

1. 会话管理。比如登录、购物车、游戏分数等服务器需要记录的数据。
2. 个性化。用户偏好、主题和其他设置。
3. 追踪。分析用户行为。

以前 Cookie 是客户端唯一的通用存储方案。但 Cookie 每次请求都会发送到服务端，它会恶化网络性能，尤其对于移动端。目前的客户端存储通常选择 Web Storage API（`localStorage` 和 `sessionStorage`） 和 IndexedDB。

## 创建 Cookies

当服务端的响应头携带 `Set-Cookie` 时，浏览器就会将该 Cookie 内容写入本地，并在随后的请求头中增加 `Cookie` 字段，将写入的数据发送回同一服务端地址。可以设定过期时间，Cookie 过期后，将不向服务端发送。另外，还可以设定域名和路径，限制 Cookie 发送的目标范围。

### Set-Cookie 和 Cookie 信息头

`Set-Cookie` 响应头，从服务端向客户端发送 Cookie。格式如下：

```http
Set-Cookie: <cookie-name>=<cookie-value>
```

以下是简单的例子：

```http
HTTP/2.0 200 OK
Content-Type: text/html
Set-Cookie: name=tony_stark
Set-Cookie: age=42

[Page Content]
```

在后续的请求中，都会携带这些 Cookies

```http
GET /sample_page.html HTTP/2.0
Host: www.example.org
Cookie: name=tony_stark; age=42
```

### 会话 Cookies

上面产生的 Cookies 称为**会话 Cookies**（Session Cookies），因为没有指定 `Expires` 或 `Max-Age` 指令，关闭浏览器会自动清除这些 Cookies。

### 永久性 Cookies

永久性 Cookies 通过设置过期时间（`Expires`）和失效时长（`Max-Age`），即使关闭浏览器，Cookies 也不会丢失。

```http
Set-Cookie: id=a3fWa; Expires=Wed, 21 Oct 2015 07:28:00 GMT;
```

### Secure 和 HttpOnly Cookies

secure cookie 仅在 https 请求时发送。即使这样，敏感信息也不应存储在 cookie 中。Chrome 52 和 Firefox 52 之后，不安全的域名（`http:`）不能设定 secure 指令。

为了减轻跨站攻击（XSS），HttpOnly cookies 无法通过 JavaScript 的 `Document.cookie` 获取。比如，保存服务端会话的 cookies 无需 JavaScript 处理，因此可以设定 `HttpOnly` 标识符。

```http
Set-Cookie: id=a3fWa; Expires=Wed, 21 Oct 2015 07:28:00 GMT; Secure; HttpOnly
```

### Cookie 的范围

`Domain` 和 `Path` 指令可以设定 cookies 的范围：cookies 可以向哪些 URL 发送。

`Domain` 设置了可以接收 Cookies 的域名。如果未指定，则默认为当前文档的主机地址，不包含子域名。如果指定了 `Domain`，则包含子域名。

比如，如果设定了 `Domain=mozilla.org`，cookies 也会发送到子域名 `developer.mozilla.org`。

`Path` 指定了发送 `Cookie` 所必须包含的 URL 路径。`%2F`(`/`) 是路径分隔符，子路径也包含在内。

比如，如果设定了 `Path=/docs`，以下路径将被匹配：

1. `/docs`
2. `/docs/Web/`
3. `/docs/Web/HTTP`

### SameSite Cookies

`SameSite` cookies 允许服务器指定一个 cookie 不出现在跨域请求中。它能针对跨站点请求伪造攻击（cross-site request forgery attacks，CSRF）提供一定程度的防护。

`SameSite` cookies 相对较新，各大主要流浏览器均已支持。

下面是一个例子：

```http
Set-Cookie: key=value; SameSite=Strict
```

`SameSite` 可以包含以下三个属性值：

| 属性值      | 含义                                                         |
| ----------- | ------------------------------------------------------------ |
| None        | 浏览器将在跨站请求和同源请求中携带 cookie                    |
| Strict      | 浏览器仅在同站请求中发送 cookie。                            |
| Lax（松懈） | 同一站点的 cookie 在跨站子请求中会被拒绝，比如加载图像或者框架。但是在用户跳转到其他站点时发送 |

当使用 `SameSite=None` 时，需要同时使用 `Secure` 指令。

### Cookie 前缀

cookie 的机制无法确认 cookie 的来源。

TODO

## 安全

TODO

## 追踪和隐私

TODO

## 参考资料

1. [Full Third-Party Cookie Blocking and More | Webkit][1], by *John Wilander*, 2020/03/24
2. [HTTP Cookies - HTTP | MDN][2]

[1]: https://webkit.org/blog/10218/full-third-party-cookie-blocking-and-more/ "Full Third-Party Cookie Blocking and More"
[2]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies "HTTP cookies - HTTP | MDN"