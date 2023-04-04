#!/bin/bash
set -xe

[ -d "$HOME/.config/helix" ] || mkdir "$HOME/.config/helix"
[ -d "$HOME/.config/helix/themes" ] || mkdir "$HOME/.config/helix/themes"
ln -sf "$PWD/config.toml" "$HOME/.config/helix/config.toml"
ln -sf "$PWD/languages.toml" "$HOME/.config/helix/languages.toml"
# TODO: ln doesn't accept wildcards
#ln -sf "$PWD/themes/*" "$HOME/.config/helix/themes/"
