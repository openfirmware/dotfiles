export PATH="$PATH:$DOTFILES/bin"

# Add paths for homebrew on OS X
if [ $OSX ]; then
	export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi
