#!/usr/bin/env sh

ps f -o pid,pcpu,pmem,start,time,command -p `lsof -n -w -t /dev/nvidia*`

