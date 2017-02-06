"
" Plugin management
"

call plug#begin('~/.config/nvim/plugged')

if has('nvim')
    Plug 'Shougo/deoplete.nvim'
endif

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'

" Just one NERDTree, always and ever. It will always look the same in all tabs
Plug 'jistr/vim-nerdtree-tabs'

Plug 'easymotion/vim-easymotion'

" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'jefersonbelmiro/vim-snippets' 

" clear tabline
Plug 'jefersonbelmiro/tabline.vim'

" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-fuzzy.vim'

" simple asynchronous fuzzy file finder for vim
if has("python")
    Plug 'troydm/asyncfinder.vim'
endif

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat' 

" TComment 
Plug 'tomtom/tcomment_vim', { 'on' : 'TComment' }

" plugin for the_silver_searcher, 'ag'
Plug 'rking/ag.vim'

" Perform search in files easily
Plug 'eugen0329/vim-esearch'

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
" Plug 'jiangmiao/auto-pairs'

" Interactive command execution in Vim.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" allows you to configure % to match more than just single characters
Plug 'vim-scripts/matchit.zip'

" html
Plug 'othree/html5.vim', { 'for': 'html' }

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }

" c++
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

" c
Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }

" colors
Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
Plug 'ywjno/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'jtai/vim-womprat'
Plug 'romainl/Apprentice'
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'

" Add plugins to &runtimepath
call plug#end()
