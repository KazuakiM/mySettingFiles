"
"
" Memo
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
" :help internal-variables {{{
"------------------------------------------------------------------------
"| b: | buffer-variable   | Local to the current buffer.                |
"| w: | window-variable   | Local to the current window.                |
"| t: | tabpage-variable  | Local to the current tab page.              |
"| g: | global-variable   | Global.                                     |
"| l: | local-variable    | Local to a function.                        |
"| s: | script-variable   | Local to a :source'ed Vim script.           |
"| a: | function-argument | Function argument (only inside a function). |
"| v: | vim-variable      | Global, predefined by Vim.                  |
"------------------------------------------------------------------------ }}}
" :help map {{{
"---------------------------------------------------------------------------------------------------------------------------------
"|commands:                                     |modes:                                                                          |
"| Variables | Constants |  Unset  |  Destroy   | Normal | Visual | Select | Operator-pending | Insert | Command-line | Lang-Arg |
"|   :map    | :noremap  | :unmap  | :mapclear  |  yes   |  yes   |  yes   |       yes        |   -    |      -       |    -     |
"|   :nmap   | :nnoremap | :nunmap | :nmapclear |  yes   |   -    |   -    |        -         |   -    |      -       |    -     |
"|   :vmap   | :vnoremap | :vunmap | :vmapclear |   -    |  yes   |  yes   |        -         |   -    |      -       |    -     |
"|   :omap   | :onoremap | :ounmap | :omapclear |   -    |   -    |   -    |       yes        |   -    |      -       |    -     |
"|   :xmap   | :xnoremap | :xunmap | :xmapclear |   -    |  yes   |   -    |        -         |   -    |      -       |    -     |
"|   :smap   | :snoremap | :sunmap | :smapclear |   -    |   -    |  yes   |        -         |   -    |      -       |    -     |
"|   :map!   | :noremap! | :unmap! | :mapclear! |   -    |   -    |   -    |        -         |  yes   |     yes      |    -     |
"|   :imap   | :inoremap | :iunmap | :imapclear |   -    |   -    |   -    |        -         |  yes   |      -       |    -     |
"|   :cmap   | :cnoremap | :cunmap | :cmapclear |   -    |   -    |   -    |        -         |   -    |     yes      |    -     |
"|   :lmap   | :lnoremap | :lunmap | :lmapclear |   -    |   -    |   -    |        -         |  yes*  |     yes*     |   yes*   |
"--------------------------------------------------------------------------------------------------------------------------------- }}}
"}}}
"
"
" Common
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
if has('vim_starting')
    set nocompatible
    if (has("win32") || has ("win64"))
        set runtimepath+=$HOME/.vim,$HOME/.vim/after
    endif
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim
endif
augroup MyAutoCmd
    autocmd!
augroup END
augroup precious-indentline
    autocmd!
augroup END
" Variable
"let s:localtime=localtime()
"let s:time=strftime('%Y%m%d%H%M%S',s:localtime)
"let s:date_hour=strftime('%Y%m%d%H',s:localtime)
" Encode
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileformat=unix
" Basic
let mapleader=','
set scrolloff=5
autocmd MyAutoCmd FileType * set textwidth=0
autocmd MyAutoCmd FileType * set formatoptions-=cb
set autoread
set hidden
set ambiwidth=double
set spelllang+=cjk
set iminsert=0
"set spell
set backspace=indent,eol,start
set virtualedit+=block
set visualbell
set t_vb=
set noerrorbells
set foldmethod=marker
"set foldopen-=search
set viminfo+=n~/.vim/viminfo/.viminfo
set updatetime=1000
nnoremap zx :<C-U>%foldopen<CR>
set matchpairs+=<:>
nnoremap 0 $
onoremap 0 $
nnoremap 1 ^
onoremap 1 ^
nnoremap gr gT
nnoremap fa <C-w>+
nnoremap fs <C-w>-
nnoremap rq <C-w>>
nnoremap rw <C-w><
"paste
nnoremap <silent><expr><Leader>v  ':set<Space>paste<CR><Insert><C-r>+<ESC>:set<Space>nopaste<CR>'
inoremap <silent><expr><C-v> '<ESC>:set<Space>paste<CR><Insert><C-r>+<ESC>:set<Space>nopaste<CR><Insert>'
" Color
syntax on
set t_Co=256
" Check space and newLineCode.
autocmd MyAutoCmd ColorScheme * highlight TabString        cterm=reverse ctermfg=darkgray     guibg=darkgray
autocmd MyAutoCmd VimEnter,WinEnter * let w:m1 = matchadd('TabString',        "\t")
autocmd MyAutoCmd ColorScheme * highlight CrString         cterm=reverse ctermfg=darkred      guibg=darkred
autocmd MyAutoCmd VimEnter,WinEnter * let w:m2 = matchadd('CrString',         "\r")
autocmd MyAutoCmd ColorScheme * highlight CrlfString       cterm=reverse ctermfg=darkmagenta  guibg=darkmagenta
autocmd MyAutoCmd VimEnter,WinEnter * let w:m3 = matchadd('CrlfString',       "\r\n")
autocmd MyAutoCmd ColorScheme * highlight WhitespaceEOL    cterm=reverse ctermfg=lightmagenta guibg=lightmagenta
autocmd MyAutoCmd VimEnter,WinEnter * let w:m4 = matchadd('WhitespaceEOL',    '\s\+$')
autocmd MyAutoCmd ColorScheme * highlight IdeographicSpace cterm=reverse ctermfg=lightred     guibg=lightred
autocmd MyAutoCmd VimEnter,WinEnter * let w:m5 = matchadd('IdeographicSpace', '　')
" Update Visual mode target colorScheme.
autocmd MyAutoCmd ColorScheme * highlight Visual cterm=reverse ctermfg=lightgreen
colorscheme jellybeans
" Show
set title
set ruler
set laststatus=2
set wildignore+=*.bmp,*.gif,*.git,*.ico,*.jpeg,*.jpg,*.log,*.mp3,*.ogg,*.otf,*.pdf,*.png,*.qpf2,*.svn,*.ttf,*.wav,.DS_Store
set wildmenu
set wildmode=longest:full,full
" [memo]
" q:  command history
" q/  downward search
" q?  upward search
set history=1000
set number
set cursorline
set cursorcolumn
" Clipboard
set clipboard+=autoselect,unnamed
" Backup
set backup
set backupdir=$HOME/.vim/backup
set swapfile
set directory=$HOME/.vim/swap
set noundofile
"set undofile
"autocmd MyAutoCmd VimEnter * call s:auto_mkdir($HOME.'/.vim/undo/'.s:date_hour.'/', 1)
"let g:undodir_path=$HOME.'/.vim/undo/'.s:date_hour.'/'
"set undodir=eval(g:undodir_path)
" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
" Search
set incsearch
set ignorecase
set smartcase
set hlsearch
set wrapscan
nnoremap <expr><Leader>%s ':%s/'.expand('<cword>').'//gc<Left><Left><Left>'
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" pretty print
nnoremap <Leader>xml  :execute '%!xmllint --noblanks --nowrap --encode UTF-8 --format %'<CR>
nnoremap <Leader>json :execute '%!python -m json.tool'<CR>
" register
vnoremap <C-w> "ay
vnoremap <C-e> "by
nnoremap <expr>;s ':%s/<C-r>a/<C-r>b/gc'
" SQL
let g:sql_type_default='mysql'
" PHP
let php_sql_query          = 1
let php_baselib            = 1
let php_htmlInStrings      = 1
let php_noShortTags        = 1
let php_parent_error_close = 1
" Vim
nnoremap [vim] <Nop>
nmap <Leader>f [vim]
nnoremap [vim]e :tabnew<Space>$MYVIMRC<CR>
nnoremap [vim]s :source<Space>$MYVIMRC<CR>
nnoremap [vim]h :source<Space>$VIMRUNTIME/syntax/colortest.vim<CR>
" Close sub window
autocmd MyAutoCmd CmdwinEnter * nmap <silent> <ESC><ESC> :q<CR>
autocmd MyAutoCmd CmdwinLeave * nunmap <ESC><ESC>
"}}}
"
"
" NeoBundle START
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
call neobundle#begin(expand('$HOME/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
let g:neobundle#log_filename = $HOME.'/.vim/neobundle.vim/neobundle.log'
"}}}
"
"
" NeoBundle
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
if neobundle#has_cache()
    NeoBundleLoadCache
