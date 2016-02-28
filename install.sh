#!/bin/sh

INSTALL_GIT=true
INSTALL_TREE=true
INSTALL_EXUBERANT_CTAGS=true
INSTALL_AG=true
INSTALL_NVIM=true

CONFIGURE_NVIM=true
CONFIGURE_GIT=true

path_nvim="$HOME/.config/nvim"

command_exists () {
    type "$1" > /dev/null ;
}

# git 
if command_exists git; then
    echo "git already installed"
elif $INSTALL_GIT; then

    echo "install git"

    sudo apt-get install git
    git config --global user.name 'Jeferson Belmiro'
    git config --global user.email 'jeferson.belmiro@gmail.com'
else
    echo "skiping install git"
fi

if command_exists git && $CONFIGURE_GIT ; then

    # git auth cache
    git config --global credential.helper "cache --timeout=10800"

    # git diff com vim
    git config --global pager.diff false
    git config --global difftool.prompt false
    git config --global diff.external git_diff_wrapper
    sudo ln -s ~/dotfiles/bin/git_diff_wrapper /usr/local/bin/

fi

# tree
if command_exists tree; then
    echo "tree already installed"
elif $INSTALL_TREE; then 
    sudo apt-get install tree
else
    echo "skiping install tree"
fi

# exuberant-ctags
if command_exists exuberant-ctags; then
    echo "exuberant-ctags already installed"
elif $INSTALL_EXUBERANT_CTAGS; then
    echo "install exuberant-ctags"
    sudo apt-get install exuberant-ctags
else 
    echo "skiping install exuberant-ctags"
fi

# ag - the silver search
#
# plugin vim
# - https://github.com/rking/ag.vim
# programa
# - https://github.com/ggreer/the_silver_searcher
#
if command_exists ag; then
    echo "ag already installed"
elif $INSTALL_AG; then
    echo "install ag"
    sudo apt-get install python-software-properties
    sudo apt-add-repository ppa:mizuno-as/silversearcher-ag
    sudo apt-get update
    sudo apt-get install silversearcher-ag
else 
    echo "skiping install ag"
fi

# neovim
# https://github.com/neovim/neovim/wiki/Installing-Neovim
if command_exists nvim; then
    echo "nvim already installed"
elif $INSTALL_NVIM; then
    echo "install nvim"

    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
    sudo apt-get install python-dev python-pip python3-dev python3-pip

    # For Python 2 plugins,
    sudo pip2 install neovim
    # For Python 3 plugins
    sudo pip3 install neovim
else
    echo "skiping install nvim"
fi

if command_exists nvim && $CONFIGURE_NVIM; then
    echo "setting nvim"

    if [ -d "$path_nvim" ]; then
        echo "neovim directory exists: $path_nvim, remove first"
        exit 1;
    fi

    mkdir ~/.config/nvim
    # cp init.vim ~/.config/nvim/init.vim
    ln -s $(realpath init.vim) ~/.config/nvim/init.vim

    # vim-plug for neovim
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    nvim +PlugInstall +qall

    # install comand-t ruby
    cd ~/.config/nvim/plugged/command-t/ruby/command-t
    ruby extconf.rb
    make

fi 

# nerd-fonts - https://github.com/ryanoasis/nerd-fonts
mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

cd ~/.local/share
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh

echo "installation complete."
