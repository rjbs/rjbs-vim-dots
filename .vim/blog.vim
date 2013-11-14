set ft=blog
" abb <buffer> @md @markup:md " why doesn't this work??
abb <buffer> mmd @markup:md
let @a="tags: journal @markup:md\ntitle: "
silent 0put a
normal j$
