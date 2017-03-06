# ZSH Theme - Preview: http://dl.dropbox.com/u/4109351/pics/gnzh-zsh-theme.png
# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{16}%n%f'
  PR_USER_OP='%F{16}%#%f'
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER='%F{16}%n%f'
  PR_USER_OP='%F{16}%#%f'
  PR_PROMPT='%F{16}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{16}%M%f' # SSH
else
  PR_HOST='%F{16}%M%f' # no SSH
fi


# local return_code="%(?..%F{red}%? ↵%f)"
local return_code="%(?..%K{15} %F{16}%?%f %k)"

local user_host="%K{15} ${PR_USER}%F{16}@${PR_HOST} %k"
local current_dir="%K{14} %F{16}%~%f %k"
local rvm_ruby=''
if ${HOME}/.rvm/bin/rvm-prompt &> /dev/null; then # detect user-local rvm installation
  rvm_ruby='%K{14} %F{16}$(${HOME}/.rvm/bin/rvm-prompt i v g s)%f %k'
elif which rvm-prompt &> /dev/null; then # detect system-wide rvm installation
  rvm_ruby='%F{red}‹$(rvm-prompt i v g s)›%f'
elif which rbenv &> /dev/null; then # detect Simple Ruby Version Management
  rvm_ruby='%F{red}‹$(rbenv version | sed -e "s/ (set.*$//")›%f'
fi
local git_branch='$(git_prompt_info)'

PROMPT="${user_host} ${current_dir} ${rvm_ruby} ${git_branch} ${return_code}
$ "
# RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%K{14} %F{16}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f %k"

}
