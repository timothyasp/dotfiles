" Wrap lines, and break only on whitespace.
setlocal textwidth=0
setlocal wrap
setlocal linebreak

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

" Use the screen-based versions of the most common movement commands instead of
" the text-based versions.
noremap <buffer> <Down> gj
noremap <buffer> j gj
noremap <buffer> <Up> gk
noremap <buffer> k gk
noremap <buffer> 0 g0
noremap <buffer> ^ g^
noremap <buffer> $ g$
noremap <buffer> G G$
