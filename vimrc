set nocompatible " be iMproved

if empty(glob($HOME . '/.vim/autoload/plug.vim'))
    execute 'silent ! curl -fLo ' . g:MYVIMDIR . '/autoload/plug.vim
                \ --create-dirs ' . 'https://raw.githubusercontent.com/
                \junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'othree/html5.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lifepillar/vim-solarized8'
Plug 'nanotech/jellybeans.vim'
Plug 'noahfrederick/vim-hemisu'
call plug#end()

filetype plugin indent on
syntax on
syntax spell toplevel

" General settings
set title
set showmode
set hidden
set colorcolumn=90
set splitright
set autoread
set autowrite
set number
set lazyredraw

" Fold settings
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" UTF-8
set encoding=utf-8
scriptencoding utf-8

" Make long text readable
set nowrap

" Backups and swaps
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set writebackup

" Set listchars for editing
set list
set listchars=tab:▸\ ,eol:¬,trail:·

" Commandline/statusline completetion
set ruler
set laststatus=2
set wildmenu
set wildmode=list:longest,full

" Indentation
set smarttab
set autoindent

" Make scrolling practical
set scrolloff=4
set sidescrolloff=4

" Searching options
set smartcase
set hlsearch
set incsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Show partial commands in the last line of the screen
set showcmd

" Colorscheme
set t_ut= " disable background color erase reference: https://sunaku.github.io/vim-256color-bce.html
set termguicolors
set background=dark
colorscheme solarized8

" So conceal characters look nice!
highlight clear Conceal
highlight link Normal Conceal

""" Plugin options

" ALE
let g:ale_c_gcc_options='-std=gnu11 -Wall'
let g:ale_c_clang_options='-std=gnu11 -Wall'
let g:ale_c_cpp_options='-std=gnu11 -Wall'

" Remap emmet hotkey key
let g:user_emmet_leader_key='<C-j>'

" Remap CtrlP hotkey
let g:ctrlp_map = '<leader>f'
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" let g:ctrlp_working_path_mode = 'ra'

" C++ improvments
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Map leaders
let mapleader = ','

""" Maps

" Folds
nnoremap <cr> za

" Make
nnoremap <leader>c :make!<cr>

" Easy buffer explorer
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <silent> <leader>x :bdelete<cr>

" Easy Ctags
nnoremap <leader>gt :!ctags -R<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>th :TagbarToggle<cr>

" NERDTree view
nnoremap <leader>n :NERDTreeToggle<cr>

" Jump to definition
nnoremap <leader>j <C-]>

" Quick save
nnoremap <leader>w :w<cr>
inoremap <leader>w <esc>:w<cr><esc>
vnoremap <leader>w <esc>:w<cr><esc>

" Split navigation
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Quick quit
noremap <leader>q <esc>:q<cr>

" No highlight
nnoremap <silent> <leader><space> :nohl<cr>

" Splits
nnoremap sp :split<cr>
nnoremap vs :vsplit<cr>

" Delete visual selection with backspace
vnoremap <bs> d
" Reselect text after shift
vnoremap > ><cr>gv
vnoremap < <<cr>gv

" New tab
nnoremap <C-t> :tabnew<cr>

" Quick open vimrc
nnoremap <leader>vc :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quick open zshrc
nnoremap <leader>z :e $HOME/.zshrc<cr>

" Quick Markdown Preview
nnoremap <leader>mp :%!markdown<cr>

" Quick Markdown Export
nnoremap <leader>md :!markdown % > %.html<cr><cr>

" LaTeX
nnoremap <leader>lx :!lualatex %<cr>
nnoremap <leader>lc :!detex % \| wc -w<cr>

" GNU Indent
nnoremap <silent> <leader>i :!indent %<cr><cr>

" Terminal
tnoremap <esc> <C-\><C-n>

augroup pythongroup
    autocmd FileType python syntax keyword pythonBuiltin self
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
augroup END

augroup haskellgroup
    " https://wiki.haskell.org/Vim
    autocmd FileType haskell setlocal tabstop=8 expandtab softtabstop=4 shiftwidth=4 shiftround
augroup END

augroup rubygroup
    autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END

augroup rubygroup
    autocmd FileType haskell setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END

augroup yamlgroup
    autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END

augroup htmlgroup
    autocmd BufNewFile,BufReadPost *.html set filetype=htmldjango
    autocmd FileType htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END

augroup latexgroup
    autocmd FileType tex set wrap linebreak nolist
    autocmd FileType tex set expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END

augroup cgroup
    autocmd FileType c syntax match cPointer '\v\-\>'
    autocmd FileType c syntax match cPointer '\v\*'
    autocmd FileType c syntax match cAddress '\v\&'
    autocmd FileType c highlight link cPointer cStorageClass
    autocmd FileType c highlight link cAddress cStorageClass

    " GNU Coding Standards
    autocmd FileType c setlocal expandtab tabstop=2 softtabstop=2 textwidth=79
    autocmd FileType c setlocal cindent fo-=ro fo+=cql
    autocmd Filetype c setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,wl,ml
augroup END
