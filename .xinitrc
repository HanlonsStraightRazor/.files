# WARNING: THESE MASSIVELY SLOW DOWN GIT COMMITS.
# The Gentoo Wiki recommends these for use with the nm-applet,
# but the lag is too annoying for me.
# Ensure dbus is either already running, or safely start it
# if [[ -z "${DBUS_SESSION_BUS_ADDRESS}" ]]
# then
#     eval $(dbus-launch --sh-syntax --exit-with-session)
# fi

# Make the keyring daemon ready to communicate with nm-applet
# export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

# Start Network Manager GTK applet
nm-applet &

# Start compositor (for transparency)
picom &

# Start Redshift
redshift &

# Hide mouse after 3 seconds of inactivity
unclutter -idle 3 &

# Start keyboard and mouse configuration applet (if applicable)
if [[ $(command -v polychromatic-tray-applet) ]]
then
    polychromatic-tray-applet &
fi

# Launch PipeWire using Gentoo's specific launcher (if installed)
if [[ $(command -v gentoo-pipewire-launcher) ]]
then
    gentoo-pipewire-launcher &
fi

# Start keyboard and mouse configuration daemon
openrazer-daemon

# Turn on num lock
numlockx

# Activate custom X keybindings
xbindkeys

# Disable screen timeout & power saving
xset s off
xset -dpms

# Build font information cache files
fc-cache -vf

# Load .Xresources
xrdb ~/.Xresources

# Set random background image
feh --bg-fill --randomize ~/.wallpaper

# Start i3
exec dbus-launch --exit-with-session i3
