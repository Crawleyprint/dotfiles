set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-haml'
Bundle 'Lokaltog/vim-powerline'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'YankRing.vim'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
" Color schemes
Bundle 'tomasr/molokai'

" Javascript
Bundle 'scrooloose/syntastic.git'
Bundle 'JavaScript-Indent'
Bundle 'JavaScript-syntax'
Bundle 'jeyb/vim-jst'
Bundle 'vim-scripts/JSON.vim'
Bundle 'ParseJSON'

" HTML 5
Bundle 'othree/html5.vim'

filetype plugin indent on     " required!

syntax enable
set number
set mouse=a
set colorcolumn=80

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

"open buffer list
nnoremap <F5> :buffers<CR>:buffer<Space>

" remap : to ;
nnoremap ; :

" Change leader key to ,
let mapleader = ","
nnoremap <leader>w <C-w>v<C-w>l

" quickly open .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<CR>

"Movement

" remap % to tab key
nnoremap <tab> %
vnoremap <tab> %
" open new vertical split
nnoremap <leader>w <C-w>v<C-w>l
" navigating the splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" escape to jj
inoremap jj <ESC>

" disable arrow keys for everything
" but insert mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"disable F1 key in all modes
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


" Command-T options
let g:CommandTMaxHeight=20
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTMaxFiles=20000

"search functionality
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

"colors
colorscheme molokai

"yanking

" Yank to system clipboard as well
noremap y "*y
noremap yy "*Y
noremap Y "*y$

" Set zen coding abbreviation expand key
let g:user_zen_expandabbr_key = '<D-e>'

autocmd BufWritePre * :%s/\s\+$//e

" Set syntax to jst for ejs files
au BufNewFile,BufRead *.ejs set filetype=jst

" HTML 5
Bundle 'othree/html5.vim'

" Markdown
au BufRead *.md set ft=markdown
" Options
set encoding=utf-8
set scrolloff=7
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set virtualedit=all
set guifont=Monaco:h12

" GUI tinkering
if has('gui_macvim')
  " set guifont=Monaco:h12
  set guioptions-=T  " no toolbar
  macmenu &File.Print key=<nop>
  map <D-p> <nop>
endif

"Nerdtree on/off
nnoremap <silent> <F2> :NERDTreeToggle<cr>
inoremap <silent> <F2> <ESC>:NERDTreeToggle<cr>
nmap <silent> <leader>m :NERDTreeFocus<CR>

"Yankring toggle
noremap <silent> <F3> :YRShow<CR>

" Fix vim's idiotic indentation
nmap <d-[> <<
nmap <d-]> >>
vmap <d-[> <gv
vmap <d-]> >gv