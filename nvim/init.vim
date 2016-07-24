
" Plugin management
source ~/.config/nvim/config/dependencies.vim

" Mapkeys
source ~/.config/nvim/config/keybindings.vim

" Plugin configuration
source ~/.config/nvim/config/plugins.vim

" config
source ~/.config/nvim/config/default.vim

" config
source ~/.config/nvim/config/functions.vim

if filereadable(glob("~/.vimrc.local")) 
  source ~/.vimrc.local
endif
