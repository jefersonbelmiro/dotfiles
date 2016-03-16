"
" Plugin management
"

call plug#begin('~/.config/nvim/plugged')

if has('nvim')
    Plug 'Shougo/deoplete.nvim'
endif

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'mhinz/vim-startify'

Plug 'easymotion/vim-easymotion'

" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-fuzzy.vim'

" simple asynchronous fuzzy file finder for vim
Plug 'troydm/asyncfinder.vim'

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat' 

" TComment { " - https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim', { 'on' : 'TComment' }

" Command-t {
Plug 'wincent/command-t'

" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Interactive command execution in Vim.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }

" colors
Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
Plug 'ywjno/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'jtai/vim-womprat'

" Add plugins to &runtimepath
call plug#end()
