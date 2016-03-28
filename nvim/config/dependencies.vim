"
" Plugin management
"

call plug#begin('~/.config/nvim/plugged')

if has('nvim')
    Plug 'Shougo/deoplete.nvim'
endif

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

Plug 'easymotion/vim-easymotion'

" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets' 

" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-fuzzy.vim'

" simple asynchronous fuzzy file finder for vim
Plug 'troydm/asyncfinder.vim'

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat' 

" TComment 
Plug 'tomtom/tcomment_vim', { 'on' : 'TComment' }

" Command-t 
" Plug 'wincent/command-t'

" Full path fuzzy file, buffer, mru, tag, ... finder 
Plug 'ctrlpvim/ctrlp.vim'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Interactive command execution in Vim.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }

" colors
Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
Plug 'ywjno/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'jtai/vim-womprat'

" Add plugins to &runtimepath
call plug#end()
