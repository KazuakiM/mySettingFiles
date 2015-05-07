"
"
" Common {{{
" Basic
set antialias cmdheight=1 guioptions-=b guioptions-=g guioptions-=l guioptions-=L guioptions-=m guioptions-=r guioptions-=R guioptions-=t guioptions-=T mouse=
set showtabline=1 t_vb= winaltkeys=no
" Color
colorscheme kazuakim
" Show
"}}}
"
"
" OS type {{{
if has("win32") || has ("win64")
    set guifont=Source_Code_Pro:h12:cANSI lines=41 columns=78
    winpos 1120 0
else
    set guifont=Ricty\ Diminished\ Discord\ Regular:h16 lines=44 columns=170
    winpos 0 23
endif
"}}}
