#!/usr/bin/env bash
set -e

# Install packages
echo "# Installing packages #"

uname=$(uname -a)

# Use different install scripts for GNU or BSD because they use different tool flags
if echo $uname | grep -iq 'linux'; then
  bash gnu-install.sh
elif echo $uname | grep -iq 'darwin'; then
  bash bsd-install.sh
fi

echo "# Installing fzf #"
if [ ! -d $HOME/.fzf ]; then
  git clone --depth 1 'https://github.com/junegunn/fzf.git' $HOME/.fzf
  $HOME/.fzf/install
fi

echo "# Installing plugins #"
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
  echo "Vundle already installed."
fi
vim +PluginInstall +qall

if [ ! -d $HOME/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
else
  echo "tmux plugin manager already installed."
fi

fish fish/defaults.fish
fish fish/abbreviations.fish
fish fish/install_fisher.fish
fish fish/install_starship.fish
