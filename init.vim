call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

" Optional:
Plug 'honza/vim-snippets'

Plug 'easymotion/vim-easymotion'

" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-fuzzy.vim'

" simple asynchronous fuzzy file finder for vim
Plug 'troydm/asyncfinder.vim'

" Plin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" fancy statusline
"Plug 'vim-airline/vim-airline' 
" themes for vim-airlin
"Plug 'vim-airline/vim-airline-themes' 

" neovim replacement for syntastic using neovim's job control functonality
"Plug 'benekastah/neomake' 

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat' 

" TComment { " - https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim', { 'on' : 'TComment' }

" Command-t {
Plug 'wincent/command-t'

"Plug 'Shougo/unite.vim'

" interpret a file by function and cache file automatically
"Plug 'MarcWeber/vim-addon-mw-utils'

" snippet manager
"Plug 'garbas/vim-snipmate' 

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

" adds font icons
"Plug 'ryanoasis/vim-devicons'

" Add plugins to &runtimepath
call plug#end()



" not compatible with vi
set nocompatible 

" detect when a file is changed
set autoread 

" Always show statusline
set laststatus=2

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
set statusline+=%3(%c%)\                                " line and column"
set statusline+=%0*%L                                   "position


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
"set fillchars+=vert:│




" -------------------------- MAPKEYS ------------------------------------------{

" <leader>
let mapleader = ","

" alt+backspace delete word backward
imap <esc><bs> <C-W>

" abre arquivo
map <F9> <ESC> :call OpenFile() <CR>

" troca de abas
nnoremap <silent> tk :tabnext<CR>
nnoremap <silent> tj :tabprev<CR>
nnoremap <silent> <A-1> 1gt
nnoremap <silent> <A-2> 2gt
nnoremap <silent> <A-3> 3gt
nnoremap <silent> <A-4> 4gt
nnoremap <silent> <A-5> 5gt
nnoremap <silent> <A-6> 6gt
nnoremap <silent> <A-7> 7gt
nnoremap <silent> <A-8> 8gt
nnoremap <silent> <A-9> 9gt

" Remap vim 0 to first non-blank character
" map 0 ^

" fecha arquivo e remove do buffer
" map <F4> :execute 'bd "' . PathName() . '/' . FileName() . '"' <CR>

" fecha arquivo
map <F4> :q<CR>

" identation
vmap <TAB> >gv
vmap <S-TAB> <gv

" toggle mouse no vim
map <silent><F5> <ESC> :call ToggleMouse() <CR> hh
imap <silent><F5> <ESC> :call ToggleMouse() <CR> hi

" K abre 'man' do que esta sob o cursor 
map K k

" apos buscar, nao pula cursor
" plugin visual-star-search does it better
"map * *N
"map # #N

" Salvar 
map <silent> <F2> <ESC>:call Save()<CR>
imap <silent> <F2> <ESC>:call Save()<CR>

" CTRL-V and SHIFT-Insert are Paste
"map <C-V>		"+gP
"map <S-Insert>		"+gP
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Redimensiona Janela com Ctrl + Direcional 
nnoremap <C-Up>    <C-w>+
nnoremap <C-Down>  <C-w>-
nnoremap <C-Left>  <C-w><
nnoremap <C-Right> <C-w>>

" Movimentaçao entre janelas
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

" Move linhas ou blocos { 
"  usando ALT+SETA nnoremap <A-DOWN> mz:m+<CR>`z==
    " normal
    nnoremap <A-UP> mz:m-2<CR>`z==
    nnoremap <A-DOWN> mz:m+<CR>`z==
    " insert
    inoremap <A-UP> <Esc>:m-2<CR>==gi
    inoremap <A-DOWN> <Esc>:m+<CR>==gi
    " visual
    vnoremap <A-UP> :m'<-2<CR>gv=`>my`<mzgv`yo`z
    vnoremap <A-DOWN> :m'>+<CR>gv=`<my`>mzgv`yo`z
" }

" volta pro normal mode
inoremap jk <ESC>l
inoremap JK <ESC>l

" apos abrir algo como {}, identa: {
"   _  <--- cursor
" }
imap <C-c> <CR><Esc>O

