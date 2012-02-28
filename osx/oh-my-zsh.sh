# Load OS X-specific plugins for oh-my-zsh

if [ $OSX ]; then
	plugins=($plugins brew)
fi
