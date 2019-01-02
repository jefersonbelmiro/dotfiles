
" <leader>
let mapleader = ","

" Plugin management
source ~/.config/vim/config/dependencies.vim

" Plugin configuration
source ~/.config/vim/config/plugins.vim

" Mapkeys
source ~/.config/vim/config/keybindings.vim

" config
source ~/.config/vim/config/default.vim

" config
source ~/.config/vim/config/functions.vim

if filereadable(glob("~/.vimrc.local")) 
  source ~/.vimrc.local
endif
