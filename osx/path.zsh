if [ $OSX ]; then
  # If Postgres.app is installed then include its bin
  pg_app_bin="/Applications/Postgres.app/Contents/Versions/9.3/bin"
  if [[ -d $pg_app_bin ]]; then
    export PATH="$pg_app_bin:$PATH"
  fi

  export PATH="/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"
fi
