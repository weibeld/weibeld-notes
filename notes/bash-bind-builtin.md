---
created: 2023-03-23T20:14:41+01:00
edited: 2023-03-24T04:01:31+01:00
title: Bash 'bind' Builtin
---

The [`bind`](https://www.gnu.org/software/bash/manual/bash.html#index-bind) builtin of Bash allows creating bindings of key sequences to GNU Readline functions and macros, as well as setting Readline variables.

That means, the `bind` builtin can be used to configure Readline in a similar way as the [Readline init file](https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File).

However, using `bind`, the settings apply only to Bash and not to any other applications that use the Readline library (e.g. GBD, R, etc.).

Also note that when using `bind` on the command line, the settings apply only to the current Bash session. To make the settings persistent for Bash, the must be added to the `~/.bashrc` file.

## Example

Assume the following statement is in the `~/.bashrc` file:

```bash
bind '"\C-h": kill-whole-line' 
```

Now in Bash, `Ctrl-H` can be used to erase the entire line.

However, this does not apply to any other applications that use Readline. For example, open GDB:

```bash
gdb
```

And try typing `Ctrl-H`. It doesn't work because the key binding defined with `bind` does not apply to GDB.

On the other hand, if the binding is defined in the [Readline init file](https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File) (e.g. `~/.inputrc`):

```
"\C-h": kill-whole-line
```

Then the binding works in all applications that use the Readline library, that is, it will work in both Bash and GDB.

## Creating a binding

Key sequence bindings can be created for both Readline functions and macros:

- The available Readline functions are listed in [Bindable Readline Commands](https://www.gnu.org/software/bash/manual/bash.html#Bindable-Readline-Commands) in the Bash docs
- A macro is a string that is inserted into the line at the current cursor position 

Below is an example:

```
# Readline function
bind '"\C-h": kill-whole-line' 
# Macro
bind '"\C-m\C-h": "hello world"' 
```

In the above example, `Ctrl-H` erases the entire line and `Ctrl-M Ctrl-H` inserts the string `hello world` at the current cursor position of the line that is being typed.

The format that `bind` expects corresponds to the format for key bindings in the Readline init file, which is described in [Readline Init File Syntax](https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File-Syntax) of the Bash docs.

The special characters (e.g. `\C`) that can be used are listed under _Key Bindings_ in [Readline Init File Syntax](https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File-Syntax). The double quotes around the key sequence part are mandatory. If defining a macro, there must also be double quotes around the string. The entire binding expression must be passed as a single argument to `bind`, thus it must be wrapped in single quotes, if it includes any whitespace.

## Options

### `bind -l`: list Readline functions

- Lists all available Readline functions
- Both bound and unbound functions are listed
- The list of functions corresponds to the functions listed in the [Bindable Readline Commands](https://www.gnu.org/software/bash/manual/bash.html#Bindable-Readline-Commands) in the Bash docs
- Number of functions in Bash 5.2.15: 173

### `bind -p`: list Readline function bindings

- Lists current set of key sequence bindings to Readline function
- The format is the same as the one used for creating the bindings
- Functions that are not bound to any key sequence are listed as comments
- Number of printed lines (bindings and unbound functions) in Bash 5.2.15: 485

### `bind -s`: list macro bindings

- Lists current set of key sequence bindings to macros
- The format is the same as the one used for creating the bindings

### `bind -v`: list Readline variable values

- List all Readline [configuration variables](https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File-Syntax) and their values
- The list of variables corresponds to the variables listed in the [Readline Init File Syntax](https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File-Syntax) in the Bash docs
- Number of variables in Bash 5.2.15: 46

### `bind -q`: query key bindings for Readline function

Prints the key sequences that the supplied Readline function is bound to.

### `bind -u`: unbind Readline function from all bindings

Unbinds the supplied function from all key sequences it is bound to.

### `bind -r`: remove a single binding

- Delete the binding of the supplied key sequence
- Works with boths Readline functions and macros
- The format for the key sequence is the same as for creating a binding (see above), however, **without the quotes**
