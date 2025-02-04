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
# ~/.bashrc

# Exit early if not running interactively
[[ $- != *i* ]] && return

# === History Settings ===
HISTCONTROL=ignoredups:ignorespace  # Ignore duplicate & space-prefixed commands
shopt -s histappend                 # Append to history instead of overwriting
HISTSIZE=5000                       # Number of commands to keep in memory
HISTFILESIZE=10000                  # Number of commands stored in ~/.bash_history

# === Terminal Adjustments ===
shopt -s checkwinsize  # Adjust window size after each command

# Enable colored prompt if 'tput' exists and terminal supports colors  
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then  
    color_prompt=yes  
else  
    color_prompt=no  
fi  

# === Load Custom Environment Variables (if available) ===
if [ -f ~/.bash_env ]; then
    . ~/.bash_env
fi

# === Load Additional Aliases (if available) ===
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
