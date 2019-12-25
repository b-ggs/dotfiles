local USER_HOST="%F{1}%n%f%F{1}@%F{1}%m%f "
[[ -n "$SSH_CLIENT" ]] && local SSH_CLIENT_PROMPT='%F{0}SSH%f %k '
local PWD_PROMPT="%F{4}%~%f"
ZSH_THEME_GIT_PROMPT_PREFIX=" %K{12} %F{0}git@"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f %k"
local GIT_PROMPT='$(git_prompt_info)'
local RETURN_PROMPT="%(?.. %K{12} %F{0}%?%f %k)"

PROMPT="${USER_HOST}${SSH_CLIENT_PROMPT}${PWD_PROMPT}${GIT_PROMPT}${RETURN_PROMPT}"$'\n'"$ "
