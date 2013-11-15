setlocal comments=b:#
setlocal iskeyword-=: " vim-perl's perl.vim adds :, which I cannot tolerate
                      " by keeping : out of 'isk' then I can move into code
                      " like C<< Foo::Bar::Baz->new >> into "Bar" and hit
                      " ciw to change only Bar -- rjbs, 2013-11-15
nnoremap <silent> _t :%!perltidy -q<CR> 
vnoremap <silent> _t :!perltidy -q<CR>
