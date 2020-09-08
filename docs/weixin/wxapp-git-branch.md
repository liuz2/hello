# 小程序开发工具强制 GIT 提交

write `./bin/beforeUpload.sh`

```sh
#! /usr/bin/env sh

# 检查分支是否为主分支
br_name=$(git symbolic-ref --short HEAD);
if [ $br_name != "master" ]
then
    echo "[错误]当前分支名为 $br_name 但是上传包必须是在 master 分支";
    exit 42;
fi

# 检查分支上是否有未提交的代码
if [[ ! -z $(git status --porcelain) ]]
then
    echo "[错误]你有未提交的代码，上传包前请将代码提交到仓库";
    exit 42;
fi

# 最后自动提交到远端仓库
git push;
```

最后还需要在微信开发者工具-`详情`中勾选`启用自定义处理命令`，并在上传前预处理中输入 `./bin/beforeUpload.sh` 地址

## REF

1. [小程序开发工具强制 GIT 提交](https://imnerd.org/miniprogram-force-git-commit.html), 2018/09/09
