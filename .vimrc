""" rjbs: Ricardo SIGNES
""" vimrc

""  set vim options
set autoindent           " carry over indenting from previous line
set backspace=2          " allow backspace beyond insertion point
set background=dark      " console bg is dark
set cinkeys-=0#          " don't unindent cpp stuff (perl comments!)
set clipboard+=unnamed   " put yanks/etc on the clipboard
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
set path=.,$HOME,,       " for editing with :find
set pastetoggle=<F2>     " F2 to toggle paste
set popt=paper:letter    " better default paper size for my purposes
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

filetype off
execute pathogen#infect()

colorscheme manxome         " use my phat color scheme
filetype plugin on          " use ftplugins, mostly for those in ~
runtime macros/matchit.vim  " pulled from macros dir to avoid requiring install
syntax on                   " enable syntax highlighting

if has("win32")
	let Tlist_Ctags_Cmd='C:\Progra~1\ctags\ctags.exe'
	nnoremap <M-Space> :simalt ~<CR>
elseif has("macunix")
	" the Carbon clipboard is screwed up, and messes up newlines
	set cb=
endif

" exec'd because ... could it work otherwise?
exec "set titleold=" . matchstr(hostname(), "^[^.]\\+")

""" use a UTF-8 term if you can

if $TERM_PROGRAM == "Apple_Terminal"
  set tenc=utf-8
endif

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
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_powerline_fonts=0

  let g:airline_theme="murmur"
endif

" perl_synwrite
silent call system("perl -e0 -MVi::QuickFix=silent")
let perl_synwrite_qf = ! v:shell_error   " use Vi::QuickFix if it can be used

" see changes
" diffthis | vs | enew | set buftype=nofile | r # | 1d |  diffthis

iabbr --r -- rjbs, <C-R>=strftime("%Y-%m-%d")<CR>
iabbr rnstar Rob N. ★

dig xx 9792
dig xy 9794
dig x? 9893

" version 7 things
if v:version >= 700
  nnoremap <F1> :set cursorcolumn! cursorline!<CR>

  let loaded_matchparen = 1
endif

let mapleader="\\"
nnoremap <leader>u :silent GundoToggle<CR>
nnoremap <leader>ev :edit   ~/.../src/rjbs-vim-dots/.vimrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

let g:ctrlp_max_height=25
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

let g:vim_json_syntax_conceal = 0

let g:rust_recommended_style = 0

nnoremap <silent> <C-c> :noh<CR>
nnoremap <silent> <C-k> :bdel<CR>
nnoremap <BS> <C-^>

vnoremap . :norm.<CR>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" cnoremap <expr> <cr> getcmdtype() == ':' ? "\n:noh\n" : "\n"

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap <silent> <Left>  :bprev<CR>
nnoremap <silent> <Right> :bnext<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" TODO: have this put the cursor back where you started -- rjbs, 2015-07-12
" TODO: do not correct "-- " sigdashes -- rjbs, 2015-07-17
nnoremap <Leader>w :%s/\s\+$//<CR>:let @/=''<CR>

" From http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

nnoremap <CR> G

" I'm not sure about this yet.  It's not the mapping of v to expand, but the
" fact that it seems to go character-word-paragraph, with no "line" in it.
vnoremap v <Plug>(expand_region_expand)
vnoremap <C-v> <Plug>(expand_region_shrink)

" from
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete

let &colorcolumn=join(range(81,999),",")

let g:rust_recommended_style = 0

