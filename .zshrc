export ZSH=/home/vasectomio/.oh-my-zsh
ZSH_THEME="nicoulaj"
DEFAULT_USER="vasectomio"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)
eval $(thefuck --alias fuck)
. ~/.z.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh

echo ">^.^<"
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/vasectomio/.sdkman"
[[ -s "/home/vasectomio/.sdkman/bin/sdkman-init.sh" ]] && source "/home/vasectomio/.sdkman/bin/sdkman-init.sh"

export PATH="/home/vasectomio/.vim/bundle/vim-live-latex-preview/bin:/home/vasectomio/.gem/ruby/2.4.0/bin:$PATH"

# resty
source ~/.restyexec

export EDITOR='nvim'
export VISUAL='nvim'
#set locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#aliases
alias node="nodejs"
alias config='/usr/bin/git --git-dir=/home/vasectomio/.cfg/ --work-tree=/home/vasectomio'

#keybindings

