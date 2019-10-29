# 查看目录大小

## df 查看磁盘使用概览

> df -- display free disk space

```sh
$ df -h

Filesystem      Size   Used  Avail Capacity iused               ifree %iused  Mounted on
/dev/disk1s1   233Gi  193Gi   36Gi    85% 4867347 9223372036849908460    0%   /
devfs          333Ki  333Ki    0Bi   100%    1152                   0  100%   /dev
/dev/disk1s4   233Gi  3.0Gi   36Gi     8%       3 9223372036854775804    0%   /private/var/vm
map -hosts       0Bi    0Bi    0Bi   100%       0                   0  100%   /net
map auto_home    0Bi    0Bi    0Bi   100%       0                   0  100%   /home
```

其中的 `-h` 表示输出 "Human-readable" 的格式。

## du 显示目录容量

> du -- display disk usage statistics

```sh
$ du -h -d 1

 13M	./node_modules
8.0K	./utils
244K	./components
 96K	./assets
 13M	.
```

其中，

1. `-h` 表示输出 "Human-readable" 的格式。
1. `-d depth` 表示打印的目录层级深度。如果不填，则会打印当前目录下的所有子目录。 

## REF

1. [Linux 下查看文件和文件夹大小](https://www.cnblogs.com/benio/archive/2010/10/13/1849946.html), by 郭振斌, 2010-10-13