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

# coc setting
ln -sf $(realpath vim/coc-settings.json) ~/.config/vim/coc-settings.json

# vim-plug for neovim
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo apt install neovim
sudo apt-get install python-neovim
sudo apt-get install python3-neovim
sudo -sf /usr/bin/nvim /usr/bin/vim
sudo -sf /usr/bin/nvim /usr/bin/vi

vim +PlugInstall +qall
vim -c 'CocInstall -sync coc-json coc-html coc-eslint coc-tsserver coc-css coc-angular coc-prettier coc-jest coc-omnisharp coc-explorer|q'
# mkdir -p .config/coc/extensions
# cd .config/coc/extensions
# npm install coc-json coc-...

