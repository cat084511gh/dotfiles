# alias
alias vim='nvim'
alias glo='git log --oneline'
alias gst='git status'
alias gui='kex --sl -s'
alias ls='ls --color=auto'
alias memo='vim ~/various/memo'
# git
source /cat0-dotfiles/git-completion.bash

# PS1
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
BLUE="\[\e[1;34m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
WHITE="\[\e[00m\]"
ORANGE="\[\e[38;5;208m\]"
# PS1="${BLUE}┌${GREEN}[cat0]${BLUE}:\W${RED}\$(parse_git_branch)\n${BLUE}└${RED}#${WHITE} "
PS1="\[\e[0m\]\[\e[38;5;0m\]\[\e[48;5;119m\] \W \[\e[0m\]\[\e[38;5;119m\]\[\e[0m\]${RED}\$(parse_git_branch)\n\[\e[00m\]\[\e[38;5;119m\]\[\e[0m\]$ "
