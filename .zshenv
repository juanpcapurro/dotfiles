#variables
export PATH="$PATH:$HOME/.scripts:${HOME}/.local/bin:/usr/sbin:/sbin"
export EDITOR="nvim"
export VISUAL='nvim -u ~/.config/nvim/fat.vim'
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"

export NVM_DIR="$HOME/.nvm"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export MPV_SOCKET="${HOME}/.mpv/socket"

# for i3 thingies
export HEADSET_ADDR="00:1E:7C:35:93:29"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=$PATH:$JAVA_HOME/bin
export GRADLE_HOME=/opt/gradle/gradle-2.13
export PATH=$PATH:/opt/gradle/gradle-2.13/bin
export ANDROID_HOME=/home/capurro/Android/Sdk
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.cargo/bin:$PATH"

#aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ssh="TERM=xterm-256color ssh"
alias fatvim="nvim -u ~/.config/nvim/fat.vim"
alias feh="feh --magick-timeout 1"
alias xclipc="xclip -selection clipboard"
