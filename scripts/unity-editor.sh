#!/bin/bash
[ -n "$1" ] && file=$1
export FrameworkPathOverride=/usr/lib/mono/4.7.1-api
# vim --servername= unity --remote-tab-silent $file 
# nvr --servername="unity" "$file" 
nvr "$file" 
