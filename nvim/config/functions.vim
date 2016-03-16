
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



" ----------------------- TESTES ------------------------------

" @todo - https://github.com/hkupty/dotfiles

" @todo - color pequisa  
" call matchaddpos('WildMenu', [[20, 9, 1]])
" help matchaddpos
" criar grupo com underline vermelho, parecido com plugin easy-motion

" @todo - plugin visual-star-search.vim 
" usar: 
" let current_win_state = winsaveview()
" call winrestview(current_win_state)

" @todo - colorir jumps, marks, undolist
" user: matchaddpos


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
