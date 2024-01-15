""" Vim color file
""" Title:      Manxome Foes Color Scheme
""" Maintainer: Ricardo SIGNES <vim@rjbs.manxome.org>
" vim: set tw=0 ts=2 sw=2

""  clear and re-initialize global variables
hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "manxome"

"" set highlight groups
""  you'll notice that the ctermbg is often 'none'; this is so that when
""  console vim runs in a terminal, transparency (if any) is not broken

highlight Title     ctermfg=3 ctermbg=none  cterm=bold  guifg=#ffff00 guibg=#000000 gui=none
highlight Directory   ctermfg=4 ctermbg=none  cterm=bold  guifg=#0000ff guibg=#000000 gui=none
highlight StatusLine  ctermfg=7 ctermbg=4   cterm=bold  guifg=#ffffff guibg=#0000ff gui=none
highlight StatusLineNC  ctermfg=0 ctermbg=4   cterm=bold  guifg=#000000 guibg=#0000ff gui=none
highlight Normal    ctermfg=7 ctermbg=none  cterm=none  guifg=#cccccc guibg=#000000 gui=none
highlight Search    ctermfg=7 ctermbg=4   cterm=bold  guifg=#ffffff guibg=#0000ff gui=none
highlight Visual    ctermfg=7 ctermbg=6   cterm=bold  guifg=#ffffff guibg=#00aaaa gui=none

""  set major preferred groups

highlight Comment   ctermfg=2 ctermbg=none  cterm=bold  guifg=#00ff00 guibg=#000000 gui=none
highlight Constant    ctermfg=6 ctermbg=none  cterm=bold  guifg=#00ffff guibg=#000000 gui=none
highlight Identifier  ctermfg=4 ctermbg=none  cterm=bold  guifg=#0000ee guibg=#000000 gui=none
highlight Statement   ctermfg=6 ctermbg=none  cterm=none  guifg=#00aaaa guibg=#000000 gui=none
highlight PreProc   ctermfg=7 ctermbg=none  cterm=bold  guifg=#ffffff guibg=#000000 gui=none
highlight Type      ctermfg=6 ctermbg=none  cterm=none  guifg=#00aaaa guibg=#000000 gui=none
highlight Special   ctermfg=7 ctermbg=none  cterm=bold  guifg=#ffffff guibg=#000000 gui=none
highlight Underlined  ctermfg=2 ctermbg=none  cterm=none  guifg=#00aa00 guibg=#000000 gui=none
highlight Ignore    ctermfg=0 ctermbg=none  cterm=bold  guifg=#aaaaaa guibg=#000000 gui=none
highlight Error     ctermfg=1 ctermbg=none  cterm=bold  guibg=#ff0000 guibg=#000000 gui=none
highlight Todo      ctermfg=1 ctermbg=none  cterm=bold  guifg=#aa0000 guibg=#000000 gui=none

"" stuff added for ALE
highlight SignColumn      ctermfg=225 ctermbg=236
highlight ALEWarningSign  ctermfg=214 ctermbg=236
highlight ALEErrorSign    ctermfg=160 ctermbg=236
highlight ALEWarning      ctermfg=7   ctermbg=130
highlight ALEError        ctermfg=7   ctermbg=124

" set syntax-specific groups
" I'd like to avoid using these, but the default settings for these two are
" just no good.  Seeing italic text in Vim is just plain wrong.

highlight htmlBold    ctermfg=7 ctermbg=none  cterm=bold  guifg=#ffffff guibg=#000000 gui=none
highlight htmlItalic  ctermfg=5 ctermbg=none  cterm=bold  guifg=#ff00ff guibg=#000000 gui=none

highlight javaScriptParens ctermfg=6 ctermbg=none  cterm=bold  guifg=#00ffff guibg=#000000 gui=none

if v:version >= 700
  highlight CursorColumn ctermbg=4 cterm=none
  highlight CursorLine   ctermbg=4 cterm=none

  highlight TabLine     ctermbg=4 ctermfg=7 cterm=none
  highlight TabLineSel  ctermbg=4 ctermfg=7 cterm=bold
  highlight TabLineFill ctermbg=4 ctermfg=7 cterm=none

  highlight ColorColumn ctermbg=233 guibg=#2c2d27
endif
