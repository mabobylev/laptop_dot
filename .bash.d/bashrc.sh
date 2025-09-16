source "$HOME/.bash.d/init.sh"
source "$HOME/.bash.d/env.sh"
source "$HOME/.bash.d/functions.sh"
source "$HOME/.bash.d/aliases.sh"
source "$HOME/.bash.d/fzfcfg.sh"
source "$HOME/.bash.d/tools.sh"
#######################################################
# Useful settings to make the terminal better
#######################################################
[[ $- == *i* ]] && bind -f ~/.bash.d/inputrc
[[ -f ~/.dir_colors ]] && eval "$(dircolors ~/.dir_colors)"
