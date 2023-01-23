#!/bin/sh
TZ='America/Argentina/Buenos_Aires'; export TZ

[ -f ~/.Xresources ] && xrdb ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

exec awesome 2>&1 > ~/tmp/awesomelogs
