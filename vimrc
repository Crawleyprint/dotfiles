set shell=/bin/bash
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
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'git.zip'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/L9'
Bundle 'SirVer/ultisnips'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/httplog'
Bundle 'plasticboy/vim-markdown'
Bundle 'BufOnly.vim'
Bundle 'aliva/vim-fish'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-haml'
Bundle 'mileszs/ack.vim'
Bundle 'YankRing.vim'
Bundle 'miripiruni/CSScomb-for-Vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'skammer/vim-css-color'
"
" Color schemes
Bundle 'tomasr/molokai'
" Javascript and html
Bundle 'JavaScript-Indent'
Bundle 'JavaScript-syntax'
Bundle 'jeyb/vim-jst'
Bundle 'vim-scripts/JSON.vim'
Bundle 'ParseJSON'
Bundle 'BufOnly.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
Bundle 'beyondwords/vim-twig'
Bundle 'rodjek/vim-puppet'
Bundle 't9md/vim-chef'

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
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set copyindent
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set virtualedit=all
set guifont=Consolas:h12
set nobackup " disable swapping
set noswapfile " disable swapping
set background=dark
set t_Co=256
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set nowrap

if has('gui_running')
  set guioptions=egmrt
  macmenu &File.New\ Tab key=<nop>
endif
let mapleader = ","
"open buffer list
nnoremap <F6> :call NumberToggle()<CR>
nnoremap <leader>t :CommandT<CR>
inoremap <leader>t :CommandT<CR>
vnoremap <leader>t :CommandT<CR>
nnoremap K i<CR><Esc>

nnoremap K i<CR><Esc>
" Close buffer and leave window open
nnoremap <leader>bo :BufOnly<CR>

" remap : to ;
nnoremap ; :

" Change leader key to ,
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
inoremap <F1> :CommandTBuffer<CR>
nnoremap <F1> :CommandTBuffer<CR>
vnoremap <F1> :CommandTBuffer<CR>


"search functionality
nnoremap / /\v
vnoremap / /\v

nnoremap <leader><space> :noh<cr>

" Yank to system clipboard as well
noremap y "*y
noremap yy "*Y
noremap Y "*y$

" Set zen coding abbreviation expand key
let g:user_zen_expandabbr_key = '<D-e>'


"nerdtree on/off
nnoremap <silent> <f2> :NERDTreeToggle<cr>
inoremap <silent> <f2> <esc>:NERDTreeToggle<cr>
nmap <silent> <leader>m :NERDTreeFocus<cr>
nnoremap <leader>c :CSScomb<cr>
vnoremap <leader>c :CSScomb<cr>
let NERDTreeShowHidden = 1

"yankring toggle
noremap <silent> <f3> :YRShow<cr>

" fix vim's idiotic indentation
vnoremap > ><cr>gv
vnoremap < <<cr>gv

" Set indentation for files

autocmd FileType css,sass,scss setlocal ai sw=4 sts=4 et

" Vim doesn't set a FileType for JSON, so we'll do it manually:
autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json
" Requires that you have Python v2.6+ installed. (Most *nix systems do.)
autocmd FileType json let b:vimpipe_command="python -m json.tool"
autocmd BufWritePre * :%s/\s\+$//e
" Set syntax to jst for ejs files
au BufNewFile,BufRead *.ejs set filetype=jst
" Markdown
au BufRead *.md set ft=markdown
" Set omnicomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"colors
colorscheme molokai

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

let g:CommandTMaxFiles=180000
let g:CommandTMaxHeight= 10

" resize current buffer by +/- 5
nnoremap <D-left> :vertical resize -5<cr>
nnoremap <D-down> :resize +5<cr>
nnoremap <D-up> :resize -5<cr>
nnoremap <D-right> :vertical resize +5<cr>
