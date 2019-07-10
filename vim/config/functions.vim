
function! Save() 

  try 

    let fileName = expand('%')
    silent execute ':w'
    " silent execute ':set ft=' . &filetype
    silent execute ':set scr=4'
    silent syntax sync fromstart
    " echo 'save ' . l:fileName
    echo 'saved'

  catch
    echohl WarningMsg | echo v:exception  
  endtry

endfunction

function! TerminalConfigure()
    silent execute ':set mouse= | startinsert'
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

" /home/dbserver/dotfiles/vim/config/functions.vim
function! CopyCurrentFileToClipboard()
    execute 'let @+=expand("%")'
endfunction

function! CopyCurrentAbsolutePathToClipboard()
    execute 'let @+=expand("%:p")'
endfunction
