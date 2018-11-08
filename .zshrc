ZSH=$HOME/.oh-my-zsh

ZSH_THEME="noah"
EDITOR=vim
SHELL=/bin/zsh

DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"



# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git npm)
source $ZSH/oh-my-zsh.sh
# Disable hostname completion
zstyle ':completion:*' hosts off
# disable git completion attempts. hellishly slow:
compdef -d git

__git_files () {
  _wanted files expl 'local files' _files
}

autoload compinit; compinit

source $HOME/.environment-etc
source $HOME/.environment-npm-completion

