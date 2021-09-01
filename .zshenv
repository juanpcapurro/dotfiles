#variables
export PATH="$PATH:$HOME/.scripts:${HOME}/.local/bin:/usr/sbin:/sbin:$HOME/.cargo/bin"
export EDITOR="nvim"
export VISUAL='nvim'
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"

export NVM_DIR="$HOME/.nvm"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# for i3 thingies
export HEADSET_ADDR="94:DB:56:F0:11:D5"

#aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ssh="TERM=xterm-256color ssh"
alias fatvim="nvim -u ~/.config/nvim/fat.vim"
alias qtvim="nvim-qt -- -u ~/.config/nvim/fat.vim"
alias feh="feh --magick-timeout 1"
alias xclipc="xclip -selection clipboard"
