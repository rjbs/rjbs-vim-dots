setlocal comments=b:#
setlocal formatoptions+=t " line break on normal lines! yeesh
setlocal iskeyword-=: " vim-perl's perl.vim adds :, which I cannot tolerate.
                      " By keeping : out of 'isk' then I can move into code
                      " like C<< Foo::Bar::Baz->new >> into "Bar" and hit
                      " ciw to change only Bar. -- rjbs, 2013-11-15
nnoremap <silent> _t :%!perltidy -q<CR> 
vnoremap <silent> _t :!perltidy -q<CR>
