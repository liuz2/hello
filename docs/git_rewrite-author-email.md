# 修改作者的邮箱

```sh
$ git filter-branch --commit-filter 'GIT_AUTHOR_NAME="xxx"; GIT_AUTHOR_EMAIL="xxx@xxx.com"; git commit-tree "$@";' HEAD
```

## REF

1. [git 更改 author, committer - 寒江独](https://blog.csdn.net/fandyvon/article/details/8566680), 2013/02/03