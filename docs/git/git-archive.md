# git archive

Create an archive of the latest snapshot of your code:

```sh
$ git archive master --prefix='project/' | gzip > `git describe master`.tar.gz
$ ls *.tar.gz
v1.6.2-rc1-20-g1234234.tar.gz
```

Create a zip archive:

```sh
$ git archive master --prefix='project/' --format=zip > `git describe master`.zip
```

## REF

1. [5.3 Distributed Git - Maintaining a Project](https://git-scm.com/book/en/v2/Distributed-Git-Maintaining-a-Project#_preparing_release), Pro Git 2nd
1. [git-archive](https://git-scm.com/docs/git-archive)
