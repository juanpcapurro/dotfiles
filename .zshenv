#variables
export PATH="$PATH:$HOME/.scripts:${HOME}/.local/bin"
export EDITOR="nvim -u ~/.config/nvim/minimal.vim"
export VISUAL='nvim'
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

#aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ssh="TERM=xterm-256color ssh"
alias fatvim="nvim -u ~/.config/nvim/fat.vim"
alias feh="feh --magick-timeout 1"
alias xclipc="xclip -selection clipboard"