" navegacao em insert mode
inoremap <C-k> <c-o>k
inoremap <C-j> <c-o>j
inoremap <C-h> <c-o>h
inoremap <C-l> <c-o>l

" }------------------------- MAPKEYS ------------------------------------------



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

" au filetype php set keywordprg=pman
autocmd filetype php set iskeyword+=$


" --------------------------- plugin's config -------------------------------{{{

" NERDTree {
    let g:NERDTreeDirArrows=0
" }

" TComment { 
" " - https://github.com/tomtom/tcomment_vim

  map <leader>c :TComment<CR>
  vmap <leader>c :TComment<CR>

" }

" Command-t {

  let g:CommandTMaxFiles = 99999
  let g:CommandTMaxDepth = 99999
  let g:CommandTMaxHeight = 10
  " let g:CommandTFileScanner = 'find'
  map <leader>b :CommandTMRU<CR>
  if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
  endif

" }

" tagbar {

  let g:tagbar_width = 25
  let g:tagbar_autofocus = 1
  let g:tagbar_compact = 1
  let g:tagbar_foldlevel = 1
  let g:tagbar_autoshowtag = 1
  let g:tagbar_type_php = {
        \ 'ctagstype' : 'php',
        \ 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
        \ ]
        \ }

" }

" easymotion {

  map <space>h <Plug>(easymotion-linebackward)
  map <space>j <Plug>(easymotion-j)
  map <space>k <Plug>(easymotion-k)
  map <space>l <Plug>(easymotion-lineforward)

  let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
  let g:EasyMotion_smartcase = 1 " search case-insensitive

" }

" incsearch-fuzzy {
"
    " let g:incsearch#auto_nohlsearch = 1
    nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

    " fuzy search
    map z/ <Plug>(incsearch-fuzzy-/)
" }

" }}}-------------------------- plugin's config --------------------------------



function! Save() 

  try 

    let output = 'Arquivo salvo'
    let fileName = expand('%')
    silent execute ':w'
    "silent execute ':set scr=4'
    silent execute ':set ft=' . &filetype

    " php lint
    " if &filetype == 'php'
      " call s:Executar('php -l ' . expand('%') . ' 2> /tmp/vim_save')
    " endif

    "let bid = '/var/www/DBPlugins/Financeiro/BID/fontes/' . fileName
    "if filewritable(bid)

    "  silent execute ':w! ' . bid
    "  let output = output . ' | copia salva em /var/www/DBPlugins/Financeiro/BID/fontes/'
    "endif

    echo output

  catch

    let s:erro = Executar('cat /tmp/vim_save')

    if !empty(s:erro) 
      let s:erro = split(s:erro, "\n")[0] 
    else 
      let s:erro = v:exception
    endif

    echohl WarningMsg | echo s:erro 
  endtry

endfunction

"
" Executa um comando e retorna resposta do comando ou erro
"
function! s:Executar(comando) 

  let l:retornoComando = system(a:comando)

  if v:shell_error 
    throw l:retornoComando
  endif

  return l:retornoComando

endfunction


function! Bulk_input_char_on_char_pre() abort
  let stack = []
  let c = 1
  while c
    let c = getchar(0)
      echo "[1] ' " . c . "'"
      if c != 0
      echo "[2]"
      let stack += [nr2char(c)]
    elseif !empty(stack)
      echo "[3]"
      echon "stack: " . stack
    endif
  endwhile
      echo "[4]"
endfunction


let s:keyLoop = 1
let s:prompt = ''

" Keymaps
let [s:lcmap, s:prtmaps] = ['nn <buffer> <silent>', {
	\ 'PrtBS()':              ['<bs>', '<c-]>'],
	\ 'PrtDelete()':          ['<del>'],
	\ 'PrtClear()':           ['<c-u>'],
	\ }]

" @todo - color pequisa  
" call matchaddpos('WildMenu', [[20, 9, 1]])
" help matchaddpos
" criar grupo com underline vermelho, parecido com plugin easy-motion

" @todo - plugin visual-star-search.vim 
" usar: 
" let current_win_state = winsaveview()
" call winrestview(current_win_state)


function! s:hl_cursor_on()
    set guicursor&
    let &guicursor = s:old_guicursor
    let &t_ve = s:old_t_ve
    unlet s:old_t_ve
endfunction


