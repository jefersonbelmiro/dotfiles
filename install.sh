#!/bin/sh

echo "install git"
sudo apt install git

echo "install curl"
sudo apt install curl

echo "install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# install zsh
echo "install zsh"
# sudo apt install zsh zsh-completions
# curl -L http://install.ohmyz.sh | sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source \$HOME/dotfiles/scripts/env.sh" >> ~/.zshrc

echo "install ripgrep"
sudo apt install ripgrep

echo "install vim"
./scripts/install_vim.sh

echo "install rofi"
sudo add-apt-repository ppa:jasonpleau/rofi
sudo apt update
sudo apt install rofi

echo "install polybar"
ln -sf ~/dotfiles/.config/polybar ~/.config/polybar
./scripts/install_polybar.sh

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

echo "install alacritty"
./scripts/install_alacritty.sh
ln -sf ~/dotfiles/.config/alacritty ~/.config/alacritty

echo "install termite"
./scripts/install_termite.sh
ln -sf ~/dotfiles/.config/termite ~/.config/termite

echo "installation complete."
