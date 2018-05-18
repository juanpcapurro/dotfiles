bindkey -v
export KEYTIMEOUT=1

HYPHEN_INSENSITIVE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
export HISTSIZE=10000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

autoload -U is-at-least
autoload -Uz compinit
compinit
eval $(thefuck --alias fuck)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/prompt.sh
source ~/.zsh/fixls.zsh
source /usr/share/autojump/autojump.zsh
source ~/.zsh/oh-my-zsh/lib/*.zsh
source ~/.zsh/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/git/git.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/lol/lol.plugin.zsh
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# shell-based programs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.restyexec
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#variables
export EDITOR='nvim'
export VISUAL='nvim'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
unalias rm

#keybindings
bindkey "^y" autosuggest-execute
bindkey "^ " vi-forward-word
bindkey "^u" autosuggest-accept

#functions
make(){
  command make $@ ; notify-send "Build terminada. Deja de pedorrear"
}
launch(){
  command $@ &>/dev/null & disown
}

#syntax highlight (wraps widgets)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
echo ">^.^<"
