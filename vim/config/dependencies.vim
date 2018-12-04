"
" Plugin management
"

call plug#begin('~/.config/vim/plugged')

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   " real-time collaborative editing
"   " Plug 'floobits/floobits-neovim'
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Plug 'mhinz/vim-startify'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" read .editorconfig
Plug 'editorconfig/editorconfig-vim'

" PCRE regex
Plug 'othree/eregex.vim'

Plug 'easymotion/vim-easymotion'

" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'

" Track the engine.
" Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Plug 'jefersonbelmiro/vim-snippets' 

" clean statusline
Plug 'jefersonbelmiro/statusline.vim'

" clear tabline
Plug 'jefersonbelmiro/tabline.vim'

" cvs diff
Plug 'jefersonbelmiro/cvsdiff.vim'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

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
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
" Plug 'jiangmiao/auto-pairs'

" Interactive command execution in Vim.
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" allows you to configure % to match more than just single characters
Plug 'vim-scripts/matchit.zip'

" html
Plug 'othree/html5.vim', { 'for': 'html' }

" git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive.git'
Plug 'airblade/vim-gitgutter'

" jenkinsfile
Plug 'martinda/Jenkinsfile-vim-syntax'

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'Shutnik/jshint2.vim', { 'for': 'javascript' } 
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }

" typescript {
"
    if has('nvim')
        Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
        " For async completion
        Plug 'Shougo/deoplete.nvim', { 'for': 'typescript' } 
        " For Denite features
        Plug 'Shougo/denite.nvim', { 'for': 'typescript' } 

        let g:deoplete#enable_at_startup = 1
        autocmd FileType typescript map <buffer> <C-]> :TSDef<CR> 
        autocmd FileType typescript map <buffer> <F1> :TSDoc<CR> 
        autocmd FileType typescript map <buffer> <F3> :TSImport<CR> 
        " fix full path after :TSDef
        autocmd BufCreate * cd .
        let g:nvim_typescript#diagnostics_enable = 0
        let g:nvim_typescript#follow_dir_change = 1
    else
        Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
        Plug 'Quramy/tsuquyomi', { 'for' : 'typescript' }
        let g:tsuquyomi_disable_quickfix = 1
        let g:tsuquyomi_shortest_import_path = 1
    endif

    Plug 'HerringtonDarkholme/yats.vim', { 'for' : 'typescript' }

    Plug 'w0rp/ale', { 'for' : 'typescript' } 
    let g:ale_lint_on_text_changed = 'never'
    " if you don't want linters to run on opening a file
    let g:ale_lint_on_enter = 0
    let g:ale_sign_error = '•' " '>>'
    let g:ale_sign_warning = '•' " '--'
    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 1
    highlight clear ALEErrorSign
    highlight clear ALEWarningSign
" }

" vue.js
Plug 'posva/vim-vue'

" c++
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

" c
Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }

" yaml
Plug 'stephpy/vim-yaml'

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

" Add plugins to &runtimepath
call plug#end()
