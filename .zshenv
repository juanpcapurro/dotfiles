#variables
export PATH="$PATH:$HOME/.scripts:${HOME}/.local/bin"
export EDITOR="nvim"
export VISUAL='nvim'
export TERMINAL="terminator"
export BROWSER="qutebrowser"
export READER="zathura"

export NVM_DIR="$HOME/.nvm"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=$PATH:$JAVA_HOME/bin
export GRADLE_HOME=/opt/gradle/gradle-2.13
export PATH=$PATH:/opt/gradle/gradle-2.13/bin
export ANDROID_HOME=/home/capurro/Android/Sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

#aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# functions
launch(){
  command $@ &>/dev/null & disown
}
