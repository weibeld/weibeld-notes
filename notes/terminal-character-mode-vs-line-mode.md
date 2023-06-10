---
created: 2023-03-18T02:14:23+01:00
edited: 2023-03-18T18:36:00+01:00
title: Terminal Character Mode vs Line Mode
---

Character mode:

- Terminal sends every character to host
- Host sends character back to terminal for display
- Terminal does NOT perform local echo

Line mode:

- Terminal sends input to host only when Enter is pressed
- Terminal performs local echo for every character typed
- Host does NOT echo input back to terminal
- Bash runs in line mode (source: ChatGPT)

https://support.honeywellaidc.com/s/article/What-is-the-difference-between-character-line-and-block-mode-in-VT220-emulation

This mode selects local echo, which causes every character transmitted by the terminal to automatically appear on the screen. Therefore, the computer does not have to transmit (echo) the character back to the terminal for display. When local echo is off, the terminal only transmits characters to the computer. The computer must echo the characters back to the terminal for display. Select send-receive mode by using the following sequences.

Canonizsation: buffering data locally (in terminal) -> line mode -> receiving application receives entire edited line -> canonical mode is line mode

Canonical vs non-canonical input: https://stackoverflow.com/questions/358342/canonical-vs-non-canonical-terminal-input
I guess a terminal must support both of them. Some applications require canonical input (e.g. shell). Some others require non-canonical, i.e. every typed character is immediately sent to the application (e.g. vim).

Terminals: first teletypes, then video terminals video display terminals - VDTs for short
