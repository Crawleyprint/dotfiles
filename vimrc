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

" Misc/unknown use
  Bundle 'vim-scripts/L9'

" Vim Improvements
  Bundle 'scrooloose/nerdtree'
  Bundle 'bling/vim-airline'
  Bundle 'YankRing.vim'
  Bundle 'ervandew/supertab'
  Bundle 'vim-scripts/Gundo'
  Bundle 'kien/ctrlp.vim.git'
  Bundle 'rking/ag.vim'

" Syntaxes
  Bundle 'scrooloose/syntastic'
  Bundle 'tpope/vim-haml'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'tpope/vim-rails.git'
  Bundle 'vim-scripts/JSON.vim'
  Bundle 'phmongeau/vim-slate'
  Bundle 'othree/javascript-libraries-syntax.vim'
  Bundle 'othree/html5.vim'
  Bundle 'vim-scripts/JavaScript-Indent'
  Bundle 'kchmck/vim-coffee-script'

" Color schemes
  Bundle 'tomasr/molokai'
  Bundle 'jonathanfilip/vim-lucius'

" Html/CSS/Templating
  Bundle 'mattn/emmet-vim'

filetype plugin indent on     " required!
syntax enable

" Line numbers and indentation
set mouse=a
set mousehide
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set ruler
" refresh buffer if file was change from outside
set autoread

" Better search options
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch

" Basic options
set encoding=utf-8
set scrolloff=3
set hidden
set copyindent
set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,docs/*     " MacOSX/Linux
set visualbell
set cursorline
set ttyfast
set ttymouse=xterm
set backspace=indent,eol,start
set laststatus=2
set virtualedit=all
set guifont=Monaco:h14
set nobackup " disable swapping
set noswapfile " disable swapping
set background=light
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set fillchars+=vert:\ | set nowrap
" How many tenths of a second to blink when matching brackets
set mat=2
set pt=<f12>

" Set normal split behavior
set splitbelow
set splitright

" Change mapleader
let mapleader = ","

" Set zen coding abbreviation expand key
let g:user_emmet_expandabbr_key = '<C-o>'
let g:user_emmet_mode = 'a'

" Show all files in NERDTree
let NERDTreeShowHidden = 1

" Choose right linter for syntastic
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_scss_checkers=['scss-lint']


" *****************************
" remapping function keys
" *****************************


" yankring toggle
noremap <silent> <F3> :YRShow<cr>

" Narrow region
vnoremap <F4> :NR<CR>

" Turn ctrl-p on/off
nnoremap <F1> :NERDTreeToggle<CR>

" Turn Gundo on/off
nnoremap <F2> :GundoToggle<CR>

" Switch betwee relative and absolute line numbers
nnoremap <F6> :call NumberToggle()<CR>

" Open scratch buffer
nnoremap <F10> :Scratch<CR>

" Split lines at cursor
nnoremap K i<CR><Esc>

nnoremap K i<CR><Esc>
" Close buffer and leave window open
nnoremap <leader>bo :BufOnly<CR>

" remap : to ;
nnoremap ; :

" Create vertical split
nnoremap <leader>w <C-w>v<C-w>l

" quickly open .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" source .vimrc
nmap <leader>sv :so $MYVIMRC<CR>

nnoremap <leader>t :CtrlP<CR>

"**************
"Movement
"**************

" navigating the splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remap % to tab key
nnoremap <tab> %
vnoremap <tab> %

" remap escape to jj
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

" Taming search
nnoremap / /\v
vnoremap / /\v
nnoremap <C-i> /\v
vnoremap <C-i> /\v

" Dismiss search highlight
nnoremap <leader><space> :noh<cr>

" Yank to system clipboard as well
noremap y "*y
noremap yy "*Y
noremap Y "*y$

"nerdtree on/off
nmap <silent> <leader>m :NERDTreeFocus<cr>
nnoremap <f5> vi{ :CSScomb<cr>
vnoremap <f5> vi{ :CSScomb<cr>

" fix vim's idiotic indentation
vnoremap > ><cr>gv
vnoremap < <<cr>gv

" Requires that you have Python v2.6+ installed. (Most *nix systems do.)
autocmd FileType json let b:vimpipe_command="python -m json.tool"
au! BufRead,BufNewFile *.json set filetype=json

" Strip white space at the end of line
autocmd BufWritePre * :%s/\s\+$//e

" Remove scrollbars
set guioptions-=L
set guioptions-=r

"colors
"let g:solarized_termcolors=256

colorscheme lucius
LuciusBlackLowContrast

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" tweak cursor line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Change ruler color
highlight ColorColumn ctermbg=Black

let g:UltisnipsSnippetsDir='snippets/'

"Airline customization

let g:airline_symbols= {}

let g:airline_right_sep = '◀'
let g:airline_left_sep = '▶'
let g:airlline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:used_javascript_libs = 'underscore,backbone,angularjs,jquery'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
