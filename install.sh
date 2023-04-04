#!/bin/bash

if [ $# -lt 1 ]; then
  >&2 echo "Usage: install.sh { all | bash | tmux | vim | helix }"
  exit 0
fi

install_dotfiles() {
  local program=$1
  cd $1 && ./install-$program.sh
  cd -
}

case $1 in
  bash)
    install_dotfiles bash
    ;;

  tmux)
    install_dotfiles tmux
    ;;
  vim)
    install_dotfiles vim
    ;;
  helix)
    install_dotfiles helix
    ;;
  all)
    for i in bash tmux vim helix; do
      install_dotfiles $i
    done
    ;;
esac
