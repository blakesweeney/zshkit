if [[ -d "$HOME/.rbenv" ]]; then
  rb_complete="$HOME/.rbenv/completions/rbenv.zsh"
  if [[ -e "$rb_complete" ]]; then
    source "$rb_complete"
  fi

  PATH="$HOME/.rbenv/bin":$PATH
  eval "$(rbenv init -)"
  function ruby-version-prompt () {
    echo "$(rbenv version-name) "
  }
fi
