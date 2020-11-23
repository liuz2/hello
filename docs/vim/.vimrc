" .vimrc

set nocompatible
set autoindent
set linebreak
set cursorline
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set foldmethod=indent

syntax on
filetype plugin on
filetype indent on

" vue-language-server
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

set suffixesadd+=.js,.vue,.less,.css,.md,.html

" 搜索时忽略 node_modules 目录
set wildignore+=**/node_modules/**/*.*

" Syntax Highlight *.wxml using *.html
au BufRead,BufNewFile *.wxml set filetype=html
" Syntax Highlight *.wxss using *.css
au BufRead,BufNewFile *.wxss set filetype=css

inoremap <c-j> <esc>o
inoremap <c-k> <esc>O

" Load all packages
packloadall
" Load help documentation for all packages
silent! helptags ALL
