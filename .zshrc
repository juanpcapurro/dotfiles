DEFAULT_USER="vasectomio"
bindkey -v
export KEYTIMEOUT=1
export TERM=xterm-256color

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

echo ">^.^<"
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/vasectomio/.sdkman"
[[ -s "/home/vasectomio/.sdkman/bin/sdkman-init.sh" ]] && source "/home/vasectomio/.sdkman/bin/sdkman-init.sh"

export PATH="/home/vasectomio/.config/nvim/plugged/vim-live-latex-preview/bin:/home/vasectomio/.gem/ruby/2.4.0/bin:$PATH"

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
alias config='/usr/bin/git --git-dir=/home/vasectomio/.cfg/ --work-tree=/home/vasectomio'

#keybindings
bindkey "^y" autosuggest-execute
bindkey "^ " vi-forward-word
bindkey "^u" autosuggest-accept

#syntax highlight (wraps widgets)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

make(){
    command make $@ ; notify-send "Build terminada. Deja de pedorrear"
}
