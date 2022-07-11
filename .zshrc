# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

PS1="%B%{$fg[red]%}%n%{$fg[white]%}@%{$fg[cyan]%}%M %{$fg[magenta]%}%4~%{$reset_color%} $%b "
# PS1="%B%{$fg[red]%}%n%{$fg[white]%}@%{$fg[yellow]%}%M %{$fg[magenta]%}%4~%{$reset_color%} $%b "

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

# --- Environment variables ---

export EDITOR="vim"
export BROWSER="firefox"

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=/home/vs/.cargo/bin:$PATH
export PATH=/home/vs/.local/bin:$PATH

export BAT_THEME="Solarized (dark)"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export SNIPPETS="$XDG_DATA_HOME/snip/"
export ZETDIR="$HOME/Documents/zettelkasten/"

export QT_QPA_PLATFORM=wayland
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks

# --- Aliases ---

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
alias hx="helix"
alias c="clear"
alias weather="curl ru.wttr.in"
alias toipe="toipe -w top1000"
alias tetris="tint -n -d -s"

alias cdc="cd $HOME/Documents/code/"
alias cdcf="cd $HOME/.config/"
alias cdbin="cd $HOME/.local/bin/"
alias cdz="cd $HOME/Documents/zettelkasten/"
alias cdtmp="cd $(mktemp -d)"
alias cdsnip="cd $SNIPPETS"

alias lf="lfub"
alias gotop="gotop -l procs"
alias ls="ls -hN --color=auto --group-directories-first" 
alias ll="ls -alhN --color=auto --group-directories-first" 
alias la="ls -AhN --color=auto --group-directories-first"
alias chmox="chmod +x"

# --- Functions ---

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


[ -f ~/.config/lf/LF_ICONS ] && {
	LF_ICONS="$(tr '\n' ':' <~/.config/lf/LF_ICONS)" \
		&& export LF_ICONS
}

eval "$(dircolors -b "$HOME/.dircolors")"

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh 2>/dev/null
