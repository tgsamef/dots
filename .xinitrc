#!/bin/sh
# http://github.com/tgsamef  ___
#                          /'___\
# same-f [.dotfiles]      /\ \__/
#  ___  __ _ _ __ ___   __\ \ ,__\
# / __|/ _` | '_ ` _ \ / _ \ \ \_/
# \__ \ (_| | | | | | |  __/\ \ \
# |___/\__,_|_| |_| |_|\___| \/_/
#______________________________________
# .xinitrc

[ -f ~/.xprofile ] && source ~/.xprofile

if [ -f $HOME/.Xresources ]; then
    xrdb -merge $HOME/.Xresources
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

dbus-update-activation-environment

exec i3

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
mkdir -p "$HOME"/.local/share/keyrings