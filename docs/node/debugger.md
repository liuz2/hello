# Debugger

Node.js includes an out-of-process debugging utility accessible via a V8 Inspector and built-in debugging client. To use it, start Node.js with the inspect argument followed by the path to the script to debug; a prompt will be displayed indicating successful launch of the debugger:

```sh
$ node insepct myscript.js
```

## Command reference

### Stepping

- `cont`, `c`: Continue execution
- `next`, `n`: step Next
- `step`, `s`: Step in
- `out`, `o`: step Out
- `pause`: Pause running code (like pause button in Developer Tools)

### Breakpoints

- `setBreakpoint()`, `sb()`: Set breakpoint on current line
- `setBreakpoint(line)`, `sb(line)`: Set breakpoint on specific line
- `setBreakpoint('fn()')`, `sb(...)`: Set breakpoint on a first statement in functions body
- `setBreakpoint('script.js', 1)`, `sb(...)`: Set breakpoint on first line of script.js
- `clearBreakpoint('script.js', 1)`, `cb(...)`: Clear breakpoint in script.js on line 1

It is also possible to set a breakpoint in a file (module) that is not loaded yet:

```sh
$ node inspect main.js
Break on start in main.js:1
> 1 (function (exports, require, module, __filename, __dirname) { const mod = require('./mod.js');
  2 mod.hello();
  3 mod.hello();
debug> setBreakpoint('mod.js', 22)
```

### Information

- `backtrace`, `bt`: Print backtrace of current execution frame
- `list(5)`: List scripts source code with 5 line context (5 lines before and after)
- `watch(expr)`: Add expression to watch list
- `unwatch(expr)`: Remove expression from watch list
- `watchers`: List all watchers and their values (automatically listed on each breakpoint)
- `repl`: Open debugger's repl for evaluation in debugging script's context
- `exec expr`: Execute an expression in debugging script's context

### Execution control

- `run`: Run script(automatically runs on debugger's start)
- `restart`: Restart script
- `kill`: Kill script

### Various

- `scripts`: List all loaded scripts
- `version`: Display V8's version

## REF

1. [Debugger](https://nodejs.org/api/debugger.html)
