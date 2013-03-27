# From:
# http://unix.stackexchange.com/questions/62579/is-there-a-way-to-add-a-directory-to-my-path-in-zsh-only-if-its-not-already-pre
typeset -U path

path=(/usr/bin /bin /usr/sbin /sbin)

path+="/usr/local/bin"
path+="$HOME/.local/bin"
path+="/usr/texbin"
path+="/usr/sbin"

BREW_HOME=`brew --prefix`
path+="$BREW_HOME/share/python"
path+="$BREW_HOME/share/python3"
path+="$BREW_HOME/share/npm/bin"

# Prepend my scripts
path[1,0]="$HOME/bin"
path[1,0]="$HOME/Applications/scripts"

# From:
# http://stackoverflow.com/questions/9347478/how-to-edit-path-variable-in-zsh
path=($^path(N))
