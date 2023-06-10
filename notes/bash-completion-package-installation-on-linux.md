---
created: 2023-03-18T00:43:31+01:00
edited: 2023-03-18T00:45:46+01:00
title: Bash Completion Package Installation on Linux
---

Behaviour of installing the `bash-completion` package with different package managers on Linux:

## APT (Debian, Ubuntu)

- Installs the bash_completion script to /usr/share/bash-completion/bash_completion
- Also creates the file /etc/bash_completion, which only sources the above file
- You have to source the /usr/share/bash-completion/bash_completion file in your ~/.bashrc
- Test if bash-completion is correctly installed with: echo $BASH_COMPLETION_VERSINFO
- You can put completion scripts in /etc/bash_completion.d/ and they will be automatically sourced by bash-completion
- On Debian, Ubuntu, this directory doesn't exist by default, but you can create it

## yum (Fedora, CentOS)

- Installs the bash_completion script to /usr/share/bash-completion/bash_completion
- You DON'T have to source the /usr/share/bash-completion/bash_completion file in your ~/.bashrc
- It's sourced automatically
- Test if bash-completion is correctly installed with: echo $BASH_COMPLETION_VERSINFO
- yum may install an old version of bash-completion (2.1) which does not have the $BASH_COMPLETION_VERSINFO variable
- In that case, maybe better test if bash-completion is installed with: type _init_completion_
- This function is contained in bashc-completion 2.1 (the minimum required for the kubectl completion script to work), but not in bash-completion 1 which is used with Bash 3.2 on macOS
- You can put completion scripts in /etc/bash_completion.d/ and they will be automatically sourced by bash-completion
- On Fedora, CentOS, this directory exists by default

## Notes

If you try to use complete-alias with bash-completion 1 and Bash 3.2, you will get an error of the form `_completion_loader: command not found`.
