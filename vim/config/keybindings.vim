
" MAPKEYS

if has('nvim')
    " alt+backspace delete word backward
    imap <A-BS> <C-W>
    cmap <A-BS> <C-W>
else
    " alt+backspace delete word backward
    imap <esc><bs> <C-W>
    cmap <esc><bs> <C-W>
    " alt+delete delete word forward
    imap [3;3~ <c-o>dw
endif

" abre arquivo
map <F9> <ESC> :call OenFile() <CR>

" esconde hlsearch 
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

" set capslock to escape key
" au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

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
imap <F4> <esc>:q<CR>

" add '"([{< in selected text
" vnoremap ' c''<ESC>P 
" vnoremap " c""<ESC>P 
" vnoremap ( c()<ESC>P 
" vnoremap [ c[]<ESC>P 
" vnoremap { c{}<ESC>P 
" " vnoremap < c<><ESC>P 

" identation
vmap <TAB> >gv
vmap <S-TAB> <gv

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

if has('nvim')
    tmap <C-j> <ESC><C-j>
    tmap <C-k> <ESC><C-k>
    tmap <C-l> <ESC><C-l>
    tmap <C-h> <ESC><C-h>
endif

" terminal mode, sai do insert mode
if has('nvim')
    tnoremap <ESC> <C-\><C-n>
endif

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
" inoremap <C-k> <c-o>k
" inoremap <C-j> <c-o>j
inoremap <C-h> <c-o>h
inoremap <C-l> <c-o>l

noremap gf gF
