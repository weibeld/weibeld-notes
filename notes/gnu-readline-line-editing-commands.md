---
created: 2023-03-21T18:32:43+01:00
edited: 2023-03-24T02:56:14+01:00
title: GNU Readline Line Editing Commands
---

TODO: maybe make specific to Readline (not Bash)?

Overview of the default line editing commands that are provided by the [GNU Readline](https://tiswww.case.edu/php/chet/readline/rltop.html) library.

## Background

## Line editing

Line editing is the primary functionality that the GNU Readline library provides. It does so by defining a set of commands that can be invoked through key combinations.

The most important ones of these commands are listed below.

> The full list of commands can be found in the [documentation](https://tiswww.cwru.edu/php/chet/readline/rluserman.html#Bindable-Readline-Commands).

Commands for moving the cursor:

| Command                | Action                                                    |
| -------------------    | --------------------------------------------------------- |
| `Left Arrow`           | Move cursor one character back                            |
| `Right Arrow`          | Move cursor one character forward                         |
| `Ctrl-B`               | Move cursor one character back                            |
| `Ctrl-F`               | Move cursor one character forward                         |
| `Meta-B` (\*\*)        | Move cursor one word back (go to beginning of word)       |
| `Meta-F` (\*\*)        | Move cursor one word forward (go to end of word)          |
| `Meta-Ctrl-B` (\*\*\*) | Move cursor one shell word back (go to beginning of word) |
| `Meta-Ctrl-F` (\*\*\*) | Move cursor one shell word forward (go to end of word)    |
| `Ctrl-A`               | Move cursor to beginning of line                          |
| `Ctrl-E`               | Move cursor to end of line                                |

Commands for erasing text:

| Command                 | Action                                                             |
| ---------------------   | ------------------------------------------------------------------ |
| `Backspace` (\*)        | Erase previous character                                           |
| `Ctrl-W` (\*)           | Erase from cursor to beginning of word                             |
| `Ctrl-U` (\*)           | Erase from cursor to beginning of line                             |
| `Ctrl-K`                | Erase from cursor to end of line                                   |
| `Meta-Backspace` (\*\*) | Erase from cursor to beginning of word                             |
| `Meta-D` (\*\*)         | Erase from cursor to end of word                                   |

Commands for yanking (pasting) previously erased text:

| Command               | Action                                                             |
| --------------------- | ------------------------------------------------------------------ |
| `Ctrl-Y`              | Insert most recently erased text into line                         |
| `Meta-Y`              | Cycle through the history of previously erased text                |

Commands for modifying text:

| Command                | Action                                                                   |
| ------------------     | ----------------------------------------------------------------------   |
| `Ctrl-T`               | Drag the character before the cursor one character forward               |
| `Meta-T` (\*\*)        | Drag the word before the cursor one word forward                         |
| `Meta-Ctrl-T` (\*\*\*) | Drag the shell word before the cursor one shell word forward             |
| `Meta-U` (\*\*)        | Transform the word under the cursor to upper case                        |
| `Meta-L` (\*\*)        | Transform the word under the cursor to lower case                        |
| `Meta-C` (\*\*)        | Transform the first character of the word under the cursor to upper case |

Miscellaneous commands:

| Command      | Action                                                                |
| ------------ | --------------------------------------------------------------------- |
| `Ctrl-L`     | Clear screen and print current line on top                            |
| `Ctrl-_`     | Undo the last editing command                                         |
| `Ctrl-V`     | Escape next character (allows entering `Esc`, `Ctrl-C`, etc. as text) |

Below are a few remarks about some of these commands.

**TTY style commands:**

The commands marked with (\*) emulate the default line editing commands of the TTY line discipline of UNIX/Linux.

> You can display the TTY line discipline commands with `stty -a`.

**Definitions of a word:**

The `Ctrl-W` command uses the notion of whitespace-delimited words. That means, only whitespace characters are regarded as word boundaries.

Conversely, the commands marked with (\*\*) use the notion of alphanumeric words. That means, every non-alphanumeric character is regarded as a word boundary. In this definitio of a word, characters such as `-` or `_` are regarded as word separators.

This is best explained with an example. Consider the following line (where `|` is the cursor):

```bash
echo foo_bar|
```

In the above line, the `Meta-Backspace` command (using the non-alphanumeric word definition) would result in `echo foo_|` because `_` is regarded as a word boundary. On the other hand, the `Ctrl-W` command (using the whitespace-delimited word definition) would result in `echo |` because only whitespace characters are regarded as word boundaries.

**Definition of a shell word:**

The commands marked with (\*\*\*) use the notion of a shell word. A shell word is defined as a token that is regarded by a shell as a single argument. This may include a quoted string containing whitespace characters or a string containing individually escaped whitespace characters.

For example, consider the following lines:

```bash
echo "foo bar baz"|
echo 'foo bar baz'|
echo foo\ bar\ baz|
```

In above lines, the command `Meta-Ctrl-B` would result in `echo |"foo bar baz"`, `echo |'foo bar baz'`, and `echo |foo\ bar\ baz`, respectively. This is because, in all cases, the string after `echo` is regarded as a single shell word.

## Line history

GNU Readline provides provides various ways for browsing, searching, and reinserting previous lines from the history.

Linear browsing of history:

| Command      | Action                                                                |
| ------------ | --------------------------------------------------------------------- |
| `Up Arrow`   | Insert previous line from history into current line                   |
| `Down Arrow` | Insert next line from history into current line                       |
| `Ctrl-P`     | Insert previous line from history into current line                   |
| `Ctrl-N`     | Insert next line from history into current line                       |

Incremental searching of history:

| Command        | Action                                                                |
| ------------   | --------------------------------------------------------------------- |
| `Ctrl-R <str>` | Start search for the given search string                              |
| `Ctrl-R`       | After the first match is displayed, cycle to next match               |
| `Ctrl-J`       | Insert selected line into current line                                |
| `Enter`        | Insert selected line into current line and submit (execute) it                 |
| `Ctrl-G`       | Abort search and restore previous line                                |

Non-incremental searching of history:

| Command        | Action                                                                |
| ------------   | --------------------------------------------------------------------- |
| `Meta-P <str>` | Search for the given search string from the end of the history        |
| `Meta-N <str>` | Search for the given search string from the beginning of the history  |

In general, the most useful history commands are the linear browsing commands (e.g. `Arrow Up`  and `Arrow Down`) and the incremental search (`Ctrl-R`).

More information can be found in the documentation:

- https://tiswww.case.edu/php/chet/readline/rluserman.html#Searching
- https://tiswww.case.edu/php/chet/readline/rluserman.html#Commands-For-History

## Auto-completion

An extremely useful feature of the GNU Readline library is auto-completion of the text that is being typed. Auto-completion is triggered by default with the `Tab` key:


| Command      | Action                                                                   |
| ------------ | ---------------------------------------------------------------------    |
| `Tab`        | Insert completion option into the line (if there's only a single option) |
| `Tab Tab`    | List all possible completion options                                     |
| `Meta-?`     | List all possible completion options (alias to `Tab Tab`)                |
| `Meta-*`     | Insert all possible completion options into the line                     |


Note that he completion options are not suggested by GNU Readline itself but by the application that uses the GNU Readline library. In essence, when you type `Tab`, GNU Readline sends the curent text of the line to the application and the application responds with a set of possible completions. GNU Readline lets you then insert of display these completions as specified above.

In the case of Bash (or another shell that uses GNU Readline) the suggested completions are shell commands and file names



https://tiswww.case.edu/php/chet/readline/rluserman.html#Commands-For-Completion

## Command arguments

https://tiswww.case.edu/php/chet/readline/rluserman.html#Numeric-Arguments

Many commands accept [arguments](https://tiswww.cwru.edu/php/chet/readline/rluserman.html#Readline-Arguments) that you can prepend to the command with the `Meta` key. For example, consider the following line:

```bash
echo foobar|
```

If you type `Meta-3 Backspace` above, then the command deletes the last three characters instead of just the last single character. Thus, the resulting line will be `echo foo|`.

## Macros

https://tiswww.case.edu/php/chet/readline/rluserman.html#Keyboard-Macros

## Customisation with init file

https://tiswww.case.edu/php/chet/readline/rluserman.html#Readline-Init-File

There's a number of commands that are not assigned to any key combination by default, but that you can assign to your desired key combination.

Documentation: [Bindable Readline Commands](https://tiswww.cwru.edu/php/chet/readline/rluserman.html#Bindable-Readline-Commands)

## Vi mode

## Resources

- https://tiswww.cwru.edu/php/chet/readline/rltop.html: GNU Readline librry
- https://tiswww.cwru.edu/php/chet/readline/rluserman.html: user interface documentation
