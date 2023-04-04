#!/bin/bash

if [ $# -lt 1 ]; then
  >&2 echo "Usage: install.sh { all | bash | tmux | vim | helix }"
  exit 0
fi

case $1 in
  bash)
    cd bash && ./install-bash.sh
    cd -
    ;;

  tmux)
    cd tmux && ./install-tmux.sh
    cd -
    ;;
  vim)
    cd vim && ./install-vim.sh
    cd -
    ;;
  helix)
    cd helix && ./install-helix.sh
    cd -
    ;;
esac
