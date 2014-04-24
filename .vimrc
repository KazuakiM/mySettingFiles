" Memo
"{{{
"   :help internal-variables
"{{{
"-----------------------------------------------------------------------------------------------------------
" buffer-variable    b:   Local to the current buffer.
" window-variable    w:   Local to the current window.
" tabpage-variable   t:   Local to the current tab page.
" global-variable    g:   Global.
" local-variable     l:   Local to a function.
" script-variable    s:   Local to a :source'ed Vim script.
" function-argument  a:   Function argument (only inside a function).
" vim-variable       v:   Global, predefined by Vim.
"-----------------------------------------------------------------------------------------------------------
"}}}
"   :help map
"{{{
"-----------------------------------------------------------------------------------------------------------
"                                        modes:
" commands:                              Normal Visual Select Operator-pending Insert Command-line Lang-Arg
" :map   :noremap   :unmap   :mapclear    yes    yes    yes         yes          -         -          -
" :nmap  :nnoremap  :nunmap  :nmapclear   yes     -      -           -           -         -          -
" :vmap  :vnoremap  :vunmap  :vmapclear    -     yes    yes          -           -         -          -
" :omap  :onoremap  :ounmap  :omapclear    -      -      -          yes          -         -          -
" :vmap  :vnoremap  :vunmap  :vmapclear    -     yes    yes          -           -         -          -
" :xmap  :xnoremap  :xunmap  :xmapclear    -     yes     -           -           -         -          -
" :smap  :snoremap  :sunmap  :smapclear    -      -     yes          -           -         -          -
" :map!  :noremap!  :unmap!  :mapclear!    -      -      -           -          yes       yes         -
" :imap  :inoremap  :iunmap  :imapclear    -      -      -           -          yes        -          -
" :cmap  :cnoremap  :cunmap  :cmapclear    -      -      -           -           -        yes         -
" :lmap  :lnoremap  :lunmap  :lmapclear    -      -      -           -          yes*      yes*       yes*
"-----------------------------------------------------------------------------------------------------------
"}}}
"   color
"{{{
" confirm the definition of color
"   :so $VIMRUNTIME/syntax/colortest.vim
" check the status of the current Vim
"   :so $VIMRUNTIME/syntax/hitest.vim
"}}}
"}}}
" Common
"{{{
set nocompatible
" Encode
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
" Basic
let mapleader=','
set scrolloff=5
set textwidth=0
set autoread
set hidden
set backspace=indent,eol,start
set vb t_vb= "
set foldmethod=marker
" Color
syntax on
set t_Co=256
augroup AdditionalHighlights
  autocmd!
  autocmd ColorScheme * highlight TabString     cterm=reverse ctermfg=darkgray
  autocmd VimEnter,WinEnter * let w:m1 = matchadd('TabString',     '\t')
  autocmd ColorScheme * highlight CrString      cterm=reverse ctermfg=darkred
  autocmd VimEnter,WinEnter * let w:m2 = matchadd('CrString',      '\r')
  autocmd ColorScheme * highlight CrlfString    cterm=reverse ctermfg=darkmagenta
  autocmd VimEnter,WinEnter * let w:m3 = matchadd('CrlfString',    '\r\n')
  autocmd ColorScheme * highlight WhitespaceEOL cterm=reverse ctermfg=lightmagenta
  autocmd VimEnter,WinEnter * let w:m4 = matchadd('WhitespaceEOL', '\s\+$')
  autocmd ColorScheme * highlight ZenkakuSpace  cterm=reverse ctermfg=lightred
  autocmd VimEnter,WinEnter * let w:m5 = matchadd('ZenkakuSpace',  '　')

  autocmd ColorScheme * highlight Visual cterm=reverse ctermfg=lightgreen
