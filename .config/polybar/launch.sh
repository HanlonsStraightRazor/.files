#!/usr/bin/env bash

# Terminate already running bar instances
# and wait for them to terminate
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null
do
  sleep 0.5
done

# Launch bar_i3
polybar bar_i3 & disown

# Display message
echo "Polybar launched..."
