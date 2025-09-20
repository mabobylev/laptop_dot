#######################################################
# FZF settings
#######################################################
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="
  --layout=reverse
  --color=fg:#ECEFF4,fg+:#EBCB8B,bg+:#3B4252
  --color=hl:#81A1C1,hl+:#5E81AC,info:#A3BE8C,marker:#3B4252
  --color=pointer:#BF616A,spinner:#af5fff,prompt:#876253,header:#87afaf"
# --info=inline
# --border
# --pointer 
# --height 40%
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
# --color=selected-bg:#45475a \
# --color=border:#313244,label:#cdd6f4"
# Preview file content using bat
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target,PortProton
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
