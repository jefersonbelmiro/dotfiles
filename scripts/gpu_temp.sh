#!/usr/bin/env sh

# nvidia-settings -q gpucoretemp
# nvidia-smi -q -d temperature

nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader
