" minimal vim start {{{
function! kazuakim#Minimal() abort "{{{
    setlocal clipboard+=autoselect,unnamed
    setlocal hlsearch
    setlocal ignorecase iminsert=0 imsearch=-1 incsearch
    setlocal noswapfile nobackup nowritebackup noundofile
    setlocal smartcase
    setlocal viminfo=
    filetype off
    filetype plugin indent off
    syntax off

    "  Replace
    nnoremap R gR
    nnoremap <expr><Leader>%s  ':%s/'. expand('<cword>') .'/'. expand('<cword>') .'/gc<Left><Left><Left>'
    nnoremap <expr><Leader>%%s ':%s/'. expand('<cword>') .'//gc<Left><Left><Left>'
    "  Search
    cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
    cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
    "  Register
    nnoremap x "_x
    nnoremap X "_x
    vnoremap <C-w> "ay
    vnoremap <C-e> "by
    nnoremap <expr>;s ':%s/<C-r>a/<C-r>b/gc'

    if &l:diff
        set cursorline
        "set clipboard+=autoselect,unnamed cursorline
        nnoremap <C-k> [c
        nnoremap <C-j> ]c
        nnoremap <C-h> do
        nnoremap <C-l> dp
    endif
endfunction "}}}
"}}}

" autocmd - QuickfixCmdPost {{{
function! kazuakim#QuickfixCmdPost() abort "{{{
    " qfixgrep {{{
    let g:QFix_PreviewEnable = 1
    "}}}
endfunction "}}}
"}}}

" Tab {{{
function! kazuakim#TabMove() abort "{{{
    let l:nowCount = tabpagenr()
    let l:maxCount = tabpagenr("$")

    if l:nowCount < l:maxCount
        +tabmove
    else
        0tabmove
    endif
endfunction "}}}
"}}}

" tags {{{
function! kazuakim#TagJumper() abort "{{{
    let l:cw = expand('<cword>')
    let l:tli = taglist('^' . l:cw . '$')
    if len(l:tli) ==# 1 && l:tli[0].name ==# l:cw
        if expand('%:p') ==# l:tli[0].filename
            execute 'tjump ' . l:cw
        else
            execute 'tab stjump ' . l:cw
        endif
        return
    endif

    if &filetype is# 'php'
        call s:KazuakimPhpTagJump(l:cw, l:tli)
    elseif &filetype is# 'go'
        call go#def#Jump('tab', 0)
    else
        execute 'tab stselect ' . l:cw
    endif
endfunction "}}}

" http://inside.pixiv.net/entry/2016/12/10/000000
function! s:_KazuakimPhpGuessClass(cw)
    let l:line = getline('.')
    let l:cword_start_pos = searchpos('\V' . escape(a:cw, '\'), 'bcW', line('.'))
    let l:prefix_end_index = l:cword_start_pos[1] - 2
    let l:prefix = l:prefix_end_index >= 0 ? l:line[:l:prefix_end_index] : ''

    if l:prefix =~# '\<use\>'
        return {'kind': ['c', 't', 'i'], 'name': a:cw, 'namespace': join(split(l:prefix[stridx(l:prefix, 'use ')+4:], '\'), '\\')}
    elseif l:prefix =~# '\<extends\>'
        return {'kind': ['c', 'i'], 'name': a:cw, 'namespace': ''}
    elseif l:prefix =~# '\<implements\>'
        return {'kind': ['i'], 'name': a:cw, 'namespace': ''}
    elseif l:prefix =~# '\<\k\+::$'
        return {'kind': ['c'], 'name': matchstr(l:prefix, '\<\zs\k\+\ze::$'), 'namespace': ''}
    endif

    return {'kind': ['c'], 'name': '', 'namespace': ''}
endfunction

function! s:KazuakimPhpGuessClass(cw)
    let l:cursor_pos = getpos('.')
    let l:class = s:_KazuakimPhpGuessClass(a:cw)
    call setpos('.', l:cursor_pos)
    return l:class
endfunction

function! s:KazuakimPhpTagJump(cw, tli)
    let l:class = s:KazuakimPhpGuessClass(a:cw)
    let l:mul = 0
    for l:tag in a:tli
        if -1 < index(l:class.kind, l:tag.kind) && l:tag.name ==# l:class.name && ((0 < strlen(l:class.namespace) && l:tag.namespace ==# l:class.namespace) || 0 ==# strlen(l:class.namespace))
            let l:mul += 1
        endif
    endfor
    if l:class.name ==# '' || 1 < l:mul
        execute 'tab stselect ' . a:cw
        return
    endif

    for l:tag in a:tli
        if -1 < index(l:class.kind, l:tag.kind) && l:tag.name ==# l:class.name && ((0 < strlen(l:class.namespace) && l:tag.namespace ==# l:class.namespace) || 0 ==# strlen(l:class.namespace))
            let l:bufDel = 0
            if expand('%:p') !=# l:tag.filename
                tabnew kazuakim_dummy.php
                execute 'normal! a' . a:cw
                let l:bufDel = 1
            endif

            let l:jc = index(a:tli, l:tag) + 1
            execute 'normal!' l:jc."\<C-]>"

            if l:bufDel ==# 1
                bdelete! kazuakim_dummy.php
            endif
            return
        endif
    endfor
endfunction
"}}}

" vital.vim {{{
function! kazuakim#Path2ProjectDirectory(path) abort "{{{
  let l:search_directory = isdirectory(a:path) ? a:path : fnamemodify(a:path, ':p:h')

  while 1
    let l:path = l:search_directory . '/.git'
    if isdirectory(l:path) || filereadable(l:path)
      return l:search_directory
    endif
    let l:next = fnamemodify(l:search_directory, ':h')
    if l:next == l:search_directory
      return ''
    endif
    let l:search_directory = l:next
  endwhile
endfunction "}}}
"}}}

" gundo.vim {{{
function! kazuakim#ClearUndo() abort "{{{
    let l:oldUndolevels = &l:undolevels
    setlocal undolevels=-1
    execute "normal! a \<BS>\<Esc>"
    write
    let &l:undolevels = l:oldUndolevels
    unlet l:oldUndolevels
endfunction "}}}
"}}}

" vim-lsp {{{
function! kazuakim#LspDocumentDiagnostics() abort "{{{
    let g:QFix_PreviewEnable = 0
    LspDocumentDiagnostics
endfunction "}}}
"}}}

" Database Switch (.vimrc.local) "{{{
function! kazuakim#DatabaseSwitch() abort "{{{
    let b:databaseIndex = ! exists('b:databaseIndex') ? 0 : b:databaseIndex + 1
    if len(g:KazuakiMDatabase) <= b:databaseIndex
        let b:databaseIndex = 0
    endif
    let g:quickrun_config['sql/mysql']['cmdopt'] = g:KazuakiMDatabase[b:databaseIndex]
    echo g:KazuakiMDatabase[b:databaseIndex]
endfunction "}}}
"}}}
