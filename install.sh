#!/bin/sh

# install zsh
echo "install zsh"
sudo apt install zsh zsh-completions
curl -L http://install.ohmyz.sh | sh

echo "install vim"
./scripts/vim_install.sh

echo "install termite"
./scripts/termite_install.sh
ln -sf ~/dotfiles/.config/termite ~/.config/termite

echo "install rofi"
sudo add-apt-repository ppa:jasonpleau/rofi
sudo apt update
sudo apt install rofi

echo "install polybar"
ln -sf ~/dotfiles/.config/polybar ~/.config/polybar

echo "install ranger"
mkdir -p ~/.config/ranger/
ln -sf ~/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf 

echo "install fontes"
ln -sf ~/dotfiles/.fonts ~/.font

echo "install i3"
ln -sf $(realpath .i3) ~/.config/i3

echo "install scrot"
sudo apt install scrot
mkdir -p ~/Pictures

echo "install hyper"
ln -sf ~/dotfiles/hyper/.hyper.js ~/.hyper.js 
ln -sf ~/dotfiles/hyper/.hyper_plugins  ~/.hyper_plugins 

echo "installation complete."
