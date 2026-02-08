" Simplified .vimrc for Go and AI-assisted coding
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'roxma/vim-paste-easy'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
call plug#end()

filetype plugin indent on
syntax on
set t_Co=256
set encoding=utf-8
set history=2000
set backspace=indent,eol,start
set clipboard+=unnamed

" Search settings
set ic
set hlsearch
set incsearch

" Appearance
set number
set cursorline
set scrolloff=5
set laststatus=2
set statusline=[%t]\ %y\ %m%=%{&fileencoding}\ [%{&ff}]\ [%l,\ %c]\ [%L]\ [%p%%]

" Colorscheme
set background=dark
silent! colorscheme molokai

" Tabs & Indentation (4 spaces for Go)
set tabstop=4
set sts=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Key Mappings
let mapleader = ','
inoremap jj <Esc>
noremap H ^
noremap L $
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quick brackets
inoremap {  {}<ESC>i
inoremap (  ()<ESC>i
inoremap [  []<ESC>i
inoremap "  ""<ESC>i

" Plugin Mappings
nmap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>d :SignifyDiff<cr>
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)

" ALE Configuration (Go & Python)
let g:ale_linters = {'go': ['govet'], 'python': ['pylint']}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

" Tasks
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>

" Restore cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