else
    " vimproc {{{
    NeoBundle 'Shougo/vimproc', {
    \    'build' : {
    \        'mac'    : 'make -f make_mac.mak',
    \        'unix'   : 'make -f make_unix.mak',
    \        'cygwin' : 'make -f make_cygwin.mak',},} "}}}
    NeoBundle 'vim-jp/vital.vim'
    NeoBundle 'mattn/webapi-vim'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'Yggdroot/indentLine'
    NeoBundle 'thinca/vim-ref'
    NeoBundle 'szw/vim-tags'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'vim-scripts/matchit.zip'
    NeoBundle 'tpope/vim-endwise'
    NeoBundle 'fuenor/qfixgrep'
    NeoBundle 'LeafCage/yankround.vim'
    NeoBundle 'glidenote/memolist.vim'
    NeoBundle 'thinca/vim-quickrun'
    NeoBundle 'thinca/vim-prettyprint'
    NeoBundle 'KazuakiM/vim-snippets'
    NeoBundle 'SirVer/ultisnips'

    NeoBundleSaveCache
endif
" lightline {{{
let g:lightline = {
\    'colorscheme': 'jellybeans',
\    'active':      {
\        'left':  [['mode','paste',],['fugitive','filename',],],
\        'right': [['qfstatusline','lineinfo',],['percent',],['fileformat','fileencoding','filetype',],],},
\    'component_function': {
\        'fugitive':     'MyFugitive',
\        'filename':     'MyFilename',
\        'fileformat':   'MyFileformat',
\        'filetype':     'MyFiletype',
\        'fileencoding': 'MyFileencoding',
\        'mode':         'MyMode',},
\    'component_expand': {
\        'qfstatusline': 'qfstatusline#Update',},
\    'component_type': {
\        'qfstatusline': 'error',},
\    'subseparator': {
\        'left':  '|',
\        'right': '|',},}
function! MyModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
    return &ft !~? 'help' && &readonly ? 'x' : ''
endfunction
function! MyFilename()
    let fname    = expand('%:t')
    return fname =~ '__Gundo\|NERD_tree' ? '' :
    \    &ft == 'unite' ? unite#get_status_string() :
    \    ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \    ('' != fname ? fname : '[No Name]') .
    \    ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
    try
        if expand('%:t') !~? 'Gundo\|NERD' && exists('*fugitive#head')
            let mark = ''  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfunction
