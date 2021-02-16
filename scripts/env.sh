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

