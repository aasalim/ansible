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

# Set the default prompt with custom colors and symbols
BRACKET_COLOR="\[\033[38;5;35m\]"
CLOCK_COLOR="\[\033[38;5;35m\]"
JOB_COLOR="\[\033[38;5;33m\]"
PATH_COLOR="\[\033[38;5;33m\]"
LINE_BOTTOM="\342\224\200"
LINE_BOTTOM_CORNER="\342\224\224"
LINE_COLOR="\[\033[38;5;248m\]"
LINE_STRAIGHT="\342\224\200"
LINE_UPPER_CORNER="\342\224\214"
END_CHARACTER="|"

# Ensure the shell is interactive before setting the prompt
if [[ -n "$PS1" && -t 1 ]]; then
  export PS1="$LINE_COLOR$LINE_UPPER_CORNER$LINE_STRAIGHT$LINE_STRAIGHT$BRACKET_COLOR[$CLOCK_COLOR\t$BRACKET_COLOR]$LINE_COLOR$LINE_STRAIGHT$BRACKET_COLOR[$JOB_COLOR\j$BRACKET_COLOR]$LINE_COLOR$LINE_STRAIGHT$BRACKET_COLOR[\H:\]$PATH_COLOR\w$BRACKET_COLOR]\n$LINE_COLOR$LINE_BOTTOM_CORNER$LINE_STRAIGHT$LINE_BOTTOM$END_CHARACTER\[$(tput sgr0)\] "
fi

# === Load Custom Environment Variables (if available) ===
if [ -f ~/.bash_env ]; then
    . ~/.bash_env
fi

# === Load Additional Aliases (if available) ===
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# === Load Work Configs (if available) ===
if [ -f ~/.bash_work ]; then
    . ~/.bash_work
fi

# === Load Dotfiles SSH keys  ===
eval $(ssh-agent -s) >/dev/null && ssh-add ~/.ssh/dotfiles 2>/dev/null

# === Load zoxide ===
eval "$(zoxide init bash)"

echo "Loaded .bashrc"
