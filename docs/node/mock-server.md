# Mock 服务器

可以使用 [JSON Server][1]。首先全局安装：

```sh
$ npm install -g json-server
```

创建 `db.json`

```json
{
    "posts": [
        {
            "id": 1,
            "title": "json-server",
            "author": "typicode"
        }
    ],
    "comments": [
        { "id": 1, "body": "some comment", "postId": 1 }
    ],
    "profile": {
        "name": "typicode"
    }
}
```

开启服务器：

```sh
$ json-server --watch db.json
```

访问 `http://localhost:3000/posts/1`，将得到：

```json
{ "id": 1, "title": "json-server", "author": "typicode" }
```

[1]: https://github.com/typicode/json-server "JSON Server"