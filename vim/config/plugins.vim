"  plugin's config 

" editorconfig {
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }

" fugitive {
    nnoremap <silent> <Leader>gs :Gstatus<CR>:20wincmd_<CR>
" }

" vim-javascript {
    let g:javascript_opfirst = 1
" }

" javascript-libraries-syntax.vim {
    let g:used_javascript_libs = 'jquery,angularjs'
" }

" TComment { 
" " - https://github.com/tomtom/tcomment_vim

  map <leader>c :TComment<CR>
  " vmap <leader>c :TComment<CR>

" }

" AsyncFinder {
  map <F7> :AsyncFinderBottom<CR>
" }

" typescript {
"
    if has('nvim')
        let g:deoplete#enable_at_startup = 1
        autocmd FileType typescript map <buffer> <C-]> :TSDef<CR> 
        autocmd FileType typescript map <buffer> <F1> :TSDoc<CR> 
        autocmd FileType typescript map <buffer> <F3> :TSImport<CR> 
        " fix full path after :TSDef
        autocmd BufCreate * cd .
        let g:nvim_typescript#diagnostics_enable = 0
        let g:nvim_typescript#follow_dir_change = 1
    else
        let g:tsuquyomi_disable_quickfix = 1
        let g:tsuquyomi_shortest_import_path = 1
    endif

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

" NERDTree {
    let g:NERDTreeMinimalUI = 1
    " let g:NERDTreeWinSize = 25
    let g:NERDTreeDirArrows = 0
    let g:NERDTreeDirArrowExpandable = '+'
    let g:NERDTreeDirArrowCollapsible = '-'
    let NERDTreeIgnore = ['\.o$', 'node_modules', '^CVS$']
    map <leader>e :NERDTreeToggle<cr>
" }

" eregex - PCRE regex {
let g:eregex_default_enable = 0
let g:eregex_force_case = 1
" nnoremap <leader>/ :call eregex#toggle()<CR> 
" }

" ctrlp {
" Full path fuzzy file, buffer, mru, tag, ... finder 

map <leader>m :CtrlPMRUFiles<CR>
map <leader>b :CtrlPBuffer<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_files = 0
let g:ctrlp_cmd = 'CtrlPCurWD' 
let g:ctrlp_by_filename = 1

if executable('rg') " RIPGREP
    let g:search_adapter='rg'
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
elseif executable('ag') " SILVER SEARCHER
    let g:search_adapter='ag'
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(CVS|git|hg|svn)$',
            \ 'file': '\v\.(jpg|png|gif)$'
            \ }

" }

" esearch {
    let g:esearch = { 'default_mappings': 1, 'adapter': g:search_adapter, 'regex': 1, 'recover_regex': 1 }
" }

" supertab  {
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
    let g:SuperTabDefaultCompletionType = "<c-n>"
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

" cvsdiff {
  map <F8> :CvsDiffToggle<cr>
" }

" incsearch {
  " map <leader>n <Plug>(incsearch-fuzzy-/)
  map <leader>n <Plug>(incsearch-fuzzy-stay)
" }


" Vim plugin that displays tags in a window, ordered by scope
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

let g:tagbar_type_typescript = {                                                  
            \ 'ctagsbin' : 'tstags',                                                        
            \ 'ctagsargs' : '-f-',                                                           
            \ 'kinds': [                                                                     
            \ 'e:enums:0:1',                                                               
            \ 'f:function:0:1',                                                            
            \ 't:typealias:0:1',                                                           
            \ 'M:Module:0:1',                                                              
            \ 'I:import:0:1',                                                              
            \ 'i:interface:0:1',                                                           
            \ 'C:class:0:1',                                                               
            \ 'm:method:0:1',                                                              
            \ 'p:property:0:1',                                                            
            \ 'v:variable:0:1',                                                            
            \ 'c:const:0:1',                                                              
            \ ],                                                                            
            \ 'sort' : 0                                                                    
            \ } 

" }

