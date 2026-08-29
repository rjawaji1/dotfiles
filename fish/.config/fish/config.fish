if status is-interactive
	# Launch Into Tmux
	if test "$TERM_PROGRAM" = ghostty; and not set -q TMUX
		tmux attach-session >/dev/null 2>&1
		or tmux
	end

    # Commands to run in interactive sessions can go here
	starship init fish | source
	fzf --fish | source

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
end

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

set -gx XDG_CONFIG_HOME $HOME/.config

set -gx PATH $HOME/Library/Application\x20Support/Herd/bin $PATH

# Postgres
set -gx PATH /opt/homebrew/opt/libpq/bin $PATH

# Important 
mise activate fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
