# find

**find** -- walk a file hierarchy

Find files using file-name (case insensitive find).

```sh
$ find . -iname "MyCProgram.c"
```

Execute commands on files found by the find command

```sh
$ find . -iname "MyCProgram.c" -exec md5sum {} \;
```

Find all empty files in home directory

```sh
$ find ~ -empty
```

## DESCRIPTION

`-name pattern`, True if the last component of the pathname being examined matches pattern.

`-iname pattern`, like `-name`, but the matching is case insensitive.

`-exec utility [argument ...] ;`, True if the program named utility returns a zero value as its exit status. Optional arguments may be passed to the utility. The expression must be terminated by a semicolon (`;`). If the string `{}` appears anywhere in the utility name or the arguments it is replaced by the pathname of the current file.

`-empty`, True if the current file or directory is empty.

## REF

1. [15 Practical Linux Find Command Examples](https://www.thegeekstuff.com/2009/03/15-practical-linux-find-command-examples/)
1. [Find command Exclude or Ignore Files](https://www.cyberciti.biz/faq/find-command-exclude-ignore-files/), by *Vivek Gite*, 2020/08/16
