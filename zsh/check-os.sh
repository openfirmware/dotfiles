# Use this script to define variables to test the current OS.
# Why? Because it's nicer to check $OSX or $UBUNTU than sprinkle 'uname -s'
# all over the config files.

UNAME=$(uname -s)

if [[ $UNAME == "Darwin" ]]; then
    OSX=true
fi

if [[ $UNAME == "Linux" ]]; then
	LINUX=true
fi

if `which lsb_release &> /dev/null`; then
	DISTRO=$(lsb_release -is)

	if [[ $DISTRO == 'Ubuntu' ]]; then
		UBUNTU=true
	fi
fi
