PROMPT=''

# User and host
local PR_USER='%F{0}%n%f'
local PR_HOST='%F{0}%M%f'
local user_host="%K{9} ${PR_USER}%F{0}@${PR_HOST} %k"
PROMPT="${PROMPT}${user_host}"

# CWD
local current_dir=" %K{12} %F{0}%~%f %k"
PROMPT="${PROMPT}${current_dir}"

# rvm or rbenv
if which rvm-prompt &> /dev/null; then # detect user-local rvm installation
  local rvm_ruby=' %K{12} %F{0}$(rvm-prompt i v g s)%f %k'
  PROMPT="${PROMPT}${rvm_ruby}"
elif which rbenv &> /dev/null; then
  local rvm_ruby=' %F{red}‹$(rbenv version | sed -e "s/ (set.*$//")›%f'
  PROMPT="${PROMPT}${rvm_ruby}"
fi

# Node version
if which node &> /dev/null; then
  node_version=' %K{12} %F{0}node-$(node -v)%f %k'
  PROMPT="${PROMPT}${node_version}"
fi

# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%K{12} %F{0}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f %k"
local git_branch=' $(git_prompt_info)'
PROMPT="${PROMPT}${git_branch}"

# Return code
local return_code=" %(?..%K{9} %F{0}%?%f %k)"
PROMPT="${PROMPT}${return_code}"

# End prompt
PROMPT="${PROMPT}"$'\n'"$ "
