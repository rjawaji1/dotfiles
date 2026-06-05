if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set XDG_CONFIG_HOME="$HOME/.config"

set -gx EDITOR nvim

set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

# set -gx PATH $HOME/Library/Application\x20Support/Herd/bin $PATH

alias vi="nvim"
alias ls="eza --group-directories-first"
alias cat="bat -p"

alias :q="exit"

alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gs="git status"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."

# Postgres
set -gx PATH /opt/homebrew/opt/libpq/bin $PATH

set -gx LDFLAGS -L/opt/homebrew/opt/libpq/lib $LDFLAGS
set -gx CPPFLAGS -I/opt/homebrew/opt/libpq/include $CPPFLAGS

starship init fish | source
zoxide init fish | source
mise activate fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
