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
fpath+=~/.zfunc

autoload -U is-at-least
autoload -Uz compinit
compinit
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/prompt.sh
source ~/.zsh/fixls.zsh
source /usr/share/autojump/autojump.zsh
source ~/.zsh/oh-my-zsh/lib/*.zsh
source ~/.zsh/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/git/git.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/lol/lol.plugin.zsh
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# shell-based programs
FZF_PATH=/usr/share/doc/fzf/examples
[ -e "$FZF_PATH" ] && source "${FZF_PATH}/key-bindings.zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.secrets ] && source ~/.secrets

#keybindings
bindkey "^y" autosuggest-execute
bindkey "^ " vi-forward-word
bindkey "^u" autosuggest-accept

#aliases
unalias rm
unalias t

#functions
make(){
  command make $@ ; notify-send "Build terminada. Deja de pedorrear"
}

hex2dec (){
  echo -n $((16#${1}))
}

dec2hex (){
  printf '%x' ${1}
}

# params: gasAmount (in gas), gasPrice (in gwei), ethPrice (in usd)
# assumes eth price of 4200usd if none is provided
gas2usd (){
  if [ -z "$3" ] ; then
    ethPrice=4200
  else
    ethPrice=$3
  fi
  echo "$ethPrice * $1 * $2 *10^9 / 10^18" | bc -l
}

contractsize(){
  [ -f "${1}" ] && echo "$(cat "${1}"|jq -r '.bytecode' |wc -c)/2" |bc
}

echo ">^.^<"
#syntax highlight (wraps widgets)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
