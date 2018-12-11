#!/bin/sh

command_exists () {
    type "$1" &> /dev/null ;
}

package_install () {
    sudo apt install $1
}

# git 
echo "install git"
package_install git
echo "setting git"
./scripts/config_git.sh

echo "install tree"
package_install tree

package_install exuberant-ctags

package_install silversearcher-ag
package_install realpath

echo "install vim"
package_install gvim
echo "setting vim"

mkdir ~/.config/vim/undodir -p

# vim directories
ln -sf $(realpath vim/config) ~/.config/vim/config
ln -sf $(realpath vim/init.vim) ~/.config/vim/init.vim
ln -sf $(realpath vim/init.vim) ~/.vimrc

# vim directories
ln -sf $(realpath ~/.config/vim) ~/.vim
ln -sf $(realpath ~/.config/vim) ~/.config/nvim

# vim-plug for neovim
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

# install termjs
cd ~/.config/vim/plugged/tern_for_vim
npm install
cd -

# install fugitive
cd ~/.config/vim/plugged/
git clone https://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q
cd -

# install zsh
echo "install zsh"
package_install zsh zsh-completions
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
