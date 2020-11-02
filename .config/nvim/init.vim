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

" needed to switch tabs in a proper way (?)
set hidden

" vim-plug start
call plug#begin()

"Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' " TS syntax
Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' 
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " cmd+p files like in VSCode
Plug 'scrooloose/nerdcommenter' " cmd+/ to comment code
Plug 'hankchiutw/nerdtree-ranger.vim'
Plug 'christoomey/vim-tmux-navigator' " switching between NERDTree and 
Plug 'pacha/vem-tabline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " shift+command+f search
Plug 'junegunn/fzf.vim' " shift+command+f search
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " git branch at the status bar

" vim-plug end
call plug#end()

" vim-code-dark theme
colorscheme codedark 

" coc extensions
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-stylelintplus', 'coc-yaml', 'coc-snippets']

" map Tab and Shift+Tab to navigate through autocompletion of CoC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" enable syntax highlighting on .tsx files
" needed when only coc-tsserver is used, commented out, because I use yats.vim
" is used
" autocmd BufNewFile,BufRead *.tsx, set filetype=typescript.tsx

" Rename with F2 like in VSCode
nmap <F2> <Plug>(coc-rename)

" NERDTREE
" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:NERDTreeIgnore = ['^node_modules$']

" cmd+/ to comment code
inoremap jk <ESC>
nmap <C-f> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" ignore git files with cmd+p
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" disable automatic comment insertion on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set vim-gitgutter 'added line' color to green
" not implemented yet

" set ctrl+j, ctrl+k to move between buffers, ctrl+q to close buffer
" we run it after vim Vim is ready, because we need to override plugin mappings
" https://vi.stackexchange.com/questions/756/how-can-i-redefine-plugin-key-mappings
" right
autocmd VimEnter * noremap <C-k> :bn<cr>
" left
autocmd VimEnter * noremap <C-j> :bp<cr>
" close buffer
autocmd VimEnter * noremap <C-q> :bd<bar>bn<CR>