augroup END
colorscheme jellybeans
" Show
set title
set ruler
set laststatus=2
set number
set cursorline
set cursorcolumn
" Clipboard
set clipboard+=autoselect,unnamed
" Backup
set nobackup
set noswapfile
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
"}}}
" NeoBundle
"{{{
if has('vim_starting')
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('$HOME/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" vimproc
"{{{
NeoBundle 'Shougo/vimproc', {
            \    'build' : {
            \        'windows' : 'make -f make_mingw32.mak',
            \        'cygwin'  : 'make -f make_cygwin.mak',
            \        'mac'     : 'make -f make_mac.mak',
            \        'unix'    : 'make -f make_unix.mak',
            \    },
            \}
"}}}
" unite.vim
"{{{
NeoBundleLazy 'Shougo/unite.vim', {
            \    'autoload' : {
            \        'commands' : ['Unite'],
            \    },
            \}
"}}}
" vital.vim
"{{{
NeoBundle 'vim-jp/vital.vim'
"}}}
" vimdoc-ja
"{{{
NeoBundleLazy 'vim-jp/vimdoc-ja', {
            \    'autoload' : {
            \        'commands' : ['help'],
            \    },
            \}
let s:hooks = neobundle#get_hooks('vimdoc-ja')
function! s:hooks.on_source(bundle)
    helptags $HOME/.vim/bundle/vimdoc-ja/doc/
endfunction
"}}}
" syntastic'
"{{{
NeoBundleLazy 'scrooloose/syntastic', {
            \    'autoload' : {
            \        'insert' : 1,
            \    },
            \}
let s:hooks = neobundle#get_hooks('syntastic')
function! s:hooks.on_source(bundle)
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2
endfunction
"}}}
" vim-php-cs-fixer
"{{{
NeoBundleLazy 'stephpy/vim-php-cs-fixer', {
            \    'autoload' : {
            \        'filetypes': 'php',
            \    },
            \}
let s:hooks = neobundle#get_hooks('vim-php-cs-fixer')
function! s:hooks.on_source(bundle)
    " If php-cs-fixer is in $PATH, you don't need to define line below
    if has('mac')
    else
        let g:php_cs_fixer_path = '$HOME/.vim/phpCsFixer/php-cs-fixer' " define the path to the php-cs-fixer.phar
    endif
    let g:php_cs_fixer_level = 'all'              " which level ?
    let g:php_cs_fixer_config = 'default'         " configuration
    let g:php_cs_fixer_php_path = 'php'           " Path to PHP
    " If you want to define specific fixers:
    "let g:php_cs_fixer_fixers_list = 'linefeed,short_tag,indentation'
    let g:php_cs_fixer_enable_default_mapping = 1 " Enable the mapping by default (<leader>pcd)
    let g:php_cs_fixer_dry_run = 0                " Call command with dry-run option
    let g:php_cs_fixer_verbose = 0                " Return the output of command if 1, else an inline information.
endfunction
"}}}
" vdebug
"{{{
"# command memo
"* <F5>  : start/run (to next breakpoint/end of script)
"* <F2>  : step over
"* <F3>  : step into
"* <F4>  : step out
"* <F6>  : stop debugging
"* <F7>  : detach script from debugger
"* <F9>  : run to cursor
"* <F10> : set line breakpoint
"* <F11> : show context variables (e.g. after "eval")
"* <F12> : evaluate variable under cursor
"* :Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints)
"* :VdebugEval <code>: evaluate some code and display the result
"* <Leader>e: evaluate the expression under visual highlight and display the result
NeoBundle 'joonty/vdebug'
"}}}
" vim-tags
"{{{
"# command memo
"* :TagsGenerate :Remake tags.
"* <C-]>         :Jump target file
"* <C-o>         :Return before file
"* :ts           :Jump target file list
NeoBundle 'szw/vim-tags'
nmap <Leader>] <C-]>
nmap <Leader>[ <C-o>
nmap <Leader>ts :ts<CR>
let g:vim_tags_auto_generate = 1
" add .vimrc.local
"}}}
" taglist.vim
"{{{
"# command memo
"* :Tlist :Show class, function and etc at left menu.
NeoBundle 'vim-scripts/taglist.vim'
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
nmap <Leader>t :Tlist<CR>
"}}}
" NeoComplete
"{{{
NeoBundleLazy 'Shougo/neocomplete.vim', {
            \    'autoload' : {
            \        'insert' : 1,
            \    },
            \}
let s:hooks = neobundle#get_hooks('neocomplete.vim')
function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
endfunction
"}}}
" neosnippet.vim
" neosnippet-snippets
" vim-snippets
"{{{
NeoBundleLazy 'Shougo/neosnippet.vim', {
            \    'depends': ['honza/vim-snippets','shougo/neosnippet-snippets'],
            \    'autoload': {
            \        'insert': 1,
            \    },
            \}
let s:hooks = neobundle#get_hooks('neosnippet.vim')
function! s:hooks.on_source(bundle)
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ '\<Plug>(neosnippet_expand_or_jump)'
                \: pumvisible() ? '\<C-n>' : '\<TAB>'
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ '\<Plug>(neosnippet_expand_or_jump)'
                \: '\<TAB>'
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif
    let g:neosnippet#enable_snipmate_compatibility = 1
    let g:neosnippet#snippets_directory=$HOME.'/.vim/bundle/vim-snippets/snippets'
endfunction
"}}}
" Align
"{{{
"# command memo
"* ,t=   :Align base action
"* ,acom :Align action only commentout
NeoBundle 'vim-scripts/Align'
let g:Align_xstrlen=3
"}}}
" vim-ref
"{{{
"# command memo
"* <S-k> :Show mabual
NeoBundle 'thinca/vim-ref'
let g:ref_phpmanual_path=$HOME.'/.vim/ref/php-chunked-xhtml'
"}}}
" matchit.zip
" vim-endwise
"{{{
"# command memo
"* % :Move from start to end or end to start
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'tpope/vim-endwise'
"}}}
" vim-surround
"{{{
"# command memo
"* cs"'   :Change From  " to '
"* cs'<p> :Change From  ' to <p>
"* ds'    :Delete '
NeoBundle 'tpope/vim-surround'
"}}}
" Grep
"  vim-qfreplace
"{{{
"# command memo
"* ,grep  :Cursor word grep
"* ,cn    :grep results next jump
"* ,cb    :grep results previous(before) jump
"* ,ccXX  :grep XX lines jump
NeoBundle 'thinca/vim-qfreplace'
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
set runtimepath+=$HOME/.vim/qfixapp/
let QFixWin_EnableMode = 1
let QFix_UseLocationList = 1
nmap <expr> <Leader>grep ':silent grep! '.expand('<cword>').' '.vital#of("vital").import("Prelude").path2project_directory("%").'<CR>'
nmap <Leader>cn :cnext<CR>
nmap <Leader>cb :cprevious<CR>
nmap <Leader>cc :cc
augroup Grep
    autocmd!
    autocmd QuickfixCmdPost *grep* cwindow
augroup END
"}}}
" nerdtree
"{{{
NeoBundleLazy 'scrooloose/nerdtree', {
            \    'autoload' : {
            \        'commands' : ['NERDTree'],
            \    },
            \}
nmap <Leader>n :NERDTree<CR>
let s:hooks = neobundle#get_hooks('nerdtree')
function! s:hooks.on_source(bundle)
    let NERDTreeShowHidden=1
endfunction
"}}}
" vim-fugitive
" landscape
" lightline
"{{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'itchyny/lightline.vim'
nmap <Leader>gstatus :Gstatus<CR>
nmap <Leader>glog :Glog<CR>
nmap <Leader>gadd :Gwrite<CR>
nmap <Leader>grm :Gremove<CR>
nmap <Leader>gdiff :Gdiff<CR>
nmap <Leader>gcommit :Gcommit
let g:lightline = {
            \    'colorscheme': 'landscape',
            \    'mode_map': { 'c': 'NORMAL' },
            \    'active': {
            \        'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \    },
            \    'component_function': {
            \        'modified': 'MyModified',
            \        'readonly': 'MyReadonly',
            \        'fugitive': 'MyFugitive',
            \        'filename': 'MyFilename',
            \        'fileformat': 'MyFileformat',
            \        'filetype': 'MyFiletype',
            \        'fileencoding': 'MyFileencoding',
            \        'mode': 'MyMode',
            \    },
            \    'separator': { 'left': '', 'right': '' },
            \    'subseparator': { 'left': '|', 'right': '|' }
            \}
function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction
function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
function! MyFileformat()
    return winwidth('.') > 70 ? &fileformat : ''
endfunction
function! MyFiletype()
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction
function! MyFileencoding()
    return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
function! MyMode()
    return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
"}}}
" Markdown with Vim
"  vim-quickrun
"  w3m.vim
"  vim-markdown
"{{{
"# command memo
"* :QuickRun :execute quickrun.
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'plasticboy/vim-markdown'
nmap <Leader>r :QuickRun<CR>
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
            \    'outputter' : 'file',
            \    'outputter/name' : tempname().'.html'
            \}
let t:outputter_w3m_vim_bufname = ''
let s:hook = {
            \   'name': 'outputer_w3m_vim',
            \   'kind': 'hook',
            \   'is_success': 0,
            \   'config': { 'enable': 1 },
            \   '_bufname': 'bufhook'
            \}
function! s:hook.on_success(session, context)
    if a:session.config.outputter != 'file' || !match(a:session.config['outputter/name'], '.html$\c')
        return
    endif
    let mode = g:w3m#OPEN_SPLIT
    let target = 'local'
    let fname = a:session.outputter._file
    let bufname = t:outputter_w3m_vim_bufname
    if bufname != '' && bufwinnr(bufname) != -1
        execute bufwinnr(bufname) 'wincmd w'
        let mode = g:w3m#OPEN_NORMAL
        silent call w3m#Open( mode, target, fname )
    else
        silent call w3m#Open( mode, target, fname )
        let t:outputter_w3m_vim_bufname = b:w3m_bufname
    endif
endfunction
call quickrun#module#register(s:hook, 1)
unlet s:hook
"}}}
" memolist.vim
"{{{
NeoBundle 'glidenote/memolist.vim'
let g:memolist_path = '$HOME/.vim/memo'
nmap <Leader>mn  :MemoNew<CR>
nmap <Leader>ml  :MemoList<CR>
nmap <Leader>mg  :MemoGrep<CR>
"}}}
" jellybeans
"{{{
NeoBundle 'nanotech/jellybeans.vim'
"}}}
filetype plugin indent on
" FileType
"{{{
autocmd BufNewFile,BufRead *.{md,mkd,mdwn,mkdn,mark*} set filetype=markdown
"}}}
" Extra local setting
"{{{
if filereadable(expand($HOME.'/.vimrc.local'))
    source ~/.vimrc.local
endif
"}}}
"}}}

