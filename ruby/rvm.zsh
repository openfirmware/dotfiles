if [[ -s $HOME/.rvm/scripts/rvm ]]; then
	PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
	source $HOME/.rvm/scripts/rvm
fi

if [[ -s /etc/profile.d/rvm.sh ]]; then
  source /etc/profile.d/rvm.sh
fi

