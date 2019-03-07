#variables
export PATH="$PATH:$HOME/.scripts:${HOME}/.local/bin"
export EDITOR="minvim"
export VISUAL='nvim'
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"

export NVM_DIR="$HOME/.nvm"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ssh="TERM=xterm-256color ssh"
alias minvim="nvim -u ~/.config/nvim/minimal.vim"
alias feh="feh --magick-timeout 1"

# functions
launch(){
  command $@ &>/dev/null & disown
}
