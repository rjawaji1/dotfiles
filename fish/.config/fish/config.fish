if status is-interactive
	# Launch Into Tmux
	# if not set -q TMUX
	# 	tmux has-session -t scratch 2>/dev/null
	# 	or tmux new-session -d -s scratch
	#
	# 	exec tmux attach-session -t scratch
	# end

    # Commands to run in interactive sessions can go here
	starship init fish | source
	# tv init fish | source
	fzf --fish | source
	mise activate fish | source

	zoxide init fish | source


	alias v="nvim"
	alias vi="nvim"
	alias ls="eza --group-directories-first"
	alias lsa="eza --group-directories-first -l"
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
end

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
# set -gx PATH $HOME/.config/composer/vendor/bin $PATH

set -gx XDG_CONFIG_HOME $HOME/.config

set -gx PATH $HOME/Library/Application\x20Support/Herd/bin $PATH


# Postgres
set -gx PATH /opt/homebrew/opt/libpq/bin $PATH

set -gx LDFLAGS -L/opt/homebrew/opt/libpq/lib $LDFLAGS
set -gx CPPFLAGS -I/opt/homebrew/opt/libpq/include $CPPFLAGS


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
