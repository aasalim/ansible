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

# === System ===
alias update='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y' # Update and upgrade system (Debian-based)

# === Bash ===
alias sb='source $HOME/.bashrc'

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
alias g='lazygit'                        # Open LazyGit
alias gs='git status'                    # Check Git status
alias ga='git add'                       # Add changes
alias gc='git commit'                    # Commit changes
alias gcm='git commit -m'                # Quickly commit with a message
alias gco='git checkout'                 # Checkout a branch
alias gd='git diff'                      # Show differences
alias gp='git pull'                      # Pull from the repository
alias gb='git branch'                    # List branches
alias gcl='git clone'                    # Clone a repository
alias gbcl='git clone --bare'            # Bare clone a repository
alias gr='git reflog'                    # Action history
alias gP='git push origin'               # Push to origin
alias gl='git log --oneline --color --abbrev-commit --decorate --graph --date=relative' # View git logs

# === Vim Aliases ===
alias vim='nvim'
alias vi='nvim'
alias wiki='cd $HOME/backups/vimwiki;nvim -c VimwikiIndex'
alias notes='nvim -c VimwikiDiaryIndex'

# === TMUX Aliases ===
alias rice='tmuxifier load-session rice'
alias work='tmuxifier load-session work'

# === cat Aliases ===
alias cat='batcat'

# function rgf() {
#     c="rg --column -nS --no-heading --color=always"
#     a="$(fzf --bind "change:reload:$c {q} || true" \
#         --ansi --reverse --preview '' --header 'Search in files')"
#     if [[ -n $a ]]; then
#         IFS=':' read -r file line char _ <<< "$a"
#         "$EDITOR" "$file" +"$line" -c "norm ${char}lh"
#         cd "$(dirname "$(readlink -f "$file")")"
#     fi
# }
function rgf() {
  local ignore_flag="--ignore-file .gitignore" # Default to ignore gitignore
  if [[ "$1" == "--respect-gitignore" ]]; then
    ignore_flag="" # Override to respect gitignore
    shift # Remove the flag from the arguments
  fi

  c="rg --column -nS --no-heading --color=always $ignore_flag"
  a="$(fzf --bind "change:reload:$c {q} || true" \
      --ansi --reverse --preview '' --header 'Search in files')"
  if [[ -n $a ]]; then
    IFS=':' read -r file line char _ <<< "$a"
    "$EDITOR" "$file" +"$line" -c "norm ${char}lh"
    cd "$(dirname "$(readlink -f "$file")")"
  fi
}
extract() {
  if [ -z "$1" ]; then
    echo "Usage: extract <file>"
    return 1
  fi

  case "$1" in
    *.tar)
      tar xvf "$1" ;;
    *.tar.gz|*.tgz)
      tar xvzf "$1" ;;
    *.tar.bz2|*.tbz2)
      tar xvjf "$1" ;;
    *.zip)
      unzip "$1" ;;
    *.rar)
      unrar x "$1" ;;
    *.7z)
      7z x "$1" ;;
    *.gz)
      gunzip "$1" ;;
    *.bz2)
      bunzip2 "$1" ;;
    *)
      echo "Unsupported file format: $1"
      return 1 ;;
  esac
}
vdiff () {
    if [ "${#}" -ne 2 ] ; then
        echo "vdiff requires two arguments"
        echo " comparing dirs: vdiff dir_a dir_b"
        echo " comparing files: vdiff file_a file_b"
        return 1
    fi
    local left="${1}"
    local right="${2}"

    if [ -d "${left}" ] && [ -d "${right}" ]; then
        vim +"DirDiff ${left} ${right}"
    else
        vim -d "${left}" "${right}"
    fi
}

echo "Loaded .bash_aliases"