function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '-') : ''
endfunction
function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
let g:unite_force_overwrite_statusline = 0
"}}}
" indentLine {{{
let g:indentLine_faster = 1
"}}}
" vim-ref {{{
let g:ref_cache_dir       = $HOME.'/.vim/vim-ref/cache'
let g:ref_phpmanual_path  = $HOME.'/.vim/vim-ref/php-chunked-xhtml'
let g:ref_detect_filetype = {
\    'html':       'phpmanual',
\    'javascript': 'phpmanual',
\    'css':        'phpmanual',}
inoremap <silent><C-k> <C-o>:call<space>ref#K("normal")<CR><ESC>
"}}}
" vim-tags {{{
let g:vim_tags_auto_generate = 1
nnoremap <Leader>tags :TagsGenerate
nnoremap <Leader>] <C-]>
nnoremap <Leader>: :<C-u>tab<Space>stj<Space><C-R>=expand('<cword>')<CR><CR>
nnoremap <Leader>[ <C-o>
nnoremap <Leader>ts :ts<CR>
" add .vimrc.local
"}}}
" qfixgrep {{{
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
let g:QFixWin_EnableMode   = 1
let g:QFix_UseLocationList = 1
nnoremap <expr> <Leader>grep ':silent grep! '.expand('<cword>').' '.vital#of("vital").import("Prelude").path2project_directory("%").'<CR>'
autocmd MyAutoCmd QuickfixCmdPost *grep* cwindow
"}}}
" yankround.vim {{{
let g:yankround_dir=$HOME.'/.vim/yankround.vim'
nmap p <Plug>(yankround-p)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
highlight YankRoundRegion cterm=underline ctermfg=magenta
let g:yankround_use_region_hl       = 1
let g:yankround_region_hl_groupname = 'YankRoundRegion'
"}}}
" memolist.vim {{{
let g:memolist_path                 = '$HOME/.vim/memolist.vim'
let g:memolist_filename_prefix_none = 1
let g:memolist_unite                = 1
let g:memolist_unite_source         = 'file_rec'
let g:memolist_unite_option         = '-default-action=tabopen'
nnoremap [memolist] <Nop>
nmap <Leader>m [memolist]
nnoremap [memolist]n :MemoNew<CR>
nnoremap [memolist]l :MemoList<CR>
"}}}
" vim-quickrun {{{
nnoremap <Leader>run :QuickRun<CR>
let g:quickrun_config = {
\    '_': {
\        'hook/close_buffer/enable_empty_data': 1,
\        'hook/close_buffer/enable_failure':    1,
\        'outputter':                           'multi:buffer:quickfix',
\        'outputter/buffer/close_on_empty':     1,
\        'outputter/buffer/split':              ':botright',
\        'runner':                              'vimproc',
\        'runner/vimproc/updatetime':           60,},
\    'watchdogs_checker/_': {
\        'hook/close_quickfix/enable_exit':           1,
\        'hook/back_window/enable_exit':              0,
\        'hook/back_window/priority_exit':            1,
\        'hook/quickfix_status_enable/enable_exit':   1,
\        'hook/quickfix_status_enable/priority_exit': 2,
\        'hook/qfsigns_update/enable_exit':           1,
\        'hook/qfsigns_update/priority_exit':         3,
\        'hook/qfstatusline_update/enable_exit':      1,
\        'hook/qfstatusline_update/priority_exit':    4,
\        'outputter/quickfix/open_cmd':               '',},
\    'watchdogs_checker/php': {
\        'command':     'php',
\        'exec':        '%c -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0 -l %o %s:p',
\        'errorformat': '%m\ in\ %f\ on\ line\ %l',},
\    'markdown': {
\        'outputter': 'browser',},
\    'php': {
\        'command':                          'phpunit',
\        'cmdopt':                           '--no-configuration',
\        'hook/close_buffer/enable_failure': 0,
\        'outputter/buffer/split':           ':botright 7sp',},}
"}}}
" ultisnips {{{
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
"let g:UltiSnipsJumpBackwardTrigger=''
let g:UltiSnipsEditSplit          = 'vertical'
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/bundle/vim-snippets/UltiSnips'
"}}}
"}}}
"
"
" NeoBundleLazy
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
" unite.vim
" unite-webcolorname
" unite-help
" vim-editvar
" codic-vim
" unite-codic.vim
" unite-tag
" jazzradio.vim {{{
NeoBundleLazy 'Shougo/unite.vim', {
\    'commands' : 'Unite',}
NeoBundleLazy 'pasela/unite-webcolorname', {
\    'depends':       'Shougo/unite.vim',
\    'unite_sources': 'webcolorname',}
NeoBundleLazy 'Shougo/unite-help', {
\    'depends':       'Shougo/unite.vim',
\    'unite_sources': 'help',}
NeoBundleLazy 'thinca/vim-editvar', {
\    'depends':       ['thinca/vim-prettyprint', 'Shougo/unite.vim'],
\    'unite_sources': 'variable',}
NeoBundleLazy 'rhysd/unite-codic.vim', {
\    'depends':       ['koron/codic-vim', 'Shougo/unite.vim'],
\    'unite_sources': 'codic',}
NeoBundleLazy 'tsukkee/unite-tag' , {
\    'depends':       'Shougo/unite.vim',
\    'unite_sources': 'tag',}
NeoBundleLazy 'supermomonga/jazzradio.vim', {
\    'depends':       'Shougo/unite.vim',
\    'unite_sources': 'jazzradio',
\    'commands':      [
\        'JazzradioUpdateChannels',
\        'JazzradioStop',
\        {
\            'name':     'JazzradioPlay',
\            'complete': 'customlist,jazzradio#channel_id_complete'},],
\    'function_prefix' : 'jazzradio',}
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
" default plugins
nnoremap <silent> [unite]f    :<C-u>call<Space>DispatchUniteFileRecAsyncOrGit()<CR>
nnoremap <silent> [unite]map  :<C-u>Unite<Space>output:map\|map!\|lmap<CR>
nnoremap <silent> [unite]msg  :<C-u>Unite<Space>output:message<CR>
nnoremap <silent> [unite]s    :<C-u>Unite<Space>-default-action=ex<Space>output:scriptnames<CR>
" add plugins
nnoremap <silent> [unite]dic :<C-u>Unite<Space>codic<CR>
nnoremap <silent> [unite]h   :<C-u>Unite<Space>help<CR>
nnoremap <silent> [unite]t   :<C-u>Unite<Space>tag<CR>
nnoremap <silent> [unite]v   :<C-u>Unite<Space>-auto-preview<Space>variable<CR>
nnoremap <silent> [unite]web :<C-u>Unite<Space>webcolorname<CR>
nnoremap <silent> [unite]y   :<C-u>Unite<Space>yankround<CR>
" jazzradio
nnoremap [jazzradio] <Nop>
nmap <Leader>j [jazzradio]
nnoremap [jazzradio]u :JazzradioUpdateChannels<CR>
nnoremap [jazzradio]p :JazzradioPlay<Space>CurrentJazz<CR>
nnoremap [jazzradio]o :JazzradioStop<CR>
nnoremap [jazzradio]l :<C-u>Unite<Space>jazzradio<CR>
" http://qiita.com/yuku_t/items/9263e6d9105ba972aea8
function! DispatchUniteFileRecAsyncOrGit()
    if isdirectory(getcwd().'/.git')
        Unite -default-action=tabopen file_rec/git
    else
        Unite -default-action=tabopen file_rec/async:!
    endif
endfunction
let s:hooks = neobundle#get_hooks('unite.vim')
function! s:hooks.on_source(bundle)
    let g:unite_data_directory             = $HOME.'/.vim/unite.vim'
    let g:unite_enable_start_insert        = 1
    let g:unite_source_grep_command        = 'ag'
    let g:unite_source_grep_default_opts   = '--nocolor --nogroup'
    let g:unite_source_grep_recursive_opt  = ''
    let g:unite_source_grep_max_candidates = 200
endfunction
unlet s:hooks
let s:hooks = neobundle#get_hooks('unite-tag')
function! s:hooks.on_source(bundle)
    let g:unite_source_tag_max_name_length  = 30
    let g:unite_source_tag_max_fname_length = 128
    let g:unite_source_tag_show_location    = 0
endfunction
unlet s:hooks
let s:hooks = neobundle#get_hooks('jazzradio.vim')
function! s:hooks.on_source(bundle)
    let g:jazzradio#cache_dir = $HOME.'/.vim/jazzradio.vim'
endfunction
unlet s:hooks
"}}}
" vimdoc-ja {{{
NeoBundleLazy 'vim-jp/vimdoc-ja', {
\    'commands' : 'help',}
"helptags $HOME/.vim/bundle/vimdoc-ja/doc/
"}}}
" open-browser.vim {{{
NeoBundleLazy 'tyru/open-browser.vim', {
\    'functions' : 'OpenBrowser',
\    'commands'  : ['OpenBrowser', 'OpenBrowserSearch'],
\    'mappings'  : '<Plug>(openbrowser-smart-search)',}
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>gx <Plug>(openbrowser-smart-search)
vmap <Leader>gx <Plug>(openbrowser-smart-search)
"}}}
" taglist.vim {{{
NeoBundleLazy 'vim-scripts/taglist.vim', {
\    'commands' : 'Tlist',}
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Show_One_File    = 1
let g:Tlist_Exit_OnlyWindow  = 1
let g:Tlist_WinWidth         = 20
let g:tlist_php_settings     = 'php;c:class;f:function;d:constant'
nnoremap <Leader>t :Tlist<CR>
"}}}
" nerdtree {{{
NeoBundleLazy 'scrooloose/nerdtree', {
\    'commands' : 'NERDTree',}
nnoremap <expr><Leader>n ':NERDTree '.vital#of("vital").import("Prelude").path2project_directory("%").'<CR>'
let g:NERDTreeWinSize           = 20
let g:NERDTreeMinimalUI         = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeShowHidden        = 1
autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
"}}}
" vim-easy-align {{{
NeoBundleLazy 'junegunn/vim-easy-align', {
\    'commands' : 'EasyAlign',}
vnoremap <silent> <Leader>a :EasyAlign<CR>
let g:easy_align_delimiters = {
\    '=': {
\        'pattern':       '===\|!==\|<=>\|\(&&\|||\|<<\|>>\)=\|=\~[#?]\?\|=>\|[:+/*!%^=><&|.-]\?=[#?]\?',
\        'left_margin':   1,
\        'right_margin':  1,
\        'stick_to_left': 0 },
\    '>': {
\        'pattern': '>>\|=>\|>', },
\    '/': {
\        'pattern':       '//\+\|/\*\|\*/',
\        'ignore_groups': ['String'], },
\    '#': {
\        'pattern':         '#\+',
\        'ignore_groups':   ['String'],
\        'delimiter_align': 'l', },
\    '$': {
\        'pattern':         '\((.*\)\@!$\(.*)\)\@!',
\        'ignore_groups':   ['String'],
\        'right_margin':    0,
\        'delimiter_align': 'l', },
\    ']': {
\        'pattern':       '[[\]]',
\        'left_margin':   0,
\        'right_margin':  0,
\        'stick_to_left': 0, },
\    ')': {
\        'pattern':       '[()]',
\        'left_margin':   0,
\        'right_margin':  0,
\        'stick_to_left': 0, },
\    'd': {
\        'pattern':      '\(\S\+\s*[;=]\)\@=',
\        'left_margin':  0,
\        'right_margin': 0, }, }
"}}}
" Align
" SQLUtilities {{{
NeoBundleLazy 'vim-scripts/SQLUtilities', {
\    'depends':  'vim-scripts/Align',
\    'commands': 'SQLUFormatter',}
let g:sqlutil_align_comma = 1
nnoremap <Leader>sql :SQLUFormatter<CR>
"}}}
" vim-regexper {{{
NeoBundleLazy 'KazuakiM/vim-regexper'
let g:regexper#AppPath = $HOME.'/.vim/bundle/regexper'
nnoremap <Leader>reg :RegexperExecute<Space>
"}}}
" wildfire.vim {{{
NeoBundleLazy 'gcmt/wildfire.vim', {
\    'mappings' : '<Plug>(wildfire-fuel)',}
map <ENTER> <Plug>(wildfire-fuel)
let s:hooks = neobundle#get_hooks('wildfire.vim')
function! s:hooks.on_source(bundle)
    map <BS> <Plug>(wildfire-water)
    let g:wildfire_objects = {
    \        '*':        ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it',],
    \        'html,xml': ['at', 'it',],}
endfunction
unlet s:hooks
"}}}
" neocomplete.vim {{{
NeoBundleLazy 'Shougo/neocomplete.vim', {
\    'depends': ['SirVer/ultisnips', 'KazuakiM/vim-snippets',],
\    'insert':  1,}
let s:hooks = neobundle#get_hooks('neocomplete.vim')
function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup                  = 0
    let g:neocomplete#data_directory           = $HOME.'/.vim/neocomplete.vim'
    let g:neocomplete#enable_at_startup        = 1
    let g:neocomplete#enable_smart_case        = 1
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplete#same_filetypes           = {
    \   'html': 'html,css,javascript,php',}
    let g:neocomplete#sources = {
    \   '_':    ['file', 'ultisnips', 'buffer', 'dictionary', ],
    \   'vim':  ['file', 'ultisnips', 'buffer', 'dictionary', 'vim'],
    \   'html': ['file', 'ultisnips', 'buffer', 'dictionary', ],}
    let g:neocomplete#sources#dictionary#dictionaries = {
    \   'default':  '',
    \   'php':      $HOME.'/.vim/dict/php.dict',}
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    inoremap <expr><C-c> pumvisible() ? "\<C-n>" : "\<C-c>"
    " tags using.
    "let g:neocomplete#sources = {
    "\   '_':    ['file', 'ultisnips', 'buffer', 'dictionary', 'tag',],
    "\   'vim':  ['file', 'ultisnips', 'buffer', 'dictionary', 'tag', 'syntax', 'vim'],
    "\   'html': ['file', 'ultisnips', 'buffer', 'dictionary', 'tag', 'syntax',],}
    "let g:neocomplete#sources#tags#cache_limit_size     = 10000000
