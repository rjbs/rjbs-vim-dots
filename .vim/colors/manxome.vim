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

hi Title            ctermfg=3   ctermbg=none  cterm=bold  guifg=#ffff00 guibg=#000000 gui=none
hi Directory        ctermfg=4   ctermbg=none  cterm=bold  guifg=#0000ff guibg=#000000 gui=none
hi StatusLine       ctermfg=7   ctermbg=4     cterm=bold  guifg=#ffffff guibg=#0000ff gui=none
hi StatusLineNC     ctermfg=0   ctermbg=4     cterm=bold  guifg=#000000 guibg=#0000ff gui=none
hi Normal           ctermfg=7   ctermbg=none  cterm=none  guifg=#cccccc guibg=#000000 gui=none
hi Search           ctermfg=7   ctermbg=4     cterm=bold  guifg=#ffffff guibg=#0000ff gui=none
hi Visual           ctermfg=7   ctermbg=6     cterm=bold  guifg=#ffffff guibg=#00aaaa gui=none

""  set major preferred groups

hi Comment          ctermfg=2   ctermbg=none  cterm=bold  guifg=#00ff00 guibg=#000000 gui=none
hi Constant         ctermfg=6   ctermbg=none  cterm=bold  guifg=#00ffff guibg=#000000 gui=none
hi Identifier       ctermfg=4   ctermbg=none  cterm=bold  guifg=#0000ee guibg=#000000 gui=none
hi Statement        ctermfg=6   ctermbg=none  cterm=none  guifg=#00aaaa guibg=#000000 gui=none
hi PreProc          ctermfg=7   ctermbg=none  cterm=bold  guifg=#ffffff guibg=#000000 gui=none
hi Type             ctermfg=6   ctermbg=none  cterm=none  guifg=#00aaaa guibg=#000000 gui=none
hi Special          ctermfg=7   ctermbg=none  cterm=bold  guifg=#ffffff guibg=#000000 gui=none
hi Underlined       ctermfg=2   ctermbg=none  cterm=none  guifg=#00aa00 guibg=#000000 gui=none
hi Ignore           ctermfg=0   ctermbg=none  cterm=bold  guifg=#aaaaaa guibg=#000000 gui=none
hi Error            ctermfg=1   ctermbg=none  cterm=bold  guibg=#ff0000 guibg=#000000 gui=none
hi Todo             ctermfg=208 ctermbg=none  cterm=bold  guifg=#aa0000 guibg=#000000 gui=none

" DEFAULT:
" Constant-like:    Boolean, Character, Number (and Float), String
" Identifier-like:  Function
" Statement-like:   Conditional, Exception, Keyword, Label, Operator, Repeat

hi Boolean          ctermfg=79  ctermbg=none  cterm=bold
hi Label            ctermfg=190 ctermbg=none  cterm=bold
hi Number           ctermfg=117 ctermbg=none  cterm=bold

"" stuff added for ALE
hi SignColumn       ctermfg=225 ctermbg=236
hi ALEWarningSign   ctermfg=214 ctermbg=236
hi ALEErrorSign     ctermfg=160 ctermbg=236
hi ALEWarning       ctermfg=7   ctermbg=130
hi ALEError         ctermfg=7   ctermbg=124

" set syntax-specific groups
" I'd like to avoid using these, but the default settings for these two are
" just no good.  Seeing italic text in Vim is just plain wrong.

hi htmlBold         ctermfg=7   ctermbg=none  cterm=bold  guifg=#ffffff guibg=#000000 gui=none
hi htmlItalic       ctermfg=5   ctermbg=none  cterm=bold  guifg=#ff00ff guibg=#000000 gui=none

hi javaScriptParens ctermfg=6   ctermbg=none  cterm=bold  guifg=#00ffff guibg=#000000 gui=none
hi jsonKeyword      ctermfg=7   ctermbg=none  cterm=bold

if v:version >= 700
  hi CursorColumn               ctermbg=4     cterm=none
  hi CursorLine                 ctermbg=4     cterm=none

  hi TabLine        ctermfg=7   ctermbg=4     cterm=none
  hi TabLineSel     ctermfg=7   ctermbg=4     cterm=bold
  hi TabLineFill    ctermfg=7   ctermbg=4     cterm=none

  hi ColorColumn                ctermbg=233                             guibg=#2c2d27
endif
