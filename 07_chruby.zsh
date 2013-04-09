if (( $+commands[brew] )); then
  base=`brew --prefix`
  chruby=$base/opt/chruby/share/chruby/chruby.sh

  rbs=$HOME/.rbenv/versions/*
  if [[ -d $rbs ]]; then
    RUBIES=($rbs)
  fi

  if [[ -e $chruby ]]; then
    source $chruby
    source $base/opt/chruby/share/chruby/auto.sh
  fi
fi
