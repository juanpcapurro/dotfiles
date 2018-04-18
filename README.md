# dotfiles
[I'm not a smart person, i copypaste stuff](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

## Preconditions
* an ssh key registered to a GitHub user.
Cloning via HTTPS is a pain for private rep 8os.
* git, obviously
* python, with a few global packages: #TODO

## How to get my rice
to use the alias for the first time: 
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Use your own git url if you cloned the repo and would like to
# modify the configs, which I encourage you to do.
git clone --bare git@github.com:juanpcapurro/dotfiles.git $HOME/.cfg
config checkout
```

## neovim files
[vim-plug]() is used for plugin management.

### other notes

