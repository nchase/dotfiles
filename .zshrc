# set up EDITOR and TERM:
EDITOR=vim
TERM=xterm-256color
SHELL=/bin/zsh

# assuming we have powerline installed, include that config. this path may need to change:
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# configure gg, my favorite alias for grep in git repositories:
alias gg='git grep --ignore-case --line-number'

# set up history configuration:
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt appendhistory
# we want history to be dump and pipeable, not a bounded window into the
# entirety of the history. (we have other tools for that):
alias history='fc -l 0'

# use bash-style word selection:
autoload -U select-word-style
select-word-style bash
# (allows alt+delete to delete to reasonable boundaries, like slashes.
#  by default zsh is very liberal in what it considers word boundaries.)

# add fzf defaults:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---

# Lines configured by zsh-newuser-install
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/noah/.zshrc'

autoload -Uz compinit
compinit
