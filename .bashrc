#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ----- ENVIRONMENTAL VARIABLES ----- #

export EDITOR="vim"
export BROWSER="firefox"
export TERM=xterm-256color

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

# get current branch in git repo
function parse_git_branch() {
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]
	then
        STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
    status=$(git status 2>&1 | tee)
	dirty=$(echo -n "${status}" 2> /dev/null \
        | grep "modified:" &> /dev/null; echo "$?")
    untracked=$(echo -n "${status}" 2> /dev/null \
        | grep "Untracked files" &> /dev/null; echo "$?")
	ahead=$(echo -n "${status}" 2> /dev/null \
        | grep "Your branch is ahead of" &> /dev/null; echo "$?")
	newfile=$(echo -n "${status}" 2> /dev/null \
        | grep "new file:" &> /dev/null; echo "$?")
	renamed=$(echo -n "${status}" 2> /dev/null \
        | grep "renamed:" &> /dev/null; echo "$?")
	deleted=$(echo -n "${status}" 2> /dev/null \
        | grep "deleted:" &> /dev/null; echo "$?")
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}


export PS1="\[\e[31m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\] \[\e[34m\]\`parse_git_branch\`\[\e[m\]\\$ "


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
alias sshserver="ssh root@185.70.187.106"
alias ?="google"

# change directory
alias cdc="cd $HOME/Documents/code/"
alias cdcf="cd $HOME/.config/"
alias cdbin="cd $HOME/.local/bin/"
alias cdz="cd $HOME/Documents/zettelkasten/"
alias cdtmp="cd $(mktemp -d)"
alias cdsnip="cd $SNIPPETS"
alias cdvimplug="cd $XDG_DATA_HOME/vim/plugins/"

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

source /usr/share/bash-completion/bash_completion
