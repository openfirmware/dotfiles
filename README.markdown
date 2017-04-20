# The dotfiles of openfirmware

## dotfiles

Your dotfiles are how you personalize your system. This is my mix. It is based off of [Zach Holman's excellent dotfiles](https://github.com/holman/dotfiles) strategy. It is biased towards OS X somewhat, but should work with any \*NIX. I think.

If you're interested in the philosophy behind why projects like these are awesome, you might want to [read Zach Holman's post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## what's different

What's different from Holman's dotfiles? I included [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for one. This meant some definitions had to change, such as `$ZSH` to `$DOTFILES`. I am also relying on oh-my-zsh's plugin system instead of building my own in the topic areas.

I am loading the ENV and PATH files in the `zshenv`, and the ALIASES in the `zshrc`. There is no "wholesale" loading of `zsh` files now.

I also pulled out quite a bunch of stuff I don't use, or replaced it wholesale (vim) with my own setup. Feel free to fork and blast away my changes.

## install

- `git clone git://github.com/openfirmware/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `git submodule update --init`
- `rake install`
- `brew install fzf`
- `/usr/local/opt/fzf/install`

The install rake task will symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`, though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`, which sets up a few paths that'll be different on your particular machine.

## topical

Everything's built around topic areas. If you're adding a new area to your forked dotfiles — say, "Java" — you can simply add a `java` directory and put files in there. Anything with an extension of `.symlink` will get symlinked without extension into `$HOME` when you run `rake install`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser above and see what components may mesh up with you. Fork it, remove what you don't use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/env.zsh**: `env.zsh` files will be loaded in the `zshenv`
- **topic/path.zsh**: `path.zsh` files will be loaded in the `zshenv`
- **topic/aliases.zsh**: `aliases.zsh` files will be loaded in the `zshrc`
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into your `$HOME`. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `rake install`.
- **topic/\*.completion.zsh**: Any files ending in `completion.zsh` get loaded last so that they get loaded after we set up zsh autocomplete functions.

## add-ons

There are a few things I use to make my life awesome. They're not a required dependency, but if you install them they'll make your life a bit more like a bubble bath.

- If you want some more colors for things like `ls`, install grc: `brew install grc`.

## bugs

I want this to work for everyone; that means when you clone it down it should work for you even though you may not have `rvm` installed, for example. That said, I do use this as *my* dotfiles, so there's a good chance I may break something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please [open an issue](https://github.com/openfirmware/dotfiles/issues) on this repository and I'd love to get it fixed for you!

## todo

* Figure out which oh-my-zsh plugins work and which do not
* Warn if zsh is not installed

## thanks

I forked [Josh Holman](https://github.com/holman)'s dotfiles as a starting point for my own dotfiles. Of the dotfile projects on Github, it was the most clear to me for the purpose of building onto. Thanks as well to [Ryan Bates](http://github.com/ryanb) for getting the dotfiles ball rolling.