function! s:hl_cursor_off()
	let s:old_guicursor = &guicursor
	set guicursor=n:block-NONE
	let s:old_t_ve = &t_ve
	set t_ve=
endfunction

" @testar - https://github.com/gelguy/Cmd2.vim
function! KeyLoop()

    call s:hl_cursor_off()

    try
        call s:Prompt()
    catch
        redraw
        echo "abort"
    endtry

    call s:hl_cursor_on()

endfunction

function! s:Prompt()

    let s:prompt = ''

    while s:keyLoop

        redraw
        echon '/' . s:prompt | echohl Cursor | echon ' ' | echohl NONE

        let nr = getchar()
        let char = !type(nr) ? nr2char(nr) : nr

        if nr >=# 0x20
            " char
            let s:prompt .= char
        else

            "let code = char2nr(nr)

            "let s:prompt .= '['.char.']'
            "if char != ''
            "    let cmd = matchstr(maparg(char), ':<C-U>\zs.\+\ze<CR>$')
            "    execute ("corm " . cmd)
            "endif

            "let cmd = matchstr(maparg(char), ':<C-U>\zs.\+\ze<CR>$')
			"exe( cmd != '' ? cmd : 'norm '.char )
            " call feedkeys(nr);

            " command
            "echon "[2]find: "  . char
        endif

    endwhile

endfunction

" let s:counter=0
" function! Teste()
"     let s:counter += 1
"     execute ':input()'
" endfunction
"
" " set updatetime=500
" " autocmd CursorHoldI * call Teste()
"
" nmap \x :call GetFoo()<CR>:exe "/" . Foo<CR>
" function GetFoo()
"   call inputsave()
"   let g:Foo = input("enter search pattern: ")
"   call inputrestore()
" endfunction


function! s:getchar(...)
	let mode = get(a:, 1, 0)
	while 1
		" Workaround for https://github.com/osyo-manga/vital-over/issues/53
		try
			let char = call("getchar", a:000)
		catch /^Vim:Interrupt$/
			let char = 3 " <C-c>
		endtry
		" Workaround for the <expr> mappings
		if string(char) !=# "\x80\xfd`"
			return mode == 1 ? !!char
\				 : type(char) == type(0) ? nr2char(char) : char
		endif
	endwhile
endfunction

function! Wait(mil)
    let timetowait = a:mil . "m"
    exe 'sleep '.timetowait
endfunction 

function! Teste()

    let line = ''
    let g:iterations = 0

    while 1
        let g:iterations = g:iterations+1
        if g:iterations > 60
            echo "60 it"
            break
        endif
        " redraw
        "sleep 100m
        let char = s:getchar()

        if empty(char)
            return
        endif

        redraw
        let line .= char
        let char = ''
        echon '> ' . g:iterations . ' ' . line | echohl Cursor | echon ' ' | echohl NONE

    endwhile
    return

    while 1
        "call Wait(1000)
        call inputsave()
		try
            let g:iterations += g:iterations+1
            let g:teste = s:getchar(0)
			"let char = call("getchar", a:000)
            if g:teste == '\<C-c>'
                input('funcionou')
            endif
            if g:teste == '\<Esc>'
                input('funcionou')
            endif
            if g:teste != ''
                "echo ">" . g:teste
                redraw
                echohl Cursor | echo '>' .  g:teste . '-' . g:iterations | echohl none
            endif
		catch /^Vim:Interrupt$/
            echo "cancelado"
            return
		endtry
        call inputrestore()
    endwhile

endfunction


" ao abrir aquivo ja formata: set fileencodings=UTF-8
" latin1 = ISO-8859-1
function! SetEncoding(encoding)

  execute 'set encoding=' . a:encoding
  execute 'set fileencoding=' . a:encoding

endfunction

function! SetTabWidth(tabWidth)

  execute 'set ts=' . a:tabWidth
  execute 'set softtabstop=' . a:tabWidth
  execute 'set shiftwidth=' . a:tabWidth

endfunction

if filereadable(glob("~/.vimrc.local")) 
  source ~/.vimrc.local
endif


" testar------------------------------

" Visual mode pressing * or # searches for the current selection
"  * Buscar para frente
"  # Buscar para tras
vnoremap <silent> * :call VisualSelection('f')<CR> 
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute  "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    execute("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    execute("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
