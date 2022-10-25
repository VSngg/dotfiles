#
# ~/.bashrc
#
# shellcheck disable=SC2148,SC2034


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ----- ENVIRONMENTAL VARIABLES ----- #

export EDITOR="vim"
export BROWSER="firefox"
export TERM=xterm-256color

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=/home/vs/.cargo/bin:$PATH
export PATH=/home/vs/.local/bin:$PATH
export PATH=/home/vs/.nimble/bin:$PATH

export GOPATH=$(go env GOPATH)

export BAT_THEME="Solarized (dark)"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

export SNIPPETS="$XDG_DATA_HOME/snip/"
export ZETDIR="$HOME/Documents/zettelkasten/"
export CODE="$HOME/Documents/code/"

export CDPATH=".:$CODE:$HOME"

export QT_QPA_PLATFORM=wayland
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks

export FZF_DEFAULT_OPTS="
--color fg:-1,bg:-1,hl:#268bd2,fg+:#eee8d5,bg+:#073642,hl+:#268bd2
--color info:#b58900,prompt:#b58900,pointer:#fdf6e3
--color marker:#fdf6e3,spinner:#b58900"

[ -f ~/.config/lf/LF_ICONS ] && {
    LF_ICONS="$(tr '\n' ':' <~/.config/lf/LF_ICONS)" \
        && export LF_ICONS
}


# ----- DIRCOLORS ----- #

if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
else
    eval "$(dircolors -b)"
fi

# ----- BASH SHELL OPTIONS ----- #

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

# ----- HISTORY ----- #

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# ----- PROMPT ----- #

__ps1() {
    local r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]' BRANCH

    BRANCH=$(git branch --show-current 2> /dev/null)
    [[ -n "$BRANCH" ]] && BRANCH="[$BRANCH] " || BRANCH=""

    PS1="$r\u$x@$b\h$x $w\W$x $p$BRANCH$x\$ "
}

PROMPT_COMMAND="__ps1"

# ----- stty disable ctrl-s ----- #

stty stop undef

# ----- ALIASES ----- #

unalias -a

# coreutils
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias mkdir="mkdir -pv"

alias ls="ls -hN --color=auto --group-directories-first"
alias ll="ls -alhN --color=auto --group-directories-first"
alias la="ls -AhN --color=auto --group-directories-first"
alias chmox="chmod +x"

# random
alias hx="helix"
alias info="info --vi-keys"
alias c="clear"
alias x="exit"
alias weather="curl ru.wttr.in"
alias toipe="toipe -w top1000"
alias tetris="tint -n -d -s"
alias lf="lfub"
alias gotop="gotop -l procs"
alias sshserver="ssh root@185.70.187.106"
alias w3m="w3m -4"
alias '?'="searxsearch"
alias '??'="google"
alias newjup="python -m jupyter_ascending.scripts.make_pair --base"
alias jl="jupyter-lab"

# change directory
alias cdc='cd $HOME/Documents/code/'
alias cdcf='cd $HOME/.config/'
alias cdbin='cd $HOME/.local/bin/'
alias cdz='cd $HOME/Documents/zettelkasten/'
alias cdtmp='cd $(mktemp -d)'
alias cdsnip='cd $SNIPPETS'
alias cdvimplug='cd $XDG_DATA_HOME/vim/plugins/'

# ----- FUNCTIONS ----- #

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

bind '"\C-o":"lfcd\C-m"'


# ----- COMPLETION ----- #

#COMPLETION_DIR="/usr/share/bash-completion/completions"
# for file in $COMPLETION_DIR/*; do
#     source "$file"
# done
source <(carapace _carapace)

# source /usr/share/bash-completion/bash_completion
# source /home/vs/.local/share/snip/snip_completion.bash
# source /home/vs/.nix-profile/share/bash-completion/completions/nix
