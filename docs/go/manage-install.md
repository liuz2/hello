# Managing Go Installations

This topic describe how to install multiple versions of Go on the same machine, as well as how to uninstall Go.

## Installing multiple Go versions

To install additional Go versions, run the `go get` command, specifying the download location of the version you want to install. The following example illustrates with version 1.10.7:

```sh
$ go get golang.org/dl/go1.10.7
$ go1.10.7 download
```

To run go commands with the newly-downloaded version, append the version number to the go command, as follows:

```sh
$ go1.10.7 version
go version go1.10.7 linux/amd64
```

When you have multiple versions installed, you can discover where each is installed, look at the version's GOROOT value. For example, run a command such as the following:

```sh
$ go1.10.7 env GOROOT
```

To uninstall a downloaded version, just remove the directory specified by its GOROOT environment variable and the goX.Y.Z binary.

## Goproxy

If you saw those error message:

```
package golang.org/dl/go1.10.7: unrecognized import path "golang.org/dl/go1.10.7": https fetch: Get "https://golang.org/dl/go1.10.7?go-get=1": dial tcp 216.239.37.1:443: i/o timeout
```

You can try Goproxy.

```sh
# Go 1.13 and above (RECOMMENDED)
$ go env -w GO111MODULE=on
$ go env -w GOPROXY=https://goproxy.cn,direct
```

## REF

1. [Managing Go Installations](https://golang.google.cn/doc/manage-install)
1. [Goproxy China](https://github.com/goproxy/goproxy.cn)
