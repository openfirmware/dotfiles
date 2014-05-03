#!/usr/bin/env zsh

echo "Installing dotfiles…"

function link_dotfile() {
	ln -Fsv "$1" "$2"
}

all=0
linkables=($PWD/**/*.symlink)
for file in $linkables
do
	filename=$(basename "$file" .symlink)
	link_dotfile $file $HOME/.$filename
done

