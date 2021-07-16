#!/usr/bin/env fish

$HOME/.dotfiles/fish/starship/install/install.sh

mkdir -p $HOME/.config/fish/conf.d
echo 'starship init fish | source' > $HOME/.config/fish/conf.d/starship.fish
