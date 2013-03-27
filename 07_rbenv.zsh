if (( $+commands[rbenv] )); then
  rb_root=`rbenv root`

  rb_complete="$rb_root/completions/rbenv.zsh"
  if [[ -e "$rb_complete" ]]; then
    source "$rb_complete"
  fi

  path[1,0]="$rb_root/bin"

  eval "$(rbenv init -)"
  function ruby-version-prompt () {
    echo "$(rbenv version-name) "
  }
fi
