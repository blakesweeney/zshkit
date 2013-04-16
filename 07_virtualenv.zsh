if (( $+commands[brew ] )); then
  export WORKON_HOME="$HOME/.pyenv/"
  BREW_HOME=`brew --prefix`
  export VIRTUALENVWRAPPER_PYTHON="$BREW_HOME/bin/python"
  source "$commands[virtualenvwrapper.sh]"
fi
