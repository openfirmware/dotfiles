#!/usr/bin/bash
set -e

# Install packages
echo "# Installing packages #"

os=$(uname -a)

if echo $os | grep -iq 'linux'; then
  # Linux Configuration
  #####################
  echo "linux detected."
  
  sudo apt install powerline fish
  sudo update-alternatives --set editor /usr/bin/vim.basic

elif echo $os | grep -iq 'darwin'; then
  # MacOS Configuration
  #####################
  echo "MacOS detected."
  
  sudo port install fish
  pip install --user powerline-status
fi

# Install symlinks to configurations
function link_dotfile() {
	ln -Ffsv "$1" "$2"
}

linkables=$(find . -maxdepth 2 -name "*.symlink" -print)
for file in $linkables
do
	filename=$(basename "$file" .symlink)
	link_dotfile $(pwd)/$file $HOME/.$filename
done

echo "# Installing plugins #"
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "Vundle already installed."
fi
vim +PluginInstall +qall

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tmux plugin manager already installed."
fi

echo "# Setting up fish #"
sudo chsh $USER -s /usr/bin/fish

fish fish/defaults.fish
fish fish/abbreviations.fish

echo "Default shell changes will take affect after a logout."
