# openfirmware/dotfiles

Some dotfiles to set up my defaults for working on the command line. I am using the Fish shell with tmux and vim.

## install

```terminal
$ git clone git://github.com/openfirmware/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ git submodule update --init
$ ./install.sh
```

The install script will symlink the appropriate files from `.dotfiles` to your home directory. This means updates to the dotfiles repository will be automatically picked up by applications.
