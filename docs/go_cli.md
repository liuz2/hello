# 常用的命令行工具

在命令行中，执行 `go` 可以显示所有的 go 工具。

1. `go build` 编译代码包及其依赖
1. `go clean` 删除 object 文件
1. `go doc` 显示包或者 symbol 的文档
1. `go env` 显示 Go 环境变量信息
1. `go fix` 改写旧版本 API 为新版
1. `gofmt` 把代码格式化为标准格式
1. `go fmt` 对指定目录下的所有 go 源文件格式化
1. `go generate` 根据编译指令预处理源码
1. `go get` 下载并安装代码包及其依赖
1. `go install` 编译并安装代码包及其依赖
1. `go list` 列举代码包
1. `go run` 编译源文件，链接库文件，并运行最终的可执行文件。
1. `go test` 运行测试用例
1. `go tool` 运行特定的工具
1. `go version` 查看 Go 编译器版本
1. `go vet` 在代码包中运行 `go tool vet`

通过 `go help [command]` 可以查看更多详情。