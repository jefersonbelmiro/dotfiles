call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" fancy statusline
Plug 'vim-airline/vim-airline' 
" themes for vim-airlin
Plug 'vim-airline/vim-airline-themes' 

" neovim replacement for syntastic using neovim's job control functonality
Plug 'benekastah/neomake' 

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat' 

" interpret a file by function and cache file automatically
Plug 'MarcWeber/vim-addon-mw-utils'

" snippet manager
Plug 'garbas/vim-snipmate' 

" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-ragtag' 

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'crusoexia/vim-javascript-lib'

" language-specific plugins
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }


Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
Plug 'ywjno/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'jtai/vim-womprat'

" adds font icons
Plug 'ryanoasis/vim-devicons'

" Add plugins to &runtimepath
call plug#end()

syntax on

set background=dark

" color Tomorrow-Night-Eighties
" color Tomorrow-Night
" color Tomorrow

" color OceanicNext
" let g:airline_theme='oceanicnext'

colorscheme womprat

" color gruvbox
" color jellybeans

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

let g:airline_powerline_fonts = 1
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

" 24 bit color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" not compatible with vi
set nocompatible 

" detect when a file is changed
set autoread 

" Always show statusline
set laststatus=2

set encoding=utf8
