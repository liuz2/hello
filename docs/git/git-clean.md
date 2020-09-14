# git clean

The command that allows you to remove untracked files is `git clean`.

Before running the actual command and removing untracked files and directories use the `-n` option that will perform a “dry run” and show you what files and directories will be deleted:

```sh
$ git clean -d -n
```

The output will look something like this:

```
Would remove content/test/
Would remove content/blog/post/example.md
```

If some of the files listed above are important, you should either start tracking these files with `git add <file>` or add them to your `.gitignore`.

Once you are sure you want to go ahead and delete the untracked files and directories, type:

```sh
$ git clean -d -f
```

The command will print all successfully deleted files and directories:

```
Removing content/test/
Removing content/blog/post/example.md
```

The `-d` option tells git to remove untracked directories too. If you don’t want to delete empty untracked directories, omit `-d` option.

The `-f` option stands for force. If not used and the Git configuration variable `clean.requireForce` is set to true, Git will not delete the files.

## REF

1. [How to Remove Untracked Files in Git](https://linuxize.com/post/how-to-remove-untracked-files-in-git/), by *Linuxize*, 2019/08/18
