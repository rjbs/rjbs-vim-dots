""" rjbs: Ricardo SIGNES
""" vimrc

if filereadable('/opt/homebrew/opt/fzf/plugin/fzf.vim')
  source /opt/homebrew/opt/fzf/plugin/fzf.vim
elseif filereadable('/usr/share/doc/fzf/examples/fzf.vim')
  source /usr/share/doc/fzf/examples/fzf.vim
endif

let g:fzf_layout = {
\   'window': { 'width': 1.0, 'height': 0.8, 'yoffset': 0.2 }
\ }
" 
let g:fzf_colors = { }
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'query':   ['fg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

nnoremap <silent> <C-p> :FZF --reverse --style=default --scheme=path<CR>

if ! filereadable(expand('~/.vim/colors/manxome.vim'))
  if ! isdirectory(expand('~/.vim/colors'))
    call mkdir(expand('~/.vim/colors'))
  endif
  if isdirectory(expand('~/.vim/colors'))
    silent call system("curl https://raw.githubusercontent.com/rjbs/rjbs-vim-dots/master/.vim/colors/manxome.vim > ~/.vim/colors/manxome.vim")
  endif
endif

""  set vim options
set autoindent           " carry over indenting from previous line
set backspace=2          " allow backspace beyond insertion point
set background=dark      " console bg is dark
set cinkeys-=0#          " don't unindent cpp stuff (perl comments!)
set comments=b://,b:#,b:* " by default allow JS and "unixy" comments, *-lists
set copyindent           " make autoindent use the same characters to indent
set directory-=.         " don't store temp files in cwd
set encoding=utf-8       " unicode
set expandtab            " spaces, not tabs! (this decision: 2005-06-02)
set foldlevelstart=99    " start with all folds open
set foldopen-=search     " don't open folds when you search into them
set foldopen-=undo       " don't open folds when you undo stuff
set formatoptions=tcqr2l " t - autowrap normal text
                         " c - autowrap comments and re-insert comment leader
                         " q - allow gq to reformat comments
                         " r - re-insert comment leader on newline
                         " 2 - indent based on second line of para, not first
                         " l - don't break long lines that were long before ins
set guioptions+=f        " don't fork if run under X11!  sheesh.
set guioptions-=T        " do not show the toolbar by default
set hidden               " hide, don't close, undisplayed buffers
set history=200          " more scrollback history
set hlsearch             " highlight search matches (<C-c> to noh)
set laststatus=2         " always show status line
set listchars=tab:>-,eol:¬,trail:␠,extends:…,precedes:…,nbsp:␠
set path=.,$HOME,,       " for editing with :find
set pastetoggle=<F2>     " F2 to toggle paste
set ruler                " display cursor position
set showcmd              " show command-in-progress
set shortmess=at         " shortens messages to avoid 'press a key' prompt
set shiftwidth=2         " two spaces per sw
set softtabstop=2        " make two spaces act like tabs
set timeout              " allow keys to timeout
set title                " do set the xterm title (see 'titleold', set below)
set tabstop=2            " The One True Tab (as of latest revision)
set textwidth=79         " set normal border; can unset for coding
set wildignore+=*/CVS/   " don't try to descend into CVS directories
set wildmenu             " enable menu of completions
set wildmode=longest:full,full " complete only as much as is common,
                               " then show menu

" Print options!  We set all margins to 0 because we're going to pipe this
" through "mpage -2" which will put pairs of pages on one, and will apply the
" margin there.
set printoptions=paper:letter,number:y,top:0c,right:0pc,bottom:0pc,left:0pc

filetype off

colorscheme manxome         " use my phat color scheme
filetype plugin on          " use ftplugins, mostly for those in ~
runtime macros/matchit.vim  " pulled from macros dir to avoid requiring install
syntax on                   " enable syntax highlighting

" exec'd because ... could it work otherwise?
exec "set titleold=" . matchstr(hostname(), "^[^.]\\+")

""" use fonts that don't make my eyes bleed

if has("gui_running")
  if has("macunix")
    set guifont=Monaco:h13
    set noanti
  elseif has("win32")
    set guifont=ProFontWindows:h11:b:cANSI,Lucida_Console:h11:b:cANSI
  elseif has("x11")
    set guifont=-jmk-neep-bold-r-normal--15-*-*-*-*-*-*-*
  endif
endif

""" act more like a pager when invoked as one

if ((v:progname == "view") || ($RJBS_IN_MAN == "1"))
  nnoremap <Space> <PageDown>
  nnoremap b       <PageUp>
  nnoremap q       :q<CR>
endif

"""  set various script options
" perl syntax
"let perl_fold=1         " allow perl folding
let perl_include_pod   = 1
let perl_extended_vars = 1

""" Airline Configuration
if !exists('g:airline_symbols')
  let g:airline_symbols = {}

  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.whitespace = '␠'
  let g:airline_powerline_fonts=0

  let g:airline_theme="murmur"
endif

" perl_synwrite
" silent call system("perl -e0 -MVi::QuickFix=silent")
let perl_synwrite_qf = 1

iabbr --r -- rjbs, <C-R>=strftime("%Y-%m-%d")<CR>
iabbr rnstar Rob N ★

dig xx 9792 " ♀
dig xy 9794 " ♂
dig x? 9893 " ⚥

" version 7 things
if v:version >= 700
  nnoremap <F1> :set cursorcolumn! cursorline!<CR>

  let loaded_matchparen = 1
endif

let mapleader="\\"
nnoremap <leader>ev :edit   ~/.../src/rjbs-vim-dots/.vimrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

let g:ctrlp_max_height=25
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

let g:vim_json_syntax_conceal = 0

" C-c to clear the highlight, which is good for when you just seached, say, a
" single space!
nnoremap <silent> <C-c> :noh<CR>

" C-k to delete the buffer.  Done with this file, bye!
nnoremap <silent> <C-k> :bdel<CR>

" Backspace to toggle between two most recent buffers.  Love it.
nnoremap <BS> <C-^>

" Select the last thing pasted (for reindent, for example)
nnoremap gV `[v`]

