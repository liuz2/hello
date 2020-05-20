# 调试

> 以下内容摘自官方文档 [Debugging][1]。

在 VS Code 中输入 <kbd>F5</kbd>，会自动调试当前的文件。这适用于调试简单程序。

对于大多数调试场景，推荐创建一个配置文件，方便存储调试配置参数。VS Code 默认会把配置信息放入 workspace 根目录下的 `.vscode/launch.json` 文件。

在运行视图，点击齿轮就可以创建新的 `launch.json` 文件。VS Code 会自动推测当前运行环境，并生成相应的配置文件。比如，Node.js 的配置文件如下：

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "program": "${file}"
        }
    ]
}
```

## Launch versus attach configurations

`request` 表示请求配置类型，可以取值 `launch` 或 `attach`。 启动（`launch`）和附加（`attach`）有什么区别？

在 VS Code 中，存在两种核心调试模式，**Launch** 和 **Attach**。它们对应不同的工作流。

Launch 模式先启动 app，然后将 VS Code 与它对接，比如后端开发。Attach 模式是将 VS Code 的调试器附加到已经运行的进程上面，比如浏览器的开发者工具。

Launch 模式和 Attach 模式的参数是不一样的。

## REF

1. [Debugging][1]

[1]: https://code.visualstudio.com/docs/editor/debugging "Debugging"
