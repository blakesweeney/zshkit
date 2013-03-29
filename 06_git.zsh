if [[ -x `which git` ]]; then

  GIT_MERGE_AUTOEDIT=no
	export GIT_MERGE_AUTOEDIT

	alias g=git
	alias gco=git-checkout
	alias gb=git-branch
  alias gst='git status'
  alias gpo='git push origin'

	function git-branch-name() {
	  git branch 2> /dev/null | grep '^\*' | sed 's/^\*\ //'
	}

	function git-dirty() {
    git status 2> /dev/null | grep "nothing to commit (working directory clean)" > /dev/null
    echo $?
	}

	function git-prompt() {
		dirty_color=$fg[$GIT_PROMPT_DIRTY_COLOR]
    clean_color=$fg[$GIT_PROMPT_CLEAN_COLOR]
    gstatus=$(git status 2> /dev/null)
    branch=`git-branch-name`
    if [[ "$branch" = "" ]]; then
      echo ""
    elif [[ `git-dirty` = 0 ]]; then
      echo "%{$clean_color%}$branch$GIT_PROMPT_CLEAN%{$reset_color%}"
    elif [[ `git-dirty` != 0 ]]; then
      echo "%{$dirty_color%}$branch$GIT_PROMPT_DIRTY%{$reset_color%}"
    fi
	}

	function github-url() {
		git config remote.origin.url | sed -En 's/git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'
	}
  alias ghu='github-url'

	# Seems to be the best OS X jump-to-github alias from http://tinyurl.com/2mtncf
	function github-go() {
		open $(github-url)
	}
  alias ggo='github-go'

fi
