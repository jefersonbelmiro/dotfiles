"  plugin's config 

" editorconfig {
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }

" fugitive {
    nnoremap <silent> <Leader>gs :Git<CR>:8wincmd_ \| set cursorline<CR>
" }

" vim-javascript {
    " let g:javascript_opfirst = 1
" }

" javascript-libraries-syntax.vim {
    " let g:used_javascript_libs = 'jquery,angularjs'
" }

" TComment { 
" " - https://github.com/tomtom/tcomment_vim

  map <leader>c :TComment<CR>
  " vmap <leader>c :TComment<CR>

" }

" typescript {
"
    if has('nvim')
        " let g:deoplete#enable_at_startup = 1
        " autocmd FileType typescript map <buffer> <C-]> :TSDef<CR> 
        " autocmd FileType typescript map <buffer> <F1> :TSDoc<CR> 
        " autocmd FileType typescript map <buffer> <F3> :TSImport<CR> 
        " fix full path after :TSDef
        " autocmd BufCreate * silent cd .
        " let g:nvim_typescript#diagnostics_enable = 0
        " let g:nvim_typescript#follow_dir_change = 1
    else
        " let g:tsuquyomi_disable_quickfix = 1
        " let g:tsuquyomi_shortest_import_path = 1
    endif

    " let g:ale_lint_on_text_changed = 'never'
    " if you don't want linters to run on opening a file
    " let g:ale_lint_on_enter = 0
    " let g:ale_sign_error = '•' " '>>'
    " let g:ale_sign_warning = '•' " '--'
    " let g:ale_set_loclist = 0
    " let g:ale_set_quickfix = 1
    " highlight clear ALEErrorSign
    " highlight clear ALEWarningSign

    " autocmd FileType typescript map <buffer> <leader>k <Plug>(ale_previous_wrap)
    " autocmd FileType typescript map <buffer> <leader>j <Plug>(ale_next_wrap)
" }

" NERDTree {
    let g:NERDTreeMinimalUI = 1
    " let g:NERDTreeWinSize = 25
    let g:NERDTreeDirArrows = 0
    let g:NERDTreeDirArrowExpandable = '+'
    let g:NERDTreeDirArrowCollapsible = '-'
    let NERDTreeIgnore = ['\.o$', 'node_modules', '^CVS$']
    let NERDTreeRespectWildIgnore=1

    " Hide the Nerdtree status line to avoid clutter
    let g:NERDTreeStatusline = ''

    " map <leader>e :NERDTreeToggle<cr>
" }

" coc-explorer {
let g:coc_explorer_global_presets = {
            \   '.vim': {
            \     'root-uri': '~/.vim',
            \   },
            \   'cocConfig': {
            \      'root-uri': '~/.config/coc',
            \   },
            \   'tab': {
            \     'position': 'tab',
            \     'quit-on-open': v:true,
            \   },
            \   'floating': {
            \     'position': 'floating',
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingTop': {
            \     'position': 'floating',
            \     'floating-position': 'center-top',
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingLeftside': {
            \     'position': 'floating',
            \     'floating-position': 'left-center',
            \     'floating-width': 50,
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingRightside': {
            \     'position': 'floating',
            \     'floating-position': 'right-center',
            \     'floating-width': 50,
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'simplify': {
            \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
            \   },
            \   'buffer': {
            \     'sources': [{'name': 'buffer', 'expand': v:true}]
            \   },
            \ }

nmap <leader>e :CocCommand explorer<CR>
" }


" eregex - PCRE regex {
let g:eregex_default_enable = 0
let g:eregex_force_case = 1
" nnoremap <leader>/ :call eregex#toggle()<CR> 
" }

" ctrlp {
" Full path fuzzy file, buffer, mru, tag, ... finder 

" map <leader>m :CtrlPMRUFiles<CR>
" map <leader>b :CtrlPBuffer<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_files = 0
let g:ctrlp_cmd = 'CtrlPCurWD' 
let g:ctrlp_by_filename = 1
let g:ctrlp_open_multiple_files = '1jr' 

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
    let g:esearch = { 
                \ 'default_mappings': 1, 
                \ 'adapter': g:search_adapter,
                \ 'regex': 1,
                \ 'recover_regex': 1 
                \ }
    " let g:esearch#out#win#open = 'enew'
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

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change sorters.
call denite#custom#source(
            \ 'file/rec', 'sorters', ['sorter/sublime'])

" " find only in filename
" call denite#custom#source('file/rec',
"             \ 'matchers', ['converter/tail_path', 'matcher/fuzzy'])

