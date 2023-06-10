---
created: 2023-03-18T02:21:13+01:00
edited: 2023-03-18T02:22:03+01:00
title: Terminfo Usage
---

Basic usage of terminfo.

## Location of the terminfo database

On macOS, the terminfo database is at`/usr/share/terminfo`.

The subdirectories represent the [hexadecimal ASCII code](https://www.asciitable.com/) of the starting character of the contained terminals (e.g. `0x31` is `1`, `0x41` is `A`, etc.).

## infocmp

Display a sinle capability per line:

```bash
infocmp -1
```

Display long capability names (from C variables of source) instead of official terminfo names:

```bash
infocmp -L
```

Sort capabilities:

```bash
infocmp -s <d|i|l|c>
```

Options:

- `d`: use same order as in terminfo database
- `i`: sort alphabetically by the official terminfo capability names
- `l`: sort alphabetically by the long capability names (from C variables of source)
- `c`: sort alphabetically by the corresponding termcap names of the capabilites

> By default, the capabilities are sorted alphabetically by the name under which they are listed (i.e. the official terminfo name by default, or the long C variable name if the `-L` flag is used). Setting the sort order explicitly is useful for comparing the different name variants of capabilities (e.g. comparing the short and long names with `infocmp -1` and `infocmp -1L -s i`).

Indent complex capability strings (e.g. including if-else branches):

```bash
infocmp -f
```
