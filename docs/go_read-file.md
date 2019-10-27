# 读取文件内容

使用 `os.Open()` 打开文件，`f.Close()` 关闭文件。

使用 `go doc os.Open` 查询文档，可以看到如下内容：

```
func Open(name string) (*File, error)
    Open opens the named file for reading. If successful, methods on the
    returned file can be used for reading; the associated file descriptor has
    mode O_RDONLY. If there is an error, it will be of type *PathError.
```

```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	counts := make(map[string]int)
	files := os.Args[1:]

	if len(files) == 0 {
		countLines(os.Stdin, counts)
	} else {
		for _, arg := range files {
			f, err := os.Open(arg)
			if err != nil {
				fmt.Fprintf(os.Stderr, "dup2: %v\n", err)
				continue
			}
			countLines(f, counts)
			f.Close()
		}
	}

	for line, n := range counts {
		if n > 1 {
			fmt.Printf("%d\t%s\n", n, line)
		}
	}
}

func countLines(f *os.File, counts map[string]int) {
	input := bufio.NewScanner(f)
	for input.Scan() {
		counts[input.Text()]++
	}
}
```

以下是其他相关 api 的帮助文档：

```
$ go doc fmt.Fprintf

func Fprintf(w io.Writer, format string, a ...interface{}) (n int, err error)
    Fprintf formats according to a format specifier and writes to w. It returns
    the number of bytes written and any write error encountered.

$ go doc os.File

type File struct {
	// Has unexported fields.
}
    File represents an open file descriptor.

func Create(name string) (*File, error)
func NewFile(fd uintptr, name string) *File
func Open(name string) (*File, error)
func OpenFile(name string, flag int, perm FileMode) (*File, error)
func Pipe() (r *File, w *File, err error)
func (f *File) Chdir() error
func (f *File) Chmod(mode FileMode) error
func (f *File) Chown(uid, gid int) error
func (f *File) Close() error
func (f *File) Fd() uintptr
func (f *File) Name() string
func (f *File) Read(b []byte) (n int, err error)
func (f *File) ReadAt(b []byte, off int64) (n int, err error)
func (f *File) Readdir(n int) ([]FileInfo, error)
func (f *File) Readdirnames(n int) (names []string, err error)
func (f *File) Seek(offset int64, whence int) (ret int64, err error)
func (f *File) Stat() (FileInfo, error)
func (f *File) Sync() error
func (f *File) Truncate(size int64) error
func (f *File) Write(b []byte) (n int, err error)
func (f *File) WriteAt(b []byte, off int64) (n int, err error)
func (f *File) WriteString(s string) (n int, err error)

$ go doc bufio.NewScanner

func NewScanner(r io.Reader) *Scanner
    NewScanner returns a new Scanner to read from r. The split function defaults
    to ScanLines.

$ go doc bufio.Scanner

type Scanner struct {
	// Has unexported fields.
}
    Scanner provides a convenient interface for reading data such as a file of
    newline-delimited lines of text. Successive calls to the Scan method will
    step through the 'tokens' of a file, skipping the bytes between the tokens.
    The specification of a token is defined by a split function of type
    SplitFunc; the default split function breaks the input into lines with line
    termination stripped. Split functions are defined in this package for
    scanning a file into lines, bytes, UTF-8-encoded runes, and space-delimited
    words. The client may instead provide a custom split function.

    Scanning stops unrecoverably at EOF, the first I/O error, or a token too
    large to fit in the buffer. When a scan stops, the reader may have advanced
    arbitrarily far past the last token. Programs that need more control over
    error handling or large tokens, or must run sequential scans on a reader,
    should use bufio.Reader instead.


func NewScanner(r io.Reader) *Scanner
func (s *Scanner) Buffer(buf []byte, max int)
func (s *Scanner) Bytes() []byte
func (s *Scanner) Err() error
func (s *Scanner) Scan() bool
func (s *Scanner) Split(split SplitFunc)
func (s *Scanner) Text() string

$ go doc io.Reader

type Reader interface {
	Read(p []byte) (n int, err error)
}
    Reader is the interface that wraps the basic Read method.

    Read reads up to len(p) bytes into p. It returns the number of bytes read (0
    <= n <= len(p)) and any error encountered. Even if Read returns n < len(p),
    it may use all of p as scratch space during the call. If some data is
    available but not len(p) bytes, Read conventionally returns what is
    available instead of waiting for more.

    When Read encounters an error or end-of-file condition after successfully
    reading n > 0 bytes, it returns the number of bytes read. It may return the
    (non-nil) error from the same call or return the error (and n == 0) from a
    subsequent call. An instance of this general case is that a Reader returning
    a non-zero number of bytes at the end of the input stream may return either
    err == EOF or err == nil. The next Read should return 0, EOF.

    Callers should always process the n > 0 bytes returned before considering
    the error err. Doing so correctly handles I/O errors that happen after
    reading some bytes and also both of the allowed EOF behaviors.

    Implementations of Read are discouraged from returning a zero byte count
    with a nil error, except when len(p) == 0. Callers should treat a return of
    0 and nil as indicating that nothing happened; in particular it does not
    indicate EOF.

    Implementations must not retain p.


func LimitReader(r Reader, n int64) Reader
func MultiReader(readers ...Reader) Reader
func TeeReader(r Reader, w Writer) Reader
```