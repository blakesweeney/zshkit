export SUB_HOME="$HOME/.subs"

if [[ ! -d "$SUB_HOME" ]]; then
  mkdir "$SUB_HOME"
fi

emtpy=`find "$SUB_HOME" -maxdepth 0 -empty | read`
if [[ $? -eq 1 ]]; then
  for dir in $SUB_HOME/*; do
    name=`basename $dir`
    if [[ -x "$dir/bin/init" ]]; then
      eval "$($dir/bin/init -)"
    else
      path=($path $dir/bin)
      eval "$($name init -)"
    fi
  done
fi
