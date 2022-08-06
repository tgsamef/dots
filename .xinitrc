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

session=${1:-i3}
case $session in
    awesome)        exec awesome;;
    bspwm)          exec bspwm;;
    cinnamon)       exec cinnamon-session;;
    dwm)            exec dwm;;
    enlightenment)  exec enlightenment_start;;
    ede)            exec startede;;
    fluxbox)        exec startfluxbox;;
    gnome)          exec gnome-session;;
    i3)             exec i3;;
    icewm)          exec icewm-session;;
    jwm)            exec jwm;;
    kde)            exec startkde;;
    mate)           exec mate-session;;
    notion)         exec notion;;
    openbox)        exec openbox-session;;
    lxde)           exec startlxde;;
    xfce)           exec startxfce4;;
    xmonad)         exec xmonad;;
    *)              exec $1;;
esac
