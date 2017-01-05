#!/bin/sh

path_vim="$HOME/.config/nvim";
manager_command="echo";

command_exists () {
    type "$1" &> /dev/null ;
    #if type "$1" > /dev/null 2>&1; then
    #    return 0
    #else
    #    return 1
    #fi
}

if command_exists apt-get; then
	manager_command="sudo apt-get install -y"
elif command_exists yaourt; then
	manager_command="yaourt -S --noconfirm"
else
	echo "package manager_command not found";
	exit 1;
fi


package_install () {
	return $($manager_command $1)
}

# git 
if command_exists git; then
    echo "git already installed"
else
    echo "install git"
    package_install git
    echo "skiping install git"
fi

# colors
git config --global core.pager "less -r"

# user
git config --global user.name 'Jeferson Belmiro'
git config --global user.email 'jeferson.belmiro@gmail.com'

# git auth cache
git config --global credential.helper "cache --timeout=10800"

# git diff com vim
git config --global pager.diff false
git config --global difftool.prompt false
git config --global diff.external git_diff_wrapper

# mergetool
git config --global mergetool.keepBackup false
git config --global mergetool.vimdiff3.cmd 'cp "$LOCAL" "$MERGED" && vim -f -d "$MERGED" "$REMOTE" -c "color jellybeans | map <F4> :qa<CR>"'
git config --global merge.tool vimdiff3
git config --global mergetool.prompt false

# alias
git config --global alias.lg "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

sudo ln -s $(realpath bin/git_diff_wrapper) /usr/local/bin/

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
    echo "skiping install exuberant-ctags"
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

# neovim
# https://github.com/neovim/neovim/wiki/Installing-Neovim
if command_exists nvim; then
    echo "nvim already installed"
else
    echo "install nvim"
    package_install nvim
fi

echo "setting vim/nvim"

if command_exists realpath; then
	echo "realpath already installed"
else
	sudo apt-get install realpath
fi

mkdir ~/.config/nvim/undodir -p

# nvim directories
ln -s $(realpath nvim/config) ~/.config/nvim/config
ln -s $(realpath nvim/init.vim) ~/.config/nvim/init.vim
ln -s $(realpath nvim/init.vim) ~/.vimrc

# vim directories
ln -s $(realpath ~/.config/nvim) ~/.vim

# vim-plug for neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

# install termjs
cd ~/.config/nvim/plugged/tern_for_vim
npm install
cd -

# install bashrc config
bash_rc_path=$(realpath bash/rc);
grep -q -F 'include "'$bash_rc_path'"' ~/.bashrc || echo 'include "'$bash_rc_path'"' >> ~/.bashrc
echo "setting bashrc"

echo "installation complete."
