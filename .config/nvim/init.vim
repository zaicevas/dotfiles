" line number on the left
set number
set clipboard=unnamed
set clipboard=unnamedplus

" show $ at the end of line
" set list

syntax on

" scroll on OS X
set mouse=n 
set nowrap  

" display tab as 2 spaces
set ts=2 sw=2

" use 'man' with vim
let $PAGER=''

" vim-plug start
call plug#begin()

"Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' " TS syntax

" vim-plug end
call plug#end()

" coc extensions
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-stylelintplus', 'coc-yaml', 'coc-snippets']

" map Tab and Shift+Tab to navigate through autocompletion of CoC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" enable syntax highlighting on .tsx files
" autocmd BufNewFile,BufRead *.tsx, set filetype=typescript.tsx

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
