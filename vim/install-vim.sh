#!/bin/bash
set -xe

[ -d "$HOME/.vim" ] || mkdir "$HOME/.vim"
[ -d "$HOME/.vim/autoload" ] || mkdir "$HOME/.vim/autoload"

ln -sf "$PWD/.vimrc" "$HOME/.vimrc"
ln -sf "$PWD/.vim/autoload/plug.vim" "$HOME/.vim/autoload/plug.vim"