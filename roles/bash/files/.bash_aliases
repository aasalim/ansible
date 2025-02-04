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
# ~/.bash_aliases

# === System Update ===
alias update='sudo apt update && sudo apt upgrade'  # Update and upgrade system (Debian-based)

# === Directory Navigation ===
alias ..='cd ..'                         # Go up one directory
alias ...='cd ../../'                    # Go up two directories
alias ....='cd ../../../'                # Go up three directories
alias ~='cd ~'                           # Go to home directory

# === List directory contents ===
alias ls='ls -lah --color=auto'          # Enable color for 'ls'
alias ll='ls'                            # Enable color for 'ls'

# === Quick File Navigation ===
alias c='clear'                          # Clear the terminal screen
alias h='history'                        # Show command history

# === Git Aliases ===
alias gs='git status'                    # Check Git status
alias ga='git add'                       # Add changes
alias gc='git commit'                    # Commit changes
alias gco='git checkout'                 # Checkout a branch
alias gd='git diff'                      # Show differences
alias gP='git push origin'               # Push to origin
alias gp='git pull'                      # Pull from the repository
alias gb='git branch'                    # List branches
alias gcl='git clone'                    # Clone a repository
alias gl='git log --oneline --color --abbrev-commit --decorate --graph --date=relative' # View git logs

