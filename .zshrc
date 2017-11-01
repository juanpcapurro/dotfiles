export ZSH=/home/capurro/.oh-my-zsh
ZSH_THEME="nicoulaj"
DEFAULT_USER="capurro"

HYPHEN_INSENSITIVE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)
eval $(thefuck --alias fuck)
. ~/.z.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh

echo ">^.^<"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=$PATH:$JAVA_HOME/bin
export GRADLE_HOME=/opt/gradle/gradle-2.13
export PATH=$PATH:/opt/gradle/gradle-2.13/bin
export ANDROID_HOME=/home/capurro/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.work-secrets

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/capurro/.sdkman"
[[ -s "/home/capurro/.sdkman/bin/sdkman-init.sh" ]] && source "/home/capurro/.sdkman/bin/sdkman-init.sh"

export PATH="/home/capurro/.vim/bundle/vim-live-latex-preview/bin:/home/capurro/.gem/ruby/2.4.0/bin:$PATH"

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
alias config='/usr/bin/git --git-dir=/home/capurro/.cfg/ --work-tree=/home/capurro'
alias ira="ionic run android -l -c -s"

#keybindings

