export SUB_HOME="$HOME/.subs"

function sub-update {
  . $SUB_HOME/init
}

if [[ ! -d "$SUB_HOME/bin" ]]; then
  mkdir -p "$SUB_HOME/bin"
fi

if [[ -e "$SUB_HOME/init" ]]; then
  sub-update
fi

alias n='nowhere cd'
alias nh='nowhere add'
alias nls='nowhere ls'
alias now='nowhere'
alias here='nowhere here'
alias there='nowhere there'