endfunction
unlet s:hooks
"}}}
" gundo.vim {{{
NeoBundleLazy 'sjl/gundo.vim', {
\    'insert' : 1,}
let s:hooks = neobundle#get_hooks('gundo.vim')
function! s:hooks.on_source(bundle)
    nnoremap u g-
    nnoremap <C-r> g+
    nnoremap <Leader>gundo :GundoToggle<CR>
endfunction
unlet s:hooks
"}}}
" sudo.vim {{{
"# command memo
"* ':w sudo:%'          :sudo save
"* ':w sudo:<filename>' :sudo another name save
"* ':e sudo:%'          :sudo open
NeoBundleLazy 'vim-scripts/sudo.vim', {
\    'insert' : 1,}
let s:hooks = neobundle#get_hooks('sudo.vim')
function! s:hooks.on_source(bundle)
    nnoremap [sudo] <Nop>
    nmap <Leader>su [sudo]
    nnoremap <silent> [sudo]w :w<Space>sudo:%<CR>
    nnoremap <silent> [sudo]a :w<Space>sudo:
    nnoremap <silent> [sudo]r :e<Space>sudo:%<CR>
endfunction
unlet s:hooks
"}}}
" vim-php-cs-fixer {{{
NeoBundleLazy 'stephpy/vim-php-cs-fixer', {
\    'filetypes': 'php',}
let s:hooks = neobundle#get_hooks('vim-php-cs-fixer')
function! s:hooks.on_source(bundle)
    " If php-cs-fixer is in $PATH, you don't need to define 'let g:php_cs_fixer_path=/path/to/file'.
    " And this setting is moved at OS type category.
    let g:php_cs_fixer_level                  = 'all'     " which level ?
    let g:php_cs_fixer_config                 = 'default' " configuration
    let g:php_cs_fixer_php_path               = 'php'     " Path to PHP
    " If you want to define specific fixers:
    "let g:php_cs_fixer_fixers_list = 'linefeed,short_tag,indentation'
    let g:php_cs_fixer_enable_default_mapping = 1         " Enable the mapping by default (<leader>pcd)
    let g:php_cs_fixer_dry_run                = 0         " Call command with dry-run option
    let g:php_cs_fixer_verbose                = 0         " Return the output of command if 1, else an inline information.
    let g:php_cs_fixer_enable_default_mapping = 0
    nnoremap <Leader>php :call<Space>PhpCsFixerFixFile()<CR>
