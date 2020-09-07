# awk - pattern-directed scanning and processing language

## Synopsis

```
awk [ -F fs ] [ -v var=value ] [ 'prog' | -f progfile ] [ file ... ]
```

## Description

Awk scans each input file for lines that match any of a set of patterns specified literally in prog or in one or more files specified as `-f` progfile.
