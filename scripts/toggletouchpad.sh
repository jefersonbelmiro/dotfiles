#!/bin/bash

# manjaro
# if synclient -l | grep "TouchpadOff .*=.*0" ; then
#     synclient TouchpadOff=1 ;
# else
#     synclient TouchpadOff=0 ;
# fi

# ubuntu
device="SynPS/2 Synaptics Touchpad"
state=$(xinput list-props “$device” | grep “Device Enabled” | cut -f3)
echo $state

if [ $state == 1 ]; then
    xinput --disable "$device"
else
    xinput --enable "$device"
fi
