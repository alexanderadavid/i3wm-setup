# theme
ZSH_THEME="robbyrussell"

# path
export ZSH="/home/alex/.oh-my-zsh"
export PATH=$PATH:/home/alex/.local/bin
export PATH=$PATH:/usr/local/go/bin

# aliases
alias gco="git checkout"
alias gs="git status"
alias gb="git branch"
alias gcam="git commit --amend"
alias gp="git pull"
alias vscd='f() { code $1; cd $1 };f'

# plugins
plugins=(git docker)
source $ZSH/oh-my-zsh.sh
source <(npm completion)

# keyboard
bindkey '^H' backward-kill-word 
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
