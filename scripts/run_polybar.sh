#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar note

NR_OF_MONITORS=$(xrandr -d :0 -q | grep ' connected' | wc -l)
# IS_NOTE=$(xrandr -d :0 -q | grep ' connected' | awk '{print $1}' | grep 'LVDS' | wc -l)
# if [ $IS_NOTE = "1" ]; then
#     polybar note 
# elif [ $NR_OF_MONITORS = "1" ]; then
#     polybar left 
# else
#     polybar left & polybar right
# fi

if [ $NR_OF_MONITORS = "1" ]; then
    polybar note 
else
    polybar left & polybar right
fi
