" line number on the left
set number
set clipboard=unnamed
set clipboard=unnamedplus

" show $ at the end of line
" set list

nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
syntax on

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set mouse=n 
set nowrap  

" display tab as 4 spaces
set ts=4 sw=4

" use 'man' with vim
let $PAGER=''
