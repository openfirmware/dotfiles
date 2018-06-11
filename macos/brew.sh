#!/bin/bash
# Install Homebrew, some formula, and some casks
set -e

if ! [ -x "$(command -v brew)" ]; then
  echo "Installing Homebrew!"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing Formulae!"
set +e
for f in $(cat $HOME/.dotfiles/macos/brew-formulae); do
  brew install $f
done

brew tap homebrew/cask

echo "Installing Casks!"
set +e
for f in $(cat $HOME/.dotfiles/macos/brew-casks); do
  brew cask install $f
done
