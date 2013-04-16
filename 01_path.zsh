# Make sure the path only conatins unique entries.
# From:
# http://unix.stackexchange.com/questions/62579/is-there-a-way-to-add-a-directory-to-my-path-in-zsh-only-if-its-not-already-pre
typeset -U path

# This is for the server where things are setup differently, so I need to add
# some paths. On other machines it should be filtered out at the end.
path=(/opt/local/bin /opt/local/sbin /sw/bin /sw/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/mysql/bin/)
path+=/Applications/MATLAB_R2007b/bin 
path+=/Applications/RNAsoft/translator/bin/ 

path+="/usr/local/bin"
path+="$HOME/.local/bin"
path+="/usr/texbin"
path+="/usr/sbin"

# Add homebrew if it exists
if (( $+commands[brew] )); then
  BREW_HOME=`brew --prefix`
  path[1,0]="$BREW_HOME/bin"
  path+="$BREW_HOME/share/python"
  path+="$BREW_HOME/share/python3"
  path+="$BREW_HOME/share/npm/bin"
fi

# Prepend my scripts
path[1,0]="$HOME/bin"
path[1,0]="$HOME/Applications/scripts"

# Remove all directories which do not exist.
# From:
# http://stackoverflow.com/questions/9347478/how-to-edit-path-variable-in-zsh
path=($^path(N))
