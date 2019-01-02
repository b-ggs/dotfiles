local USER_HOST="%K{9} %F{0}%n%f%F{0}@%F{0}%m%f %k "
[[ -n "$IS_SSH" ]] && local IS_SSH_PROMPT='%K{12} %F{0}SSH%f %k '
local PWD_PROMPT="%K{12} %F{0}%~%f %k"
[[ -n "$(command -v chruby 2> /dev/null)" ]] && local CHRUBY_PROMPT=' %K{12} %F{0}chruby@$(chruby_prompt_info)%f %k'
ZSH_THEME_GIT_PROMPT_PREFIX=" %K{12} %F{0}git@"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f %k"
local GIT_PROMPT='$(git_prompt_info)'
local RETURN_PROMPT="%(?.. %K{12} %F{0}%?%f %k)"

PROMPT="${USER_HOST}${IS_SSH_PROMPT}${PWD_PROMPT}${CHRUBY_PROMPT}${GIT_PROMPT}${RETURN_PROMPT}"$'\n'"ⵄ "