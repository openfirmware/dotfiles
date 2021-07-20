#!/usr/bin/env bash
# This script assumes it is being run on a system with GNU tools.
set -e

# Install packages
echo "# Installing packages #"

packages=$(grep -v '#' linux/packages | tr '\n' ' ')
sudo apt install -y $packages
sudo update-alternatives --set editor /usr/bin/vim.basic

mkdir -p $HOME/.config/fish/conf.d
echo 'source /etc/grc.fish' > $HOME/.config/fish/conf.d/grc.fish

# Install symlinks to configurations
function link_dotfile() {
	ln -Ffnsv "$1" "$2"
}

linkables=$(find $(pwd) -maxdepth 2 -name "*.symlink" -print)
for file in $linkables
do
	filename=$(basename "$file" .symlink)
	link_dotfile "$file" "$HOME/.$filename"
done

echo "# Setting up fish #"
sudo chsh $USER -s /usr/bin/fish
echo "Default shell changes will take affect after a logout."
