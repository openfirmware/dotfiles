#!/usr/bin/env bash
# This script assumes it is being run on a system with BSD tools.
set -e

# Install packages
echo "# Installing packages #"

packages=$(grep -v '#' macos/ports | tr '\n' ' ')
sudo port install $packages
pip install --user powerline-status

# Install symlinks to configurations
function link_dotfile() {
	ln -Ffhsv "$1" "$2"
}

linkables=$(find $(pwd) -maxdepth 2 -name "*.symlink" -print)
for file in $linkables
do
	filename=$(basename "$file" .symlink)
	link_dotfile "$file" "$HOME/.$filename"
done

echo "# Setting up fish #"
sudo chsh -s /opt/local/bin/fish $USER
echo "Default shell changes will take affect after a logout."
