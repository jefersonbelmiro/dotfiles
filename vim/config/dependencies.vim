" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

"
" Plugin management
"
call plug#begin('~/.config/vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

" read .editorconfig
Plug 'editorconfig/editorconfig-vim'

" eregex - PCRE regex 
Plug 'othree/eregex.vim'

Plug 'easymotion/vim-easymotion'

" focussing on a selected region<Paste>
Plug 'chrisbra/NrrwRgn'

" Personal Wiki 
Plug 'vimwiki/vimwiki'

" clean statusline
Plug 'jefersonbelmiro/statusline.vim'

" clear tabline
Plug 'jefersonbelmiro/tabline.vim'

" cvs diff
Plug 'jefersonbelmiro/cvsdiff.vim'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

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

" ctrlp 
" Full path fuzzy file, buffer, mru, tag, ... finder 
" Plug 'ctrlpvim/ctrlp.vim'

" Perform all your vim insert mode completions with Tab
" Plug 'ervandew/supertab'

" automatic closing of quotes, parenthesis, brackets, etc.
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

" Interactive command execution in Vim.
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" allows you to configure % to match more than just single characters
Plug 'vim-scripts/matchit.zip'

" undo tree
Plug 'sjl/gundo.vim'

" html
Plug 'othree/html5.vim', { 'for': 'html' }

" git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" jenkinsfile
Plug 'martinda/Jenkinsfile-vim-syntax'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" javascript
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'mxw/vim-jsx', { 'for': 'jsx' }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
" Plug 'Shutnik/jshint2.vim', { 'for': 'javascript' } 
" Plug 'isRuslan/vim-es6', { 'for': 'javascript' }

" javascript/typescript
" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'typescript'] }

if has('nvim')
    " For async completion
    " Plug 'Shougo/deoplete.nvim'
    " For Denite features
    " Plug 'Shougo/denite.nvim'
    " Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

" Plug 'w0rp/ale'

" typescript {
"
    " if has('nvim')
    "     Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    " else
    "     Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
    "     Plug 'Quramy/tsuquyomi', { 'for' : 'typescript' }
    " endif
    "
    " Plug 'HerringtonDarkholme/yats.vim', { 'for' : 'typescript' }

" }


" auto-close plugin
" Plug 'rstacruz/vim-closer'


" Intellisense Engine
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Denite - Fuzzy finding, buffer management
" Plug 'Shougo/denite.nvim'
Plug 'rafaelnery/denite.nvim'

" Manger list of git objects with interface of denite.nvim
Plug 'chemzqm/denite-git'

" dark powered file explorer implementation
"  - @SEE config file https://github.com/mhartington/dotfiles/blob/master/config/nvim/init.vim
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "
" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'


" === UI === "
" File explorer
" Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'mhartington/oceanic-next'

" Customized vim status line
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Icons
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'









" tagbar 
Plug 'majutsushi/tagbar'

" vue.js
Plug 'posva/vim-vue'

" c++
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

" c
Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }

" yaml
Plug 'stephpy/vim-yaml', { 'for': 'yml' }

" Blade
Plug 'jwalton512/vim-blade'

" colors
Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
Plug 'ywjno/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'jefersonbelmiro/vim-womprat'
Plug 'romainl/Apprentice'
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
Plug 'larsbs/vimterial_dark'
Plug 'cocopon/iceberg.vim'

" Add plugins to &runtimepath
call plug#end()
