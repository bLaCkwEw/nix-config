if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set nvim as default text editor
set -gx EDITOR (type -p nvim)

# pnpm
set -gx PNPM_HOME "/home/blackwew/media/.pnpm-store/"
set -gx PATH "$PNPM_HOME" $PATH
alias pnpr="pnpm run"

# Zoxide
zoxide init fish | source

# Various aliases
alias c="clear"
alias e="exit"
alias q="exit"
alias h="history --max=10"
alias rm="rm -drvI"

# Git
alias gs="git status"
alias gc="git commit -v"
alias ga="git add"
alias gaa="git add ."
alias gpu="git pull"
alias gps="git push"
