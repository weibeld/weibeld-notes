---
created: 2024-05-03T12:27:21+02:00
edited: 2024-05-03T12:27:21+02:00
title: Collations
---

## What is a collation?

A collation defines the order of characters in a character set. It is defined by the _locale_ that is assigned to the `LC_COLLATE` category of the system's locale settings (see [Locales](locales.md)).

For example, consider the following lines of text in `file`:

```
e
u
ä
ö
ü
i
a
o
```

Now, set the collation to the `C` locale and sort the lines:

```bash
$ export LC_COLLATE=C
$ cat file | sort
a
e
i
o
u
ä
ö
ü
```

Then, set the collation to the `de_CH.UTF-8` locale and sort the lines again:

```bash
$ export LC_COLLATE=de_CH.UTF-8
$ cat file | sort
a
ä
e
i
o
ö
u
ü
```

As can be seen, the sort order is different. Whereas the `C` locale places `ä`, `ö`, and `ü` after `u` (according to their Unicode values), the `de_CH.UTF-8` locale places them after `a`, `o`, and `u`, respectively.

This also affects character range expressions (e.g. `[a-z]`), as they are for example used in regexes.

For example, set the collation again to the `C` locale and test whether `ä` is included in the range `[a-b]`:

```bash
$ export LC_COLLATE=C
$ [[ ä =~ [a-b] ]]
```

The command returns `1`, meaning that `ä` is not included in `[a-b]` with the `C` locale.

Now, set the collation to the `de_CH.UTF-8` locale and repeat the test:

```bash
$ export LC_COLLATE=de_CH.UTF-8
$ [[ ä =~ [a-b] ]]
```

The command now returns `0`, meaning that `ä` is included within the `[a-b]` range with the `de_CH.UTF-8` locale.

## What locales exist?

To list all locales supported by the system, use the following command:

```bash
$ locale -a | sort 
```

> **Note:** the data backing these locales can be found in `/usr/share/locale`.

## What other aspects can be customised with locales?

👉 See [Locales](locales.md)
