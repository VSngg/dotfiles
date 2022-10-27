#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -e /home/vs/.nix-profile/etc/profile.d/nix.sh ]; then . /home/vs/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
