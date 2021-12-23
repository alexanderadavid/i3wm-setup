# theme
ZSH_THEME="minimal"

# path
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/Scripts/bin

export BROWSER=$(which google-chrome-stable)
# aliases
alias gco="git checkout"
alias gs="git status"
alias gb="git branch"
alias gcam="git commit --amend"
alias gp="git pull"
alias vscd='f() { code $1; cd $1 };f'
alias devChrome='google-chrome-stable --disable-web-security'

# plugins
plugins=(git docker last-working-dir golang heroku node)
source $ZSH/oh-my-zsh.sh
source <(npm completion)

# keyboard
bindkey '^H' backward-kill-word 
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# keeping our env separate so we don't check secrets into version control
# source $HOME/.env
