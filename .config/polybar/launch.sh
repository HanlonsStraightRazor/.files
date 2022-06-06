#!/usr/bin/env bash

# Terminate already running polybar instances
killall -q polybar

# Make sure the correct temperature is displayed
# The name of the core to watch should be in a file called "name"
temp_path=$(
    for i in /sys/class/hwmon/hwmon*/temp*_input
    do
        if [[ $(<$(dirname $i)/name) == $(<~/.config/polybar/name) ]]
        then
            realpath $i
            break
        fi
    done
)
# rm -f ~/.config/polybar/temp
# ln -s -T $temp_path ~/.config/polybar/temp
sed -i "s|hwmon-path\s*=.*|hwmon-path = $temp_path|" ~/.config/polybar/config

# Launch bar_i3
polybar bar_i3 & disown
