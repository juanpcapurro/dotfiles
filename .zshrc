DEFAULT_USER="vasectomio"
bindkey -v

HYPHEN_INSENSITIVE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

eval $(thefuck --alias fuck)
source ~/.zsh/z.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/prompt.sh
source ~/.zsh/oh-my-zsh/lib/history.zsh
source ~/.zsh/oh-my-zsh/lib/completion.zsh
source ~/.zsh/oh-my-zsh/lib/key-bindings.zsh
source ~/.zsh/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh

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
alias config='/usr/bin/git --git-dir=/home/vasectomio/.cfg/ --work-tree=/home/vasectomio'

#keybindings
function accept_suggestion() {
    zle history-beginning-search-backward
    zle accept-line
}
zle -N accept_suggestion
bindkey "^y" accept_suggestion
