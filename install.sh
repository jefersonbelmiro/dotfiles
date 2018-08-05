#!/bin/sh

command_exists () {
    type "$1" &> /dev/null ;
}

package_install () {
	sudo pacman -S --noconfirm $1
}

# git 
if command_exists git; then
    echo "git already installed"
else
    echo "install git"
    package_install git
    echo "setting git"
    ./scripts/config_git.sh
fi

# tree
if command_exists tree; then
    echo "tree already installed"
else
    echo "install tree"
    package_install tree
fi

# exuberant-ctags
if command_exists exuberant-ctags; then
    echo "exuberant-ctags already installed"
else 
    echo "install exuberant-ctags"
    package_install exuberant-ctags
fi

# ag - the silver search https://github.com/ggreer/the_silver_searcher
# plugin vim
# - https://github.com/rking/ag.vim
#
if command_exists ag; then
    echo "ag already installed"
else 
    echo "install ag"
    if command_exists yaourt; then
        package_install the_silver_searcher
    else 
        package_install silversearcher-ag
    fi
fi

if command_exists realpath; then
	echo "realpath already installed"
else
	package_install realpath
fi

# vim
if command_exists gvim; then
    echo "vim already installed"
else
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
fi

# install zsh
if command_exists zsh; then
	echo "zsh already installed"
else
	echo "install zsh"
	package_install zsh zsh-completions
    chsh -s /bin/zsh
	sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	sudo usermod -s /bin/zsh $USER
fi

echo "installation complete."
