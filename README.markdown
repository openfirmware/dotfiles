# openfirmware/dotfiles

Some dotfiles to set up my defaults for working on the command line.

* fish
* grc
* nvm.fish
* powerline
* starship
* tmux

## install

```terminal
$ git clone git://github.com/openfirmware/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ git submodule update --init
$ ./install.sh
```

The install script will symlink the appropriate files from `.dotfiles` to your home directory. This means updates to the dotfiles repository will be automatically picked up by applications.

## references

* https://github.com/holman/dotfiles
* https://github.com/caarlos0/dotfiles.fish