" When there's a visual selection, make "." redo the same command you did last,
" just like it does in normal mode.
vnoremap . :norm.<CR>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" ←/→ to flip through the buffers, in order.
nnoremap <silent> <Left>  :bprev<CR>
nnoremap <silent> <Right> :bnext<CR>

" Map %% in the command line to current path.  This is great for "I want to
" make another file in the same path as this one."
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Map \w to "remove all trailing whitespace"
" TODO: have this put the cursor back where you started -- rjbs, 2015-07-12
" TODO: do not correct "-- " sigdashes -- rjbs, 2015-07-17
nnoremap <Leader>w :%s/\s\+$//<CR>:let @/=''<CR>

function MaybeOpenLinear()
  " 1. mark our current position
  " 2. yank the WORD in which the cursor sits
  " 3. jump back to the cusor position (because yiW jumps to start of WORD)
  normal ml
  normal "lyiW
  normal `l

  " Often we will have "ABC-123: Do a thing".  The WORD will have included the
  " colon, so let's remove it.
  let l:word = substitute(getreg('l'), ':', '', '')

  if match(l:word, '\c[A-Z]\{3,4\}-[0-9]\+') > -1
    echo(l:word)
    if has('macunix')
      silent call system('open https://linear.app/fastmail/issue/' . l:word)
    else
      echo 'open https://linear.app/fastmail/issue/' . l:word
    endif
  endif
endfunction

nnoremap <silent> <CR> :call MaybeOpenLinear()<CR>

" I'm not sure about this yet.  It's not the mapping of v to expand, but the
" fact that it seems to go character-word-paragraph, with no "line" in it.
vnoremap v <Plug>(expand_region_expand)
vnoremap <C-v> <Plug>(expand_region_shrink)

" from
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete

" Color all the columns after 80 (i.e., ones I want to not use) very slightly
" greyer than black, so I can see the right margin.
let &colorcolumn=join(range(81,999),",")

"" ALE-related configuration
let g:ale_virtualtext_cursor = 'current'
let g:ale_sign_warning = '○'
let g:ale_sign_error = '●'
" nnoremap <silent> <C-]> :ALEGoToDefinition<CR>

" Not sure about this. -- rjbs, 2024-01-15
" let g:ale_sign_column_always = 1

function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Show the syntax group being used to highlight the text under the cursor.
" This is useful when editing syntax definitions or color schemes.
nnoremap <silent> gs :call SynGroup()<CR>

set printexpr=ByzantinePrintFile()
function ByzantinePrintFile()
  call system("/Users/rjbs/bin/libexec/vim-print-helper "
    \.. v:fname_in
    \.. " "
    \.. shellescape(expand('%:t'))
  \)
  call delete("v:fname_in")
  return v:shell_error
endfunc

let g:ale_perl_perlcritic_options = "-4"
