export EDITOR

function not_run_from_ssh () {
	ps x|grep "${PPID}.*sshd"|grep -v grep
	echo $?
}

if [[ -x `which mvim` ]]; then
  alias vi="mvim"
  EDITOR='mvim -f -c "au VimLeave * !open -a Terminal"'
elif [[ -x `which cvim` ]]; then
  alias vi="cvim"
  EDITOR=cvim
elif [[ -x `which gvim` ]]; then
	EDITOR=gvim
elif [[ -x `which vim` ]]; then
	EDITOR=vim
else
	EDITOR=vi
fi

# Set EDITOR as default for plaintext stuff
for s in txt c cc cxx cpp; do
	alias -s $s=$EDITOR
done

alias o=open

# Abuse the "open" command on OS X
if [[ $OSTYPE[1,6] == "darwin" ]]; then
	for s in mp3 wav aac \
		avi mp4 m4v mov qt mpg mpeg \
		jpg png psd bmp gif tif tiff \
		ps pdf html dmg; do
		alias -s $s=open
	done
fi
