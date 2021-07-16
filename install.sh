#!/usr/bin/bash
set -e

# Install packages
# TODO: Add OS switch
echo "# Installing packages #"
sudo apt install powerline fish

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