endfunction
unlet s:hooks
"}}}
" shabadou.vim
" vim-qfsigns
" vim-qfstatusline
" quickfixstatus
" vim-watchdogs {{{
NeoBundleLazy 'osyo-manga/vim-watchdogs', {
\    'depends':   ['thinca/vim-quickrun', 'osyo-manga/shabadou.vim', 'KazuakiM/vim-qfsigns', 'KazuakiM/vim-qfstatusline', 'dannyob/quickfixstatus'],
\    'filetypes': ['php', 'javascript', 'ruby'],}
let s:hooks = neobundle#get_hooks('vim-watchdogs')
function! s:hooks.on_source(bundle)
    "vim-qfsigns
    nnoremap <Leader>sy :QfsignsJunmp<CR>
    "let g:qfsigns#AutoJump = 2

    "vim-qfstatusline
    let g:Qfstatusline#UpdateCmd = function('lightline#update')

    "vim-watchdogs
    let g:watchdogs_check_BufWritePost_enable = 1
    let g:watchdogs_check_CursorHold_enable   = 1
endfunction
unlet s:hooks
"}}}
" vim-markdown {{{
NeoBundleLazy 'plasticboy/vim-markdown', {
\    'filetypes': 'markdown',}
"}}}
" previm {{{
NeoBundleLazy 'kannokanno/previm', {
\    'depends':   'open-browser.vim',
\    'filetypes': 'markdown',}
nnoremap <silent> <Leader>pre :PrevimOpen<CR>
"}}}
"}}}
"
"
" NeoBundleFetch
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
"# function memo
"* New Install 'NeoBundle'. And Update 'NeoBundle' to 'NeoBundleFetch'.
" ColorScheme {{{
NeoBundleFetch 'nanotech/jellybeans.vim'
NeoBundleFetch 'altercation/vim-colors-solarized'
NeoBundleFetch 'tomasr/molokai'
"}}}
" Lingr (none-Vimplugin but there is vim-users.jp room.) {{{
NeoBundleFetch 'psychs/lingr-irc'
"}}}
" neosnippet-snippets {{{
NeoBundleFetch 'KazuakiM/neosnippet-snippets'
"}}}
" PHP {{{
"* URL: https://github.com/ziadoz/awesome-php
NeoBundleFetch 'ziadoz/awesome-php'
nnoremap <Leader>awe :tabnew $HOME/.vim/bundle/awesome-php/README.md<CR>
"}}}
" Regexper {{{
NeoBundleFetch 'javallone/regexper'
"}}}
"}}}
"
"
" OS type
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
if has('mac')
    " Programming language
    let $PYTHON_DLL = '/usr/local/Cellar/python/2.7.7_2/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib'
    "let $PYTHON3_DLL = '/usr/local/Cellar/python3/3.4.1/Frameworks/Python.framework/Versions/3.4/lib/libpython3.4.dylib'
    let $PERL_DLL   = '/usr/local/Cellar/perl518/5.18.2/lib/5.18.2/darwin-thread-multi-2level/CORE/libperl.dylib'
    let $RUBY_DLL   = '/usr/local/lib/libruby.dylib'
    let $LUA_DLL    = '/usr/local/lib/liblua.dylib'
    let g:previm_open_cmd  = 'open -a firefox'
    let g:regexper#OpenCmd = 'open -a firefox'
