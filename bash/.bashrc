#
# ~/.bashrc
#
# shellcheck disable=SC2148,SC2034


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ----- Utility functions ----- #
_have()    { type "$1" &>/dev/null; }

# ----- PATH ----- #
pathappend() {
    declare arg
    for arg in "$@"; do
        test -d "$arg" || continue
        PATH=${PATH//":$arg:"/:}
        PATH=${PATH/#"$arg:"/}
        PATH=${PATH/%":$arg"/}
        export PATH="${PATH:+"$PATH:"}$arg"
    done
} && export -f pathappend

pathprepend() {
    for arg in "$@"; do
        test -d "$arg" || continue
        PATH=${PATH//:"$arg:"/:}
        PATH=${PATH/#"$arg:"/}
        PATH=${PATH/%":$arg"/}
        export PATH="$arg${PATH:+":${PATH}"}"
    done
} && export -f pathprepend

pathprepend \
    "$HOME/.local/bin" \
    "$HOME/.cargo/bin" \
    "$HOME/go/bin" \

pathappend \
    "$HOME/scripts"

# ----- ENVIRONMENTAL VARIABLES ----- #

if _have nvim; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

_have hx && export EDITOR="hx"

export BROWSER="firefox"
export TERM=xterm-256color

_have go && export GOPATH=$(go env GOPATH)

export BAT_THEME="Solarized (dark)"
export MANROFFOPT="-c"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export SNIPPETS="$XDG_DATA_HOME/snip/"
export ZETDIR="$HOME/Documents/zettelkasten/"
export CODE="$HOME/Documents/code/"

export CDPATH=".:$CODE:$HOME"

export KEG_CURRENT="$HOME/keg"

export QT_QPA_PLATFORM=wayland
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks

[ -f ~/.config/lf/LF_ICONS ] && {
    LF_ICONS="$(tr '\n' ':' <~/.config/lf/LF_ICONS)" \
        && export LF_ICONS
}


# ----- DIRCOLORS ----- #

if _have dircolors; then
    if [[ -r "$HOME/.dircolors" ]]; then
        eval "$(dircolors -b "$HOME/.dircolors")"
    else
        eval "$(dircolors -b)"
    fi
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

    PS1="$r\u$x@$b\h$x $w\w$x $p$BRANCH$x\n\$ "
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
alias less="less -R"
alias pw="powershell.exe"

alias ls="ls -hN --color=auto --group-directories-first"

if _have exa; then
    alias ll="exa -alh --group-directories-first"
    alias la="exa -a --group-directories-first"
else
    alias ll="ls -alhN --color=auto --group-directories-first"
    alias la="ls -AhN --color=auto --group-directories-first"
fi

alias chmox="chmod +x"

alias c="clear"
alias x="exit"

# random
alias info="info --vi-keys"
alias weather="curl ru.wttr.in"
alias toipe="toipe -w top1000"
alias tetris="tint -n -d -s"
alias gotop="gotop -l procs"

if _have mosh; then
    alias sshserver="mosh root@185.70.187.106"
else
    alias sshserver="ssh root@185.70.187.106"
fi

if _have nala; then
    alias sai="sudo nala install"
    alias sas="sudo nala search"
else
    alias sai="sudo apt install"
    alias sas="sudo apt search"
fi

_have lazygit && alias lg="lazygit"

alias w3m="w3m -4"
alias '?'="searxsearch"
alias '??'="google"
alias newjup="python -m jupyter_ascending.scripts.make_pair --base"
alias jl="jupyter-lab"

# change directory
alias cdtmp='cd $(mktemp -d)'

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

function tm() {
    # 1. Check if tmux is installed
    if ! _have tmux; then
        echo "Error: tmux is not installed or not found in PATH." >&2
        echo "Please install tmux to use this function." >&2
        return 1
    fi
    # Define the target session name
    local session_name="default"
    echo "Attempting to attach to session '${session_name}' (creating if necessary)..."
    # Use -A (Attach) on new-session. If 'default' exists, it attaches instead of creating.
    tmux new-session -A -s "${session_name}"
}

f() { 
	if [[ ! -f "$XDG_CONFIG_HOME"/dirlist ]]; then 
	    touch "$XDG_CONFIG_HOME"/dirlist; 
	fi 
    case $1 in
        add | a | new)
            if grep -q "${PWD}" "$XDG_CONFIG_HOME"/dirlist ; then 
                echo "${PWD} already added to dirlist" 
            else 
                echo "${PWD}" >> "$XDG_CONFIG_HOME"/dirlist \
                && echo "Added ($PWD) to dirlist!" 
            fi 
            ;;
        cf | config | conf)
            cd "$XDG_CONFIG_HOME" || return
            ;;
        c | code)
            cd "$CODE" || return
            ;;
        bin)
            cd "$HOME/.local/bin" || return
            ;;
        *) 
            local dirlist=$(fzf --height="35%" --header="Change directory to:" \
            --preview="(ls -A --color "{1}")" --preview-window=right:50%:border \
            < "$XDG_CONFIG_HOME"/dirlist) && cd ${dirlist} || return
            ;;
    esac
}
bind '"\C-f":"f\C-m"'
# ----- COMPLETION ----- #

_have carapace && source <(carapace _carapace)
complete -C kn kn
complete -C keg keg

# source /usr/share/bash-completion/bash_completion
#[ -f "/home/vs/.ghcup/env" ] && source "/home/vs/.ghcup/env" # ghcup-env
#. "$HOME/.cargo/env"
