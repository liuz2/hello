# 开始

## 安装

对于国内用户，可以直接访问 [Flutter 社区中文资源][3]，文档是中文的，视频也从 Youtube 搬到了哔哩哔哩。

在国内需要配置两个环境变量，才能正常升级 Flutter，并使用公开仓库。这两个变量是 `PUB_HOSTED_URL` 和 `FLUTTER_STORAGE_BASE_URL`，设定命令如下：

```sh
$ export PUB_HOSTED_URL=https://pub.flutter-io.cn
$ export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
$ git clone -b dev https://github.com/flutter/flutter.git
$ export PATH="$PWD/flutter/bin:$PATH"
$ cd ./flutter
$ flutter doctor
```

### 在 macOS 系统安装

可以下载固定版本的 Flutter 或者直接克隆 Flutter 仓库。使用仓库的命令如下：

```sh
$ git clone https://github.com/flutter/flutter.git -b stable
```

下载仓库，并在 `~/.zshrc` 中设置环境变量：

```sh
export PATH="<PATH To Flutter Bin>:$PATH"
```

执行 `flutter doctor`，将会对当前系统做一次全身体检，检测当前环境是否满足 Flutter 的开发要求。

我的电脑运行体检后，报告了 5 处问题：

1. 无法找到 Android SDK
1. 没有安装 CocoaPods
1. 没有安装 Android Studio
1. 没有连接的设备
1. 没有安装 VS Code 的 Flutter 插件

去官网下载 [Android Studio][5]。

## 参考文档

1. [Install - Flutter][1]
1. [Using Flutter in China][2]
1. [Flutter 社区中文资源][3]
1. [macOS install - Flutter][4]

[1]: https://flutter.dev/docs/get-started/install "Install"
[2]: https://flutter.dev/community/china "Using Flutter in China"
[3]: https://flutter.cn/ "Flutter 社区中文资源"
[4]: https://flutter.dev/docs/get-started/install/macos "macOS install - Flutter"
[5]: https://developer.android.google.cn/studio "Download Android Studio and SDK Tools"