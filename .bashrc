#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disaable ctrk-s and ctrl-q in shell
stty -ixon

#######################################################
[[ -f /usr/share/bash-preexec/bash-preexec.sh ]] && source /usr/share/bash-preexec/bash-preexec.sh
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
[[ -f /usr/share/doc/pkgfile/command-not-found.bash ]] && source /usr/share/doc/pkgfile/command-not-found.bash
# [[ -f /usr/share/bash-completion/completions/zellij ]] && source /usr/share/bash-completion/completions/zellij
# [[ -f $HOME/.bash.d/bash_cht.sh ]] && source $HOME/.bash.d/bash_cht.sh
# [[ -f $HOME/.bash.d/alacritty.bash ]] && source $HOME/.bash.d/alacritty.bash
# [[ -f $HOME/.local/share/blesh/ble.sh ]] && source $HOME/.local/share/blesh/ble.sh

#######################################################
# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
#######################################################
shopt -s checkwinsize

#######################################################
# Expand the history size
#######################################################
export HISTFILESIZE=10000
export HISTSIZE=1000
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace
# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
#######################################################
shopt -s autocd
shopt -s dirspell
shopt -s cdspell

#######################################################
# To have colors for ls and all grep commands such as grep, egrep and zgrep
#######################################################
export CLICOLOR=1
# export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

export LESS_TERMCAP_mb=$'\e[1;36m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[1;37m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;34m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;34m'

PS1='[\u@\h \W]\$ '

export PATH="${PATH}:${HOME}/.local/bin/"

# Function for creating a new directory and entering it
mcd() {
  mkdir -p "$@" && cd "$@"
}

# Function for git auto commit and push
gcp() {
  read -r -p "Commit message: " commit_msg
  git commit -a -m "$commit_msg"
  git push
}

# Function for rsync copy
cpr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
}

# Function for rsync move
mvr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
}

# function to check if a command exists
command_exist() {
  command -v "$1" >/dev/null 2>&1
}

alias cpv='rsync -ah --info=progress2'
# check if lsd or eza is installed

if command_exist lsd; then
  # alias ls='eza --icons=always'
  alias ls='lsd --color=always'
else
  alias ls='ls --color=always'
fi
alias la='ls -a'
alias ll='ls -l'
alias lt='ls --tree --level=1 --no-time --no-user --no-permissions'
# check if ripgrep is installed
if command_exist rg; then
  alias grep='rg'
else
  alias grep='grep --color=auto'
fi
# check if bat is installed
if command_exist bat; then
  alias cat='bat -n'
fi
# check if nvim is installed
if command_exist nvim; then
  alias v='nvim'
  alias vi='nvim'
fi
alias svi='sudo vi'
alias mkdir='mkdir -p'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
#alias pbcopy='xclip -selection clipboard'
#alias pbpaste='xclip -selection clipboard -o'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Alias's for git
alias gu='git add . && git commit -a -m "Update" && git push'
alias gc='git clone'
alias gp='git push'
alias gl='git pull'
alias gs='git status'

# Alias for my dotfiles repos
alias dtf='/usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME"'

# Alias's for paru or yay
if command_exist paru; then
  alias pkgm='paru'
elif command_exist yay; then
  alias pkgm='yay'
else
  alias pkgm='pacman'
fi
alias pkgi='pkgm --noconfirm --needed -S'
alias pkgu='pkgm --noconfirm --needed -Syu'
alias pkgs='pkgm -Ss'
alias pkgc='pkgm --noconfirm -Scc'
alias pkgr='pkgm -Rns'
alias pkgd='pkgm --noconfirm --needed -Syyu; pkgm --noconfirm -Scc'

#######################################################
# Useful settings to make the terminal better
#######################################################
[[ -f ~/.dir_colors ]] && eval "$(dircolors ~/.dir_colors)"
eval "$(fzf --bash)"
eval "$(thefuck --alias)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
