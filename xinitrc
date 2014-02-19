#!/bin/sh

# configure zshrc
. ~/.zshrc

# configure ssh agent
ssh-agent quartz-wm --only-proxy

# configure X11
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xsetroot -solid dark
xsetroot -cursor_name left_ptr
xsetroot general

xset fp+ /opt/local/share/fonts/
xset fp rehash

# urxvt daemon server
urxvtd --quiet --opendisplay --fork

# start urxvt client
urxvtc &

# setup dwm

while true
do
  xsetroot -name "`date +"%H:%M"`"
  xset r rate 250 30
  xset b off
  sleep 5
done &

exec dwm
