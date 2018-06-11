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
