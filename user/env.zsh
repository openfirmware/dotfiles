# Set other ENV variables
export EDITOR=vim
export VISUAL=vim
export PAGER=less

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Need this to sign things
export GPG_TTY=`tty`
