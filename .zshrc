# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}%n%{$fg[white]%}@%{$fg[yellow]%}%M %{$fg[magenta]%}%~%{$reset_color%} $%b "

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vs/.zshrc'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select 
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Aliases 
alias \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkdir="mkdir -pv"
alias v="nvim" 
alias hx="helix"
alias c="clear"
alias weather="curl ru.wttr.in"
alias cdc="cd $HOME/Documents/code/"
alias cdth="cd $HOME/Documents/диплом/thesis/"
alias cdcf="cd $HOME/.config/"
alias cdbin="cd $HOME/.local/bin/"
alias cdz="cd $HOME/Documents/zettelkasten/"
alias lf="lfub"
alias gotop="gotop -l procs"
alias ls="ls -hN --color=auto --group-directories-first" 
alias ll="ls -alhN --color=auto --group-directories-first" 
alias la="ls -AhN --color=auto --group-directories-first"
alias chmox="chmod +x"


# functions

se() { du -a ~/.config/* | awk '{print $2}' | fzf --preview 'bat {}' | xargs -r $EDITOR ;}

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

# Environment variables

export EDITOR=nvim
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=/home/vs/.cargo/bin:$PATH
export PATH=/home/vs/.local/bin:$PATH
export BAT_THEME="gruvbox-dark"
export KDEHOME=$XDG_CONFIG_HOME/kde
export BROWSER=firefox
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks

export BEMENU_OPTS='-I 0 -i -l 10 -p ">_" -W 0.3 --fn "mononoki Nerd Font Mono:10" --nb "#282828" --nf "#ebdbb2" --sf "#282828" --sb "#f4800d" --tb "#282828" --tf "#ebdbb2" --hb "#ebdbb2" --hf "#282828"'

[ -f ~/.config/lf/LF_ICONS ] && {
	LF_ICONS="$(tr '\n' ':' <~/.config/lf/LF_ICONS)" \
		&& export LF_ICONS
}

eval "$(dircolors -b "$HOME/.dircolors")"

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh 2>/dev/null
