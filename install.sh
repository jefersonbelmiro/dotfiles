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
ln -s $(realpath vim/config) ~/.config/vim/config
ln -s $(realpath vim/init.vim) ~/.config/vim/init.vim
ln -s $(realpath vim/init.vim) ~/.vimrc

# vim directories
ln -s $(realpath ~/.config/vim) ~/.vim

# vim-plug for neovim
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

# install termjs
cd ~/.config/vim/plugged/tern_for_vim
npm install
cd -

# install zsh
echo "install zsh"
package_install zsh zsh-completions
curl -L http://install.ohmyz.sh | sh

#fix monitor dell
sudo xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
sudo xrandr --addmode DP-1 "1920x1080_60.00"

echo "installation complete."
