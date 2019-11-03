#!/bin/sh

# gnome-keyring
# source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
dbus-update-activation-environment --systemd DISPLAY

[ -f ~/.Xresources ] && xrdb ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

exec i3 >i3logs 2>&1
# exec dwm > dwmlogs 2>&1
