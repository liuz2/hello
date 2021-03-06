# Vim Cheat Sheet

Marked: 562 of 701 / usr_02.txt

## Help

| KEY | ACTION |
| --- | --- |
| `:help` | get generic help |
| `:help {subject}` | get help for a given subject |
| `:help index` | get a complete index of all Vim commands |
| `:help CTRL-A` | get help for a control character. The case is ignored. |
| `:help i_CTRL-H` | get help for a control character for the **insert-mode**. |
| `:help -t` | find out what command-line arguments does |
| `:help 'number'` | help for an option, need to enclose it in single quotation marks. |
| `:help i_<Up>` | find help for special keys, enclose them in angle brackets |
| `:help E37` | find help about an error using error ID |
| `:help user-manual` | read user manual, [online url][1] |
| `<C-]>` | jump to a subject under the cursor |
| `<C-o>` | jump back |
| `<C-t>` | jump back, just like `<C-o>` |
| `<C-d>` | let Vim show available topics |

The Vim documentation consists of two parts:

1. The User Manual
1. The Reference manual

## General

| KEY | ACTION |
| --- | --- |
| `:set compatible?` | check compatible option |
| `:set showmode` | to see what mode you are in |
| `<Esc>` | get back to Normal mode. Like the home button of iPhone |
| `x` | delete a character |
| `dd` | delete a line |
| `J` | delete a line break |
| `u` | undo the last edit |
| `U` | undo line |
| `<C-r>` | undoes the undo |
| `ZZ` | writes the file and exits |

## Operators

TODO: update the following USAGE. You can find it in `:h motions.txt` 46 of 1326

| KEY | USAGE |
| --- | --- |
| c | change |
| d | change |
| y | change |
| ~ | change |
| g~ | change |
| gu | change |
| gU | change |
| ! | change |
| = | change |
| gq | change |
| g? | change |
| `>` | change |
| `<` | change |
| zf | change |
| g@ | change |

## Moving around

```
: motion.txt
```

| KEY | ACTION |
| --- | --- |
| `h` | left |
| `j` | down |
| `k` | up |
| `l` | right |
| `<C-g>` | to know where you are in the file |
| `` ||

## CLI Options

These options are used to start vim in command line terminal.

- `--clean` makes sure Vim is started with nice defaults

## Windows

| KEY | ACTION |
| --- | --- |
| `<C-w> <C-w>` | jump to another window |

## Folding

All the folding commands start with "z".

| KEY | ACTION |
| --- | --- |
| `zf` | create a fold |
| `zo` | open one fold under the cursor |
| `zO` | open all folds under the cursor |
| `zc` | close one fold under the cursor |
| `zr` | reduce folding |
| `zR` | open all foldings |
| `zm` | more folding |
| `zM` | close all foldings |
| `zi` | toggle foldings |

[1]: http://vimdoc.sourceforge.net/ "Vimdoc: the online source for Vim documentation"
