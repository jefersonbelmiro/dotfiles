"  plugin's config 

" deoplete.nvim {
if has('nvim')
    let g:deoplete#enable_at_startup = 1
    " disable autocomplete

    let g:deoplete#disable_auto_complete = 1
    if has("gui_running")
        inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
    else
        inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
    endif
endif 
" }

" ultisnips {

    " UltiSnips config
    " inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    let g:UltiSnipsExpandTrigger="<c-k>"
    let g:UltiSnipsJumpForwardTrigger="<c-k>"
    let g:UltiSnipsJumpBackwardTrigger="<c-j>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical" 

" }

" javascript-libraries-syntax.vim {
    let g:used_javascript_libs = 'jquery,angularjs'
" }

" NERDTree {
    let g:NERDTreeWinSize = 25
    let g:NERDTreeDirArrows=0
    map <leader>e :NERDTreeToggle<cr>
" }

" TComment { 
" " - https://github.com/tomtom/tcomment_vim

  map <leader>c :TComment<CR>
  " vmap <leader>c :TComment<CR>

" }

" ctrlp {

    map <leader>m :CtrlPBufTag<CR>
    map <leader>b :CtrlPBuffer<CR>
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPCurWD' 
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(CVS|git|hg|svn)$',
                \ 'file': '\v\.(jpg|png|gif)$'
                \ }

" }

" Command-t {

  " let g:CommandTMaxFiles = 99999
  " let g:CommandTMaxDepth = 99999
  " let g:CommandTMaxHeight = 10
  " " let g:CommandTFileScanner = 'find'
  " map <leader>b :CommandTMRU<CR>
  " if &term =~ "xterm" || &term =~ "screen"
  "   let g:CommandTCancelMap = ['<ESC>', '<C-c>']
  " endif

" }

" tagbar {

    nmap <leader>t :TagbarToggle<CR>
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