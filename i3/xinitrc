#!/bin/bash

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x "$f" ]] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if command -v ibus-daemon > /dev/null; then
  export GTK_IM_MODULE=xim
  export XMODIFIERS=@im=ibus
  export QT_IM_MODULE=xim
  ibus-daemon -drx --xim
fi

exec i3
