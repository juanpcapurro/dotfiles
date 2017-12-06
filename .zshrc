DEFAULT_USER="capurro"
bindkey -v
export KEYTIMEOUT=1

HYPHEN_INSENSITIVE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

eval $(thefuck --alias fuck)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/prompt.sh
source ~/.zsh/fixls.zsh
source /usr/share/autojump/autojump.zsh
source ~/.zsh/oh-my-zsh/lib/*.zsh
source ~/.zsh/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh

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

#variables
export EDITOR='nvim'
export VISUAL='nvim'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#aliases
alias ira="ionic run android -l -c -s"
alias enepeeme="npm"
alias la='ls -la'
alias config='/usr/bin/git --git-dir=/home/capurro/.cfg/ --work-tree=/home/capurro'
alias tmux='tmux -2'

#keybindings
bindkey "^y" autosuggest-execute
bindkey "^ " autosuggest-accept

#syntax highlight (wraps widgets)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
