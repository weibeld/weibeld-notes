---
created: 2023-03-18T02:18:30+01:00
edited: 2023-03-18T02:18:57+01:00
title: Carriage Return and Line Feed Line Separators
---

Today, Unix/Linux uses LF (line feed) as a line separator whereas Windows uses the two-character sequence CR (carriage return) followed by LF.

Originally, when hardcopy [teletypes](https://en.wikipedia.org/wiki/Computer_terminal#Hard-copy_terminals) were used as computer terminals (1960s), the CR+LF sequence was used to indicate a new line. The two-character sequence was needed to give the print head enough time to return to the beginning of the line before printing the next character (see [Wikipedia](https://en.wikipedia.org/wiki/Newline#History)). With a single-character indicator (e.g. only CR or LF) it could happen that the first character of the new line already started printing when the print head was still on the way back to the beginning of the line.

When teletypes where later replaced by [video terminals](https://en.wikipedia.org/wiki/Computer_terminal#VDUs) (1970s), this mechanical timing constraint for starting a new line didn't apply anymore. However, the CR+LF line separator was maintained by many early operating systems. This included [MS-DOS](https://en.wikipedia.org/wiki/MS-DOS) and eventually its successor Windows. That's why today Windows uses CR+LF as a line separator.

On the other hand, [Multics](https://en.wikipedia.org/wiki/Multics) (the predecessor of Unix), chose a different approach. It used only the LF character as a line separator and then used device drivers that translated this character to   whatever character sequence was needed by the displaying device. For example, when a file was to be displayed on a teletype, the teletype driver would replace all the LF characters by a CR+LF sequence before sending the data to the teletype, so that the file gets printed correctly on the teletype (see [Wikipedia](https://en.wikipedia.org/wiki/Newline#History)). Unix retained this approach from Multics, and that's why today Unix/Linux uses LF as a line separator.

> Actually, this translation from LF to CR+LF for output seems still to be done today in Unix by the [line discipline](https://en.wikipedia.org/wiki/Line_discipline).

> See critique in [The UNIX-HATERS Handbook](https://web.mit.edu/~simsong/www/ugh.pdf) (Chapter 6) that Unix was designed for (or at least in the age of) teletypes.
