if [[ -x `which git` ]]; then

	alias g=git
	alias gco=git-checkout
	alias gb=git-branch
  alias gst='git status'
  alias gpo='git push origin'

  # get the name of the branch we are on
  # function git-info() {
  #   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  #   echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  # }

  # Checks if working tree is dirty
  # parse_git_dirty() {
  #   local SUBMODULE_SYNTAX=''
  #   if [[ $POST_1_7_2_GIT -gt 0 ]]; then
  #         SUBMODULE_SYNTAX="--ignore-submodules=dirty"
  #   fi
  #   if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
  #     echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  #   else
  #     echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  #   fi
  # }

	function git-branch-name () {
	  git branch 2> /dev/null | grep '^\*' | sed 's/^\*\ //'
	}

	function git-dirty () {
    git status 2> /dev/null | grep "nothing to commit (working directory clean)" > /dev/null
    echo $?
	}

  function git-need-to-push() {
    if pushtime=$(echo $1 | grep 'Your branch is ahead' 2> /dev/null); then
      echo "↑"
    fi
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

	function git-track () {
		branch=$(git-branch-name)
		git config branch.$branch.remote origin
		git config branch.$branch.merge refs/heads/$branch
		echo "tracking origin/$origin"
	}

	function github-init () {
		git config branch.$(git-branch-name).remote origin
		git config branch.$(git-branch-name).merge refs/heads/$(git-branch-name)
	}

	function github-url () {
		git config remote.origin.url | sed -En 's/git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'
	}

	# Seems to be the best OS X jump-to-github alias from http://tinyurl.com/2mtncf
	function github-go () {
		open $(github-url)
	}

  #compare the provided version of git to the version installed and on path
  #prints 1 if input version <= installed version
  #prints -1 otherwise
  # function git_compare_version() {
  #   local INPUT_GIT_VERSION=$1;
  #   local INSTALLED_GIT_VERSION
  #   INPUT_GIT_VERSION=(${(s/./)INPUT_GIT_VERSION});
  #   INSTALLED_GIT_VERSION=($(git --version));
  #   INSTALLED_GIT_VERSION=(${(s/./)INSTALLED_GIT_VERSION[3]});

  #   for i in {1..3}; do
  #     if [[ $INSTALLED_GIT_VERSION[$i] -lt $INPUT_GIT_VERSION[$i] ]]; then
  #       echo -1
  #       return 0
  #     fi
  #   done
  #   echo 1
  # }

  #this is unlikely to change so make it all statically assigned
  # POST_1_7_2_GIT=$(git_compare_version "1.7.2")
  #clean up the namespace slightly by removing the checker function
  # unset -f git_compare_version

fi