else
    autocmd MyAutoCmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    " php setting.
    let g:php_cs_fixer_path = '$HOME/.vim/vim-php-cs-fixer/php-cs-fixer' " define the path to the php-cs-fixer.phar
endif
"}}}
"
"
" NeoBundle END
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
call neobundle#end()
"}}}
"
"
" FileType
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
filetype plugin indent on
autocmd MyAutoCmd BufNewFile,BufRead *.{md,mkd,mdwn,mkdn,mark*} setlocal filetype=markdown
autocmd MyAutoCmd BufNewFile,BufRead *.coffee                   setlocal filetype=coffee
autocmd MyAutoCmd BufNewFile,BufRead *.{snip*}                  setlocal filetype=snippets
autocmd MyAutoCmd BufNewFile,BufRead *.{bin,exe}                setlocal filetype=xxd
"}}}
"
"
" Extra local functions
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
" quickrun - prettyprint {{{
"# function memo
"* URL: http://qiita.com/rbtnn/items/39d9ba817329886e626b
"* NoFormattings :echo neobundle#config#get_neobundles()
"* Formattings   :QuickRunPP neobundle#config#get_neobundles()
"* Formatting    :QuickRunPP neobundle#get('vim-markdown')
function! s:quickrun_pp(q_args)
    let a:dict = {
    \    'type':                      'vim', 'runner':           'vimscript', 'outputter':          'buffer',
    \    'outputter/buffer/filetype': 'vim', 'hook/eval/enable': 1,           'hook/eval/template': 'echo PP(%s)',
    \    'src':                       a:q_args,}
    call quickrun#run(a:dict)
