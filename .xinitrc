# merge in defaults and keymaps
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Startup applications
xsetroot -cursor_name left_ptr
xset r rate 300 50
setxkbmap -layout br -variant abnt2  
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
eval $(ssh-agent)
feh --bg-scale /usr/share/backgrounds/4.jpg &
picom --config $HOME/.config/picom/picom.conf &
slstatus &

# WM
exec dwm 
