
" Plugin management
source ~/.config/vim/config/dependencies.vim

" Mapkeys
source ~/.config/vim/config/keybindings.vim

" Plugin configuration
source ~/.config/vim/config/plugins.vim

" config
source ~/.config/vim/config/default.vim

" config
source ~/.config/vim/config/functions.vim

if filereadable(glob("~/.vimrc.local")) 
  source ~/.vimrc.local
endif
