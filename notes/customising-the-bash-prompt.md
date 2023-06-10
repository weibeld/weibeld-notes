---
created: 2023-03-18T00:47:15+01:00
edited: 2023-03-18T00:54:48+01:00
title: Customising the Bash Prompt
---

Information for customsing the Bash prompt.

## Available Prompts

Bash has four prompts that can be customised:

- PS1: primary prompt
- PS2: continuation prompt (when commands need more input)
- PS3: not commonly used
- PS4: not commonly used

Customising a prompt is done by assiging a prompt string to the corresponding variable.

For example:

~~~bash
PS1='my-prompt> '
~~~

### References

- `PS1` and `PS2`
- https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Variables.html
- `PS3` and `PS4`
- https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html

## `PROMPT_COMMAND` Variable

Bash provides the variable `PROMPT_COMMAND`. If you set it, then its value is interpreted as a command, and this command is executed immediately before printing a primary prompt (PS1).

You can do anything you want in this command, but one use case is to set the `PS1` variable. In this way, you can include custom dynamic components in the prompt.

For example (in `~/.bashrc`):

~~~bash
PROMPT_COMMAND=__set_prompt

__set_prompt() {
local exit_code=$?
PS1='$exit_code|\u@\h:\w $'
}
~~~

This prepends the exit code of the previous command to the default prompt. Note that `$?` is a Bash special parameter and is documented [here](https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html).

You can perform any actions you want in the command that you pass to `PROMPT_COMMAND`, which allows to customise the prompt in sophisticated ways.

### References

- `PROMPT_COMMAND`
- https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html

## Bash Escape Characters

Bash provides a number of escape characters for inclusion in prompt strings. They are automatically expanded by Bash before the prompt is displayed. These escape characters include the following (the full list can be found [here](https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html)):

- `\u`: username of current user
- `\h`: hostname up to first period (.)
- `\H`: full hostname
- `\w`: current working directory
- `\W`: basename of current working directory
- `\d`: current date
- `\t`: current time
- `\j`: number of active jobs in the current shell
- `\v`: version of Bash
- `\!`: history number of command you're about to type
- `\#`: sequence number of command you're about to type in current shell

The following are example prompt strings using Bash escape characters:

- `\u@\h:\w$ '`
- `\#|\v|\w $ '`

### References

- https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html

## Variables

You can include environment variables in prompt strings, such as `$HOME`. The same applies to Bash's special parameters, such as `$_` or `$$` (see [here](https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html)).

The following are example prompt strings including variables or special parameters:

- `'$$:\w$ '`
- `'\u@\h:$HOME$ '`

Note that in the above example that prepends the exit code of the previous command to the prompt, we also included a variable in the prompt string.

The feature of interpolating variables in prompt string is actually a Bash shell option and is enabled by default. It can be turned on and off individually with the commands `shopt -s promptvars` to turn it on, and `shopt -u promptvars` to turn it off.

### References

- `promptvars`
- https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

## Terminal Escape Sequences

You can also include terminal escape sequences in prompt strings.

Prompt strings can also contain text attribute escape sequences. They change the appearance of subsequent text until they are overwritten by another escape sequence.

Most terminals use ANSI/VT100 (https://vt100.net/docs/vt100-ug/contents.html) escape sequences. The text attribute escape sequences of this standard have the format `ESC[<param>m`. ESC is the Escape character and can be typed in Bash as `\e` or `\033` (octal). `ESC[` is the control sequence introducer (CSI), and `m` is the final character. `<param>` is a numeric value, and each value set or unsets a text attribute as shown in the following.

Formatting escape sequences:

- `\e[1m`: bold
- `\e[2m`: * dim
- `\e[3m`: * italic
- `\e[4m`: underline
- `\e[5m`: * blink
- `\e[7m`: reverse foreground and background colours
- `\e[8m`: hidden (useful for passwords)

_\* May not work in some (or most) terminals._

To reset a corresponding attribute, add 20 to the parameter. For example, `\e[24m` resets the 'underlined' attribute.

Colour escape sequences (foreground colours):

- `\e[30m`: black
- `\e[31m`: red
- `\e[32m`: green
- `\e[33m`: yellow
- `\e[34m`: blue
- `\e[35m`: magenta
- `\e[36m`: cyan
- `\e[37m`: white
- `\e[38m`: default colour

For the corresponding background colours, add 10 to the parameter. For example, `\e[41m` is the escape sequence for red background colour.

If your terminal supports 16 colours

To reset ALL attributes, use the following escape sequence:

- `\e[0m`: reset all attributes

This should be used at the end of a prompt string, so that the command input uses default text formatting.

It is possible to use multiple parameters in the same escape sequence if they are separated by a semicolon. For example, `\e[1;31m` sets both the `bold` and the `red` attribute.

> IMPORTANT: IF YOU USE INVISIBLE CHARACTERS LIKE TEXT ATTRIBUTE ESCAPE SEQUENCES IN A PROMPT STRING, YOU MUST ENCLOSE THEM IN '\[' AND `\]', RESPECTIVELY.OTHERWISE BASH CAN'T CALCULATE THE LENGHT OF THE PROMPT CORRECTLY.

Example prompt strings with text attribute escape sequences:

- `\[\e[1;31m\]\u@\h:\w$ \[\e[0m\]`: default prompt in red and bold
- `\[\e[1;31m\]\u@\[\e[4m\]\h\[\e[24m\]:\w$ \[\e[0m\]`: like before, but hostname additionally underlined
