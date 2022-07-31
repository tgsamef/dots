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

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
dbus-update-activation-enciroment DISPLAY XAUTHORITY
exec i3