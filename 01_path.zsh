# From:
# http://unix.stackexchange.com/questions/62579/is-there-a-way-to-add-a-directory-to-my-path-in-zsh-only-if-its-not-already-pre
typeset -U path

path=($path /usr/local/bin $HOME/.local/bin)
BREW_HOME=`brew --prefix`

path=($HOME/bin $HOME/Applications/scripts $path)
path=($path /usr/texbin /usr/sbin)
path=($path $BREW_HOME/share/python $BREW_HOME/share/python3 $BREW_HOME/share/npm/bin)

# From:
# http://stackoverflow.com/questions/9347478/how-to-edit-path-variable-in-zsh
path=($^path(N))
