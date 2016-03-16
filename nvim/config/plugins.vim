"  plugin's config 

if has('nvim')
" deoplete.nvim {
    let g:deoplete#enable_at_startup = 1
" }
endif

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
  let g:EasyMotion_use_upper = 1
  let g:EasyMotion_use_smartsign_us = 1

" }