endfunction
command! -nargs=1 -complete=expression QuickRunPP :call<Space>s:quickrun_pp(<q-args>)
"}}}
" Auto DirectoryMake {{{
function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force || input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction
"}}}
" File/Buffer information {{{
function! FileInfo(filename)
    let a:fn = expand('%:p')
    echo '[filename ]'.a:fn
    echo '[type     ]'.getftype(a:fn)
    echo '[mtime    ]'.strftime('%Y-%m-%d %H:%M %a', getftime(a:fn))
    echo '[size     ]'.getfsize(a:fn).' bytes'
    echo '[perm     ]'.getfperm(a:fn)
endfunction
function! BufferInfo()
    echo '[bufnr    ]'.bufnr('%')
    echo '[bufname  ]'.expand('%:p')
    echo '[cwd      ]'.getcwd()
    if filereadable(expand('%'))
        echo '[mtime    ]'.strftime('%Y-%m-%d %H:%M %a',getftime(expand('%')))
    endif
    echo '[size     ]'.(line2byte(line('$') + 1) - 1) . ' bytes'
    echo '[filetype ]'.&ft
    echo '[expandtab]'.(&et ? 'true' : 'false')
    echo '[tabstop  ]'.&ts
endfunction
nnoremap <F2> :call<Space>FileInfo(expand('<cfile>'))<CR>
nnoremap <F3> :call<Space>BufferInfo()<CR>
"}}}
"}}}
"
"
" Other setting files
"----------------------------------------------------------------------------------------------------------------------------------
"{{{
" Environment setting file
if (has("win32") || has ("win64"))
    source ~/.vimrc.win
else
    source ~/.vimrc.local
endif
"}}}

