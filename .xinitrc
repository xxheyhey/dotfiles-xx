# blueman-applet fix
systemctl --user import-environment DISPLAY

# X related starup tasks
xrandr --dpi 144
xset r rate 300 30
xset b off
xrdb ~/.Xresources
xautolock -time 5 -locker slock -corners ---- -detectsleep &
setxkbmap -option "compose:ralt"
setxkbmap -option "caps:swapescape"
xbindkeys

# Other startup apps/services
dunst &
picom &
slstatus &
~/.fehbg &
nm-applet &
blueman-applet &
numlockx &
flameshot &
volctl &

# Launch window manager
exec dwm
