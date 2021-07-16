# openfirmware/dotfiles

Some dotfiles to set up my defaults for working on the command line.

* [done](https://github.com/franciscolourenco/done)
* [fish](https://fishshell.com/)
* [grc](https://github.com/garabik/grc)
* [nvm.fish](https://github.com/jorgebucaran/nvm.fish)
* [powerline](https://powerline.readthedocs.io/en/master/overview.html)
* [starship](https://starship.rs/)
* [tmux](https://en.wikipedia.org/wiki/Tmux)

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

