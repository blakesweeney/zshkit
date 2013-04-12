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

alias n='_nowhere_wrapper cd'
alias nh='nowhere add'
alias nls='nowhere ls'
alias now='_nowhere_wrapper'
alias here='nowhere here'
alias there='nowhere there'
