
" not compatible with vi
set nocompatible 

" detect when a file is changed
set autoread 

set encoding=utf8


" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" 24 bit color
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
colorscheme womprat

"Habilita coloração por syntax 
syntax enable 

set textwidth=110
set colorcolumn=120

" 1 - mostra abas somente se tiver 2 arquivos 
" 2 - sempre mostra abas 
set showtabline=1

" Sempre mostra barra de Mensagens 
set laststatus=2

set statusline=
set statusline+=%f%m\                                   "file name/modified flag
set statusline+=%=                                      "indent right
set statusline+=%r\                                     "file type
set statusline+=%{strlen(&ft)?&ft:'none'}               "file type
set statusline+=%0*\ %{''.(&fenc!=''?&fenc:&enc).''}    "Encoding
set statusline+=%0*\ %{&ff}\                            "FileFormat (dos/unix..) 
set statusline+=%0(%v%)\                                " column
set statusline+=%l\ %L                                   "position

set background=dark

" let g:airline_theme = 'ubaryd'
colorscheme womprat

hi StatusLine ctermbg=234 cterm=NONE guibg=#222222
hi StatusLineNC ctermbg=234 cterm=NONE guibg=#222222
hi ColorColumn ctermbg=234 guibg=#222222
hi vertsplit ctermbg=none guibg=none

hi TabLine cterm=none ctermbg=none guibg=#222222 guifg=none gui=none
hi TabLineFill cterm=none ctermbg=none guibg=none guifg=none gui=none
hi TabLineSel cterm=bold,underline ctermbg=none guibg=#333333 gui=none

hi Search ctermbg=237 ctermfg=none
hi Visual ctermbg=239 ctermfg=none

set nonu

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

autocmd VimEnter * set scroll=4
autocmd WinEnter * set scroll=4
"autocmd BufAdd * call input("damat")
autocmd VimResized * set scroll=4

set expandtab " Use spaces instead of tabs
set smarttab  " Be smart when using tabs ;)

set shiftwidth=4 
set tabstop=4   
set softtabstop=4
"set linebreak          
"set textwidth  =150 " Linebreak on 150 characters

set autoindent  "Auto indent
set smartindent "Smart indent
set nowrap      "No Wrap lines

set nobackup   
set nowritebackup 
set noswapfile  
  
set mousem=popup_setpos
set mouse=a
set showcmd
set showmode
set ttyfast

"set list
"set listchars=tab:\|\ 
"hi SpecialKey ctermbg=none

" diff
set diffopt+=iwhite
set diffexpr=""

"au FilterWritePre * call DiffToggle(0)
"au QuitPre * call DiffToggle(1)
"call DiffToggle(0)

" Navegacao
set wildmenu
set wildignore=*.o,*~,*.pyc,CVS,*~            " Ignora certos tipos de arquivo
set wildmode=list:longest                     " Command <tab> completion, list matches, then longest common, then all.
set wildignore+=node_modules/**
set wildignore+=**/node_modules/* 

set termencoding=utf-8                       " Codificação do terminal
set fileformats=unix,dos,mac                 " Use unix as the standard file type
set switchbuf=useopen,usetab,newtab          " Specify the behavior when switching between buffers 

" abriu arquivo somente leitura, editou e agora nao consegue salvar?
"cmap w!! w !sudo tee % >/dev/null

" Folding
set foldmethod=manual

set shortmess+=filmnrxoOtT                      " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=all                             " permite o cursor mover onde nao tem caracter 

"undo 
set undofile
set undodir=~/.config/nvim/undodir

" au filetype php set keywordprg=pman
autocmd filetype php set iskeyword+=$