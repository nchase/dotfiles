# set up EDITOR and TERM:
EDITOR=vim
TERM=xterm-256color
SHELL=/bin/zsh


# add python to path for powerline support:
PATH=$PATH:$HOME/Library/Python/3.9/bin
# spin up powerline:
. ~/Library/Python/3.8/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# aliases:
source ~/.shell-aliases

# history configuration:
source ~/.shell-history

alias vim="nvim"

# use bash-style word selection:
autoload -U select-word-style
select-word-style bash
# (allows alt+delete to delete to reasonable boundaries, like slashes.
#  by default zsh is very liberal in what it considers word boundaries.)

# add fzf defaults:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ignore git directory, follow symbolic links:
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# nvm:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go:
export GOPATH=~/.go

# ---

# Lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/noah/.zshrc'

autoload -Uz compinit
compinit

# rebuilt autocompletion lookup table without having to restart:
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# add important directories to PATH:
export PATH=./node_modules/.bin:$PATH
export PATH=../node_modules/.bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"


# add additional/machine-specific configuration:
source ~/.etcrc
