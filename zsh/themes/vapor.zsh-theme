PROMPT=""

# User and host
local user_host="%K{9} %F{0}%n%f%F{0}@%F{0}%M%f %k "
PROMPT="${PROMPT}${user_host}"

# CWD
local current_dir="%K{12} %F{0}%~%f %k"
PROMPT="${PROMPT}${current_dir}"

# Git
ZSH_THEME_GIT_PROMPT_PREFIX=" %K{12} %F{0}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f %k"
local git_branch='$(git_prompt_info)'
PROMPT="${PROMPT}${git_branch}"

# End prompt
PROMPT="${PROMPT}"$'\n'"$ "
