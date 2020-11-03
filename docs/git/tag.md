# tag

Listing your tags

```sh
$ git tag
```

You can also search for tags that match a particular pattern

```sh
$ git tag -l "v1.8.5*"
```

Creating an annotated tag

```sh
$ git tag -a v1.4 -m "my version 1.4"
```

Creating a lightweight tag

```sh
$ git tag v1.4-lw
```

Creating tag for a specific commit

```sh
$ git tag -a v1.2 9fceb02
```

Push tag to remote server

```sh
$ git push origin v1.5
```

Push all tags to remote server

```sh
$ git push origin --tags
```

Remove a local lightweight tag

```sh
$ git tag -d v1.4-lw
```

There are two common variations for deleting a tag from a remote server.

```sh
$ git push origin :refs/tags/v1.4-lw

# or
$ git push origin --delete <tagname>
```

## REF

1. [2.6 Git Basics - Tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging)
