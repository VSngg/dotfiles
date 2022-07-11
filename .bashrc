#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ----- ENVIRONMENTAL VARIABLES ----- #

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
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

export SNIPPETS="$XDG_DATA_HOME/snip/"
export ZETDIR="$HOME/Documents/zettelkasten/"

export QT_QPA_PLATFORM=wayland
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks

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

# PROMPT_LONG=20
# PROMPT_MAX=95
# PROMPT_AT=@

# __ps1() {
#   local P='$' dir="${PWD##*/}" B countme short long double\
#     r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
#     u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
#     b='\[\e[36m\]' x='\[\e[0m\]'
# 
#   [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
#   [[ $PWD = / ]] && dir=/
#   [[ $PWD = "$HOME" ]] && dir='~'
# 
#   B=$(git branch --show-current 2>/dev/null)
#   [[ $dir = "$B" ]] && B=.
#   countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "
# 
#   [[ $B = master || $B = main ]] && b="$r"
#   [[ -n "$B" ]] && B="$g($b$B$g)"
# 
#   short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
#   long="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$g╚ $p$P$x "
#   double="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "
# 
#   if (( ${#countme} > PROMPT_MAX )); then
#     PS1="$double"
#   elif (( ${#countme} > PROMPT_LONG )); then
#     PS1="$long"
#   else
#     PS1="$short"
#   fi
# }
# 
# PROMPT_COMMAND="__ps1"

export PS1="\[\033[38;5;1m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\H\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;5m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;4m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

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
alias c="clear"
alias weather="curl ru.wttr.in"
alias toipe="toipe -w top1000"
alias tetris="tint -n -d -s"
alias lf="lfub"
alias gotop="gotop -l procs"

# change directory
alias cdc="cd $HOME/Documents/code/"
alias cdcf="cd $HOME/.config/"
alias cdbin="cd $HOME/.local/bin/"
alias cdz="cd $HOME/Documents/zettelkasten/"
alias cdtmp="cd $(mktemp -d)"
alias cdsnip="cd $SNIPPETS"

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

