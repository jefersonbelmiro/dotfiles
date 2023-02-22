#!/usr/bin/env bash

export EDITOR=vim
export PAGER=less
export LESS="-iMSx4 -FX"
export PGUSER="postgres"
export PGPORT=5432

# https://github.com/mhinz/neovim-remote
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
fi

[ -s ~/.local.env ] && \. ~/.local.env

export FrameworkPathOverride=/usr/lib/mono/4.7.1-api


alias jest-coverage="jest --coverage --coverage-reporters=text --verbose"

ssh-login() {
   eval `ssh-agent -s`
   ssh-add ~/.ssh/id_rsa
}

# set 3min screen turn off
# xset dpms 180

# set keyboard language
# setxkbmap us

# set wacom table screen lock
# xsetwacom set "Wacom Intuos S Pen eraser" MapToOutput HDMI-1
# xsetwacom set "Wacom Intuos S Pen stylus" MapToOutput HDMI-1

