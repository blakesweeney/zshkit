export N_HOME=$HOME/.config/now

function n
{
    link="$N_HOME/$1"
    if [[ ! -e "$link" ]]; then
      echo "Link does not exist"
    else
      cd `readlink "$link"`
      pwd
      ls
    fi
}
