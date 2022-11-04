#!/bin/sh

[ -f ~/.Xresources ] && xrdb ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

while :; do
  ssh-agent dwm > dwmlogs 2>&1
done
