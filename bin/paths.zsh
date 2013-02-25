export PATH="$PATH:$DOTFILES/bin"

# Add paths for homebrew on OS X
if [ $OSX ]; then
	export PATH="/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"
fi
