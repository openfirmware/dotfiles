# Check for updates to scripts
# Based on oh-my-zsh & RVM
#
# Only checks every 7 days

function _current_epoch() {
  echo $(($(date +%s) / 60 / 60 / 24))
}

function _update_dotfiles_checkstamp() {
  echo "LAST_EPOCH=$(_current_epoch)" > ~/.dotfiles-update
}

function _dotfiles_update_check() {
    for lib_file ($DOTFILES/update-check/lib/*.zsh) source $config_file
    for update_file ($DOTFILES/update-check/update.d/*.zsh) source $config_file
}

if [ -f ~/.dotfiles-update ]
then
  . ~/.dotfiles-update

  if [[ -z "$LAST_EPOCH" ]]; then
    _update_dotfiles_checkstamp && return 0;
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt 6 ]; then
    _dotfiles_update_check
  fi
else
  # create the dotfiles update file
  _update_dotfiles_checkstamp
fi
