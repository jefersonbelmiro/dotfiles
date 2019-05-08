
" not compatible with vi
set nocompatible 

" detect when a file is changed
set autoread 

set synmaxcol=256
syntax sync minlines=512

" check one time after 4s of inactivity in normal mode
" au CursorHold * checktime       
au CursorHold * if !bufexists("[Command Line]") | checktime | endif

set encoding=utf8

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"Habilita coloração por syntax 
syntax enable 

"set linebreak          
"set textwidth=110 " Linebreak on 110 characters 
" set colorcolumn=120

" 1 - mostra abas somente se tiver 2 arquivos 
" 2 - sempre mostra abas 
set showtabline=1

" Sempre mostra barra de Mensagens 
set laststatus=2

set background=dark " for the dark version
" colorscheme 
if has("gui_running")
    set guioptions=r
    colorscheme vimterial_dark
else
    try
        " colorscheme womprat
        colorscheme one
    catch /^Vim\%((\a\+)\)\=:E185/
        color default
    endtry

    " Vim airline theme
    let g:airline_theme='space'

    hi StatusLine ctermbg=234 cterm=NONE guibg=NONE
    hi StatusLineNC ctermbg=234 cterm=NONE guibg=NONE gui=NONE
    hi ColorColumn ctermbg=234 guibg=NONE
    hi vertsplit ctermbg=NONE guibg=NONE

    hi Normal guibg=NONE

    " hi TabLine cterm=NONE ctermbg=NONE guibg=#222222 guifg=NONE gui=NONE
    " hi TabLineFill cterm=NONE ctermbg=NONE guibg=NONE guifg=NONE gui=NONE
    " hi TabLineSel cterm=bold,underline ctermbg=NONE guibg=#333333 gui=NONE

    " (){}[]
    " hi MatchParen guibg=NONE guifg=#ffffff

    hi Search ctermbg=237 ctermfg=NONE guibg=#444444 guifg=#dddddd
    hi Visual ctermbg=239 ctermfg=NONE

    hi GitGutterChange guifg=orange guibg=NONE gui=NONE
    hi GitGutterAdd guifg=green guibg=NONE gui=NONE
    hi GitGutterDelete guifg=red guibg=NONE gui=NONE

    hi custom_deniteMatchedRange gui=NONE guibg=NONE 

    " coc.nvim color changes
    hi! link CocErrorSign WarningMsg
    hi! link CocWarningSign Number
    hi! link CocInfoSign Type

    " Make background transparent for many things
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE
    hi! LineNr ctermfg=NONE guibg=NONE
    hi! SignColumn ctermfg=NONE guibg=NONE

    " Try to hide vertical spit and end of buffer symbol
    " hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
    " hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

    " Customize NERDTree directory
    hi! NERDTreeCWD guifg=#99c794

    " Make background color transparent for git changes
    " hi! SignifySignAdd guibg=NONE
    " hi! SignifySignDelete guibg=NONE
    " hi! SignifySignChange guibg=NONE

    " Highlight git change signs
    " hi! SignifySignAdd guifg=#99c794
    " hi! SignifySignDelete guifg=#ec5f67
    " hi! SignifySignChange guifg=#c594c5

    " hi ActiveWindow guibg=#17252c
    " hi InactiveWindow guibg=#0D1B22

endif

" highlight SignColumn guibg=NONE ctermbg=NONE
" highlight SpellBad ctermbg=NONE cterm=bold,underline ctermfg=9

set nonu

set updatetime=100

set title
"set titlestring=%f
set nocompatible                  " desabilita compatiblidade com vi
set history=2000                  " Quantas linhas de histórico o vim deve lembra0
set ruler                         " Sempre mostra posicao atual
set hid                           " A buffer becomes hidden when it is abandoned
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set ignorecase                    " Ignora maiusculas/minusculas quando fizer pesquisa
set smartcase                     " When searching try to be smart about cases ??? @todo descobrir o que eh mesmo
set hlsearch                      " Destaca resultados da busca
"set nowrapscan                    " desabilita ao final da pesquisa ('/')voltar para primeira ocorrencia"
set incsearch                     " Vai buscando enquando digita
set magic                         " For regular expressions turn magic on
set showmatch                     " Show matching brackets when text indicator is over them
set matchtime=2                   " How many tenths of a second to blink when matching brackets
set autoindent

" scroll
set sidescroll=1    " ao chegar cursor final da pagina e tiver mais conteudo, move 1 caracter, default 0, meia pagina
set scrolloff=1     " quando cursor tiver 1 linha do final da pagina, move verticalmente
set sidescrolloff=2 " igual scrolloff so que horizontal, quando cursor ficar 2 caracteres final da pagina, move 1 caracter, o que esta configurado no sidescroll
set nostartofline   " disabel move cursor first non-blank of the line
set scroll=4        " linhas do ctrl+u e ctrl+d

" autocmd VimEnter * if !&previewwindow | silent set scroll=4 mouse=a | endif
" autocmd BufEnter * if !&previewwindow | silent set scroll=4 mouse=a | endif 
" autocmd VimResized * set scroll=4
autocmd BufCreate * silent cd .

" on enter terminal buf, go insert mode
if has('nvim')
    autocmd BufEnter * if &buftype == 'terminal' | call TerminalConfigure() | endif
    autocmd TermOpen * call TerminalConfigure() 
endif

set expandtab " Use spaces instead of tabs
set smarttab  " Be smart when using tabs ;)

set shiftwidth=4 
set tabstop=4   
set softtabstop=4

set autoindent  "Auto indent
set smartindent "Smart indent
set nowrap      "No Wrap lines

" set nobackup   
" set nowritebackup 
" set noswapfile  
  
set mousem=popup_setpos
set mouse=a
set noshowcmd
set noshowmode
set ttyfast

"set list
"set listchars=tab:\|\ 
"hi SpecialKey ctermbg=NONE

set listchars=eol:¬,tab:→→,extends:>,precedes:<,space:·

" diff
set diffopt+=iwhite
" set diffexpr=""

" Navegacao
set wildmenu
set wildmode=list:longest                     " Command <tab> completion, list matches, then longest common, then all.
set wildignore=*.o,*~,*.pyc,CVS,*~,.git       " Ignora certos tipos de arquivo
" set wildignore+=*/node_modules/*
" set wildignore+=*/bower_components/*
" set wildignore+=*/vendor/*

set termencoding=utf-8                       " Codificação do terminal
set fileformats=unix,dos,mac                 " Use unix as the standard file type
set switchbuf=useopen,usetab,newtab          " Specify the behavior when switching between buffers 

" abriu arquivo somente leitura, editou e agora nao consegue salvar?
cmap w!! w !sudo tee % >/dev/null

" Folding
set foldmethod=manual

" set shortmess+=filmnrxoOtT                      " abbrev. of messages (avoids 'hit enter')

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=all                             " permite o cursor mover onde nao tem caracter 

"undo 
set undofile
set undodir=~/.config/nvim/undodir


" Yank and paste with the system clipboard
set clipboard=unnamed

" Enable true color support
set termguicolors


" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.config/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
set termguicolors

" " Editor theme
" set background=dark
" try
"   colorscheme OceanicNext
" catch
"   colorscheme slate
" endtry

" au filetype php set keywordprg=pman
autocmd filetype php setlocal iskeyword+=$
" autocmd filetype css,scss setlocal iskeyword+=-
