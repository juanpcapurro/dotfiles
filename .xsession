#!/bin/sh
TZ='America/Argentina/Buenos_Aires'; export TZ

[ -f ~/.Xresources ] && xrdb ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

# disable touchpad on thinkpad x1 carbon 5th gen
xinput set-prop 12 188 0

exec dwm > dwmlogs 2>&1
