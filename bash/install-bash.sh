#!/bin/bash
set -xe

ln -sf "$PWD/.bash_profile" "$HOME/.bash_profile"
ln -sf "$PWD/.bashrc" "$HOME/.bashrc"
ln -sf "$PWD/.dircolors" "$HOME/.dircolors"
ln -sf "$PWD/.inputrc" "$HOME/.inputrc"
ln -sf "$PWD/dirlist" "$HOME/.config/dirlist"
