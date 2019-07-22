#!/bin/sh

echo "setting vim"

mkdir ~/.config/vim/undodir -p
mkdir ~/.config/vim/backup -p

# vim directories
ln -sf $(realpath vim/config) ~/.config/vim/config
ln -sf $(realpath vim/init.vim) ~/.config/vim/init.vim
ln -sf $(realpath vim/init.vim) ~/.vimrc

# vim directories
ln -sf $(realpath ~/.config/vim) ~/.vim
ln -sf $(realpath ~/.config/vim) ~/.config/nvim

# vim-plug for neovim
# curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
vim -c 'CocInstall -sync coc-json coc-html coc-tslint coc-tsserver coc-css coc-angular|q'
# mkdir -p .config/coc/extensions
# cd .config/coc/extensions
# npm install coc-json coc-html coc-tslint coc-tsserver coc-css coc-angular

# install zsh
echo "install zsh"
sudo apt install zsh zsh-completions
curl -L http://install.ohmyz.sh | sh

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

echo "installation complete."
