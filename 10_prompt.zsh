setopt prompt_subst

if [ "$(whoami)" = "root" ]; then NCOLOR="red"; else NCOLOR="green"; fi

PROMPT='%{$reset_color%B%n%b@%m %{$fg_bold[blue]%~%} %{$reset_color%} `git-prompt` %}
%(!.#.$) '

RPROMPT=''

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg_no_bold[red]%}%B"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%}%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_CLEAN=""

GIT_PROMPT_CLEAN=""
GIT_PROMPT_CLEAN_COLOR="green"
# GIT_PROMPT_DIRTY="±"
GIT_PROMPT_DIRTY=""
GIT_PROMPT_DIRTY_COLOR="red"
