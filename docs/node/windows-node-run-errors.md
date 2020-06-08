# 在 Windows 系统运行 Node.js 脚本报错的解决办法

如果在 Windows 系统使用 `npm install -g xxx` 全局安装 node 工具，运行时报错“在此系统上禁止运行脚本”，有可能是由于**执行策略**的设置过于严格导致的。可以按照如下方法修改安全策略：

1. 搜索 `powershell`，右键以管理员身份运行；
1. 若要在本地计算机上运行未签名脚本，请使用以下命令将计算机上的执行策略更改为 RemoteSigned：`set-ExecutionPolicy RemoteSigned`；
1. 查看执行策略：`get-ExecutionPolicy`。

## 参考文档

1. [PowerShell : 无法加载文件 C:\Users\huyn\AppData\Roaming\npm\ng.ps1，因为在此系统上禁止运行脚本](https://blog.csdn.net/weixin_38883338/article/details/100054550)，作者*小妖666*，2019/08/24