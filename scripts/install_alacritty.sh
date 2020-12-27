#!/bin/sh

echo "install dependencies"
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

echo "install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup override set stable
rustup update stable

cargo install alacritty

# mkdir ~/app/alacritty -p
# git clone https://github.com/alacritty/alacritty.git ~/app/alacritty
# cd  ~/app/alacritty
# cargo build --release
#
# cd -

