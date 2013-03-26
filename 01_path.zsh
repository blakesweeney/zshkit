path=($path /usr/local/bin $HOME/.local/bin)
BREW_HOME=`brew --prefix`

path=($HOME/bin $HOME/Applications/scripts $path)
path=($path /usr/texbin /usr/sbin)
path=($path $BREW_HOME/share/python $BREW_HOME/share/python3 $BREW_HOME/share/npm/bin)
