export SUB_HOME="$HOME/.subs"

if [[ ! -d "$SUB_HOME/bin" ]]; then
  mkdir -p "$SUB_HOME/bin"
fi

path+="$SUB_HOME/bin"

if [[ -e "$SUB_HOME/init" ]]; then
  . $SUB_HOME/init
fi

alias n='_nowhere_wrapper cd'
alias nh='nowhere add'
alias nls='nowhere ls'
alias now='_nowhere_wrapper'
alias here='nowhere here'
alias there='nowhere there'
