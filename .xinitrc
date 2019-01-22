#!/bin/sh

# gnome-keyring
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

# Tray programs. The most race-conditioney are launched first.
nextcloud &
blueman-applet &
nm-applet &
volumeicon &

exec i3 >i3logs 2>&1