" call denite#custom#source('file/old', 'matchers',
"       \ ['converter/abbr_word', 'matcher/fuzzy'])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
" \ 'reversed': 1,
" \ 'auto_resume': 1,
" \ 'winminheight': 10, 
" \ 'auto_resize': 1,
let s:denite_options = {
            \ 'prompt': '❯',
            \ 'split': 'floating',
            \ 'winheight': 10,
            \ 'winwidth': 99999,
            \ 'winrow': 0,
            \ 'start_filter': 1,
            \ 'source_names': 'short',
            \ 'highlight_matched_range': 'custom_deniteMatchedRange',
            \ }
call denite#custom#option('default', s:denite_options)

augroup ps_denite_setup
    au!
    autocmd FileType denite call s:denite_mappings()
    au FileType denite-filter call s:denite_filter_mappings()
augroup END

" DENITE FILTER WINDOW
function! s:denite_filter_mappings() abort
    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer> <C-j> <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-k> <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
    inoremap <silent><buffer><expr> <tab> denite#do_map('choose_action')
endfunction

" DENITE WINDOW
function! s:denite_mappings() abort
    noremap <silent><buffer><expr> <ESC> denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    noremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <tab> denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> V denite#do_map('toggle_select')
    nnoremap <silent><buffer><expr> <c-space> denite#do_map('toggle_select')
endfunction

" denite-git {
" <C-V> preview
  map <F8> :call DeniteExecute('gitlog')<CR>
" }
"
" git status 
" map <Leader>gs :call DeniteExecute('gitstatus')<CR>

" files 
map <c-p> :call DeniteExecute('file/rec')<CR>

catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" " === Coc.nvim === "
" " use <tab> for trigger completion and navigate to next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
" "Close preview window when completion is done.
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

" === Signify === "
" let g:signify_sign_delete = '-'

" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>[c <Plug>(coc-diagnostic-prev)
nmap <leader>]c <Plug>(coc-diagnostic-next)

nmap <leader>dc :call DeniteExecute('change')<CR>

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
" Run jest for current file
command! -nargs=0 JestCurrentFile :call  CocAction('runCommand', 'jest.fileTest', ['%'])
" Run jest for current test
command! -nargs=0 JestCurrentTest :call  CocAction('runCommand', 'jest.singleTest')

nmap <silent> <F3> :call FixAllProblems()<CR>
nmap <silent> <F5> :call FixCompatibilite()<CR>
nmap <silent> <F6> :call OrganizeImports()<CR>

" prettier
nmap <silent> <F7> :call FormatFile()<CR>
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

nmap <leader>b :call DeniteExecute('buffer')<CR>
nmap <leader>m :call DeniteExecute('file/old')<CR>

function! DeniteExecute(cmd, ...)
    let option = get(a:, 1, '')
    execute ':Denite ' . option . ' ' . a:cmd
endfunction

function! FixAllProblems()
    CocCommand tsserver.executeAutofix
    " CocCommand tslint.fixAllProblems
    CocCommand eslint.executeAutofix
    silent call FixCompatibilite()
    echo "autofix"
endfunction

function! FixCompatibilite() 
    silent execute ':set scr=4 | set mouse=a'
    silent syntax sync fromstart
    echo 'fixed layout'
endfunction

function! OrganizeImports() 
    CocCommand tsserver.organizeImports
    echo "fix organize imports"
endfunction

function! FormatFile() 
    CocCommand prettier.formatFile
    echo "format file"
endfunction

" Use <C-l> for trigger snippet expand.
" imap <C-j> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-n>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-p>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Load custom snippets from snippets folder
" let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Hide conceal markers
" let g:neosnippet#enable_conceal_markers = 0

" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
" let g:NERDTreeDirArrowExpandable = '⬏'
" let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

" === Signify === "
let g:signify_sign_delete = '-'


" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Set preview window to appear at bottom
" set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode


"
" " Call method on window enter
" augroup WindowManagement
"   autocmd!
"   autocmd WinEnter * call Handle_Win_Enter()
" augroup END
"
" " Change highlight group of preview window when open
" function! Handle_Win_Enter()
"   if &previewwindow
"     " setlocal winhighlight=Normal:MarkdownError
"     setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
"   endif
" endfunction


" Use K to show documentation in preview window
nnoremap <F1> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" startify
"
let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

" When opening a file or bookmark, change to its directory.
let g:startify_change_to_dir = 0
" When opening a file or bookmark, seek and change to the root directory of the VCS (if there is one). 
let g:startify_change_to_vcs_root = 1
" Automatically update sessions
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_autoload = 1
let g:startify_custom_header = startify#fortune#boxed()

set updatetime=300

"
" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
