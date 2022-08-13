#!/bin/bash

_snip_completions(){
    findsnippets="$(find $SNIPPETS -mindepth 1 -printf '%P\n')"
    COMPREPLY=($(compgen -W "$findsnippets" "${COMP_WORDS[1]}"))
}

complete -F _snip_completions snip
