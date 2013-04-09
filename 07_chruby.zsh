if (( $+commands[brew] )); then
  base=`brew --prefix`
  chruby="$base/opt/chruby/share/chruby/chruby.sh"

  if [[ -e $chruby ]]; then
    source $chruby
    source $base/opt/chruby/share/chruby/auto.sh
  fi

  rbs="$HOME/.rbenv/versions"
  if [[ -d "$rbs" ]]; then
    RUBIES=($rbs/*)
  fi

fi
