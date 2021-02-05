################################################################################
# My .xprofile
################################################################################
#   ____ ____  _                       ____ _              _     _
#  / ___/ ___|| |__   __ _ _ __ _ __  / ___| |__   ___  __| | __| | __ _ _ __
# | |   \___ \| '_ \ / _` | '__| '_ \| |   | '_ \ / _ \/ _` |/ _` |/ _` | '__|
# | |___ ___) | | | | (_| | |  | |_) | |___| | | |  __/ (_| | (_| | (_| | |
#  \____|____/|_| |_|\__,_|_|  | .__/ \____|_| |_|\___|\__,_|\__,_|\__,_|_|
#                              |_|
#
################################################################################
################################################################################

# Set screen brightness at 50%
xrandr --output eDP1 --brightness 0.5

# Start compositor (for transparency)
picom &

# Hide mouse after 3 seconds of inactivity
unclutter -idle 3 &

# Fix Vim colors
USRRESOURCES=$HOME/.Xresources

# Build font information cache files
fc-cache -vf

# Load .Xresources
xrdb ~/.Xresources

# Set random background image
feh --bg-fill --randomize ~/.wallpaper

# Turn on num lock
numlockx

# Start awesome window manager
exec awesome
