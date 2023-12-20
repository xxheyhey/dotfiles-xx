#xrandr --newmode "2560x1440_165.00"  938.50  2560 2792 3072 3584  1440 1443 1448 1588 -hsync +vsync
#xrandr --addmode Virtual-1 2560x1440_165.00
#xrandr --output Virtual-1 --mode 2560x1440_165.00
xrandr --dpi 144
xset r rate 240 30
xset b off

~/.fehbg &
picom &
slstatus &
nm-applet &
dunst &
numlockx &
flameshot &
xautolock -time 5 -locker slock -corners 000- -detectsleep &

xrdb ~/.Xresources
setxkbmap -option "compose:ralt"

xbindkeys
exec dwm
