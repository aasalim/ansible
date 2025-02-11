#| Shell Type                  | Files Loaded                                | Example Use Case                                                  |
#|-----------------------------|---------------------------------------------|-------------------------------------------------------------------|
#| Login + Interactive         | `/etc/profile` → `~/.profile` → `~/.bashrc` | SSH login (`ssh user@host`), TTY login (`Ctrl+Alt+F3`)            |
#| Login + Non-Interactive     | `/etc/profile` → `~/.profile`               | SSH running a command (`ssh user@host uptime`)                    |
#| Non-Login + Interactive     | `/etc/bash.bashrc` → `~/.bashrc`            | Opening a GUI terminal, running `bash` inside an existing session |
#| Non-Login + Non-Interactive | No files loaded (unless forced)             | Running a script (`./myscript.sh`), cron jobs                     |
#
# /etc/profile:     System-wide environment settings for login shells
# /etc/bash.bashrc: System-wide Bash configuration for interactive non-login shells
# ~/.profile:       User-specific environment settings for login shells
# ~/.bashrc:        User-specific Bash configuration for non-login interactive shells
# ~/.bash_env:      User-specific environment variables and settings
# ~/.bash_aliases:  User-specific Bash aliases
# ------------------------------------------------------------------------------------------------------------------------------------------------
# /etc/bash.bashrc
#
# Exit early if not running interactively
[[ $- != *i* ]] && return

# Source user-specific ~/.bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

echo "Loaded bash.bashrc"
