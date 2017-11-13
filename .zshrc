bindkey -v
export KEYTIMEOUT=1

HYPHEN_INSENSITIVE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

eval $(thefuck --alias fuck)
source ~/.zsh/z.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/prompt.sh
source ~/.zsh/fixls.zsh
source ~/.zsh/oh-my-zsh/lib/history.zsh
source ~/.zsh/oh-my-zsh/lib/completion.zsh
source ~/.zsh/oh-my-zsh/lib/key-bindings.zsh
source ~/.zsh/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh

# resty
source ~/.restyexec

#variables
export EDITOR='nvim'
export VISUAL='nvim'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#aliases
alias node="nodejs"
alias la='ls -la'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#keybindings
bindkey "^y" autosuggest-execute
bindkey "^ " autosuggest-accept

#syntax highlight (wraps widgets)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
