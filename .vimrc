set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/OmniCppComplete'
Plug 'ycm-core/YouCompleteMe'
Plug 'tell-k/vim-autopep8'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'roxma/vim-paste-easy'
Plug 'scrooloose/nerdtree'
Plug 'zivyangll/git-blame.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'shougo/echodoc.vim'
Plug 'dense-analysis/ale'

" Initialize plugin system
call plug#end()

"filetype plugin indent on

set t_Co=256
set shortmess=atI

syntax on
set history=2000
"set number
"set mouse=a
"set smartcase
set ic
set hlsearch
set incsearch
set list lcs=tab:\♠\ ,trail:•
set showmatch
set backspace=indent,eol,start
set splitright
set scrolloff=5

set wrap
set showmatch
set showcmd
set showmode
set clipboard+=unnamed

set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-kr,latin1
set ffs=unix,dos,mac

set smartindent
set tabstop=4
set sts=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

let mapleader = ','
let g:mapleader = ','
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
"let g:ycm_server_python_interpreter = '/usr/bin/python2.7'

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR>

set noerrorbells
set novisualbell
set t_vb=
set tm=500

noremap H ^
noremap L $

"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap (  ()<Left>
inoremap <C-e> <C-o>$
"nnoremap <up>    <nop>
"nnoremap <down>  <nop>
"nnoremap <left>  <nop>
"nnoremap <right> <nop>
"inoremap <up>    <nop>
"inoremap <down>  <nop>
"inoremap <left>  <nop>
"inoremap <right> <nop>

inoremap jj <Esc>

nmap <Leader>w :set wrap! wrap?<CR>
nmap <Leader>n :set nu! nu?<CR>
nmap <Leader>fj :%!python -m json.tool<CR>

nnoremap <leader>d :SignifyDiff<cr>
nnoremap <leader>p :SignifyHunkDiff<cr>
nnoremap <leader>u :SignifyHunkUndo<cr>

" hunk jumping
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)

nnoremap <Leader>2 :call ToggleSignColumn()<CR>
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
nnoremap <leader>t :NERDTree<cr>


" Toggle signcolumn
func! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=yes
        let b:signcolumn_on=1
    endif
endfunction

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map Y y$

"inoremap <Esc> <nop>

"inoremap <expr> , ((pumvisible())?("\<C-n>"):(","))
"inoremap <expr> . ((pumvisible())?("\<C-p>"):("."))

set statusline=[%t]\ %y\ %m%=%{&fileencoding}\ [%{&ff}]\ [%l,\ %c]\ [%L]\ [%p%%]

set background=dark
set cursorline
set cursorcolumn
"colorscheme gruvbox

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

"let g:ag_working_path_mode="r"
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore node_modules --ignore "gen/*" --ignore "tags" --ignore "linux_test*/*"'
" bind K to grep word under cursor
nnoremap f :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_WinWidth=50
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

"""""""""" Spell check on """"""""""
"set spell spelllang=en_us
"setlocal spell spelllang=en_us
"highlight clear SpellBad
"highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
"highlight clear SpellCap
"highlight SpellCap term=underline cterm=underline
"highlight clear SpellRare
"highlight SpellRare term=underline cterm=underline
"highlight clear SpellLocal
"highlight SpellLocal term=underline cterm=underline

let g:asyncrun_open = 6
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>

"map <silent> <F5> :call CompileRunGcc() <CR><CR>
"func! CompileRunGcc()
"        silent exec "w"
"        if &filetype == 'c'
"                silent exec "!gcc % -o %<"
"                silent exec "!time ./%<"
"                silent exec ":q"
"        elseif &filetype == 'cpp'
"                silent exec "!g++ % -o %<"
"                silent exec "!time ./%<"
"                silent exec ":q"
"        elseif &filetype == 'sh'
"                silent :!time bash %
"                silent exec ":q"
"        elseif &filetype == 'python'
"                silent exec '!clear'
"                silent exec "!python3 %"
"                silent exec ":q"
"        endif
"endfunc

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

"cs add ./cscope.out
nmap <C-\>s : cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g : cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c : cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t : cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e : cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f : cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i : cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d : cs find d <C-R>=expand("<cword>")<CR><CR>

"ominicpp configuration
set nocp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std","_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" Universal Ctags Configuration
set tags=./.tags;,.tags
let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" echodoc configuration
set noshowmode
let g:echodoc_enable_at_startup = 1

" ALE Configuration
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_python_pylint_options = '--disable=C0111'
let g:ale_linters = {
            \'c':      ['clang'],
            \'c++':    ['clang'],
            \'python': ['pylint'],
            \'go':     ['govet']
            \}

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\|WARNING\|trb\)')
  endif
endif
