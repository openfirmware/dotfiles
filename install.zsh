#!/usr/bin/env zsh

echo "Installing dotfiles…"

function link_dotfile() {
	ln -Ffsv "$1" "$2"
}

all=0
linkables=($PWD/**/*.symlink)
for file in $linkables
do
	filename=$(basename "$file" .symlink)
	link_dotfile $file $HOME/.$filename
done

echo "Installing binaries…"
rsync -rv ./bin/ $HOME/bin

echo "Installing powerline…"
sudo apt install powerline

echo "Installing plugins…"
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
