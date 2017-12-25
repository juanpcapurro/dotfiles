bindkey -v
export KEYTIMEOUT=1

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
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
unalias rm

#keybindings
bindkey "^y" autosuggest-execute
bindkey "^ " vi-forward-word
bindkey "^u" autosuggest-accept
make(){
    command make $@ ; notify-send "Build terminada. Deja de pedorrear"
}

# variables required by various software
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# esptool
export ESP_HOME=/opt/esp-open-sdk
export PATH=$PATH:$ESP_HOME/esptool2
# Sming Framework
export SMING_HOME=/opt/Sming/Sming
export ESP_HOME=/opt/esp-open-sdk
#SDKMAN 
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#vim-latex-preview, ruby gems
export PATH="$HOME/.config/nvim/plugged/vim-live-latex-preview/bin:$HOME/.gem/ruby/2.4.0/bin:$PATH"

#syntax highlight (wraps widgets)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
