#!/usr/bin/env bash
set -e

# Install packages
echo "# Installing packages #"

os=$(uname -a)

if echo $os | grep -iq 'linux'; then
  # Linux Configuration
  #####################
  echo "linux detected."
  
  packages=$(grep -v '#' linux/packages | tr '\n' ' ')
  sudo apt install -y $packages
  sudo update-alternatives --set editor /usr/bin/vim.basic

  mkdir -p $HOME/.config/fish/conf.d
  echo 'source /etc/grc.fish' > $HOME/.config/fish/conf.d/grc.fish

elif echo $os | grep -iq 'darwin'; then
  # MacOS Configuration
  #####################
  echo "MacOS detected."
  
  packages=$(grep -v '#' macos/ports | tr '\n' ' ')
  sudo port install $packages
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

echo "# Setting up fish #"
sudo chsh $USER -s /usr/bin/fish

fish fish/defaults.fish
fish fish/abbreviations.fish
fish fish/install_fisher.fish
fish fish/install_starship.fish

echo "Default shell changes will take affect after a logout."
